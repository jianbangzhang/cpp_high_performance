# SIMD 向量化理论深度解析

现代 CPU 性能的**硬件级秘密武器**：SIMD（单指令多数据流）。这是让程序在不增加核心数的情况下获得 4～32 倍加速的关键技术。

## 一、SIMD 的本质：数据级并行

### 问题：为什么需要 SIMD？

**摩尔定律的终结**：

```
历史趋势：
1990s: CPU 频率每 18 个月翻倍（500MHz → 1GHz → 2GHz）
2000s: 继续增长（2GHz → 3GHz → 4GHz）
2010s: 停滞（3～5GHz，物理极限）

功耗墙：P = C × V² × f
- 频率翻倍 → 功耗翻倍
- 5GHz+ → 散热无法解决

解决方案：
1. 多核（Thread-Level Parallelism）
2. SIMD（Data-Level Parallelism）← 本章焦点
```

### 核心思想：向量寄存器

**标量处理**（传统 CPU）：

```c
// 标量代码：每次处理 1 个元素
for (int i = 0; i < n; ++i) {
    c[i] = a[i] + b[i];
}

// 汇编（x86-64，标量）：
loop:
    movss  xmm0, [a + i*4]    ; 加载 a[i]（32-bit float）
    movss  xmm1, [b + i*4]    ; 加载 b[i]
    addss  xmm0, xmm1         ; xmm0 += xmm1
    movss  [c + i*4], xmm0    ; 存储 c[i]
    inc    i
    cmp    i, n
    jl     loop
    
// 每次迭代：1 个加法
```

**向量处理**（SIMD）：

```c
// 向量化代码：每次处理 8 个元素（AVX2）
for (int i = 0; i < n; i += 8) {
    __m256 va = _mm256_load_ps(&a[i]);  // 加载 8 个 float
    __m256 vb = _mm256_load_ps(&b[i]);
    __m256 vc = _mm256_add_ps(va, vb);  // 8 个加法并行
    _mm256_store_ps(&c[i], vc);
}

// 汇编（AVX2）：
loop:
    vmovaps ymm0, [a + i*4]   ; 加载 8 个 float（256 位）
    vmovaps ymm1, [b + i*4]
    vaddps  ymm0, ymm0, ymm1  ; 单条指令，8 个并行加法
    vmovaps [c + i*4], ymm0
    add     i, 8
    cmp     i, n
    jl      loop
    
// 每次迭代：8 个加法（并行）
```

**加速比**：8× 理论加速（实际 4～6×，受内存带宽限制）

## 二、SIMD 指令集的演进史

### 历史时间线

```
1997: MMX (Multi-Media Extension)
      - 64-bit 寄存器（mm0-mm7）
      - 整数操作：2×32-bit 或 8×8-bit
      - 问题：与 FPU 寄存器共享（无法同时用）

1999: SSE (Streaming SIMD Extensions)
      - 128-bit 寄存器（xmm0-xmm15）
      - 4×32-bit float
      - 独立寄存器组

2001: SSE2
      - 支持双精度：2×64-bit double
      - 整数操作：2×64-bit, 4×32-bit, 8×16-bit, 16×8-bit

2004: SSE3, SSSE3
      - 水平操作（horizontal ops）
      - 更多整数指令

2007: SSE4.1, SSE4.2
      - 点积（dot product）
      - 字符串操作

2011: AVX (Advanced Vector Extensions)
      - 256-bit 寄存器（ymm0-ymm15）
      - 8×32-bit float 或 4×64-bit double
      - 非破坏性三操作数（dst = src1 op src2）

2013: AVX2
      - 整数向量化（8×32-bit int）
      - FMA (Fused Multiply-Add)：a*b+c 单条指令
      - Gather：非连续内存加载

2017: AVX-512
      - 512-bit 寄存器（zmm0-zmm31）
      - 16×32-bit float 或 8×64-bit double
      - 掩码寄存器（k0-k7）：条件执行
      - 更多指令：VPOPCNT（popcount）, VPCONFLICT（冲突检测）

2016: ARM NEON / SVE
      - NEON：128-bit（ARMv7/v8）
      - SVE：128～2048-bit（可伸缩）
      - 向量长度无关（VL-Agnostic）编程

2023: RISC-V Vector Extension 1.0
      - 可伸缩向量长度
      - 开放标准
```

### 寄存器宽度对比

