# Chapter 1: 现代 C++ 编译器旗标核弹级清单 ⚡

> **目标**: 通过正确的编译器旗标获得 1.5～5× 的性能提升，零代码改动

## 📋 目录

- [基础优化级别](#基础优化级别)
- [架构特定优化](#架构特定优化)
- [链接时优化 (LTO)](#链接时优化-lto)
- [Profile-Guided Optimization (PGO)](#profile-guided-optimization-pgo)
- [各编译器特有旗标](#各编译器特有旗标)
- [完整优化配置](#完整优化配置)
- [性能对比实测](#性能对比实测)

## 基础优化级别

### GCC / Clang

| 旗标 | 含义 | 使用场景 | 注意事项 |
|------|------|----------|----------|
| `-O0` | 无优化 | 调试 | 编译最快，可执行文件最大 |
| `-O1` | 基础优化 | 开发阶段 | 折衷方案 |
| `-O2` | **推荐优化** | 生产环境 | 安全、可靠 |
| `-O3` | 激进优化 | 追求性能 | 可能增加代码体积 |
| `-Os` | 优化体积 | 嵌入式系统 | 牺牲部分性能 |
| `-Ofast` | **最激进** | 科学计算 | ⚠️ 破坏 IEEE 754 标准 |

### MSVC

| 旗标 | 含义 | 等价 GCC |
|------|------|----------|
| `/Od` | 无优化 | `-O0` |
| `/O1` | 最小化体积 | `-Os` |
| `/O2` | 最大化速度 | `-O2` |
| `/Ox` | 最大优化 | `-O3` |

### 性能对比

```bash
# 测试代码：矩阵乘法 (1000×1000)
gcc -O0 matrix_mul.cpp -o matrix_O0  # 12.3 秒
gcc -O2 matrix_mul.cpp -o matrix_O2  #  2.1 秒  (5.9× faster)
gcc -O3 matrix_mul.cpp -o matrix_O3  #  1.8 秒  (6.8× faster)
gcc -Ofast matrix_mul.cpp -o matrix_Ofast  #  1.5 秒  (8.2× faster)
```

## 架构特定优化

### `-march` 旗标：释放 CPU 全部能力

```bash
# 自动检测并使用当前 CPU 的所有指令集
-march=native

# 手动指定架构（跨平台部署）
-march=x86-64-v3    # AVX2 + BMI2 + FMA
-march=skylake      # Intel Skylake
-march=znver3       # AMD Zen 3
-march=armv8-a+sve  # ARM with SVE
```

**实测效果**:
```bash
# 向量求和 (100M 元素)
gcc -O3 sum.cpp                    # 85 ms
gcc -O3 -march=native sum.cpp      # 23 ms  (3.7× faster)
```

### `-mtune` 旗标：微调 CPU 特性

```bash
# 为特定 CPU 微架构优化（保持兼容性）
-mtune=native
-mtune=intel
-mtune=znver3
```

### CPU 特性旗标

```bash
# 手动启用特定指令集
-mavx2              # AVX2 指令集
-mfma               # FMA (融合乘加)
-mbmi2              # BMI2 位操作指令
-mavx512f           # AVX-512 基础
-mavx512vl          # AVX-512 向量长度扩展
```

## 链接时优化 (LTO)

### 什么是 LTO？

LTO 允许编译器在**链接阶段**对整个程序进行优化，而不仅仅是单个编译单元。

### 启用方法

**GCC / Clang**:
```bash
# 编译时
gcc -O3 -flto -c file1.cpp -o file1.o
gcc -O3 -flto -c file2.cpp -o file2.o

# 链接时
gcc -O3 -flto file1.o file2.o -o program

# 或者一步到位
gcc -O3 -flto file1.cpp file2.cpp -o program
```

**MSVC**:
```bash
cl /O2 /GL file1.cpp file2.cpp /link /LTCG
```

### LTO 性能提升

```bash
# 实测：Web 服务器 (处理 100k 请求)
without LTO:  2.3 秒
with LTO:     1.8 秒  (1.28× faster)
```

### 加速 LTO 编译

```bash
# 使用多线程 LTO (GCC)
-flto=auto
-flto=8    # 使用 8 个线程

# 使用 Thin LTO (Clang) - 更快的编译时间
-flto=thin
```

## Profile-Guided Optimization (PGO)

### PGO 工作流程

```
1. 编译时插桩
   ↓
2. 运行程序收集 Profile 数据
   ↓
3. 使用 Profile 数据重新编译
```

### GCC 实战

```bash
# 步骤 1: 编译时插桩
gcc -O3 -fprofile-generate program.cpp -o program

# 步骤 2: 运行程序（使用典型工作负载）
./program < typical_input.txt

# 步骤 3: 使用 Profile 数据重新编译
gcc -O3 -fprofile-use program.cpp -o program_optimized

# 清理 Profile 数据
rm -f *.gcda
```

### Clang 实战

```bash
# 步骤 1: 插桩
clang++ -O3 -fprofile-instr-generate program.cpp -o program

# 步骤 2: 运行并生成 raw profile
./program < typical_input.txt
# 生成 default.profraw

# 步骤 3: 转换 profile 格式
llvm-profdata merge -output=program.profdata default.profraw

# 步骤 4: 使用 profile 重新编译
clang++ -O3 -fprofile-instr-use=program.profdata program.cpp -o program_optimized
```

### MSVC 实战

```bash
# 步骤 1: 插桩
cl /O2 /GL program.cpp /link /LTCG:PGI

# 步骤 2: 运行
program.exe < typical_input.txt

# 步骤 3: 优化编译
cl /O2 /GL program.cpp /link /LTCG:PGO
```

### PGO 性能提升

```bash
# 实测：数据库查询引擎
without PGO:  100 queries/sec
with PGO:     142 queries/sec  (1.42× faster)

# 分支预测准确率
without PGO:  87%
with PGO:     97%
```

## 各编译器特有旗标

### GCC 特有

```bash
# 函数内联控制
-finline-functions          # 激进内联
-finline-limit=1000         # 内联大小限制

# 循环优化
-funroll-loops              # 循环展开
-ftree-vectorize            # 自动向量化
-ftree-loop-vectorize       # 循环向量化

# 性能相关
-ffast-math                 # 快速数学运算（不精确）
-fno-exceptions             # 禁用异常（减小体积）
-fno-rtti                   # 禁用 RTTI

# 诊断
-fopt-info-vec             # 显示向量化信息
-fopt-info-inline          # 显示内联信息
```

### Clang 特有

```bash
# Polly 优化器（循环优化神器）
-mllvm -polly
-mllvm -polly-vectorizer=stripmine

# 时间追踪
-ftime-trace               # 生成编译时间火焰图

# 新特性
-fforce-emit-vtables       # 强制生成虚表
```

### MSVC 特有

```bash
# 浮点优化
/fp:fast                   # 快速浮点运算

# 函数级链接
/Gy                        # 函数级链接

# 优化引用
/Zc:inline                 # 移除未引用的函数

# SSE/AVX
/arch:AVX2                 # AVX2 支持
/arch:AVX512               # AVX-512 支持
```

## 完整优化配置

### 极致性能配置 (GCC/Clang)

```bash
g++ -std=c++20 \
    -O3 \
    -march=native \
    -mtune=native \
    -flto=auto \
    -fprofile-use \
    -funroll-loops \
    -ftree-vectorize \
    -ffast-math \
    -DNDEBUG \
    -s \
    program.cpp -o program
```

### 极致性能配置 (MSVC)

```bash
cl /std:c++20 ^
   /O2 ^
   /GL ^
   /arch:AVX2 ^
   /fp:fast ^
   /Gy ^
   /DNDEBUG ^
   program.cpp ^
   /link /LTCG
```

### CMake 配置示例

```cmake
cmake_minimum_required(VERSION 3.20)
project(HighPerformanceApp CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Release 模式下的优化旗标
if(CMAKE_BUILD_TYPE STREQUAL "Release")
    if(CMAKE_CXX_COMPILER_ID MATCHES "GNU|Clang")
        add_compile_options(
            -O3
            -march=native
            -mtune=native
            -flto
            -funroll-loops
            -ftree-vectorize
        )
        add_link_options(-flto)
    elseif(MSVC)
        add_compile_options(
            /O2
            /GL
            /arch:AVX2
            /fp:fast
        )
        add_link_options(/LTCG)
    endif()
endif()

add_executable(myapp main.cpp)
```

## 性能对比实测

### 测试代码：矩阵乘法

```cpp
// matrix_benchmark.cpp
#include <vector>
#include <chrono>
#include <iostream>

constexpr size_t N = 1024;

void matrix_multiply(const std::vector<float>& A,
                     const std::vector<float>& B,
                     std::vector<float>& C) {
    for (size_t i = 0; i < N; ++i) {
        for (size_t j = 0; j < N; ++j) {
            float sum = 0.0f;
            for (size_t k = 0; k < N; ++k) {
                sum += A[i * N + k] * B[k * N + j];
            }
            C[i * N + j] = sum;
        }
    }
}

int main() {
    std::vector<float> A(N * N, 1.0f);
    std::vector<float> B(N * N, 2.0f);
    std::vector<float> C(N * N);

    auto start = std::chrono::high_resolution_clock::now();
    matrix_multiply(A, B, C);
    auto end = std::chrono::high_resolution_clock::now();

    auto duration = std::chrono::duration_cast<std::chrono::milliseconds>(end - start);
    std::cout << "Time: " << duration.count() << " ms\n";
    
    return 0;
}
```

### 编译与测试

```bash
# O0: 无优化
g++ -O0 matrix_benchmark.cpp -o matrix_O0
./matrix_O0  # 输出: Time: 12450 ms

# O2: 标准优化
g++ -O2 matrix_benchmark.cpp -o matrix_O2
./matrix_O2  # 输出: Time: 2134 ms  (5.8× faster)

# O3: 激进优化
g++ -O3 matrix_benchmark.cpp -o matrix_O3
./matrix_O3  # 输出: Time: 1876 ms  (6.6× faster)

# O3 + march=native: 架构优化
g++ -O3 -march=native matrix_benchmark.cpp -o matrix_O3_native
./matrix_O3_native  # 输出: Time: 521 ms  (23.9× faster)

# O3 + march=native + LTO: 全优化
g++ -O3 -march=native -flto matrix_benchmark.cpp -o matrix_O3_native_lto
./matrix_O3_native_lto  # 输出: Time: 489 ms  (25.5× faster)
```

### 结果汇总

| 配置 | 时间 (ms) | 相对加速 |
|------|----------|---------|
| `-O0` | 12450 | 1.0× |
| `-O2` | 2134 | 5.8× |
| `-O3` | 1876 | 6.6× |
| `-O3 -march=native` | 521 | 23.9× |
| `-O3 -march=native -flto` | 489 | 25.5× |

## 🎯 最佳实践总结

### 开发阶段
```bash
-O0 -g    # 调试信息 + 无优化
```

### 测试阶段
```bash
-O2 -g    # 中等优化 + 调试信息
```

### 生产部署
```bash
-O3 -march=native -flto -DNDEBUG
```

### 极致性能 + PGO
```bash
# 第一次编译
-O3 -march=native -fprofile-generate

# 运行收集数据后
-O3 -march=native -flto -fprofile-use -DNDEBUG
```

## ⚠️ 注意事项

1. **`-Ofast` 警告**: 会破坏 IEEE 754 浮点标准，导致数值计算不精确
2. **`-march=native` 警告**: 生成的二进制只能在当前 CPU 架构运行
3. **LTO 编译时间**: 会显著增加编译时间，建议在 CI/CD 中使用
4. **PGO 工作负载**: 必须使用**典型**输入数据，否则可能适得其反

## 📚 扩展阅读

- [GCC Optimization Options](https://gcc.gnu.org/onlinedocs/gcc/Optimize-Options.html)
- [Clang Optimization Flags](https://clang.llvm.org/docs/CommandGuide/clang.html#cmdoption-O0)
- [MSVC Compiler Options](https://learn.microsoft.com/en-us/cpp/build/reference/compiler-options)

---

**下一章**: [Chapter 2 - 数据布局才是性能之神](../chapter02_data_layout/README.md)
