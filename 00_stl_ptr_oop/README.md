# C++ STL 分析 + 智能指针 + 面向对象编程 示例项目

本仓库演示了 C++ 标准模板库（STL）、智能指针以及面向对象编程（OOP）原则的综合使用。包含代码示例、详细分析和现代 C++ 开发的最佳实践。

## 目录
- [C++ STL 分析 + 智能指针 + 面向对象编程 示例项目](#c-stl-分析--智能指针--面向对象编程-示例项目)
  - [目录](#目录)
  - [项目简介](#项目简介)
  - [STL 概述与分析](#stl-概述与分析)
  - [智能指针](#智能指针)
  - [面向对象编程整合](#面向对象编程整合)
  - [完整代码示例](#完整代码示例)
  - [最佳实践](#最佳实践)
  - [参考资料](#参考资料)

## 项目简介
C++ STL 提供了丰富的泛型容器和算法。结合 `<memory>` 中的智能指针，可以显著提升内存管理的安全性。面向对象编程（封装、继承、多态）则帮助我们构建可维护、可扩展的代码。

本项目重点分析这三者如何协同工作，强调效率、安全性和可维护性。

## STL 概述与分析
STL 主要由以下部分组成：
- **容器**：序列容器（如 `vector`、`list`）、关联容器（如 `map`、`set`）、无序容器（如 `unordered_map`）。
- **算法**：排序、查找等（如 `std::sort`、`std::find`）。
- **迭代器**：连接容器与算法的桥梁。
- **函数对象**：可自定义行为的仿函数。

**分析**：
- **优点**：泛型、高效（哈希容器 O(1)，树容器 O(log N)），零开销抽象。
- **缺点**：模板使用复杂，误用可能导致性能问题（如 vector 频繁扩容）。
- **性能特点**：`vector` 缓存友好，适合随机访问；`list` 适合频繁插入/删除。
- **线程安全**：STL 本身不线程安全，多线程访问需加锁。

现代 C++（C++11 及以上）中，STL 与智能指针完美结合，用于安全管理容器中的动态对象。

## 智能指针
智能指针自动管理动态分配内存，避免内存泄漏和悬空指针。主要类型：
- `std::unique_ptr`：独占所有权，不可拷贝，可移动。
- `std::shared_ptr`：共享所有权，引用计数。
- `std::weak_ptr`：非拥有引用，用于打破 `shared_ptr` 循环引用。

**分析**：
- **unique_ptr vs shared_ptr**：单所有权优先用 `unique_ptr`（开销极小）；多所有权用 `shared_ptr`（有原子计数开销）。
- **优点**：遵循 RAII 原则，析构时自动释放资源。
- **缺点**：`shared_ptr` 有一定开销；循环引用需用 `weak_ptr` 解决。
- **自定义删除器**：可处理非 new/delete 的资源（如文件句柄）。

典型用法：在 `vector<std::unique_ptr<Base>>` 中存储多态对象，实现安全的多态容器。

## 面向对象编程整合
C++ OOP 核心原则：
- **封装**：隐藏实现细节。
- **继承**：基类-派生类关系。
- **多态**：虚函数实现运行时行为选择。

与 STL + 智能指针结合：
- 使用智能指针存储多态对象到容器中，避免对象切片（slicing）。
- 使用 STL 算法对容器中的多态对象进行统一操作。

**分析**：
- **优势**：代码复用性高，智能指针让 OOP 更安全（无需手动 delete）。
- **注意点**：虚函数有开销；现代 C++ 更推荐组合而非继承。
- **最佳实践**：接口类使用纯虚函数，容器中统一使用智能指针管理派生类实例。

## 完整代码示例
以下是一个完整的示例程序（保存为 `main.cpp`），演示形状多态层次结构，使用 STL 容器和智能指针。

```cpp
#include <iostream>
#include <vector>
#include <memory>
#include <algorithm>
#include <cmath>

// 基类：抽象形状（OOP：抽象与多态）
class Shape {
public:
    virtual ~Shape() = default;                    // 虚析构函数，确保正确删除派生类
    virtual double area() const = 0;               // 纯虚函数：计算面积
    virtual void print() const = 0;                // 打印信息
};

// 派生类：圆形
class Circle : public Shape {
private:
    double radius;
public:
    explicit Circle(double r) : radius(r) {}
    double area() const override {
        return M_PI * radius * radius;
    }
    void print() const override {
        std::cout << "圆形，半径 = " << radius << std::endl;
    }
};

// 派生类：矩形
class Rectangle : public Shape {
private:
    double width, height;
public:
    Rectangle(double w, double h) : width(w), height(h) {}
    double area() const override {
        return width * height;
    }
    void print() const override {
        std::cout << "矩形，宽 = " << width << "，高 = " << height << std::endl;
    }
};

int main() {
    // STL 容器 + 智能指针存储多态对象
    std::vector<std::unique_ptr<Shape>> shapes;

    // 添加对象（使用 make_unique 更安全）
    shapes.push_back(std::make_unique<Circle>(5.0));
    shapes.push_back(std::make_unique<Rectangle>(4.0, 6.0));
    shapes.emplace_back(std::make_unique<Circle>(3.0));  // emplace_back 更高效

    // 使用 STL 算法遍历并计算总面积
    double totalArea = 0.0;
    std::for_each(shapes.begin(), shapes.end(), [&](const auto& shape) {
        shape->print();
        totalArea += shape->area();
    });

    std::cout << "总面积: " << totalArea << std::endl;

    // 程序结束时，unique_ptr 自动释放所有对象，无需手动 delete
    return 0;
}
```

**编译与运行**：
```bash
g++ main.cpp -o shapes -std=c++17
./shapes
```

**示例输出**：
```
圆形，半径 = 5
矩形，宽 = 4，高 = 6
圆形，半径 = 3
总面积: 102.832
```

**代码要点分析**：
- **STL**：`vector` 存储、`for_each` 遍历、`emplace_back` 高效构造。
- **智能指针**：`unique_ptr` 独占所有权，`make_unique` 异常安全。
- **OOP**：继承 + 虚函数实现多态，基类指针统一操作不同派生类。

## 最佳实践
- STL 操作尽量使用 `const` 和引用，避免不必要的拷贝。
- 优先使用 `std::make_unique` 和 `std::make_shared`，异常更安全。
- 现代 C++ 中几乎杜绝裸指针所有权转移，全部交给智能指针。
- 大数据量时注意性能剖析，STL 算法已高度优化，但仍需测试。
- 异常安全：智能指针析构不抛异常，但构造函数可能抛出。

## 参考资料
- C++ 标准参考：https://zh.cppreference.com/w/
- 推荐书籍：《Effective Modern C++》（Scott Meyers）——深入讲解智能指针与 STL。
- 《C++ Primer》（第5版）——系统学习 STL 与 OOP。