| 指令集 | 寄存器宽度 | float 并行度 | double 并行度 | int32 并行度 |
|--------|-----------|-------------|--------------|-------------|
| SSE | 128-bit | 4 | 2 | 4 |
| AVX/AVX2 | 256-bit | 8 | 4 | 8 |
| AVX-512 | 512-bit | 16 | 8 | 16 |
| ARM NEON | 128-bit | 4 | 2 | 4 |
| ARM SVE | 128～2048-bit | 可变 | 可变 | 可变 |

## 三、自动向量化的理论基础

### 编译器的向量化决策模型

```cpp
// 示例：简单循环
void add_arrays(float* a, float* b, float* c, int n) {
    for (int i = 0; i < n; ++i) {
        c[i] = a[i] + b[i];
    }
}

// 编译器的分析过程：
// 1. 依赖性分析（Dependence Analysis）
//    - c[i] 不依赖 c[i-1]？✓ 可并行
//    - a, b, c 没有别名？需检查
//
// 2. 成本模型（Cost Model）
//    标量版本成本：n × (2 load + 1 add + 1 store) = 4n 操作
//    向量版本成本：(n/8) × (2 vload + 1 vadd + 1 vstore) + 余数处理
//                  = (n/8) × 4 + (n%8) × 4 ≈ n/2 操作
//    
//    向量版本更快 → 向量化！
//
// 3. 代码生成
gcc -O3 -march=native -ftree-vectorize
```

**生成的汇编**（-O3 -march=skylake-avx512）：

```asm
add_arrays:
    xor     eax, eax
    test    edx, edx        ; 检查 n
    jle     .L1             ; n <= 0，直接返回
    
.L_vector_loop:
    vmovups zmm0, [rdi + rax*4]  ; 加载 a[i..i+15]（512-bit）
    vaddps  zmm0, zmm0, [rsi + rax*4]  ; 加 b[i..i+15]
    vmovups [rcx + rax*4], zmm0        ; 存储 c[i..i+15]
    add     rax, 16                    ; i += 16
    cmp     eax, edx
    jl      .L_vector_loop
    
.L_scalar_epilogue:
    ; 处理余数（n % 16）
    ; ...
    
.L1:
    ret
```

**关键观察**：
- 单条 `vaddps` 处理 16 个 float
- 循环迭代次数减少 16 倍
- 理论加速 16×（实际 8～12×）

### 自动向量化的必要条件

#### 1. 循环独立性（Loop Independence）

**可向量化**：

```c
// 每个迭代独立
for (int i = 0; i < n; ++i) {
    c[i] = a[i] * b[i];  // c[i] 不依赖其他迭代
}
```

**不可向量化**（数据依赖）：

```c
// 累加器：依赖前一次迭代
float sum = 0;
for (int i = 0; i < n; ++i) {
    sum += a[i];  // sum 依赖 sum(i-1)
}

// 编译器输出：
// "loop not vectorized: loop contains data dependencies"
```

**解决方案**：手动展开为多个累加器

```c
float sum0 = 0, sum1 = 0, sum2 = 0, sum3 = 0;
for (int i = 0; i < n; i += 4) {
    sum0 += a[i];
    sum1 += a[i+1];
    sum2 += a[i+2];
    sum3 += a[i+3];
}
float sum = sum0 + sum1 + sum2 + sum3;
// 现在可以向量化！
```

#### 2. 连续内存访问（Contiguous Memory）

**理想情况**（SoA）：

```c
struct ParticlesSoA {
    float* x;  // 所有 x 连续
    float* y;
    float* z;
};

for (int i = 0; i < n; ++i) {
    particles.x[i] += velocity.x[i] * dt;  // 连续访问 ✓
}
```

**糟糕情况**（AoS）：

```c
struct Particle {
    float x, y, z;
};

Particle* particles;
for (int i = 0; i < n; ++i) {
    particles[i].x += velocity[i].x * dt;
    // 访问模式：particles[0].x, particles[1].x, particles[2].x
    // 内存地址：0, 12, 24（步长 12，不连续）
    // 编译器：不向量化或效率低
}
```

#### 3. 对齐访问（Alignment）

```c
// 对齐到 64 字节（AVX-512 要求）
alignas(64) float a[1024];
alignas(64) float b[1024];

// 编译器生成：
vmovaps zmm0, [a]  // 对齐加载（快）

// vs 非对齐：
float* a = malloc(1024 * sizeof(float));  // 可能未对齐
vmovups zmm0, [a]  // 非对齐加载（慢 2～3×）
```

