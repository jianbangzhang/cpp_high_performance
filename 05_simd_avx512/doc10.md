
---

# 一、调度器整体架构

我们采用 **“外置调度器 + Triton 原生执行”** 的工业安全做法：

```
Client
  ↓
[ Custom Scheduler ]   ← 你写的（C++ 或 Python）
  ↓
Triton HTTP / gRPC
  ↓
[ CPU Model (AMX) ]   [ GPU Model ]
```

**原则**：

* ❌ 不改 Triton core
* ❌ 不改 kernel
* ✅ 控制：什么时候发给谁、一次发多少

---

# 二、方案 A（推荐）：Python 外部调度器（最快落地）

> **这是 90% 团队的首选**

---

## 2.1 Python 调度器结构

```
scheduler/
 ├── scheduler.py        # 核心逻辑
 ├── cost_model.py       # T_AMX / T_GPU
 ├── triton_client.py    # 封装 HTTP/gRPC
 └── queue.py
```

---

## 2.2 请求队列（queue.py）

```python
import time
from collections import deque

class Request:
    def __init__(self, input, arrival_time=None):
        self.input = input
        self.arrival_time = arrival_time or time.time()

class RequestQueue:
    def __init__(self):
        self.q = deque()

    def push(self, req):
        self.q.append(req)

    def pop_n(self, n):
        batch = []
        for _ in range(min(n, len(self.q))):
            batch.append(self.q.popleft())
        return batch

    def size(self):
        return len(self.q)

    def oldest_wait_time(self):
        if not self.q:
            return 0
        return time.time() - self.q[0].arrival_time
```

---

## 2.3 成本模型（cost_model.py）

```python
class CostModel:
    def __init__(self):
        # 通过 profiling 得到
        self.gpu_launch = 0.15   # ms
        self.gpu_per_item = 0.02
        self.amx_per_item = 0.08

        self.B1 = 4    # AMX → GPU 分界
        self.B2 = 16   # GPU 启动 amortized

    def gpu_time(self, B):
        return self.gpu_launch + B * self.gpu_per_item

    def amx_time(self, B):
        return B * self.amx_per_item

    def marginal_gain(self, B):
        return self.gpu_time(B) - self.gpu_time(B + 1)
```

---

## 2.4 Triton Client 封装（triton_client.py）

```python
import tritonclient.http as httpclient
import numpy as np

class TritonModel:
    def __init__(self, url, model_name):
        self.client = httpclient.InferenceServerClient(url)
        self.model_name = model_name

    def infer(self, batch_inputs):
        # 示例：单输入模型
        input_data = np.stack(batch_inputs)
        inp = httpclient.InferInput("INPUT", input_data.shape, "FP32")
        inp.set_data_from_numpy(input_data)

        result = self.client.infer(
            model_name=self.model_name,
            inputs=[inp]
        )
        return result
```

---

## 2.5 核心调度器（scheduler.py）

```python
import time
import threading
from queue import RequestQueue
from cost_model import CostModel
from triton_client import TritonModel

class OptimalScheduler:
    def __init__(self):
        self.queue = RequestQueue()
        self.cost = CostModel()

        self.amx_model = TritonModel("localhost:8000", "model_amx")
        self.gpu_model = TritonModel("localhost:8000", "model_gpu")

        self.tick_interval = 0.1 / 1000  # 100 us

    def submit(self, req):
        self.queue.push(req)

    def dispatch(self, model, batch):
        inputs = [r.input for r in batch]
        model.infer(inputs)

    def loop(self):
        while True:
            B = self.queue.size()
            if B == 0:
                time.sleep(self.tick_interval)
                continue

            wait_time = self.queue.oldest_wait_time()

            if B < self.cost.B1:
                batch = self.queue.pop_n(B)
                self.dispatch(self.amx_model, batch)

            elif B < self.cost.B2:
                if self.cost.marginal_gain(B) > wait_time:
                    time.sleep(self.tick_interval)
                else:
                    batch = self.queue.pop_n(B)
                    self.dispatch(self.gpu_model, batch)

            else:
                batch = self.queue.pop_n(B)
                self.dispatch(self.gpu_model, batch)

    def start(self):
        threading.Thread(target=self.loop, daemon=True).start()
```

---

## 2.6 这个 Python 版本已经能干什么？

✅ 动态 batch
✅ AMX / GPU 自适应
✅ p99 明显下降
✅ Triton 无侵入

---

# 三、方案 B：Triton Backend C++（重型但最强）

> **当你要极致性能、避免 Python jitter**

---

## 3.1 C++ Backend 架构

```
backend/
 ├── scheduler_backend.cc
 ├── cost_model.h
 ├── request_queue.h
 └── CMakeLists.txt
```

---

## 3.2 请求队列（request_queue.h）

```cpp
#include <deque>
#include <chrono>

struct Request {
  void* payload;
  std::chrono::steady_clock::time_point ts;
};

class RequestQueue {
public:
  void Push(Request r) { q_.push_back(r); }

  std::vector<Request> PopN(int n) {
    std::vector<Request> out;
    while (n-- && !q_.empty()) {
      out.push_back(q_.front());
      q_.pop_front();
    }
    return out;
  }

  int Size() const { return q_.size(); }

  double OldestWaitMs() const {
    if (q_.empty()) return 0;
    auto dt = std::chrono::steady_clock::now() - q_.front().ts;
    return std::chrono::duration<double, std::milli>(dt).count();
  }

private:
  std::deque<Request> q_;
};
```

---

## 3.3 成本模型（cost_model.h）

```cpp
struct CostModel {
  double gpu_launch = 0.15;
  double gpu_per = 0.02;
  double amx_per = 0.08;

  int B1 = 4;
  int B2 = 16;

  double GpuTime(int B) const {
    return gpu_launch + B * gpu_per;
  }

  double MarginalGain(int B) const {
    return GpuTime(B) - GpuTime(B + 1);
  }
};
```

---

## 3.4 调度逻辑（scheduler_backend.cc 核心）

```cpp
void SchedulerTick() {
  int B = queue.Size();
  if (B == 0) return;

  double wait = queue.OldestWaitMs();

  if (B < cost.B1) {
    DispatchAMX(queue.PopN(B));
  } else if (B < cost.B2) {
    if (cost.MarginalGain(B) > wait)
      return;
    else
      DispatchGPU(queue.PopN(B));
  } else {
    DispatchGPU(queue.PopN(B));
  }
}
```

> **真正工程里，这个 Tick 通常挂在 Triton 的 Execute() 或专用调度线程中**

---

# 四、Triton 模型仓库配置示例

```text
model_amx/
 └── config.pbtxt
model_gpu/
 └── config.pbtxt
```

### config.pbtxt（AMX）

```text
instance_group {
  kind: KIND_CPU
  count: 1
}
```

### config.pbtxt（GPU）

```text
instance_group {
  kind: KIND_GPU
  count: 1
}
```

⚠️ **关闭 dynamic_batching**

---

# 五、上线前必踩的 6 个坑（非常重要）

### 1️⃣ Triton 默认 batching 会和你打架

→ 必须关

### 2️⃣ GPU launch 抖动

→ warm-up

### 3️⃣ Python GIL

→ 多进程或 C++ 版

### 4️⃣ AMX NUMA 绑定

→ `numactl --cpunodebind`

### 5️⃣ 请求老化（aging）

→ 防止中 batch 饥饿

### 6️⃣ 监控必须看 p99，不是 avg

---


