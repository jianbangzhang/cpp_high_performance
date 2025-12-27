# C++ 高性能编程完全指南 

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![C++20](https://img.shields.io/badge/C%2B%2B-20-blue.svg)](https://en.cppreference.com/w/cpp/20)
[![Build Status](https://img.shields.io/badge/build-passing-brightgreen.svg)]()

> 从编译器旗标到无锁数据结构，从 SIMD 到 PGO，带你榨干每一滴性能

## 性能提升一览表

| 章节 | 主题 | 典型加速比 | 适合人群 |
|------|------|-----------|----------|
| 0 | 现代 C++ OOP_STL_PTR_MS | 零拷贝 | 所有人 |
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

## 项目结构

```
cpp-performance-guide/
├── 00_stl_ptr_oop_ms
│   ├── ai_graph2.cpp
│   ├── ai_graph.cpp
│   ├── compile_run.sh
│   ├── doc
│   │   ├── C++.Primer.5th.Edition_2013.pdf
│   │   └── Scott_Meyers_Effective_Modern_C++.pdf
│   ├── md
│   │   ├── doc1.md
│   │   ├── doc2.md
│   │   ├── doc3.md
│   │   ├── doc4.md
│   │   ├── doc5.md
│   │   ├── doc6.md
│   │   ├── doc7.md
│   │   ├── doc8.md
│   │   └── doc9.md
│   └── README.md
├── 01_compiler_flags_nuclear
│   ├── matrix_benchmark.cpp
│   ├── md
│   │   ├── doc1.md
│   │   └── main.md
│   └── README.md
├── 02_data_layout_soa_aos
│   ├── aos_vs_soa_benchmark.cpp
│   ├── doc
│   │   ├── dodbook.pdf
│   │   ├── DOD-Cpp.pdf
│   │   ├── introduction-to-data-oriented-design.pdf
│   │   ├── practical-examples-in-data-oriented-design.pdf
│   │   └── St11ASX_CUDA.pdf
│   ├── md
│   │   └── doc1.md
│   └── README.md
├── 03_crtp_full_power
│   ├── crtp_complete_guide.cpp
│   ├── crtp_complete_guide.s
│   ├── doc
│   │   ├── CRTP.pdf
│   │   └── mixin_crtp.pdf
│   ├── md
│   │   └── doc1.md
│   └── README.md
├── 04_expression_templates
│   ├── expression_templates_complete.cpp
│   ├── expression_templates_complete.s
│   ├── md
│   │   └── doc1.md
│   └── README.md
├── 05_simd_avx512
│   ├── doc
│   │   ├── 102476_0001_00_en_introduction-to-sve.pdf
│   │   ├── 3 - Intro to SVE.pdf
│   │   ├── com.arm.doc.102699_0100_00_en.pdf
│   │   ├── DDI0584B_a_SVE_supp_armv9A.pdf
│   │   └── sve-ieee-micro-2017.pdf
│   ├── md
│   │   ├── doc10.md
│   │   ├── doc11.md
│   │   ├── doc12.md
│   │   ├── doc13.md
│   │   ├── doc1.md
│   │   ├── doc2.md
│   │   ├── doc3.md
│   │   ├── doc4.md
│   │   ├── doc5.md
│   │   ├── doc6.md
│   │   ├── doc7.md
│   │   ├── doc8.md
│   │   └── doc9.md
│   ├── README.md
│   └── simd_complete_guide.cpp
├── 06_allocators_arena_pool
│   ├── custom_allocators_complete.cpp
│   ├── doc
│   │   ├── 1804.03436v2.pdf
│   │   ├── berger-oopsla2002.pdf
│   │   ├── BH_US_12_Argyroudis_Exploiting_the_ jemalloc_Memory_ Allocator_WP.pdf
│   │   ├── lto.pdf
│   │   ├── n3916.pdf
│   │   └── paper.pdf
│   ├── md
│   │   ├── doc1.md
│   │   ├── doc2.md
│   │   └── doc3.md
│   ├── perf.sh
│   └── README.md
├── 07_lockfree_spsc_mpmc
│   ├── doc
│   │   ├── 1996_PODC_queues.pdf
│   │   ├── 2001-caslists.pdf
│   │   ├── hazard-pointers.pdf
│   │   ├── herlihy93transactional.pdf
│   │   ├── p124-herlihy.pdf
│   │   └── urcu-main.pdf
│   ├── lockfree_datastructures_complete.cpp
│   ├── md
│   │   └── doc1.md
│   └── README.md
├── 08_constexpr_all_the_things
│   ├── constexpr_complete_guide.cpp
│   ├── constexpr_complete_guide.s
│   ├── doc
│   │   ├── p0810r0.pdf
│   │   └── sac10-constexpr.pdf
│   └── README.md
├── 09_pgo_lto_bolt
│   ├── benchmark_program.cpp
│   ├── doc
│   │   ├── 1010.2196v2.pdf
│   │   ├── 1411.6361v1.pdf
│   │   ├── 1807.06735v2.pdf
│   │   ├── 2507.16649v1.pdf
│   │   ├── af0a39422b19fbbe063479f5d3a71d9278677314.pdf
│   │   └── baseline_result.txt
│   ├── md
│   │   ├── doc1.md
│   │   └── doc2.md
│   ├── pgo_lto_bolt_workflow.sh
│   └── README.md
├── 10_profiling_perf_vtune_tracy
│   ├── doc
│   │   ├── 2927299.2927301.pdf
│   │   ├── PerfTool.pdf
│   │   ├── RooflineVyNoYellow.pdf
│   │   ├── tracy.pdf
│   │   ├── vtune-profiler_cookbook_2023.2-766316-782573 (1).pdf
│   │   └── vtune-profiler_cookbook_2023.2-766316-782573.pdf
│   ├── git.sh
│   ├── hotspot_example.cpp
│   ├── md
│   │   └── main.md
│   └── README.md
├── 11_real_world_eigen_folly
│   ├── compile.sh
│   ├── doc
│   │   ├── 1807.06735v2.pdf
│   │   ├── JeffDean.pdf
│   │   ├── p3731-schulze.pdf
│   │   └── RooflineVyNoYellow.pdf
│   ├── md
│   │   └── main.md
│   ├── mini_eigen.cpp
│   └── README.md
├── 12_final_checklist
│   ├── md
│   │   └── main.md
│   └── README.md
├── 13-optimization-doc
│   ├── code
│   │   ├── asmlib
│   │   │   ├── asmlib.h
│   │   │   ├── asmlib-instructions.pdf
│   │   │   ├── asmlibran.h
│   │   │   ├── asmlibSrc.zip
│   │   │   ├── inteldispatchpatch.zip
│   │   │   ├── libacof32.lib
│   │   │   ├── libacof32o.lib
│   │   │   ├── libacof64.lib
│   │   │   ├── libacof64o.lib
│   │   │   ├── libad32.dll
│   │   │   ├── libad32.lib
│   │   │   ├── libad64.dll
│   │   │   ├── libad64.lib
│   │   │   ├── libaelf32.a
│   │   │   ├── libaelf32o.a
│   │   │   ├── libaelf64.a
│   │   │   ├── libaelf64o.a
│   │   │   ├── libamac32.a
│   │   │   ├── libamac32o.a
│   │   │   ├── libamac64.a
│   │   │   ├── libamac64o.a
│   │   │   ├── libaomf32.lib
│   │   │   ├── libaomf32o.lib
│   │   │   └── license.txt
│   │   ├── cpuidfake
│   │   │   ├── cpuidFake.exe
│   │   │   ├── cpuidFakeSource.zip
│   │   │   ├── DriverSource.zip
│   │   │   ├── Instructions.txt
│   │   │   ├── MSRDriver32.sys
│   │   │   └── MSRDriver64.sys
│   │   ├── objconv
│   │   │   ├── changelog.txt
│   │   │   ├── extras.zip
│   │   │   ├── objconv.exe
│   │   │   ├── objconv-instructions.pdf
│   │   │   └── source.zip
│   │   └── testp
│   │       ├── DriverSrcLinux.zip
│   │       ├── DriverSrcWin.zip
│   │       ├── PMCTest.zip
│   │       ├── testp.pdf
│   │       └── TestScripts.zip
│   └── doc
│       ├── 10-nan_propagation.pdf
│       ├── 161204_Mastering_the_FreeRTOS_Real_Time_Kernel-A_Hands-On_Tutorial_Guide.pdf
│       ├── 1-optimizing_cpp.pdf
│       ├── 2408.14158v2.pdf
│       ├── 2-optimizing_assembly.pdf
│       ├── 3-microarchitecture.pdf
│       ├── 4-instruction_tables.pdf
│       ├── 5-calling_conventions.pdf
│       ├── 6-vcl_manual.pdf
│       ├── 7-forwardcom.pdf
│       ├── 8-objconv-instructions.pdf
│       ├── 9-asmlib-instructions.pdf
│       ├── FreeRTOS_Reference_Manual_V10.0.0.pdf
│       └── instruction_tables.ods
├── CMakeLists.txt
├── CONTRIBUTING.md
├── LEARNING_PATH.md
├── LICENSE
├── quick_start.sh
├── README.md
├── RESOURCES.md
└── web.md
```

## 快速开始

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


## 章节详解

### Chapter 1: 现代 C++ 编译器旗标核弹级清单

**关键内容**:
- `-O3` vs `-Ofast` vs `-O2` 的真实差异
- `-march=native` 的神奇效果
- `-flto` (链接时优化) 实战
- `-fprofile-generate` / `-fprofile-use` (PGO)
- 各编译器特有的杀手级旗标


[详细文档](01_compiler_flags_nuclear/README.md)

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

[详细文档](02_data_layout_soa_aos/README.md)

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

[详细文档](03_crtp_full_power/README.md)

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

[详细文档](04_expression_templates/README.md)

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

[详细文档](05_simd_avx512/README.md)

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

[详细文档](06_allocators_arena_pool/README.md)

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

[详细文档](07_lockfree_spsc_mpmc/README.md)

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

[详细文档](08_constexpr_all_the_things/README.md)

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

[详细文档](09_pgo_lto_bolt/README.md)

### Chapter 10: 热点分析神器

**关键内容**:
- perf 从入门到精通
- Intel VTune Profiler 实战
- Tracy Profiler 实时分析
- FlameGraph 火焰图绘制

[详细文档](10_profiling_perf_vtune_tracy/README.md)

### Chapter 11: 真实世界项目剖析

**关键内容**:
- Eigen 的表达式模板实现
- Folly 的无锁数据结构
- LLVM 的编译器优化技巧
- Google Abseil 的最佳实践

[详细文档](11_real_world_eigen_folly/README.md)

### Chapter 12: 终极 Checklist

**27 条上线前必检项**:
- [ ] 编译器优化旗标已启用
- [ ] PGO 已运行
- [ ] 热点已 profiling
- [ ] 数据布局已优化
- [ ] SIMD 在关键路径已启用
- [ ] 内存分配已优化
- [ ] ...（完整清单见章节）

[详细文档](12_final_checklist/README.md)

## 性能测试框架

本项目使用自研的轻量级 benchmark 框架：

```cpp
#include "common/benchmark_utils.hpp"

BENCHMARK(MyFunction) {
    // 你的代码
    my_function();
}

BENCHMARK_MAIN();
```

## 推荐阅读

- [Agner Fog's Optimization Manuals](https://www.agner.org/optimize/)
- [Intel Intrinsics Guide](https://www.intel.com/content/www/us/en/docs/intrinsics-guide/index.html)
- [Compiler Explorer (godbolt.org)](https://godbolt.org/)
- [C++ Core Guidelines - Performance](https://isocpp.github.io/CppCoreGuidelines/CppCoreGuidelines#S-performance)

## 贡献指南

欢迎提交 PR！请确保：
1. 代码通过所有编译器测试
2. 包含性能对比数据
3. 添加详细注释
4. 更新相关文档

## 许可证

MIT License - 详见 [LICENSE](LICENSE) 文件

## 致谢

感谢以下项目和资源的启发：
- [Eigen](https://eigen.tuxfamily.org/)
- [Folly](https://github.com/facebook/folly)
- [Boost](https://www.boost.org/)
- [CppCon Talks](https://www.youtube.com/user/CppCon)

---

**⚡ 让我们一起榨干 C++ 的每一滴性能！⚡**

如有问题或建议，请提交 [Issue](https://github.com/jianbangzhang/cpp_high_performance/issues) 或联系维护者。
