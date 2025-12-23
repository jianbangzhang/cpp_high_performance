# 学习路径指南 🎯

> 根据你的背景和目标，选择适合自己的学习路径

## 📊 自我评估

在开始之前，先评估你的当前水平：

### Level 1: 初学者
- ✓ 熟悉 C++ 基础语法
- ✓ 了解 STL 容器和算法
- ✓ 能编写简单的程序
- ✗ 对性能优化了解有限
- ✗ 不熟悉编译器优化

### Level 2: 中级开发者
- ✓ 熟练使用 C++11/14/17
- ✓ 了解基本的性能考虑
- ✓ 使用过 profiler 工具
- ✗ 不熟悉 SIMD 和底层优化
- ✗ 对编译器内部机制了解有限

### Level 3: 高级开发者
- ✓ 精通现代 C++ (C++17/20)
- ✓ 有性能调优经验
- ✓ 了解计算机体系结构
- ✓ 想要系统性学习顶尖优化技巧

---

## 🛤️ 路径一：初学者路径（4-6 周）

**目标**: 掌握基础性能优化概念和实用技巧

### Week 1-2: 编译器与工具链
- **学习内容**:
  - [ ] Chapter 1: 编译器旗标 (3 天)
  - [ ] 掌握 `-O2`, `-O3`, `-march=native`
  - [ ] 学会使用编译器优化报告
  - [ ] 实践: 对比不同优化级别的效果

