# C++ 高性能编程资源大全 📚

> 精选的书籍、文章、视频、工具和项目，助你成为性能优化专家

## 📖 必读书籍

### 入门级

1. **《Optimized C++》** by Kurt Guntheroth
   - 📘 实用性强，充满实战技巧
   - 🎯 适合：有 C++ 基础的开发者
   - ⭐ 评分: 4.5/5

2. **《C++ High Performance》** (2nd Edition) by Bjorn Andrist & Viktor Sehr
   - 📘 现代 C++ 性能指南
   - 🎯 适合：C++17/20 开发者
   - ⭐ 评分: 4.6/5

3. **《Effective C++》** by Scott Meyers
   - 📘 经典之作，55 条最佳实践
   - 🎯 适合：所有 C++ 开发者
   - ⭐ 评分: 4.8/5

### 中级

4. **《C++ Concurrency in Action》** (2nd Edition) by Anthony Williams
   - 📘 并发编程圣经
   - 🎯 适合：需要编写多线程代码的开发者
   - ⭐ 评分: 4.7/5
   - 🔗 [官网](https://www.manning.com/books/c-plus-plus-concurrency-in-action-second-edition)

5. **《The Art of Writing Efficient Programs》** by Fedor G. Pikus
   - 📘 深入编译器和 CPU 架构
   - 🎯 适合：追求极致性能的开发者
   - ⭐ 评分: 4.6/5

6. **《Data-Oriented Design》** by Richard Fabian
   - 📘 游戏行业的性能秘诀
   - 🎯 适合：游戏开发者
   - 🔗 [在线免费阅读](https://www.dataorienteddesign.com/dodbook/)

### 高级

7. **《Computer Systems: A Programmer's Perspective》** by Bryant & O'Hallaron
   - 📘 计算机系统基础
   - 🎯 适合：想深入理解底层的开发者
   - ⭐ 评分: 4.9/5

8. **《The Art of Multiprocessor Programming》** by Herlihy & Shavit
   - 📘 并发算法理论与实践
   - 🎯 适合：高级并发编程
   - ⭐ 评分: 4.5/5

9. **《Software Optimization Resources》** by Agner Fog
   - 📘 优化手册合集（免费）
   - 🎯 适合：所有性能工程师
   - 🔗 [免费下载](https://www.agner.org/optimize/)
   - 包含 5 本手册：
     - Optimizing software in C++
     - Optimizing subroutines in assembly language
     - The microarchitecture of Intel, AMD and VIA CPUs
     - Instruction tables
     - Calling conventions

---

## 📝 精选文章与博客

### 必读博客

1. **Brendan Gregg's Blog**
   - 🔗 http://www.brendangregg.com/
   - 📌 性能分析、火焰图、Linux 内核

2. **Agner Fog's Optimization Resources**
   - 🔗 https://www.agner.org/optimize/
   - 📌 CPU 微架构、汇编优化

3. **Russ Cox's Blog**
   - 🔗 https://research.swtch.com/
   - 📌 Go 语言、并发、性能

4. **Preshing on Programming**
   - 🔗 https://preshing.com/
   - 📌 无锁编程、内存模型

5. **Easyperf Blog**
   - 🔗 https://easyperf.net/blog/
   - 📌 性能分析教程、perf 使用

### 经典文章

6. **"What Every Programmer Should Know About Memory"** by Ulrich Drepper
   - 🔗 https://people.freebsd.org/~lstewart/articles/cpumemory.pdf
   - 📌 内存层次、缓存

7. **"Lockless Programming Considerations"** by Paul McKenney
   - 🔗 https://www.kernel.org/doc/Documentation/memory-barriers.txt
   - 📌 Linux 内核内存屏障

8. **"C++Now 2012: Data-Oriented Design"** by Mike Acton
   - 🔗 https://www.youtube.com/watch?v=rX0ItVEVjHc
   - 📌 数据导向设计

---

## 🎥 推荐视频

### CppCon 精选

1. **"Embracing Modern C++ Safely"** by John Lakos
   - 🔗 https://www.youtube.com/watch?v=Vokr_ZqILOE
   - ⏱️ 1h 30m

2. **"Benchmarking C++ Code"** by Bryce Adelstein Lelbach
   - 🔗 https://www.youtube.com/watch?v=zWxSZcpeS8Q
   - ⏱️ 1h

3. **"There Are No Zero-Cost Abstractions"** by Chandler Carruth
   - 🔗 https://www.youtube.com/watch?v=rHIkrotSwcc
   - ⏱️ 1h 30m

4. **"Want Fast C++? Know Your Hardware!"** by Timur Doumler
   - 🔗 https://www.youtube.com/watch?v=BP6NxVxDQIs
   - ⏱️ 1h

5. **"The Nightmare of Move Semantics"** by Nicolai Josuttis
   - 🔗 https://www.youtube.com/watch?v=PNRju6_yn3o
   - ⏱️ 1h 30m

### 专题系列

6. **"C++ Weekly"** by Jason Turner
   - 🔗 https://www.youtube.com/c/lefticus1
   - 📌 每周短视频（10-15 分钟）
   - 🎯 涵盖现代 C++ 技巧

7. **"Back to Basics" Series** (CppCon)
   - 🔗 CppCon YouTube Channel
   - 📌 从基础到高级的系统性讲解

---

## 🛠️ 工具与库

### 性能分析工具

| 工具 | 平台 | 用途 | 链接 |
|------|------|------|------|
| **perf** | Linux | CPU profiling, PMU | 内置 |
| **Intel VTune** | Linux/Win | 微架构分析 | [链接](https://www.intel.com/content/www/us/en/developer/tools/oneapi/vtune-profiler.html) |
| **Tracy Profiler** | 跨平台 | 实时性能分析 | [GitHub](https://github.com/wolfpld/tracy) |
| **Valgrind** | Linux/Mac | 内存分析 | [官网](https://valgrind.org/) |
| **gperftools** | 跨平台 | CPU/Heap profiling | [GitHub](https://github.com/gperftools/gperftools) |
| **Instruments** | macOS | 系统级分析 | Xcode |
| **AMD uProf** | Linux/Win | AMD CPU 优化 | [下载](https://developer.amd.com/amd-uprof/) |

### Benchmark 库

| 库 | 特点 | 推荐指数 |
|----|------|---------|
| **Google Benchmark** | 功能强大，统计准确 | ⭐⭐⭐⭐⭐ |
| **Catch2 Benchmark** | 集成测试框架 | ⭐⭐⭐⭐ |
| **Celero** | 自动化对比 | ⭐⭐⭐ |
| **Hayai** | 轻量级 | ⭐⭐⭐ |

### 高性能库

| 库 | 领域 | 特点 |
|----|------|------|
| **Eigen** | 线性代数 | 表达式模板、SIMD |
| **Folly** | 通用 | Facebook 出品，并发工具 |
| **Abseil** | 通用 | Google 出品，现代 C++ |
| **TBB** | 并行计算 | Intel 出品，任务调度 |
| **Boost.Lockfree** | 并发 | 无锁数据结构 |
| **jemalloc** | 内存分配 | 高性能分配器 |
| **mimalloc** | 内存分配 | Microsoft 出品 |

---

## 🏫 在线课程

### 付费课程

1. **"C++ Performance Optimization"** - Pluralsight
   - 💰 订阅制
   - ⏱️ 4h
   - 🎯 实战导向

2. **"Advanced C++ Programming"** - Udemy
   - 💰 一次性购买
   - ⏱️ 8h
   - 🎯 包含性能专题

### 免费资源

3. **"Performance Ninja"** Class
   - 🔗 https://github.com/dendibakh/perf-ninja
   - 💰 免费
   - 📌 实战练习题

4. **MIT 6.172: Performance Engineering**
   - 🔗 https://ocw.mit.edu/courses/6-172-performance-engineering-of-software-systems-fall-2018/
   - 💰 免费
   - 📌 MIT 公开课

---

## 📊 基准测试与数据

### 在线工具

1. **Quick Bench** - https://quick-bench.com/
   - 在线 C++ benchmark
   - 多编译器对比

2. **Compiler Explorer** - https://godbolt.org/
   - 查看汇编输出
   - 多编译器对比

3. **C++ Insights** - https://cppinsights.io/
   - 查看编译器展开的代码
   - 理解模板实例化

### 性能数据库

4. **uops.info** - https://uops.info/
   - CPU 指令延迟和吞吐量
   - 各代 CPU 微架构数据

5. **7-cpu.com** - http://www.7-cpu.com/
   - Intel/AMD CPU 技术细节

---

## 🌐 社区与论坛

### 活跃社区

1. **r/cpp** - https://www.reddit.com/r/cpp/
   - Reddit C++ 社区
   - 新闻、讨论、提问

2. **C++ Slack** - https://cpplang.slack.com/
   - 实时聊天
   - 各主题频道

3. **Stack Overflow [c++]** - https://stackoverflow.com/questions/tagged/c++
   - 技术问答
   - 最大的 C++ 社区

### 会议

4. **CppCon** - https://cppcon.org/
   - 年度盛会
   - 所有视频免费公开

5. **C++Now** - https://cppnow.org/
   - 高质量技术会议

6. **Meeting C++** - https://meetingcpp.com/
   - 欧洲 C++ 会议

---

## 🔧 编译器与工具链

### 编译器

| 编译器 | 版本 | 特点 | 下载 |
|--------|------|------|------|
| GCC | 14+ | 成熟稳定 | [官网](https://gcc.gnu.org/) |
| Clang | 18+ | 快速编译，友好错误 | [官网](https://clang.llvm.org/) |
| MSVC | 19.41+ | Windows 最佳 | Visual Studio |
| ICC | 最新 | Intel 优化 | [官网](https://www.intel.com/content/www/us/en/developer/tools/oneapi/dpc-compiler.html) |

### 构建系统

- **CMake** - 跨平台构建
- **Ninja** - 快速构建
- **Bazel** - Google 的构建系统
- **Meson** - 现代构建系统

---

## 📐 标准与规范

### C++ 标准

1. **C++20** - 当前主流
   - Concepts
   - Ranges
   - Coroutines
   - Modules

2. **C++23** - 新特性
   - `std::print`
   - Multidimensional subscript
   - `if consteval`

3. **C++26** - 开发中
   - Reflection
   - Pattern Matching

### 编程规范

- **C++ Core Guidelines** - https://isocpp.github.io/CppCoreGuidelines/
- **Google C++ Style Guide** - https://google.github.io/styleguide/cppguide.html
- **LLVM Coding Standards** - https://llvm.org/docs/CodingStandards.html

---

## 🎯 学习路径推荐

### 3 个月速成（每天 2-3 小时）

**Week 1-4: 基础**
- 阅读《Optimized C++》
- 完成 Chapter 1-2（编译器旗标、数据布局）
- 练习：优化一个小项目

**Week 5-8: 进阶**
- 学习 Chapter 3-5（CRTP、表达式模板、SIMD）
- 观看 CppCon 相关视频
- 练习：实现自己的 mini-Eigen

**Week 9-12: 高级**
- 深入 Chapter 6-8（分配器、无锁、constexpr）
- 阅读 Folly 源码
- 项目：实现一个高性能组件

### 6 个月深度学习

在 3 个月基础上：

**Month 4-5: 实战**
- 完成 Chapter 9-11
- 贡献开源项目
- 参加 Code Review

**Month 6: 综合**
- 独立项目：高性能系统
- 撰写技术博客
- 分享经验

---

## 💼 就业资源

### 公司

需要高性能 C++ 工程师的公司：

- **科技巨头**: Google, Meta, Microsoft, Apple, Amazon
- **金融**: Jane Street, Citadel, Two Sigma, DE Shaw
- **游戏**: Epic Games, Blizzard, Unity, Unreal
- **数据库**: MongoDB, Redis Labs, ScyllaDB
- **云计算**: Cloudflare, Fastly
- **硬件**: Intel, NVIDIA, AMD, ARM

### 职位关键词

搜索这些关键词找到相关职位：

- "C++ Performance Engineer"
- "Systems Programmer"
- "HFT Developer"
- "Game Engine Developer"
- "Compiler Engineer"
- "Database Engineer"

---

## 📬 保持更新

### Newsletter

1. **C++ Weekly Newsletter** - https://cppweekly.com/
2. **Fluent C++** - https://www.fluentcpp.com/
3. **Meeting C++ News** - https://meetingcpp.com/blog/

### RSS Feeds

订阅关键博客的 RSS，保持信息同步

---

## 🙏 致谢

本资源列表参考了：

- CppCon 演讲者推荐
- Stack Overflow 高票回答
- Reddit r/cpp 精选
- 专业书籍参考文献

---

## 📝 贡献

发现好资源？欢迎提交 PR 或 Issue！

格式：
```markdown
**资源名称** by 作者
- 🔗 链接
- 📌 简短描述
- 🎯 适合人群
```

---

**持续学习，持续进步！** 🚀
