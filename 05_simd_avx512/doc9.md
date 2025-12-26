
---

# 第 5 章

## 将最优动态 Batch 调度器

## 落地到 Triton / TensorRT / vLLM 的真实做法

---

## 5.1 先说结论（工程真相）

| 框架                          | 能否完整支持   | 难点             |
| --------------------------- | -------- | -------------- |
| **Triton Inference Server** | ✅ 最容易    | 多实例 + 动态 batch |
| **TensorRT**                | ⚠️ 需外层调度 | 本身不管请求         |
| **vLLM**                    | ⚠️ 可深度融合 | 调度逻辑极复杂        |

👉 **最优调度器几乎一定在“推理引擎之外”**

---

## 5.2 统一抽象：调度器应该放在哪一层？

### 推理系统分层（非常重要）

```
[ Client ]
    ↓
[ Request Queue ]   ← 👈 调度器在这里
    ↓
[ Inference Engine ]
    ↓
[ Hardware (AMX / GPU) ]
```

**原则**：

> ❌ 不改 kernel
> ❌ 不侵入算子
> ✅ 控制“何时、用谁、跑多少 batch”

---

## 5.3 Triton Inference Server：最佳实验平台

### 5.3.1 Triton 的天然优势

* 原生支持：

  * Dynamic batching
  * Multiple model instances
  * CPU / GPU 同时部署
* 架构是 **显式请求队列**

👉 **Triton 本身就是一个调度框架**

---

### 5.3.2 在 Triton 中实现 AMX + GPU 双路径

#### Step 1：部署两个 model instance

```text
model/
 ├── amx_instance/
 │    └── instance_group { kind: KIND_CPU }
 └── gpu_instance/
      └── instance_group { kind: KIND_GPU }
```

---

#### Step 2：关闭 Triton 内置 dynamic batching（关键）

```text
dynamic_batching {
  max_queue_delay_microseconds: 0
}
```

因为：

> **我们要自己算“等不等值不值”**

---

### 5.3.3 插入自定义调度器（核心）

位置：

* **Scheduler / Backend API**
* 或 External Request Router

#### 调度逻辑

```cpp
on_request_arrival(req):
    enqueue(req)

periodic_tick():
    B = queue.size()

    if B < B1:
        dispatch(amx_instance)
    else if B < B2:
        if marginal_gain(B) > wait_cost():
            wait()
        else:
            dispatch(gpu_instance)
    else:
        dispatch(gpu_instance)
```

---

### 5.3.4 Triton 的真实工程注意点

✅ 优点：

* Triton 自动做内存管理
* CPU/GPU 并行
* 易于 A/B 测试

⚠️ 限制：

* 单模型多 instance 的参数共享复杂
* AMX kernel 需自己写（ONEDNN / custom backend）

---

## 5.4 TensorRT：调度器必须在“外面”

### 5.4.1 为什么 TensorRT 不适合内嵌？

TensorRT 的定位是：

> **“给定 batch，最快算完”**

它**完全不关心**：

* 请求排队
* batch 形成
* SLA

👉 **调度必须在 TensorRT 之上**

---

### 5.4.2 正确架构（工业实践）

```
[ Request Queue ]
        ↓
[ Custom Scheduler ]
        ↓
 ┌─────────────┬─────────────┐
 │ TensorRT AMX│ TensorRT GPU│
 └─────────────┴─────────────┘
```

---

### 5.4.3 AMX + TensorRT 的现实方案

#### 事实

* TensorRT **不支持 AMX**
* CPU 推理一般用：

  * oneDNN
  * OpenVINO

---

#### 实际落地方案

| 路径      | 引擎           |
| ------- | ------------ |
| 小 batch | oneDNN + AMX |
| 大 batch | TensorRT GPU |

---

### 5.4.4 调度关键点

1️⃣ **提前 warm-up GPU**
避免 batch 切换导致冷启动

2️⃣ **GPU launch amortization threshold**
来自 profiling，不是猜的

3️⃣ **强制 flush tail request 到 AMX**

---

### 5.4.5 TensorRT 的真实限制

❌ 不支持跨 batch 融合
❌ 动态 shape 成本高
❌ 多 stream 调度复杂

👉 所以 **TensorRT ≠ 调度系统**

---

## 5.5 vLLM：最复杂，也最值得做

vLLM 是 **最难改，但收益最大** 的系统。

---

## 5.5.1 vLLM 的调度现状（事实）

vLLM 已经有：

* Continuous batching
* Token-level scheduling
* KV cache 管理

但：

> **它假设“只用 GPU”**

---

## 5.5.2 在 vLLM 中插入 AMX 的正确方式

### 不要动模型 kernel（这是陷阱）

❌ 不要改 attention kernel
❌ 不要在 decode 内分叉

---

### 正确插入点：**Prefill 阶段**

LLM 推理：

```
Prefill (heavy GEMM)
Decode  (memory bound)
```

---

### 5.5.3 新 pipeline（工业可行）

```
Incoming requests
        ↓
Dynamic batch scheduler
        ↓
Small prefill → CPU AMX
Large prefill → GPU Tensor Core
        ↓
Decode → GPU only
```

👉 **AMX 只做 prefill**

---

### 5.5.4 为什么这在数学上是最优的？

* Prefill：

  * 计算密集
  * batch 效应明显
* Decode：

  * batch 越大越慢
  * GPU memory bound

---

### 5.5.5 vLLM 中的真实改动点

| 模块        | 改动               |
| --------- | ---------------- |
| Scheduler | 增加 AMX path      |
| Executor  | 支持 CPU execution |
| KV Cache  | CPU → GPU 转移     |

⚠️ 这是 **vLLM hack 级改造**

---

## 5.6 统一调度器接口设计（强烈建议）

为了跨 Triton / TensorRT / vLLM 复用：

```cpp
struct ExecutionPath {
    double estimate_latency(batch);
    void execute(batch);
};

class OptimalScheduler {
    vector<ExecutionPath> paths;
    Decision schedule(queue_state);
};
```

---

## 5.7 工业级经验总结（血泪）

### ❌ 常见失败模式

* 盲目追求 GPU 利用率
* 忽视 p99
* 把 batch 当目标

---

### ✅ 成功系统的共同点

* Tail request 永远有“逃生通道”（AMX）
* GPU 只吃“已经肥的 batch”
* 决策基于 **边际收益**

---

## 5.8 一句话终极总结

> **推理系统的核心不是“算得多快”，
> 而是“什么时候不该等”。**

把这套调度器塞进 Triton / TensorRT / vLLM，
你得到的不是 5% 优化，而是：

* p99 直接腰斩
* GPU 利用率上升
* 系统进入“可证明最优”的状态

---
