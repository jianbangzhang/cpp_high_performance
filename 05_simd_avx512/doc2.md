
---

# 第 5 章：SIMD 性能建模实战

## —— 从理论峰值到实测性能的完整推导路径

> **目标**：
> 学会在写代码之前，就能判断：
>
> * 这个 loop **最多能跑多快**
> * **瓶颈在算力、内存还是调度**
> * SIMD 是否值得、值多少

---

## 5.1 为什么必须做性能建模

现实中的 SIMD 性能常见三种错觉：

1. **“AVX512 是 AVX2 的 2×” → ❌**
2. **“自动向量化没慢就算成功” → ❌**
3. **“FLOPs 高 = 快” → ❌**

**性能建模的本质**是回答：

> *“理论上我最多能拿到多少，
> 现在为什么只拿到了其中的一部分？”*

---

## 5.2 SIMD 理论峰值性能计算（上限模型）

### 5.2.1 核心公式（第一性原理）

[
\boxed{
Peak_FLOPs
==========

Cores
\times
Frequency
\times
Vector_Width
\times
Ops_per_lane
}
]

其中：

| 项            | 含义                   |
| ------------ | -------------------- |
| Cores        | 物理核心数                |
| Frequency    | SIMD 执行频率（注意 AVX 降频） |
| Vector Width | SIMD lane 数          |
| Ops per lane | 每 lane 每 cycle 的运算数  |

---

### 5.2.2 案例：Intel Xeon AVX512

假设：

* 1 core
* AVX512
* float32
* 双 FMA 单元

计算：

* 512 bit / 32 bit = **16 lanes**
* FMA = 2 FLOPs（mul + add）
* 双 FMA = 4 FLOPs / lane / cycle

[
Peak = 1 \times f \times 16 \times 2 = 32 \text{ FLOPs / cycle}
]

如果频率 = 2.5 GHz：

[
Peak = 80 \text{ GFLOPs / core}
]

👉 **这是“天花板”，任何代码都不可能超过**

---

### 5.2.3 常见错误（必须避开）

❌ 使用标称主频而忽略 **AVX offset**
❌ 把 scalar FLOPs 当 SIMD FLOPs
❌ 忽略单核 vs 全核区别

---

## 5.3 指令级吞吐模型（Execution Throughput）

理论峰值假设：

> **每 cycle 都能发射满向量指令**

现实中要检查：

---

### 5.3.1 µop 与 Port 约束

现代 CPU：

* 每条 SIMD 指令 → 1～2 µops
* 每个 port 每 cycle 只能接 1 µop

示例（Skylake-X）：

| Port    | 功能    |
| ------- | ----- |
| p0 / p1 | FMA   |
| p2 / p3 | Load  |
| p4      | Store |

👉 如果 loop 中：

* 2 load + 1 FMA
  → load port 成瓶颈

---

### 5.3.2 指令吞吐计算示例

Loop body：

```c
c[i] = a[i] * b[i] + c[i];
```

向量化后：

* load a
* load b
* load c
* fma
* store c

端口需求：

| 类型    | 数量 |
| ----- | -- |
| Load  | 3  |
| Store | 1  |
| FMA   | 1  |

→ **访存端口先饱和**

---

## 5.4 Roofline Model：算力 vs 带宽的统一视角

### 5.4.1 Roofline 定义

[
Performance \le \min(
Peak_Compute,,
Arithmetic_Intensity \times Memory_Bandwidth
)
]

---

### 5.4.2 算术强度（Arithmetic Intensity）

[
AI = \frac{FLOPs}{Bytes}
]

示例：

* 每 iteration：2 FLOPs
* 内存：3 load + 1 store = 16 bytes

[
AI = 0.125
]

👉 极度 **memory bound**

---

### 5.4.3 SIMD 提升的本质

* SIMD **提高的是 Compute Roof**
* 如果没碰到 Roof → SIMD 白给

---

## 5.5 实测性能建模流程（工程方法论）

下面是 **工业级标准流程**。

---

### 5.5.1 Step 1：测标量基线

```bash
-O3 -fno-tree-vectorize
```

目的：

* 确认算法复杂度
* 得到纯标量 CPI

---

### 5.5.2 Step 2：开启自动向量化

```bash
-O3 -march=native
```

检查：

* 是否 vectorized
* SIMD width
* 是否 FMA

工具：

* `-Rpass=vector`
* Godbolt

---

### 5.5.3 Step 3：硬件计数器分析

```bash
perf stat \
  -e cycles,instructions,fp_arith_inst_retired.512b_packed_single
```

关键指标：

| 指标          | 说明         |
| ----------- | ---------- |
| IPC         | 发射效率       |
| FLOPs/cycle | 接近峰值？      |
| Cache miss  | SIMD 被内存拖慢 |

---

### 5.5.4 Step 4：对齐理论峰值

[
Efficiency = \frac{Measured}{Peak}
]

经验判断：

| 效率     | 结论      |
| ------ | ------- |
| >90%   | 完美      |
| 70–90% | 很好      |
| <60%   | 存在结构性瓶颈 |

---

## 5.6 SIMD 实测偏差的 7 大来源

### 1️⃣ AVX 降频

* AVX512 → -200～500 MHz
* 峰值被悄悄拉低

---

### 2️⃣ Load / Store 带宽不足

* SIMD 一次 load 很大
* L1 / L2 带宽成瓶颈

---

### 3️⃣ Loop 尾部剥离

* N % SIMD_WIDTH
* 尾部标量拉低均值

---

### 4️⃣ Gather 指令

* 实质是串行 load
* 经常慢于标量

---

### 5️⃣ 分支掩码成本

* Mask ≠ 免费
* active lane 少 → 浪费

---

### 6️⃣ 指令调度失败

* µops 堵在同一个 port
* 编译器无法重排

---

### 7️⃣ TLB / Cache Miss

* SIMD 放大 miss 代价

---

## 5.7 手动 SIMD 的建模决策点

### 5.7.1 值不值得手写？

用下面的公式判断：

[
Gain = Peak \times SIMD_Efficiency
]

如果：

* 自动：0.6 × Peak
* 理论：0.9 × Peak

👉 手动 SIMD **有价值**

---

### 5.7.2 典型值得手写的场景

* Gather-heavy
* 条件密集
* 非连续布局
* 微内核（GEMM / Conv）

---

## 5.8 实战案例：FMA 内核完整建模

### 理论：

* 32 FLOPs / cycle
* 2.5 GHz
* → 80 GFLOPs

### 实测：

* 52 GFLOPs

[
Efficiency = 65%
]

分析：

* L1 带宽饱和
* store port 冲突
* AVX 降频

结论：

> SIMD 已到极限
> **该 kernel 的瓶颈不是计算**

---

## 5.9 SIMD vs GPU：建模视角差异

| 维度   | SIMD | GPU |
| ---- | ---- | --- |
| 并行度  | 8～64 | 万级  |
| 控制流  | 强    | 弱   |
| 延迟隐藏 | 差    | 强   |
| 建模难度 | 高    | 更高  |

👉 SIMD 更适合 **低延迟 + 强控制**

---

## 5.10 本章总结（工程金律）

> **SIMD 性能不是“写不写 intrinsics”，
> 而是“你有没有算过上限”**。

记住三句话：

1. **算峰值之前，不要优化**
2. **没碰 Roof，SIMD 不背锅**
3. **90% 峰值 = 工程极限**

---

## 推荐配套资源（进阶）

* Intel® Optimization Manual
* uops.info（端口吞吐数据库）
* Agner Fog Optimization Guides
* LLVM-MCA

---