**理论原因**：
- 对齐加载：单次内存事务
- 非对齐加载：可能跨越两个 cache line，需两次事务

#### 4. 无别名（No Aliasing）

```c
void add(float* a, float* b, float* c, int n) {
    for (int i = 0; i < n; ++i) {
        c[i] = a[i] + b[i];
    }
}

// 问题：编译器不知道 a, b, c 是否重叠
// 如果 c == a，那么 c[i] = a[i] + b[i] 会修改后续的 a[i+1]
// → 不敢向量化
```

**解决方案 1**：`__restrict` 关键字

```c
void add(float* __restrict a, 
         float* __restrict b, 
         float* __restrict c, int n) {
    // 告诉编译器：a, b, c 不重叠
    // → 可以向量化
}
```

**解决方案 2**：编译器旗标

```bash
gcc -fstrict-aliasing  # 假设无别名（可能不安全）
```

#### 5. 已知或大迭代次数

```c
// 好：编译器知道至少 1000 次
for (int i = 0; i < 1000; ++i) {
    c[i] = a[i] + b[i];
}

// 不好：不知道 n（可能很小）
for (int i = 0; i < n; ++i) {  // n 可能 < 16
    c[i] = a[i] + b[i];
}
// 编译器可能放弃向量化（开销不值得）
```

**解决方案**：循环分割

```c
if (n >= 16) {
    // 向量化主循环
    for (int i = 0; i < n - n%16; i += 16) {
        // SIMD 代码
    }
}
// 标量处理余数
for (int i = n - n%16; i < n; ++i) {
    c[i] = a[i] + b[i];
}
```

### 向量化报告

```bash
# GCC
gcc -O3 -march=native -fopt-info-vec-optimized -fopt-info-vec-missed

# Clang
clang -O3 -march=native -Rpass=loop-vectorize -Rpass-missed=loop-vectorize

# 输出示例
# test.c:10:5: remark: vectorized loop (vectorization width: 16)
# test.c:25:5: remark: loop not vectorized: cannot prove data independence
```

## 四、手动 SIMD：Intrinsics 编程

### Intrinsics 的类型系统

```c
// AVX-512 类型（Intel）
__m512  // 16×32-bit float
__m512d // 8×64-bit double
__m512i // 16×32-bit int（或其他整数）

__mmask16 // 掩码（16 位）

// 加载/存储
__m512 _mm512_load_ps(const float* mem);        // 对齐加载
__m512 _mm512_loadu_ps(const float* mem);       // 非对齐加载
void _mm512_store_ps(float* mem, __m512 a);     // 对齐存储

// 算术
__m512 _mm512_add_ps(__m512 a, __m512 b);       // a + b
__m512 _mm512_mul_ps(__m512 a, __m512 b);       // a * b
__m512 _mm512_fmadd_ps(__m512 a, __m512 b, __m512 c);  // a*b + c

// 掩码操作（条件执行）
__m512 _mm512_mask_add_ps(__m512 src, __mmask16 k, __m512 a, __m512 b);
// 等价于：result[i] = k[i] ? (a[i] + b[i]) : src[i]
```

### 实战案例 1：向量加法

```c
void vec_add_scalar(const float* a, const float* b, float* c, size_t n) {
    for (size_t i = 0; i < n; ++i) {
        c[i] = a[i] + b[i];
    }
}

void vec_add_avx512(const float* a, const float* b, float* c, size_t n) {
    size_t i = 0;
    
    // 主循环：处理 16 的倍数
    for (; i + 16 <= n; i += 16) {
        __m512 va = _mm512_loadu_ps(&a[i]);
        __m512 vb = _mm512_loadu_ps(&b[i]);
        __m512 vc = _mm512_add_ps(va, vb);
        _mm512_storeu_ps(&c[i], vc);
    }
    
    // 余数处理（标量）
    for (; i < n; ++i) {
        c[i] = a[i] + b[i];
    }
}
```

**性能对比**（10M 元素，Intel Xeon Platinum 8380）：

| 实现 | 时间 | 吞吐量 | 加速比 |
|------|------|--------|--------|
| 标量 | 15 ms | 2.7 GB/s | 1× |
| 自动向量化 (-O3) | 2.5 ms | 16 GB/s | 6× |
| 手动 AVX-512 | 1.8 ms | 22 GB/s | **8.3×** |

### 实战案例 2：点积（Dot Product）

