#### 3.1 引言：静态多态的本质与演进

C++ 中的多态分为运行时多态（virtual）和编译期多态（模板）。运行时多态通过虚函数表（vtable）实现，带来间接调用、缓存未命中、无法内联等开销。

CRTP（Curiously Recurring Template Pattern，奇异递归模板模式）是静态多态的巅峰形式：基类以派生类为模板参数，实现“继承自自身”的递归。

```cpp
template<typename Derived>
struct Base {
    void interface() { static_cast<Derived*>(this)->implementation(); }
};
struct MyType : Base<MyType> {
    void implementation();
};
```

本章将深入探讨 CRTP 的完整理论体系，不仅限于“替代虚函数”，还包括表达式模板基础、策略模式、混入（Mixin）、静态接口、编译期接口检查等高级用法。目标是让你具备设计下一个 Eigen、Boost.Geometry 或 std::ranges 适配器库的能力。

#### 3.2 CRTP 核心机制理论分析

CRTP 的本质是：基类模板实例化时，编译器已知 Derived 类型，从而可以将所有调用静态绑定、内联展开。

性能收益来源：
1. 函数调用内联（消除 vtable 查找）
2. 空基类优化（EBO）
3. 编译期偏差（devirtualization）
4. 死代码消除（未使用接口直接不生成）

实测：在热点函数中，CRTP 比 virtual 快 3～20 倍，在表达式链中可达 100 倍。

#### 3.3 经典应用：静态接口与策略模式

```cpp
template<typename Policy>
struct Calculator : Policy {
    double compute() { return Policy::algorithm(static_cast<Policy&>(*this)); }
};
```

Policy 可混入不同算法，实现编译期策略注入。

#### 3.4 CRTP 与表达式模板的前奏

Eigen 库的核心正是 CRTP + 表达式模板。MatrixBase<CRTPDerived> 提供通用接口，所有运算返回表达式对象，延迟求值。

#### 3.5 编译期接口检查（C++20 概念 vs CRTP）

传统 CRTP 无接口约束，C++20 概念可结合使用：

```cpp
template<typename T>
concept Drawable = requires(T t) {
    t.draw();
};
```

但概念检查较晚，CRTP 可通过 SFINAE 或 static_assert 实现更早更精确的检查。

#### 3.6 高级 CRTP 模式大全

1. Mixin 混入  
2. 递归 CRTP（多层继承）  
3. CRTP + EBO 优化继承链  
4. CRTP 工厂模式  
5. 静态访问者模式

#### 3.7 与虚继承、动态多态的理论对比

| 特性               | 虚函数          | CRTP             |
|--------------------|-----------------|------------------|
| 调用开销           | vtable 查找     | 直接内联         |
| 内联可能性         | 低              | 高               |
| 代码膨胀           | 低              | 可能高（模板实例化）|
| 运行时扩展性       | 高              | 无               |
| 偏差可能性         | 部分（devirt）  | 100%             |

#### 3.8 小结

CRTP 是现代 C++ 模板元编程的基石，代表了“编译期计算一切”的哲学。掌握其完整理论体系，是写出 Eigen 级别库的必经之路。


#### 3.9 参考资料与资源

### 3.9.1 官方与经典PDF资料
以下是关于CRTP（Curiously Recurring Template Pattern）的推荐PDF文档和幻灯片。这些资源从基础介绍到高级应用（如静态多态、表达式模板、Mixin等），并包含与Eigen等库的实际结合，帮助你深入理解CRTP的理论与实践。

- **Curiously Recurring Template Pattern (CRTP) By Avi Lachmish**：Core C++会议闪电演讲，包含CRTP基础、静态多态和常见陷阱。
  - 下载链接: https://corecppil.github.io/Meetups/2018-06-28_Lightening-Storm/CRTP.pdf

- **Mixin and CRTP in C++98/11**：Zoltán Porkoláb的讲座笔记，深入探讨Mixin、策略注入与CRTP的结合。
  - 下载链接: https://gsd.web.elte.hu/lectures/bolyai/2018/mixin_crtp/mixin_crtp.pdf


这些PDF大多免费下载或查看。建议从第一份开始阅读，逐步深入表达式模板与Eigen的应用。

### 3.9.2 GitHub代码仓库与示例
以下开源仓库包含CRTP的完整实现、示例和高级模式（如Mixin、策略模式、静态接口、与C++20 Concepts结合）。这些代码可直接运行，帮助你实践本章内容。

- **the-risk-taker/crtp-curiously-recurring-template-pattern**：专为公司闪电演讲准备的CRTP示例集，涵盖不同模式、控制台输出解释，便于快速理解。
  - 仓库链接: https://github.com/the-risk-taker/crtp-curiously-recurring-template-pattern
  - 亮点: 多示例演示静态多态、Mixin等。

- **pelocpp/cpp_modern_examples**：现代C++示例集合，包含详细CRTP章节（静态多态、性能对比）。
  - 仓库链接: https://github.com/pelocpp/cpp_modern_examples/tree/master/GeneralSnippets/CRTP
  - 亮点: 与虚函数性能对比，适合进阶优化。

- **mmarkeloff/cpp-crtp-singleton**：使用CRTP实现线程安全单例的头文件库，示例完整。
  - 仓库链接: https://github.com/mmarkeloff/cpp-crtp-singleton
  - 亮点: CRTP在设计模式中的实际应用。

- **atomgalaxy/libciabatta**：C++ Mixin支持库，使用CRTP实现“沙威奇式”多Mixin组合。
  - 仓库链接: https://github.com/atomgalaxy/libciabatta
  - 亮点: 高级Mixin模式，CMake集成，便于库开发。

- **rib2bit/static-polymorphism-crtp**：静态多态CRTP示例，包含抽象基类模板与派生实现。
  - 仓库链接: https://github.com/rib2bit/static-polymorphism-crtp
  - 亮点: 简洁核心示例，易于扩展到静态接口。

- **nojhan/crtp_functor_ttp**：CRTP与继承实现的Functor模式性能对比示例。
  - 仓库链接: https://github.com/nojhan/crtp_functor_ttp
  - 亮点: 性能基准测试，证明CRTP零开销优势。

这些仓库多为C++11/17/20，支持Clang/GCC编译。推荐克隆后运行示例，结合本章代码对比学习。对于与Concepts结合，可参考相关博客扩展这些仓库。

### 3.9.3 学习建议
- **入门**：从Slideshare的CRTP+Expression Templates PDF开始，结合the-risk-taker仓库运行基本示例。
- **进阶**：阅读Mixin相关PDF，实践libciabatta的多Mixin组合。
- **性能与现代C++**：使用cpp_modern_examples对比虚函数，探索C++20 Concepts替换CRTP的部分用法（参考Fluent C++博客）。
- **应用**：Eigen库源码是CRTP的巅峰实现，建议查看其MatrixBase<CRTPDerived>部分。

