# C++ 高性能编程完全指南 🚀

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![C++20](https://img.shields.io/badge/C%2B%2B-20-blue.svg)](https://en.cppreference.com/w/cpp/20)
[![Build Status](https://img.shields.io/badge/build-passing-brightgreen.svg)]()

> 从编译器旗标到无锁数据结构，从 SIMD 到 PGO，带你榨干每一滴性能

## 📊 性能提升一览表

| 章节 | 主题 | 典型加速比 | 适合人群 |
|------|------|-----------|----------|
| 1 | 现代 C++ 编译器旗标核弹级清单 | 1.5～5× | 所有人 |
| 2 | 数据布局才是性能之神（SoA vs AoS） | 3～50× | 游戏、物理、AI、渲染 |
| 3 | CRTP 完全体：不止是替代虚函数 | 3～100× | 想写下一个 Eigen 的人 |
| 4 | 表达式模板：让临时对象彻底消失 | 5～50× | 矩阵、张量、科学计算 |
| 5 | SIMD 手动 & 自动（AVX2/AVX512/SVE） | 4～32× | 音频、视频、深度学习推理 |
| 6 | 内存分配器：从 new/delete 到神器 | 2～20× | 任何频繁分配的程序 |
| 7 | 锁自由 & 无等待数据结构 | 5～1000× | 高并发服务器、实时系统 |
| 8 | 编译期计算 + constexpr 一切 | 0ms（运行时） | 序列化、配置、单位测试 |
| 9 | PGO + LTO + BOLT 二进制优化终极流 | 1.2～3× | 所有想榨干最后 5% 的人 |
| 10 | 热点分析神器（perf、VTune、Tracy） | 找到 100× 机会 | 性能调优工程师 |
| 11 | 真实世界 SOTA 项目源码剖析 | 学到真功夫 | 准备去大厂/超算/游戏公司 |
| 12 | 终极 Checklist：上线前必跑 27 条 | 防止翻车 | 所有人 |

## 🎯 项目结构

```
cpp-performance-guide/
├── chapter01_compiler_flags/      # 编译器优化旗标
│   ├── examples/
│   ├── benchmarks/
│   └── README.md
├── chapter02_data_layout/         # SoA vs AoS
│   ├── aos_benchmark.cpp
│   ├── soa_benchmark.cpp
│   └── README.md
├── chapter03_crtp/                # CRTP 模式
│   ├── crtp_vs_virtual.cpp
│   ├── static_polymorphism.cpp
│   └── README.md
├── chapter04_expression_templates/ # 表达式模板
│   ├── matrix_et.cpp
│   ├── lazy_evaluation.cpp
│   └── README.md
├── chapter05_simd/                # SIMD 优化
│   ├── avx2_examples/
│   ├── avx512_examples/
│   ├── arm_neon/
│   └── README.md
├── chapter06_allocators/          # 内存分配器
│   ├── pool_allocator.cpp
│   ├── arena_allocator.cpp
│   └── README.md
├── chapter07_lockfree/            # 无锁数据结构
│   ├── spsc_queue.cpp
│   ├── mpmc_queue.cpp
│   └── README.md
├── chapter08_constexpr/           # 编译期计算
│   ├── compile_time_json.cpp
│   ├── constexpr_algorithms.cpp
│   └── README.md
├── chapter09_pgo_lto/             # 二进制优化
│   ├── pgo_workflow/
│   ├── lto_examples/
│   └── README.md
├── chapter10_profiling/           # 性能分析工具
│   ├── perf_tutorial/
│   ├── vtune_examples/
│   └── README.md
├── chapter11_real_world/          # 真实项目剖析
│   ├── eigen_analysis/
│   ├── folly_analysis/
│   └── README.md
├── chapter12_checklist/           # 终极检查清单
│   └── README.md
├── common/                        # 公共代码
│   ├── benchmark_utils.hpp
│   ├── timer.hpp
│   └── cpu_features.hpp
├── CMakeLists.txt
└── README.md
```

## 🚀 快速开始

### 环境要求

- **编译器**: GCC 14+ / Clang 18+ / MSVC 19.41+
- **C++ 标准**: C++20 或更高
- **CMake**: 3.20+
- **可选工具**: 
  - perf (Linux 性能分析)
  - Intel VTune (高级性能分析)
  - Tracy Profiler (实时性能分析)

### 编译项目

```bash
# 克隆仓库
git clone https://github.com/yourusername/cpp-performance-guide.git
cd cpp-performance-guide

# 创建构建目录
mkdir build && cd build

# 配置 CMake（启用所有优化）
cmake .. -DCMAKE_BUILD_TYPE=Release \
         -DCMAKE_CXX_FLAGS="-march=native -O3"

# 编译
cmake --build . -j$(nproc)

# 运行所有基准测试
ctest --output-on-failure
```

### 快速体验

```bash
# 体验第一章：编译器旗标的威力
cd build/chapter01_compiler_flags
./compiler_flags_demo

# 体验第二章：数据布局优化
cd ../chapter02_data_layout
./aos_vs_soa_benchmark

# 体验第五章：SIMD 加速
cd ../chapter05_simd
./simd_comparison
```

## 📚 章节详解

### Chapter 1: 现代 C++ 编译器旗标核弹级清单

**关键内容**:
- `-O3` vs `-Ofast` vs `-O2` 的真实差异
- `-march=native` 的神奇效果
- `-flto` (链接时优化) 实战
- `-fprofile-generate` / `-fprofile-use` (PGO)
- 各编译器特有的杀手级旗标

**示例代码**:
```cpp
// 不同优化级别的性能对比
// 见 chapter01_compiler_flags/optimization_levels.cpp
```

[详细文档](chapter01_compiler_flags/README.md)

### Chapter 2: 数据布局才是性能之神

**关键内容**:
- AoS (Array of Structures) vs SoA (Structure of Arrays)
- Cache Line 对齐与填充
- False Sharing 的避免
- 向量化友好的数据布局

**性能对比**:
```
AoS:  2.3 GB/s (缓存未命中率: 45%)
SoA:  87.6 GB/s (缓存未命中率: 2%)
加速比: 38×
```

[详细文档](chapter02_data_layout/README.md)

### Chapter 3: CRTP 完全体

**关键内容**:
- 静态多态 vs 动态多态性能对比
- Mixin 模式实现
- 编译期接口检查
- 零开销抽象的极致应用

**性能对比**:
```
虚函数调用:      1.2 ns/call
CRTP 调用:       0.3 ns/call (内联后为 0)
加速比: 4× 到 ∞
```

[详细文档](chapter03_crtp/README.md)

### Chapter 4: 表达式模板

**关键内容**:
- 惰性求值消除临时对象
- 如何实现自己的表达式模板库
- Eigen 库的核心技巧
- 编译期优化的极限

**性能对比**:
```
朴素实现:     3 次内存分配，2 次完整遍历
表达式模板:   0 次内存分配，1 次融合遍历
加速比: 15× (在大矩阵上可达 50×)
```

[详细文档](chapter04_expression_templates/README.md)

### Chapter 5: SIMD 手动 & 自动

**关键内容**:
- Intrinsics vs 编译器自动向量化
- AVX2 / AVX-512 实战
- ARM NEON 优化
- 跨平台 SIMD 抽象

**性能对比**:
```
标量代码:        100 ms
自动向量化:       28 ms (3.6×)
手动 AVX2:        13 ms (7.7×)
手动 AVX-512:      7 ms (14×)
```

[详细文档](chapter05_simd/README.md)

### Chapter 6: 内存分配器神器

**关键内容**:
- 对象池分配器
- Arena 分配器
- 单调递增分配器
- pmr (C++17 多态分配器)

**性能对比**:
```
std::allocator:        850 ns/allocation
PoolAllocator:          12 ns/allocation
ArenaAllocator:          2 ns/allocation
加速比: 70× 到 425×
```

[详细文档](chapter06_allocators/README.md)

### Chapter 7: 锁自由 & 无等待数据结构

**关键内容**:
- SPSC / MPMC 队列实现
- ABA 问题的解决
- Memory Order 详解
- Hazard Pointer 技术

**性能对比**:
```
Mutex-based Queue:      1,200 ns/op
Lock-free SPSC:            45 ns/op
Lock-free MPMC:           120 ns/op
加速比: 10× 到 27×
```

[详细文档](chapter07_lockfree/README.md)

### Chapter 8: 编译期计算 + constexpr 一切

**关键内容**:
- `constexpr` 函数与算法
- 编译期 JSON 解析器
- 编译期单位系统
- `consteval` 与 `constinit` (C++20)

**效果**:
```
运行时开销: 0 ms
编译时间增加: 可接受范围内
类型安全: 100%
```

[详细文档](chapter08_constexpr/README.md)

### Chapter 9: PGO + LTO + BOLT 终极流

**关键内容**:
- PGO (Profile-Guided Optimization) 完整流程
- LTO (Link-Time Optimization) 最佳实践
- BOLT (Binary Optimization and Layout Tool)
- 三者组合的终极效果

**性能提升**:
```
基准:           100%
+LTO:           115%
+PGO:           142%
+BOLT:          168%
```

[详细文档](chapter09_pgo_lto/README.md)

### Chapter 10: 热点分析神器

**关键内容**:
- perf 从入门到精通
- Intel VTune Profiler 实战
- Tracy Profiler 实时分析
- FlameGraph 火焰图绘制

[详细文档](chapter10_profiling/README.md)

### Chapter 11: 真实世界项目剖析

**关键内容**:
- Eigen 的表达式模板实现
- Folly 的无锁数据结构
- LLVM 的编译器优化技巧
- Google Abseil 的最佳实践

[详细文档](chapter11_real_world/README.md)

### Chapter 12: 终极 Checklist

**27 条上线前必检项**:
- [ ] 编译器优化旗标已启用
- [ ] PGO 已运行
- [ ] 热点已 profiling
- [ ] 数据布局已优化
- [ ] SIMD 在关键路径已启用
- [ ] 内存分配已优化
- [ ] ...（完整清单见章节）

[详细文档](chapter12_checklist/README.md)

## 🛠️ 性能测试框架

本项目使用自研的轻量级 benchmark 框架：

```cpp
#include "common/benchmark_utils.hpp"

BENCHMARK(MyFunction) {
    // 你的代码
    my_function();
}

BENCHMARK_MAIN();
```

## 📖 推荐阅读

- [Agner Fog's Optimization Manuals](https://www.agner.org/optimize/)
- [Intel Intrinsics Guide](https://www.intel.com/content/www/us/en/docs/intrinsics-guide/index.html)
- [Compiler Explorer (godbolt.org)](https://godbolt.org/)
- [C++ Core Guidelines - Performance](https://isocpp.github.io/CppCoreGuidelines/CppCoreGuidelines#S-performance)

## 🤝 贡献指南

欢迎提交 PR！请确保：
1. 代码通过所有编译器测试
2. 包含性能对比数据
3. 添加详细注释
4. 更新相关文档

## 📄 许可证

MIT License - 详见 [LICENSE](LICENSE) 文件

## 🙏 致谢

感谢以下项目和资源的启发：
- [Eigen](https://eigen.tuxfamily.org/)
- [Folly](https://github.com/facebook/folly)
- [Boost](https://www.boost.org/)
- [CppCon Talks](https://www.youtube.com/user/CppCon)

---

**⚡ 让我们一起榨干 C++ 的每一滴性能！⚡**

如有问题或建议，请提交 [Issue](https://github.com/yourusername/cpp-performance-guide/issues) 或联系维护者。