```c
// 标量版本
float dot_scalar(const float* a, const float* b, size_t n) {
    float sum = 0;
    for (size_t i = 0; i < n; ++i) {
        sum += a[i] * b[i];
    }
    return sum;
}

// AVX-512 版本
float dot_avx512(const float* a, const float* b, size_t n) {
    __m512 vsum = _mm512_setzero_ps();  // 初始化为 0
    
    size_t i = 0;
    for (; i + 16 <= n; i += 16) {
        __m512 va = _mm512_loadu_ps(&a[i]);
        __m512 vb = _mm512_loadu_ps(&b[i]);
        
        // FMA: vsum = va * vb + vsum
        vsum = _mm512_fmadd_ps(va, vb, vsum);
    }
    
    // 水平归约：将 16 个部分和相加
    float result = _mm512_reduce_add_ps(vsum);
    
    // 余数
    for (; i < n; ++i) {
        result += a[i] * b[i];
    }
    
    return result;
}
```

**性能分析**：

```
标量版本：
- 每次迭代：1 乘法 + 1 加法 = 2 FLOPs
- n 次迭代 = 2n FLOPs
- 有依赖链（sum 依赖前次）

AVX-512 版本：
- 每次迭代：16 乘法 + 16 加法 = 32 FLOPs
- n/16 次迭代 ≈ 2n FLOPs（相同）
- 但：16 个独立累加器，打破依赖链
- CPU 可乱序执行（Out-of-Order Execution）

实测加速：12～15×
```

### 实战案例 3：条件操作（掩码）

```c
// 任务：c[i] = (a[i] > threshold) ? a[i] : 0

// 标量版本（有分支）
void threshold_scalar(const float* a, float* c, size_t n, float thresh) {
    for (size_t i = 0; i < n; ++i) {
        if (a[i] > thresh) {  // 分支预测可能失败
            c[i] = a[i];
        } else {
            c[i] = 0;
        }
    }
}

// AVX-512 版本（无分支）
void threshold_avx512(const float* a, float* c, size_t n, float thresh) {
    __m512 vthresh = _mm512_set1_ps(thresh);  // 广播 thresh
    __m512 vzero = _mm512_setzero_ps();
    
    for (size_t i = 0; i + 16 <= n; i += 16) {
        __m512 va = _mm512_loadu_ps(&a[i]);
        
        // 生成掩码：k[i] = (a[i] > thresh)
        __mmask16 mask = _mm512_cmp_ps_mask(va, vthresh, _CMP_GT_OQ);
        
        // 条件选择：无分支！
        __m512 vc = _mm512_mask_blend_ps(mask, vzero, va);
        
        _mm512_storeu_ps(&c[i], vc);
    }
    
    // 余数处理...
}
```

**理论优势**：
- 无分支 → 无分支预测失败
- 16 个元素并行判断
- 加速比：8～20×（取决于分支预测失败率）

### 实战案例 4：非连续访问（Gather/Scatter）

```c
// 任务：c[i] = a[indices[i]] + b[i]

// AVX-512 Gather
void gather_add(const float* a, const int* indices, 
                const float* b, float* c, size_t n) {
    for (size_t i = 0; i + 16 <= n; i += 16) {
        // 加载索引
        __m512i vidx = _mm512_loadu_si512(&indices[i]);
        
        // Gather：a[indices[i..i+15]]
        __m512 va = _mm512_i32gather_ps(vidx, a, 4);  // scale=4 (sizeof(float))
        
        __m512 vb = _mm512_loadu_ps(&b[i]);
        __m512 vc = _mm512_add_ps(va, vb);
        
        _mm512_storeu_ps(&c[i], vc);
    }
}
```

**性能**：
- Gather 比普通加载慢 10～20×（随机内存访问）
- 但仍比标量快 2～4×（16 个并行）

## 五、性能理论模型

### Roofline 模型（屋顶线模型）

**核心思想**：程序性能受限于**计算峰值**或**内存带宽**

```
性能（GFLOP/s）
    ^
    |           计算屋顶（Compute Bound）
    |          /‾‾‾‾‾‾‾‾‾‾‾‾‾‾
    |         /
    |        /  内存屋顶（Memory Bound）
    |       /
    |      /
    |     /
    +----+-------------------------> 算术强度（FLOP/Byte）
         ↑
      交叉点
```

**定义**：

- **算术强度**（Arithmetic Intensity）：
  ```
  AI = FLOPs / 内存访问字节数
  ```