- **推荐资源**:
  - [GCC Optimization Options](https://gcc.gnu.org/onlinedocs/gcc/Optimize-Options.html)
  - [Compiler Explorer (Godbolt)](https://godbolt.org/)

- **检查点**:
  ```bash
  # 能否回答：
  # 1. -O2 和 -O3 的主要区别是什么？
  # 2. 为什么 -march=native 能提升性能？
  # 3. 什么时候应该使用 -Ofast？
  ```

### Week 3-4: 数据布局优化
- **学习内容**:
  - [ ] Chapter 2: AoS vs SoA (5 天)
  - [ ] 理解缓存行和缓存局部性
  - [ ] 学习 False Sharing 的避免
  - [ ] 实践: 重构你的数据结构

- **实战项目**:
  ```cpp
  // 优化一个粒子系统或游戏对象系统
  // 从 AoS 转换为 SoA，测量性能提升
  ```

- **检查点**:
  - 能否解释为什么 SoA 更快？
  - 能否识别代码中的 False Sharing？
  - 性能提升是否达到 2-5× ？

### Week 5-6: 性能分析工具
- **学习内容**:
  - [ ] Chapter 10: perf 基础 (4 天)
  - [ ] 学会使用 `perf stat`, `perf record`
  - [ ] 读懂火焰图
  - [ ] 实践: 找出程序热点

- **实战练习**:
  ```bash
  # 1. 用 perf 分析你自己的项目
  perf record -g ./your_program
  perf report
  
  # 2. 识别并优化最热的函数
  # 3. 验证优化效果
  ```

- **里程碑**:
  - 能独立找出程序性能瓶颈
  - 知道如何验证优化效果
  - 达到 2-3× 整体性能提升

---

## 🚀 路径二：中级开发者路径（6-8 周）

**目标**: 掌握高级优化技巧，能够设计高性能系统

### Phase 1: 零开销抽象（Week 1-2）
- **学习内容**:
  - [ ] Chapter 3: CRTP 完全体
  - [ ] Chapter 4: 表达式模板
  - [ ] 理解零开销抽象的含义
  - [ ] 学习模板元编程技巧

- **实战项目**:
  ```cpp
  // 实现一个自己的 mini-Eigen 库
  // 支持向量和矩阵的表达式模板
  class Vec { ... };
  Vec result = a + b * 2.0f + c;  // 零临时对象！
  ```

- **检查点**:
  - CRTP 性能是否达到虚函数的 3-10×？
  - 能否用表达式模板消除临时对象？
  - 理解 Eigen 的核心设计思想？

### Phase 2: SIMD 并行（Week 3-4）
- **学习内容**:
  - [ ] Chapter 5: SIMD 手动 & 自动
  - [ ] 学习 AVX2 intrinsics
  - [ ] 理解编译器自动向量化
  - [ ] 掌握 SIMD 的适用场景

- **实战项目**:
  ```cpp
  // 优化一个图像处理算法
  // 实现标量版、自动向量化版、手动 AVX2 版
  // 对比性能：目标 4-8× 提升
  ```

- **进阶挑战**:
  - 实现 RGB 转灰度（AVX2）
  - 实现矩阵乘法（AVX2 + 循环展开）
  - 实现快速排序（SIMD partition）

### Phase 3: 内存与并发（Week 5-7）
- **学习内容**:
  - [ ] Chapter 6: 内存分配器
  - [ ] Chapter 7: 无锁数据结构
  - [ ] 理解内存池、Arena 分配器
  - [ ] 掌握 lock-free 编程基础

- **实战项目**:
  ```cpp
  // 实现一个高性能对象池
  template<typename T>
  class ObjectPool { ... };
  
  // 实现一个 lock-free SPSC 队列
  template<typename T>
  class SPSCQueue { ... };
  ```

- **检查点**:
  - 对象池是否比 std::allocator 快 10-100×？
  - 理解 ABA 问题及其解决方案？
  - 能否正确使用 memory_order？

### Phase 4: 编译期优化（Week 8）
- **学习内容**:
  - [ ] Chapter 8: constexpr 一切
  - [ ] 学习编译期计算技巧
  - [ ] 理解 constexpr 的局限性
  - [ ] 掌握 C++20 constexpr 新特性

- **实战项目**:
  ```cpp
  // 实现编译期 JSON 解析器
  constexpr auto config = parse_json(R"({"port": 8080})");
  static_assert(config["port"].as_int() == 8080);
  
  // 实现编译期单位系统
  constexpr auto speed = 100_km / 1_h;  // 类型安全！
  ```

- **里程碑**:
  - 能灵活运用 constexpr
  - 理解编译期计算的边界
  - 实现了有实用价值的编译期工具

---

## 🏆 路径三：高级开发者路径（8-12 周）

**目标**: 成为性能优化专家，能够设计 SOTA 级别的系统

### Phase 1: 全栈优化（Week 1-3）
- **完成所有基础章节** (1-8)
- **深入理解**:
  - CPU 微架构（流水线、分支预测、缓存层次）
  - 编译器优化原理（内联、循环展开、向量化）
  - 操作系统调度（NUMA、CPU affinity）

- **推荐阅读**:
  - [Intel Optimization Manual](https://software.intel.com/content/www/us/en/develop/articles/intel-sdm.html)
  - [Agner Fog's Optimization Manuals](https://www.agner.org/optimize/)
  - [What Every Programmer Should Know About Memory](https://people.freebsd.org/~lstewart/articles/cpumemory.pdf)

### Phase 2: 二进制优化大师（Week 4-5）
- **学习内容**:
  - [ ] Chapter 9: PGO + LTO + BOLT
  - [ ] 深入理解链接器工作原理
  - [ ] 掌握二进制布局优化
  - [ ] 学习 Profile-Guided Optimization 最佳实践

- **实战项目**:
  ```bash
  # 完整的 PGO + LTO + BOLT 流程
  # 1. Baseline 构建
  # 2. PGO 优化
  # 3. LTO 优化
  # 4. BOLT 优化
  # 目标：每一步都能带来可测量的提升
  ```

- **检查点**:
  - PGO 提升是否达到 20-40%？
  - LTO 提升是否达到 10-20%？
  - BOLT 提升是否达到 10-15%？
  - 总体提升是否达到 1.5-2×？

### Phase 3: 深度性能分析（Week 6-7）
- **学习内容**:
  - [ ] Chapter 10: 性能分析神器
  - [ ] 精通 perf、VTune、Tracy
  - [ ] 学习火焰图、热图、时间线分析
  - [ ] 掌握微架构级分析

- **高级技巧**:
  ```bash
  # perf 高级用法
  perf stat -e cycles,instructions,branches,branch-misses,\
             L1-dcache-loads,L1-dcache-load-misses,\
             LLC-loads,LLC-load-misses ./program
  
  # 分析分支预测
  perf record -e branch-misses ./program
  
  # NUMA 分析
  perf mem record ./program
  ```

### Phase 4: 真实世界项目剖析（Week 8-10）
- **学习内容**:
  - [ ] Chapter 11: SOTA 项目源码剖析
  - [ ] 深入研究 Eigen、Folly、LLVM
  - [ ] 学习顶级项目的设计模式
  - [ ] 理解工业级性能优化

- **项目实战**:
  ```cpp
  // 选择一个方向深入：
  // 1. 线性代数库（学习 Eigen）
  // 2. 并发库（学习 Folly）
  // 3. 编译器（学习 LLVM）
  // 4. 游戏引擎（学习 Unreal Engine）
  ```

- **学习方法**:
  1. 克隆仓库，阅读核心代码
  2. 运行 benchmark，理解性能数据
  3. 修改代码，验证理解
  4. 尝试改进，提交 PR

### Phase 5: 综合项目（Week 11-12）
- **目标**: 设计并实现一个高性能系统

- **项目选择**:
  1. **高性能 Web 服务器**
     - 支持 100k 并发连接
     - 延迟 < 1ms (P99)
     - 吞吐量 > 1M requests/sec

  2. **实时物理引擎**
     - 10k 刚体模拟
     - 60 FPS 稳定
     - SIMD 优化碰撞检测

  3. **机器学习推理引擎**
     - 支持常见算子（Conv, GEMM, etc.）
     - 完全 SIMD 优化
     - 内存零拷贝

  4. **高频交易系统（模拟）**
     - 延迟 < 10μs (P99.9)
     - 无锁数据结构
     - Lock-free order book

- **验收标准**:
  - [ ] 完整的性能测试报告
  - [ ] 优于现有开源方案（或接近）
  - [ ] 清晰的性能分析和优化说明
  - [ ] 可重现的 benchmark

---

## 🎓 特定领域学习路径

### 游戏开发 🎮

**推荐章节顺序**:
1. Chapter 2: 数据布局（实体组件系统）
2. Chapter 5: SIMD（物理模拟、渲染）
3. Chapter 6: 内存分配器（游戏对象池）
4. Chapter 7: 无锁数据结构（多线程渲染）
5. Chapter 10: 性能分析（帧率优化）

**实战项目**:
- 实现一个 ECS 系统
- 优化粒子系统（目标：100k 粒子 @ 60 FPS）
- 实现多线程渲染管线

### 科学计算 / 机器学习 🧮

**推荐章节顺序**:
1. Chapter 4: 表达式模板（矩阵运算）
2. Chapter 5: SIMD（向量化计算）
3. Chapter 3: CRTP（库设计）
4. Chapter 8: constexpr（编译期优化）
5. Chapter 9: PGO + LTO（模型推理）

**实战项目**:
- 实现 mini-BLAS（矩阵乘法）
- 实现 CNN 推理引擎
- 优化 Transformer 模型

### 高性能服务器 🌐

**推荐章节顺序**:
1. Chapter 7: 无锁数据结构（并发处理）
2. Chapter 6: 内存分配器（请求对象池）
3. Chapter 10: 性能分析（热点定位）
4. Chapter 9: PGO（服务器优化）
5. Chapter 12: Checklist（上线前检查）

**实战项目**:
- 实现 C10k/C100k 服务器
- 实现 lock-free 消息队列
- 优化 RPC 框架

### 金融 / 高频交易 💹

**推荐章节顺序**:
1. Chapter 7: 无锁数据结构（订单簿）
2. Chapter 6: 内存分配器（零分配）
3. Chapter 10: 性能分析（微秒级优化）
4. Chapter 5: SIMD（计算加速）
5. Chapter 1: 编译器旗标（极致优化）

**实战项目**:
- 实现 lock-free order book
- 优化延迟至 < 10μs
- 实现确定性 GC

---

## 📚 学习资源推荐

### 必读书籍
1. **《Optimized C++》** by Kurt Guntheroth
2. **《C++ High Performance》** by Bjorn Andrist
3. **《Computer Systems: A Programmer's Perspective》** by Bryant & O'Hallaron

### 在线资源
- [CppCon Talks](https://www.youtube.com/user/CppCon) - 大量性能优化相关演讲
- [Compiler Explorer](https://godbolt.org/) - 查看编译器生成的汇编
- [Quick Bench](https://quick-bench.com/) - 在线 benchmark

### 工具链
- **编译器**: GCC 14, Clang 18, MSVC 19.41
- **分析器**: perf, VTune, Tracy Profiler
- **Benchmark**: Google Benchmark, Catch2 Benchmark

### 社区
- [r/cpp](https://www.reddit.com/r/cpp/)
- [C++ Slack](https://cpplang.slack.com/)
- [Stack Overflow](https://stackoverflow.com/questions/tagged/c%2b%2b)

---

## ✅ 学习检查点

### 初级毕业标准
- [ ] 能使用编译器优化旗标提升 2-5× 性能
- [ ] 理解缓存局部性，能优化数据布局
- [ ] 会使用 perf 找出性能瓶颈
- [ ] 完成至少 3 个优化项目

### 中级毕业标准
- [ ] 掌握 SIMD 编程，能实现 4-8× 加速
- [ ] 理解无锁编程，能实现基础无锁数据结构
- [ ] 能设计自定义内存分配器
- [ ] 完成至少 5 个高性能组件

### 高级毕业标准
- [ ] 能独立设计高性能系统架构
- [ ] 熟练使用 PGO/LTO/BOLT 等高级优化
- [ ] 深入理解 CPU 微架构
- [ ] 贡献过 SOTA 开源项目
- [ ] 完成至少 1 个综合性高性能系统

---

## 🚀 开始你的旅程

1. **评估当前水平** - 选择适合的学习路径
2. **设定目标** - 想要达到什么水平？
3. **动手实践** - 性能优化必须实战
4. **持续测量** - 没有测量就没有优化
5. **分享交流** - 加入社区，分享经验

记住：**性能优化是一项需要长期积累的技能，保持耐心和热情！**

祝你在 C++ 高性能编程的道路上越走越远！🎯
