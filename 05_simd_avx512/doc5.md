
---

# 第 5 章：Tensor Core vs SIMD FMA 的体系结构差异

## —— 标量向量计算 vs 矩阵块计算的根本分野

---

## 5.1 表面相似，实质不同

表面看：

* SIMD FMA：
  [
  c_i = a_i \times b_i + c_i
  ]
* Tensor Core：
  [
  C_{m\times n} = A_{m\times k} \times B_{k\times n} + C
  ]

两者都是 **FMA**。

**本质却完全不同**：

| 维度   | SIMD FMA | Tensor Core |
| ---- | -------- | ----------- |
| 计算单位 | 向量 lane  | 矩阵 tile     |
| 并行粒度 | 元素级      | 块级          |
| 编程语义 | 标量扩展     | 线性代数原语      |

👉 **Tensor Core 并不是“更宽的 SIMD”**

---

## 5.2 SIMD FMA 的体系结构本质

### 5.2.1 SIMD FMA 的抽象模型

```
for i in lanes:
    c[i] += a[i] * b[i]
```

特征：

* 每个 lane **语义独立**
* 共享一条指令
* 完全同步

---

### 5.2.2 微架构视角

* 每 cycle：

  * 多个 lane 同时执行 FMA
* 调度单位：

  * 向量指令
* 数据路径：

  * Register → ALU → Register

👉 **SIMD 是 ALU 的横向复制**

---

### 5.2.3 SIMD FMA 的设计目标

* 服务 **通用代码**
* 保持 **IEEE 精度**
* 保证 **低延迟**

因此：

* 数据类型灵活
* 控制流复杂也能跑
* 峰值相对受限

---

## 5.3 Tensor Core 的体系结构本质

### 5.3.1 Tensor Core 的抽象模型

```
C_tile += A_tile × B_tile
```

注意：

* 这是 **一个原子指令**
* 程序员 **无法访问内部标量结果**

---

### 5.3.2 Tensor Core 的硬件组织

* 一个 Tensor Core：

  * 包含 **多个 FMA 阵列**
  * 深度流水
* 一次指令：

  * 触发 **几十到上百次 FMA**

👉 **它是“硬编码矩阵乘法的 ASIC”**

---

### 5.3.3 执行粒度差异

| 项目   | SIMD FMA     | Tensor Core  |
| ---- | ------------ | ------------ |
| 最小计算 | 1 FMA / lane | 一个 tile GEMM |
| 调度   | 每条指令         | 每个 warp      |
| 并行来源 | 向量宽度         | tile 内部展开    |

---

## 5.4 数据通路与存储模型差异

### SIMD FMA

* 数据来源：

  * 通用寄存器 / 向量寄存器
* 生命周期：

  * 短
* 访存：

  * 显式 load/store

---

### Tensor Core

* 数据来源：

  * shared memory / fragment
* 生命周期：

  * 覆盖整个 tile
* 访存：

  * 编译器自动调度

👉 **Tensor Core 把“数据重用”硬件化**

---

## 5.5 精度与数值语义的根本差异

### SIMD FMA

* float32 / float64
* IEEE 754 严格
* 确定性强

---

### Tensor Core

* FP16 / BF16 / TF32 / INT8
* 混合精度
* 内部累加可能非 IEEE

👉 **Tensor Core 牺牲数值通用性换吞吐**

---

## 5.6 性能建模：数量级差异从何而来

### 5.6.1 SIMD FMA 建模

[
Peak = Cores × Frequency × Lanes × 2
]

典型：

* 32–64 FLOPs / cycle / core

---

### 5.6.2 Tensor Core 建模

以 A100 为例：

* 一个 SM：

  * 4 Tensor Cores
* 每 TC：

  * 每 cycle 执行一个 16×8×16 GEMM

[
FLOPs = 2 × 16 × 8 × 16 = 4096
]

👉 **数量级差异源于“计算原语不同”**

---

## 5.7 控制流与分歧的处理差异

| 维度   | SIMD FMA | Tensor Core |
| ---- | -------- | ----------- |
| 控制流  | 支持       | 几乎无         |
| 分歧   | mask     | warp 级同步    |
| 适用逻辑 | 复杂       | 极简          |

Tensor Core 假设：

> **所有线程都在算同一个矩阵块**

---

## 5.8 为什么 Tensor Core 极其高效

### 三个硬编码假设

1. **问题是 GEMM**
2. **数据可重用**
3. **精度可降低**

CPU SIMD **不能**假设这些。

---

## 5.9 为什么 SIMD FMA 依然不可替代

| 场景         | 原因                |
| ---------- | ----------------- |
| 小 batch 推理 | Tensor Core 启动成本高 |
| 不规则数据      | SIMD 灵活           |
| 强控制流       | GPU 发散            |
| 高精度        | FP64              |

👉 **SIMD 是“通用刀”，Tensor Core 是“工业冲床”**

---

## 5.10 融合趋势：界限正在变模糊

* GPU：

  * Warp-level MMA
  * 更通用
* CPU：

  * AMX（Intel）
  * BF16 tile

👉 **未来是“Tile-based SIMD”**

---

## 5.11 一句话总结

> **SIMD FMA 是“把算术向量化”
> Tensor Core 是“把线性代数硬件化”**

理解这一点，就理解了：

* 为什么 Tensor Core 吞吐爆炸
* 为什么它不能替代 CPU
* 为什么 AI 时代选择了 GPU

---

