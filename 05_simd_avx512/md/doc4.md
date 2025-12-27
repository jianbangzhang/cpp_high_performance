
---

# 第 5 章：Warp Divergence 的定量建模

## —— 从控制流分歧到吞吐损失的可计算模型

---

## 5.1 为什么必须“定量”理解 Warp Divergence

Warp divergence 常被模糊描述为：

> “if 会让 GPU 变慢”

这是**严重不够的**。

工程上你真正需要回答的是：

* 慢 **多少倍**
* 在 **什么概率分布下** 慢
* 是否 **值得为此重写代码**

👉 本章的目标：**把 divergence 从“感觉”变成“公式”**

---

## 5.2 SIMT 中 Warp 的执行基本假设

### 5.2.1 Warp 执行模型回顾

* Warp = 32 threads（NVIDIA）
* 同一时刻 **只能执行一条指令**
* 不同控制流路径 → **串行执行**

执行逻辑：

```
if (cond) {
    A
} else {
    B
}
```

等价于：

```
执行 A（mask = cond）
执行 B（mask = !cond）
```

---

### 5.2.2 Warp Divergence 的本质

> **不是“有分支”，
> 而是“一个 warp 内有多个不同路径”**

极端情况：

* 全 true → 无 divergence
* 16 true + 16 false → **最大浪费**

---

## 5.3 最基本的 Warp Divergence 性能模型

### 5.3.1 单 if-else 的时间模型

设：

* Warp 大小：W
* A 路径指令数：T₁
* B 路径指令数：T₂
* Warp 中有至少 1 个线程走 A、1 个走 B

则：

[
T_{warp} = T_1 + T_2
]

而理想情况（无 divergence）：

[
T_{ideal} = \max(T_1, T_2)
]

---

### 5.3.2 Divergence 开销因子

定义：

[
D = \frac{T_1 + T_2}{\max(T_1, T_2)}
]

性质：

* T₁ = T₂ → D = 2（最坏）
* T₂ ≪ T₁ → D → 1

👉 **不是所有分支都值得消除**

---

## 5.4 引入概率：Warp 内分支分布模型

现实中，分支不是固定的，而是概率事件。

---

### 5.4.1 Bernoulli 分布模型

设：

* 每个 thread 以概率 **p** 走 A
* Warp 大小 W

Warp 内情况：

* 全 A：概率 = p^W
* 全 B：概率 = (1-p)^W
* Diverged：概率 = 1 − p^W − (1-p)^W

---

### 5.4.2 期望执行时间

设：

* T₁ = T₂ = T（对称分支）

期望时间：

[
E[T] = T \cdot (p^W + (1-p)^W) + 2T \cdot (1 - p^W - (1-p)^W)
]

归一化（理想 = T）：

[
Slowdown = 2 - (p^W + (1-p)^W)
]

---

### 5.4.3 数值直觉（W=32）

| p    | p^32 + (1-p)^32 | Slowdown |
| ---- | --------------- | -------- |
| 0.01 | ≈0.72           | 1.28×    |
| 0.1  | ≈0.03           | 1.97×    |
| 0.5  | ≈0              | **2.0×** |

👉 **GPU 害怕的不是随机，而是“半对半”**

---

## 5.5 非对称分支的现实模型

设：

* T₁ ≫ T₂
* 主路径 + 罕见慢路径（常见于 error handling）

期望时间：

[
E[T] \approx
T_1 + (1 - p^W) \cdot T_2
]

结论：

> **只要慢路径足够少，divergence 成本可忽略**

这解释了为什么 GPU 代码中：

```cuda
if (unlikely(error)) { ... }
```

通常没问题。

---

## 5.6 多级分支：指数级灾难

### 5.6.1 两级 if 嵌套

```
if (A) {
    if (B) ...
}
```

理论上：

* 最多 4 条路径
* Warp 串行执行所有出现过的路径

最坏情况：

[
T_{warp} = T_{00} + T_{01} + T_{10} + T_{11}
]

👉 **路径数指数增长**

---

### 5.6.2 分支熵（Branch Entropy）

定义路径概率 pᵢ：

[
H = -\sum p_i \log p_i
]

* 熵低 → 可预测 → GPU 友好
* 熵高 → 随机 → GPU 灾难

👉 **Warp divergence 本质是“控制流熵问题”**

---

## 5.7 Divergence 与 Occupancy 的耦合

Warp divergence 不只是“慢”，还会：

* 拉长 warp 生命周期
* 降低 SM 可并行 warp 数
* 进一步降低 latency hiding

简化模型：

[
Effective_Throughput
====================

\frac{Active_Warps}{Divergence_Factor}
]

👉 **这是二阶性能塌陷**

---

## 5.8 Divergence vs SIMD Mask：数学对照

| 维度   | SIMD       | SIMT  |
| ---- | ---------- | ----- |
| 执行   | 所有 lane 同时 | 分支串行  |
| 成本   | 空 lane 浪费  | 时间浪费  |
| 最坏情况 | 50% 计算浪费   | 2× 时间 |

数学上：

* SIMD：效率 ∝ 活跃 lane 比例
* SIMT：效率 ∝ 路径数倒数

---

## 5.9 经典优化策略的定量解释

### 5.9.1 分支外提（Branch Hoisting）

把分支移到 warp 外：

* 降低 p 的方差
* 提高 p^W

---

### 5.9.2 数据重排（Warp Specialization）

让同一 warp 处理同类数据：

* p → 0 或 1
* divergence → 0

---

### 5.9.3 Predication（以算代分）

当：

[
T_2 < T_1 \times (1 - p^W)
]

用 predication 比 if 更快。

---

## 5.10 实战案例：Embedding Lookup

### 场景

* ID 分布不均
* 高频 ID 快路径
* 低频 ID 慢路径

建模结论：

* 按 ID bucket 分 warp
* divergence 从 1.8× → 1.1×

---

## 5.11 工程判断速查表

| 情况      | 建议       |
| ------- | -------- |
| p ≈ 0.5 | 重构       |
| T₁ ≫ T₂ | 保留分支     |
| 多级 if   | 拆 kernel |
| 随机条件    | Warp 特化  |

---

## 5.12 本章总结（核心公式）

记住这三条：

1. **Warp divergence 最坏 = 路径数**
2. **p≈0.5 是 GPU 最危险区**
3. **Divergence 是时间损失，不是算力损失**

> **GPU 不怕算多，
> 怕的是“不知道下一条该算什么”。**

---

