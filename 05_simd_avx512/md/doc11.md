
---

# 第 5 章

## 用 Queuing Theory 推导推理系统 p99 延迟上界

### —— 为什么 AMX + 动态 batch 在数学上必然压尾延迟

---

## 5.1 问题重新表述（非常关键）

我们关心的是：

> **在请求到达随机（线上真实）的情况下，
> 调度策略能否给出一个“可控的 p99 延迟上界”？**

而不是：

* 平均延迟
* 吞吐峰值

---

## 5.2 基本建模假设（工业可接受）

### 5.2.1 请求到达模型

* 到达过程：**Poisson 流**
* 到达率：(\lambda)

> 这是互联网服务最常用、最保守的假设

---

### 5.2.2 服务模型（关键）

我们有 **两类服务台**：

| 服务台       | 模型                  | 特点             |
| --------- | ------------------- | -------------- |
| AMX       | M/M/1               | 低启动、线性         |
| GPU batch | M/G/1（bulk service） | 高启动、强 batch 效应 |

---

## 5.3 Baseline：GPU-only 为什么 p99 必炸？

### 5.3.1 GPU-only = M/G/1 + 批处理

GPU 的服务时间：

[
S(B) = T_{launch} + B \cdot t
]

batch B 本身是 **随机变量**，由等待时间决定。

---

### 5.3.2 Pollaczek–Khinchine 定理

对 M/G/1：

[
\mathbb{E}[W]
=============

\frac{\lambda \mathbb{E}[S^2]}{2(1 - \rho)}
]

其中：

[
\rho = \lambda \mathbb{E}[S]
]

👉 **关键：(\mathbb{E}[S^2])（二阶矩）**

---

### 5.3.3 p99 爆炸的根源

* batch waiting → 服务时间分布 **重尾**
* (\mathbb{E}[S^2]) 非常大
* 当 (\rho \to 1)：

[
W \to \infty
]

👉 **GPU-only 的尾延迟在数学上不可控**

---

## 5.4 动态 batching 的排队模型

我们引入：

* 最大等待时间：(T_{max})
* 或边际收益停止条件（等价）

---

### 5.4.1 批处理队列的上界性质

如果 batch 等待被截断：

[
B \le B_{max}
\quad\Rightarrow\quad
S \le S_{max}
]

于是：

[
\mathbb{P}(W > t)
\le
e^{-\theta t}
]

**尾部从重尾 → 指数尾**

---

### 5.4.2 但问题还没解决

即使如此：

* 当 λ 高
* GPU launch 很贵

p99 仍然很高。

---

## 5.5 引入 AMX：本质是一个“优先级队列”

### 5.5.1 调度器的数学抽象

策略：

* 等待超过阈值的请求 → AMX
* 新鲜 batch → GPU

这是一个：

> **带优先级的 M/M/1 + M/G/1 复合系统**

---

### 5.5.2 用 Priority Queue 理论建模

* Class 1（高优先）：AMX
* Class 2（低优先）：GPU

AMX 的服务时间：

[
S_a \sim \text{Exp}(\mu_a)
]

---

## 5.6 p99 上界的关键定理（核心）

### 定理（尾截断 + 优先级）：

若：

1. 所有请求在时间 (T_{cut}) 后必被 AMX 服务
2. AMX 为 M/M/1，(\rho_a < 1)

则对任意请求：

[
\mathbb{P}(W > T_{cut} + t)
\le
e^{-(\mu_a - \lambda_a)t}
]

👉 **p99 上界线性可控**

---

## 5.7 显式写出 p99 上界公式

设：

* (T_{cut})：最大 GPU 等待时间
* AMX 服务率：(\mu_a)
* 进入 AMX 的到达率：(\lambda_a)

则：

[
\mathbb{P}(W > T_{cut} + t)
===========================

e^{-(\mu_a - \lambda_a)t}
]

解 p99：

[
p99
\le
T_{cut}
+
\frac{\ln(100)}{\mu_a - \lambda_a}
]

---

## 5.8 这个公式为什么极其重要？

因为它告诉你：

> **p99 不再取决于 GPU 吞吐，也不取决于 batch 分布**

而只取决于：

1. AMX 的服务能力
2. 你愿意给 GPU 多久

---

## 5.9 把公式映射回工程参数

### 5.9.1 参数对应关系

| 理论          | 工程                             |
| ----------- | ------------------------------ |
| (T_{cut})   | max batch wait / marginal gain |
| (\mu_a)     | AMX 推理 TPS                     |
| (\lambda_a) | tail 请求比例                      |

---

### 5.9.2 反推调度参数（非常实用）

如果你有 SLA：

```
p99 <= 20 ms
```

已知：

* AMX p50 = 2 ms → μₐ ≈ 500/s
* tail 流量 ≤ 20%

你可以反算：

[
T_{cut}
\le
20
--

\frac{\ln 100}{\mu_a - \lambda_a}
]

👉 **这是“数学选参数”，不是拍脑袋**

---

## 5.10 为什么 AMX 不需要很强？

注意：

[
\lambda_a \ll \lambda
]

AMX 只吃：

* 小 batch
* 老请求
* tail 流量

👉 **AMX 是“尾延迟保险丝”，不是主力**

---

## 5.11 对比没有 AMX 的系统

| 架构             | p99 行为 |
| -------------- | ------ |
| GPU-only       | 随 λ 爆炸 |
| 固定 batch       | 截断但高   |
| 动态 batch + AMX | 有显式上界  |

---

## 5.12 这就是为什么工业界这样做

你现在可以理解：

* Google TPU serving
* Meta adaptive batching
* NVIDIA Triton ensemble

**为什么一定有 CPU fallback**

不是因为快，而是因为：

> **它让 p99 可证明**

---

## 5.13 一句话终极总结（数学版）

> **AMX 在推理系统中的作用，
> 不是加速平均，而是把排队系统从“无界”变成“有界”。**

---