- **计算峰值**（Compute Roof）：
  ```
  Peak GFLOP/s = 核数 × 频率 × 向量宽度 × FMA
  
  示例（Intel Xeon 8380，40 核，2.3GHz，AVX-512）：
  = 40 × 2.3 × 16 × 2 (FMA)
  = 2944 GFLOP/s (理论)
  ```

- **内存屋顶**（Memory Roof）：
  ```
  Peak GB/s × AI = 实际 GFLOP/s
  
  示例（DDR4-3200，6 通道）：
  = 6 × 25.6 GB/s = 153.6 GB/s
  ```

**案例分析：向量加法**

```c
c[i] = a[i] + b[i];

// 内存访问：
// - 读 a[i]: 4 字节
// - 读 b[i]: 4 字节
// - 写 c[i]: 4 字节
// 总计：12 字节

// 计算：1 个加法 = 1 FLOP

// 算术强度 = 1 FLOP / 12 Byte ≈ 0.083 FLOP/Byte
```

**性能预测**：

```
内存带宽 = 153.6 GB/s
算术强度 = 0.083 FLOP/Byte

实际性能 = 153.6 × 0.083 ≈ 12.7 GFLOP/s（内存受限！）

计算峰值 = 2944 GFLOP/s（根本达不到）

结论：向量加法是典型的内存受限操作
     SIMD 只能部分加速（打满内存带宽）
```

**案例分析：矩阵乘法**

```c
C[i][j] += A[i][k] * B[k][j];  // 循环 k

// 内存访问（假设 cache 友好）：
// - 读 A[i][k]: 4 字节
// - 读 B[k][j]: 4 字节
// - 读写 C[i][j]: 4+4 字节
// 总计：≈ 16 字节（摊销后）

// 计算：1 乘法 + 1 加法 = 2 FLOPs

// 算术强度 ≈ 2 / 16 = 0.125（朴素）
//           ≈ O(N) / O(N²) 内存（分块优化后）
//           ≈ 可达 10+ FLOP/Byte（高度优化）
```

**结论**：矩阵乘法可以是计算受限（通过分块），SIMD 加速明显。

### Amdahl 定律扩展

```
加速比 = 1 / ((1-P) + P/S)

其中：
- P = 可并行部分比例
- S = 并行加速比

SIMD 场景：
- P = 向量化代码比例
- S = SIMD 宽度（理想）或实际加速（现实）
- (1-P) = 标量代码（条件分支、余数处理等）
```

**示例**：

```
场景：90% 代码向量化，10% 标量

理想（AVX-512，16× 加速）：
加速比 = 1 / (0.1 + 0.9/16) = 1 / 0.15625 ≈ 6.4×

实际（考虑内存瓶颈，8× 加速）：
加速比 = 1 / (0.1 + 0.9/8) = 1 / 0.2125 ≈ 4.7×

结论：即使 90% 向量化，也只能达到 4～6× 总加速
```

## 六、ISA 对比：AVX-512 vs ARM SVE

### AVX-512 的特点

**优势**：
1. **高并行度**：16 个 float，8 个 double
2. **丰富指令**：500+ 条指令
   - VPOPCNT（popcount）
   - VPCONFLICT（冲突检测）
   - VPERMT2PS（复杂置换）
3. **掩码寄存器**：k0-k7，支持精细控制

**劣势**：
1. **功耗问题**：512-bit 运算 → CPU 降频
   ```
   Base频率：2.3GHz
   AVX-512 频率：1.8GHz（降 20%）
   ```
2. **兼容性**：Intel 专有，AMD Zen4+ 才支持
3. **代码膨胀**：需要多版本（SSE/AVX2/AVX512）

### ARM SVE 的革命性设计

**核心思想**：向量长度无关（VL-Agnostic）

```c
// 传统 AVX-512（硬编码 16）
for (int i = 0; i < n; i += 16) {
    __m512 v = _mm512_load_ps(&a[i]);
    // 处理 16 个元素
}

// ARM SVE（动态长度）
svfloat32_t va;
for (int i = 0; i < n; i += svcntw()) {  // svcntw() 返回当前向量长度
    svbool_t pg = svwhilelt_b32(i, n);   // 生成谓词（predicate）
    va = svld1_f32(pg, &a[i]);            // 谓词控制加载
    // 处理 svcntw() 个元素（可能是 4, 8, 16, 32...）
}
```

**优势**：
1. **可移植性**：同一代码在 128-bit 和 2048-bit 硬件上运行
2. **未来证明**：硬件升级时无需重新编译
3. **谓词机制**：比 AVX-512 掩码更灵活

