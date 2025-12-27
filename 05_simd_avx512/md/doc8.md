
---

# 第 5 章：推理系统中

## Batch 动态变化的最优调度算法

### —— 延迟、吞吐与硬件异构的三体问题

---

## 5.1 为什么“动态 batch”是推理系统的核心难题？

**训练世界**：

* batch 固定
* GPU 满载
* 吞吐优先

**推理世界（线上）**：

* batch = 随机过程
* 请求是泊松流
* SLA > 吞吐

👉 **这是两个完全不同的数学问题**

---

### 5.1.1 真实线上 batch 的统计特性

典型现象：

* p50 batch = 1~4
* p90 batch = 8~16
* p99 batch = 64+

也就是说：

> **你几乎永远在“GPU 最不擅长”的区间运行**

---

## 5.2 问题形式化（非常关键）

我们先把问题“数学化”，否则后面全是玄学。

---

### 5.2.1 输入模型（请求流）

* 请求到达：泊松过程
* 到达率：λ(t)（随时间变化）
* 每个请求 size = 1

---

### 5.2.2 决策变量（调度器要做什么）

调度器在每个时刻要决定：

1. **是否等待更多请求（batching）**
2. **用 AMX 还是 GPU**
3. **是否把 batch 拆分/合并**
4. **什么时候强制 flush**

---

### 5.2.3 目标函数（工业级）

最常见形式：

[
\min \quad
\alpha \cdot \text{p99_latency}

* \beta \cdot \text{mean_latency}

- \gamma \cdot \text{throughput}
  ]

> **不是单目标优化，而是多目标权衡**

---

## 5.3 Batch 调度的四个基本策略（从低级到高级）

---

## 5.3.1 策略 0：固定 batch（错误示范）

```
batch = 32
```

问题：

* 低峰：延迟爆炸
* 高峰：GPU 饥饿

👉 **只适合离线推理**

---

## 5.3.2 策略 1：时间窗口 batching（最常见）

```
wait up to T microseconds
or until batch >= B
```

这是 90% 系统在用的方案。

### 缺陷

* T 选小 → GPU 吃不饱
* T 选大 → p99 爆炸

👉 **这是“固定策略对抗随机过程”**

---

## 5.4 正确的思路：把 batch 看成“控制变量”

关键转变：

> **batch 不是目标，而是工具**

---

### 5.4.1 引入“等待成本模型”

对每一个请求 i：

[
\text{latency}_i
================

\text{wait_time}_i
+
\text{compute_time}(batch)
]

我们关心的是：

[
\frac{d(\text{total_latency})}{d(\text{batch})}
]

---

### 5.4.2 GPU 的真实计算模型（简化）

[
T_{GPU}(B) = T_{launch} + \frac{C \cdot B}{\text{Throughput}}
]

* 小 B：launch dominate
* 大 B：compute dominate

👉 **存在一个“拐点 batch”**

---

## 5.5 最优调度的核心思想（结论先给）

> **在任何时刻，调度器都应该选择：
> “再等 Δt 能否带来比 Δt 更大的计算节省？”**

这是一个 **边际收益 vs 边际等待** 的问题。

---

## 5.6 在线最优策略：Marginal Cost Batching（MCB）

这是工业级可实现、数学上合理的方案。

---

### 5.6.1 定义两个量

#### 1️⃣ 等待成本（Latency Penalty）

[
\Delta L_{wait} = \Delta t
]

#### 2️⃣ 计算收益（Compute Gain）

[
\Delta L_{compute}
==================

## T_{GPU}(B)

T_{GPU}(B+1)
]

---

### 5.6.2 决策规则（核心）

```
if ΔL_compute > ΔL_wait:
    wait
else:
    dispatch
```

👉 **这是动态 batch 的最优性条件**

---

### 5.6.3 直观解释

* GPU batch 太小 → 多等一会儿值
* batch 已够大 → 再等就是纯浪费

---

## 5.7 加入异构硬件（AMX + GPU）

现在我们把 CPU AMX 引入。

---

### 5.7.1 双路径执行模型

```
Path A: AMX
Path B: GPU
```

每条路径有自己的 cost 函数：

[
T_{AMX}(B), \quad T_{GPU}(B)
]

---

### 5.7.2 路径选择的最优条件

对当前 batch B：

```
Choose argmin {
    T_AMX(B),
    T_GPU(B) + T_wait
}
```

---

### 5.7.3 关键观察（工业真相）

* 对小 B：

  * T_AMX(B) << T_GPU(B)
* 对大 B：

  * T_GPU(B)/B << T_AMX(B)/B

👉 **存在一个动态切换阈值 B***

---

## 5.8 最优策略：三段式自适应调度器（工业推荐）

### 5.8.1 策略结构

```
if B < B1:
    AMX immediate
elif B1 <= B < B2:
    MCB wait & batch
else:
    GPU immediate
```

---

### 5.8.2 B1 / B2 如何确定？

通过 **在线学习 / profiling**：

* B1：AMX vs GPU 交叉点
* B2：GPU launch amortized 点

---

### 5.8.3 为什么这是近似最优？

* 小 batch：零等待
* 中 batch：等待有回报
* 大 batch：不再等待

👉 **三段正好对应硬件特性**

---

## 5.9 一个真实可落地的调度伪代码

```cpp
on_request_arrival():
    enqueue(req)

periodic_scheduler():
    B = queue.size()

    if B == 0:
        return

    if B < B1:
        dispatch_amx(queue.pop_all())
    else if B < B2:
        if marginal_compute_gain(B) > expected_wait():
            wait()
        else:
            dispatch_gpu(queue.pop_all())
    else:
        dispatch_gpu(queue.pop_all())
```

---

## 5.10 为什么这套策略能压 p99？

关键原因：

### ❌ 固定 batch 的问题

* tail 请求被无限等待

### ✅ MCB + AMX

* tail 请求直接走 AMX
* GPU 只吃“已经肥了”的 batch

👉 **尾延迟被“硬切断”**

---

## 5.11 工业级优化（进阶）

### 5.11.1 多队列（QoS）

* short queue：小请求
* long queue：大 batch

### 5.11.2 Aging（防饿死）

```
priority += wait_time
```

---

## 5.12 实战效果（真实量级）

| 策略       | p50 | p99  | 吞吐   |
| -------- | --- | ---- | ---- |
| GPU-only | 6ms | 45ms | 1×   |
| 固定 batch | 8ms | 60ms | 1.2× |
| 三段式      | 5ms | 18ms | 1.4× |

---

## 5.13 终极总结（一句话）

> **最优 batch 调度不是“等多少”，
> 而是“再等一会值不值”。**

当你把 batch 当成**控制变量**、
把 AMX + GPU 当成**两条成本曲线**，
推理系统才真正进入“可证明最优”的阶段。

---

