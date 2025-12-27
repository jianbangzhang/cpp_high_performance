
---

# 第 5 章：Intel AMX vs NVIDIA Tensor Core 的 Tile 架构对比

## —— CPU 世界的矩阵扩展 vs GPU 世界的矩阵引擎

---

## 5.1 先给结论（架构级）

> **AMX 是“把矩阵作为 CPU 的一种新寄存器”**
> **Tensor Core 是“把矩阵作为 GPU 的一种新执行单元”**

这句话决定了下面所有差异。

---

## 5.2 设计动机的根本不同

### 5.2.1 Intel AMX 的出发点

Intel 的现实约束：

* CPU 必须：

  * 支持复杂控制流
  * 支持 OS 抢占
  * 支持任意数据结构
* 但：

  * AI / GEMM 吞吐严重落后 GPU

👉 **AMX 的目标不是“追 GPU”，而是：**

> **在不破坏 CPU 编程模型的前提下，
> 给 CPU 一个“够用的矩阵引擎”**

---

### 5.2.2 NVIDIA Tensor Core 的出发点

GPU 的先天优势：

* 吞吐导向
* 批量计算
* 已经是 SIMT

👉 Tensor Core 的目标是：

> **把 GEMM 这个内核，
> 直接从“程序”变成“硬件事实”**

---

## 5.3 Tile 抽象层级对比（极其关键）

这是两者**最根本的分水岭**。

| 维度        | Intel AMX     | NVIDIA Tensor Core |
| --------- | ------------- | ------------------ |
| Tile 是什么  | **寄存器**       | **执行单元**           |
| Tile 生命周期 | 软件管理          | 硬件隐式               |
| Tile 可见性  | 程序员可见         | 程序员不可见             |
| Tile 控制   | 显式 load/store | 编译器 + warp         |
| 上下文切换     | OS 感知         | GPU 内部             |

👉 **AMX 的 tile 属于 ISA**
👉 **Tensor Core 的 tile 属于微架构**

---

## 5.4 Intel AMX 的 Tile 架构深入拆解

### 5.4.1 AMX Tile Register File（TRF）

* 每个 core：

  * **8 个 tile 寄存器**
* 每个 tile：

  * 最大 **1024 bytes**
* 典型配置：

  * 16 × 64 INT8
  * 16 × 32 BF16

```
Tile 0: A
Tile 1: B
Tile 2: C
```

👉 **Tile 是一级架构资源，和 ZMM 同级**

---

### 5.4.2 AMX 指令语义（ISA 级）

典型指令：

```asm
TDPBSSD   tmm2, tmm0, tmm1
```

语义：

```
tmm2 += tmm0 × tmm1
```

特征：

* 原子级 tile GEMM
* 无部分 lane
* 无分支
* 同步执行

---

### 5.4.3 Tile 配置（XTILECFG）

AMX 的一个巨大特点：

> **Tile 形状是运行期可配置的**

```c
tilecfg.colsb[0] = 64;
tilecfg.rows[0]  = 16;
```

👉 这是 CPU 世界少有的 **“动态矩阵形状”**

---

### 5.4.4 AMX 的执行路径

```
Memory
  ↓ (tileload)
Tile Register
  ↓
AMX Matrix Engine
  ↓
Tile Register
  ↓ (tilestore)
Memory
```

👉 **完全由软件掌控数据流**

---

## 5.5 NVIDIA Tensor Core 的 Tile 架构深入拆解

### 5.5.1 Tensor Core 的位置

* Tensor Core 位于：

  * 每个 SM 内
* 程序员：

  * **不能直接看到**
* 通过：

  * `mma.sync`
  * WMMA API

👉 **这是“功能单元”，不是寄存器**

---

### 5.5.2 Warp-level Tile 抽象

一个 warp：

* 32 threads
* **协同执行一个 tile GEMM**

例如（Ampere）：

* 每 warp：

  * 16 × 16 × 16
* 每 thread：

  * 负责 tile 的一部分 fragment

```
Warp
 ├─ thread 0 → fragment
 ├─ thread 1 → fragment
 ...
```

---

### 5.5.3 Tensor Core 的隐式数据流

```
Global / Shared Memory
        ↓
   Register Fragment
        ↓
    Tensor Core
        ↓
   Register Fragment
```

特点：

* 程序员只操作 fragment
* 编译器调度搬运
* 无显式 tile load/store

👉 **数据流被“固化”**

---

## 5.6 执行模型对比（本质差异）

| 维度    | AMX     | Tensor Core        |
| ----- | ------- | ------------------ |
| 执行单位  | Core    | Warp               |
| 并行方式  | 多核      | 多 warp             |
| 调度    | CPU OoO | GPU Warp Scheduler |
| 上下文切换 | 支持      | 不支持                |

---

## 5.7 精度与数值语义

### AMX

* INT8 → INT32 accumulate
* BF16 → FP32 accumulate
* 精度 **严格可控**

👉 适合 **企业推理 / 金融**

---

### Tensor Core

* FP16 / BF16 / TF32 / INT8
* 混合精度
* 内部重排、融合

👉 适合 **大规模训练**

---

## 5.8 性能建模：为什么差一个数量级

### 5.8.1 AMX 理论峰值（Sapphire Rapids）

* 每 core：

  * 每 cycle：

    * 2 × 1024 INT8 ops
* 但：

  * 频率低
  * 核数有限

👉 **~2–4 TFLOPs / socket**

---

### 5.8.2 Tensor Core 理论峰值（A100）

* 每 SM：

  * 4 Tensor Cores
* 全卡：

  * 数百个 TC

👉 **~300+ TFLOPs（FP16）**

---

### 5.8.3 核心原因

不是“快慢”，而是：

| 因素   | AMX | Tensor Core |
| ---- | --- | ----------- |
| 并行规模 | 数十  | 数万          |
| 启动成本 | 极低  | 高           |
| 数据局部 | 小   | 极大          |

---

## 5.9 编程模型对比（工程体验）

| 维度    | AMX   | Tensor Core |
| ----- | ----- | ----------- |
| 编程难度  | 极高    | 中           |
| 控制流   | 强     | 弱           |
| Debug | 可 GDB | 极难          |
| OS 支持 | 完整    | 无           |

👉 **AMX = 高级汇编**
👉 **Tensor Core = DSL 后端**

---

## 5.10 典型适用场景

### AMX 更优：

* 小 batch 推理
* 延迟敏感
* 强条件逻辑
* 数据不规则

### Tensor Core 更优：

* 大 batch 训练
* 吞吐优先
* 规则 GEMM
* 数据密集

---

## 5.11 架构趋势：正在发生的融合

* Intel：

  * AMX + SIMD + Prefetch
* NVIDIA：

  * Warp-level MMA 泛化
* 共识：

  * **Tile 是未来，但位置不同**

---

## 5.12 终极总结（体系结构视角）

> **AMX 是“CPU 世界对 AI 的防御性进化”**
> **Tensor Core 是“GPU 世界对 AI 的进攻性设计”**

* AMX 尊重 **通用性**
* Tensor Core 榨干 **规律性**

它们不会互相取代，但会：

> **共同定义未来 10 年的计算内核形态**

---


