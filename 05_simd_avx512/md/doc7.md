
---

# 第 5 章：CPU + GPU 混合系统中

## AMX + Tensor Core 的 Pipeline 设计

### —— 控制密集与吞吐密集计算的架构级分工

---

## 5.1 先给总图（架构全景）

一个理想的 **AMX + Tensor Core 混合系统**，不是“CPU 调度 GPU”那么简单，而是：

```
            ┌───────────┐
Input  ───▶ │  CPU Core │
            │ (Scalar)  │
            └─────┬─────┘
                  │
          控制 / 过滤 / 重排
                  │
            ┌─────▼─────┐
            │   AMX     │   ← 小批量、低延迟、强逻辑
            │ (Tile GEMM│
            └─────┬─────┘
                  │
         批量化 / Blocking
                  │
        ┌─────────▼─────────┐
        │      GPU SM       │
        │  Tensor Cores     │ ← 大批量、高吞吐
        └─────────┬─────────┘
                  │
             Post-process
```

👉 **这是一个“异构计算流水线”，不是 offload**

---

## 5.2 混合设计的核心思想（三条铁律）

### 铁律 1：**AMX 在“时间前段”，Tensor Core 在“时间后段”**

* AMX：**低启动延迟**
* GPU：**高启动延迟、高吞吐**

> 任何把 GPU 放在 pipeline 第一跳的设计，
> 都会在小 batch 上输给 CPU。

---

### 铁律 2：**AMX 处理“控制熵”，GPU 处理“算术熵”**

* 控制熵高：

  * if
  * filter
  * dynamic shape
* 算术熵高：

  * GEMM
  * Conv
  * Attention

👉 **这是 SIMD vs SIMT 哲学的系统级体现**

---

### 铁律 3：**数据只“升级”一次**

```
小 batch → AMX
大 batch → GPU
```

* 绝不：

  * CPU ↔ GPU 来回
* 一旦进 GPU：

  * 坚持算到阶段结束

---

## 5.3 AMX 在 Pipeline 中的“黄金位置”

### 5.3.1 AMX 适合的阶段（精确定义）

AMX 不是 GPU 的替代，而是：

> **GPU 的“预处理器 + 后处理器”**

典型阶段：

1. **Embedding 前处理**

   * ID mapping
   * hash / filter
2. **动态形状规整**

   * padding
   * re-layout
3. **小 GEMM**

   * batch < 32
   * sequence tail

---

### 5.3.2 为什么这些阶段不能直接丢给 GPU？

| 问题      | GPU             | AMX      |
| ------- | --------------- | -------- |
| 分支      | Warp divergence | 标量控制     |
| 小 batch | 启动浪费            | 直接算      |
| 不规则内存   | 非合并             | Cache 友好 |

👉 **AMX 吃掉 GPU 最讨厌的部分**

---

## 5.4 Tensor Core 在 Pipeline 中的“主干地位”

### 5.4.1 Tensor Core 的理想输入形态

Tensor Core 只想看到：

* 大
* 规整
* 连续
* 无分支

也就是说：

```
[ M x K ] × [ K x N ]
M, N 足够大
```

👉 AMX 的工作目标：**把世界变成这样**

---

### 5.4.2 Pipeline 中的批量放大（Batch Amplification）

AMX 的一个关键作用：

> **把“小而碎”的计算，合并成 GPU 喜欢的“大块”**

例如：

* 128 个请求
* 每个 request 一个小 GEMM

AMX：

* 先做过滤、规整
* 拼成一个大 GEMM

GPU：

* 一次 Tensor Core 吃掉

---

## 5.5 数据通路设计（最容易翻车的地方）

### 5.5.1 PCIe / NVLink 的“现实上限”

粗略数量级：

| 通道            | 带宽           |
| ------------- | ------------ |
| PCIe Gen4 x16 | ~32 GB/s     |
| NVLink (单向)   | ~50–100 GB/s |

对比：

* GPU HBM：>1 TB/s
* CPU L3：>1 TB/s（片内）

👉 **跨设备通信是数量级差距**

---

### 5.5.2 Pipeline 中的三种数据策略

#### 1️⃣ Zero-copy（极少数情况）

* 小 batch
* Unified Memory
* 低带宽需求

❌ 不适合 GEMM

---

#### 2️⃣ Staging + Double Buffer（推荐）

```
AMX compute  |====|
Memcpy H2D        |====|
GPU compute             |==========|
```

* 计算与传输重叠
* pipeline 化

---

#### 3️⃣ Persistent GPU Kernel（高端玩法）

* GPU kernel 常驻
* CPU 只投任务描述

👉 延迟最低，但复杂度极高

---

## 5.6 AMX + Tensor Core 的联合性能模型

这是最关键的一节。

### 5.6.1 总时间模型

[
T_{total} =
T_{CPU_scalar}

* T_{AMX}
* \max(T_{H2D}, T_{GPU})
* T_{D2H}
  ]

设计目标：

> **让 H2D 被 GPU compute 完全隐藏**

---

### 5.6.2 什么时候混合是“负收益”？

如果：

[
T_{AMX} + T_{H2D} > T_{GPU_saved}
]

👉 **直接 GPU 更快**

典型失败场景：

* batch 太小
* GEMM 本身很轻
* 频繁来回

---

## 5.7 三种经典 Pipeline 模式（工业级）

---

### 模式 A：**AMX 前处理 + GPU 主计算（最常见）**

```
CPU scalar
   ↓
AMX filter / pack
   ↓
GPU Tensor Core
```

适用：

* NLP 推理
* 推荐系统

---

### 模式 B：**GPU 主计算 + AMX 后处理**

```
GPU Tensor Core
   ↓
CPU + AMX
   ↓
结果融合 / Top-K
```

适用：

* 排序
* Beam Search
* 条件输出

---

### 模式 C：**AMX-only → GPU-only 分段**

```
if (batch < T):
    AMX
else:
    GPU
```

适用：

* 在线服务
* SLA 严格

👉 **这是工业界最稳妥的策略**

---

## 5.8 一个真实风格的案例（推理系统）

### 场景

* Transformer 推理
* batch 动态变化
* SLA：p99 < 20ms

### 设计

* batch < 8：

  * AMX 全程
* batch ≥ 8：

  * AMX embedding + GPU attention

### 结果

| 指标  | GPU-only | AMX+GPU |
| --- | -------- | ------- |
| p50 | 7ms      | 5ms     |
| p99 | 42ms     | 18ms    |

👉 **AMX 消灭尾延迟**

---

## 5.9 架构陷阱清单（血泪总结）

❌ 把 AMX 当“小 GPU”
❌ 每一层都 CPU ↔ GPU
❌ 忽略调度和 NUMA
❌ 忽略 AMX tile 配置成本

---

## 5.10 未来趋势：异构 Pipeline 会“自动化”

正在发生的事：

* 编译器：

  * 自动决定 AMX / GPU
* Runtime：

  * 动态 batch 路由
* 模型：

  * 更规整的 kernel

👉 **未来的优化目标不是“写 intrinsics”，而是“设计 pipeline”**

---

## 5.11 终极总结（一句话）

> **AMX 是“把不规则世界压平”，
> Tensor Core 是“把规则世界碾碎”。**

把这两者放在一个 pipeline 里，
你就拥有了 **低延迟 + 高吞吐** 的同时解。

---

