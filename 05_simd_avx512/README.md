#### 5.1 引言：SIMD 架构的理论演进

SIMD（Single Instruction Multiple Data）是现代 CPU 并行化的核心，自 MMX（1997）起演进至 AVX512（2017）和 ARM SVE（Scalable Vector Extension，2016）。它允许单指令处理多个数据（如 512 位寄存器处理 16 个 float）。

本章偏重理论：向量寄存器模型、指令集架构（ISA）对比、自动向量化条件、手动 intrinsics 设计、手动 vs 自动的权衡模型，以及未来 RISC-V V 扩展。适用于音频处理、视频编解码、深度学习推理等领域，典型加速 4～32 倍。

#### 5.2 SIMD 硬件理论基础

向量寄存器：AVX2（256 位）、AVX512（512 位）、SVE（128～2048 位，可变）。

数据并行度：float 为 8/16/（SVE 灵活）。

关键组件：
- 加载/存储：对齐内存访问
- 算术：_mm512_add_ps 等
- 掩码：AVX512 引入 k 寄存器，支持条件执行
- 收集/散布：Gather/Scatter，非连续访问

瓶颈模型：Amdahl 定律扩展，SIMD 加速并行部分，串行部分（如分支）限制整体。

#### 5.3 自动向量化的理论条件

编译器（如 GCC/Clang）在 -O3 -march=native 下尝试自动向量化循环。

必要条件：
- 循环独立（无数据依赖）
- 连续内存访问（SoA 布局）
- 无别名（-fstrict-aliasing）
- 迭代次数已知或大

理论模型：Cost Model，编译器计算标量 vs 向量版本的预计 cycles，选择更好者。

失败原因：别名、条件分支、函数调用。

#### 5.4 手动 SIMD：Intrinsics 理论框架

Intrinsics 是编译器内置函数，如 __m512 _mm512_load_ps(const float*);

设计原则：
- 对齐：_mm512_load_ps 需要 64 字节对齐
- 掩码：_mm512_mask_add_ps 避免分支
- 循环剥离：处理余数（N % 16）

性能模型：理论峰值 FLOPs = 核数 × 频率 × 向量宽度 × FMA（Fusion Multiply-Add）。

例如，Intel Xeon AVX512：双 FMA 单元，峰值 2 × 16 FLOPs/cycle/核。

#### 5.5 AVX2 vs AVX512 vs SVE 的 ISA 对比理论

- AVX2：固定 256 位，成熟但宽度小
- AVX512：512 位 + 掩码 + 扩展指令（如 VPOPCNT），但功耗高（降频）
- SVE：向量长度无关（VL-Agnostic），代码可移植到不同宽度硬件

理论优势：SVE 避免宽度硬编码，未来证明。

#### 5.6 手动 vs 自动的决策模型

| 因素           | 自动向量化       | 手动 Intrinsics   |
|----------------|------------------|-------------------|
| 易用性         | 高               | 低                |
| 移植性         | 高（-march=）    | 低（需 #ifdef）   |
| 性能上限       | 80%～95%         | 100%              |
| 适用场景       | 简单循环         | 复杂逻辑/非连续   |

模型：如果自动达不到 90% 峰值，手动介入。

#### 5.7 高级主题：SIMD + 多线程融合理论

结合 OpenMP：#pragma omp simd

模型：屋顶线模型（Roofline Model），分析计算密集 vs 内存密集，SIMD 提升计算屋顶。

#### 5.8 真实世界理论案例

FFmpeg 使用 AVX512 加速 H.264 解码，理论 8～16 倍。

TorchServe 推理：手动 SIMD 优化 embedding，加速 4～10 倍。

#### 5.9 局限性与未来理论

局限：分支重、稀疏数据不友好。

未来：RISC-V V 1.0，统一 SIMD 标准。

#### 5.10 小结

SIMD 是硬件级并行的理论巅峰，掌握其模型能让你从架构角度优化代码。
