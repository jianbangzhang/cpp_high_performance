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


