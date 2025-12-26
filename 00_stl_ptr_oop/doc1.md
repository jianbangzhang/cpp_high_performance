# 深入 STL 算法示例

本节扩展了之前的 C++ STL 项目，专注于 STL 算法的深入分析和示例。STL 算法库（`<algorithm>`、` <numeric>` 等头文件）提供了超过 100 个泛型函数，用于操作容器中的元素。这些算法是高效的、非修改性的或修改性的，能与迭代器无缝协作。

我们将分析常见算法分类、性能考虑，并提供扩展代码示例。示例基于之前的形状类层次，结合智能指针和 OOP，演示如何在实际场景中使用算法处理数据。

## STL 算法分类与分析
STL 算法大致分为几类：
- **非修改序列操作**：如 `std::find`、`std::count`、`std::all_of`。这些不改变容器内容，常用于查询。
  - **分析**：时间复杂度通常 O(N)，适合线性搜索。C++11+ 支持 lambda 表达式自定义谓词，提升灵活性。
- **修改序列操作**：如 `std::transform`、`std::replace`、`std::fill`。修改元素或生成新序列。
  - **分析**：常用于数据转换，支持输出迭代器，可链式操作。注意避免无效迭代器。
- **排序与有序操作**：如 `std::sort`、`std::stable_sort`、`std::merge`。
  - **分析**：`sort` 是 O(N log N) 的 introsort（快速+堆+插入混合）；`stable_sort` 保持相对顺序，但空间开销更高。适用于随机访问迭代器（如 vector）。
- **分区与移除**：如 `std::partition`、`std::remove_if`、`std::unique`。
  - **分析**：`remove_if` 返回新逻辑结束迭代器，常与 `erase` 结合（erase-remove idiom）移除元素。高效处理过滤。
- **数值操作**（`<numeric>`）：如 `std::accumulate`、`std::inner_product`、`std::partial_sum`。
  - **分析**：用于求和、乘积等数学操作。C++17+ 支持并行执行（execution policy），提升多核性能。
- **集合操作**：如 `std::set_union`、`std::set_intersection`。要求输入有序。
  - **分析**：O(N) 时间，适合合并有序容器。

**整体分析**：
- **性能**：算法是模板化的，编译时优化；但依赖容器类型（vector 快于 list）。
- **安全性**：结合智能指针，避免手动内存管理；使用 `const_iterator` 防止意外修改。
- **现代特性**：C++20 引入 ranges（如 `std::ranges::sort`），更简洁表达算法管道。
- **常见陷阱**：无效迭代器（算法后可能失效）；边界检查；lambda 捕获变量需小心。

## 扩展代码示例
以下是扩展的 `main.cpp`，在之前的形状示例基础上，添加更多 STL 算法演示：
- 使用 `std::sort` 按面积排序形状。
- 使用 `std::accumulate` 计算总面积（数值算法）。
- 使用 `std::transform` 生成面积向量。
- 使用 `std::partition` 分区圆形和矩形。
- 使用 `std::remove_if` 移除小面积形状（结合 erase）。
- 使用 lambda 和智能指针确保安全。

```cpp
#include <iostream>
#include <vector>
#include <memory>
#include <algorithm>   // 核心算法头文件
#include <numeric>     // 数值算法
#include <cmath>       // M_PI
#include <iterator>    // back_inserter

// 基类：Shape（同前）
class Shape {
public:
    virtual ~Shape() = default;
    virtual double area() const = 0;
    virtual void print() const = 0;
};

// 派生类：Circle（同前）
class Circle : public Shape {
private:
    double radius;
public:
    explicit Circle(double r) : radius(r) {}
    double area() const override { return M_PI * radius * radius; }
    void print() const override { std::cout << "圆形，半径 = " << radius << std::endl; }
    bool isCircle() const { return true; }  // 新增：用于分区
};

// 派生类：Rectangle（同前）
class Rectangle : public Shape {
private:
    double width, height;
public:
    Rectangle(double w, double h) : width(w), height(h) {}
    double area() const override { return width * height; }
    void print() const override { std::cout << "矩形，宽 = " << width << "，高 = " << height << std::endl; }
    bool isCircle() const { return false; }
};

int main() {
    // 创建形状容器
    std::vector<std::unique_ptr<Shape>> shapes;
    shapes.emplace_back(std::make_unique<Circle>(5.0));    // 面积 ~78.54
    shapes.emplace_back(std::make_unique<Rectangle>(4.0, 6.0));  // 面积 24
    shapes.emplace_back(std::make_unique<Circle>(3.0));    // 面积 ~28.27
    shapes.emplace_back(std::make_unique<Rectangle>(2.0, 3.0));  // 面积 6
    shapes.emplace_back(std::make_unique<Circle>(1.0));    // 面积 ~3.14

    std::cout << "原始形状：" << std::endl;
    std::for_each(shapes.begin(), shapes.end(), [](const auto& s) { s->print(); });

    // 1. std::sort - 按面积升序排序（需自定义比较器）
    std::sort(shapes.begin(), shapes.end(), [](const auto& a, const auto& b) {
        return a->area() < b->area();
    });
    std::cout << "\n按面积排序后：" << std::endl;
    std::for_each(shapes.begin(), shapes.end(), [](const auto& s) { s->print(); });

    // 2. std::accumulate - 计算总面积（数值算法）
    double totalArea = std::accumulate(shapes.begin(), shapes.end(), 0.0,
        [](double sum, const auto& s) { return sum + s->area(); });
    std::cout << "\n总面积（accumulate）：" << totalArea << std::endl;

    // 3. std::transform - 生成面积向量
    std::vector<double> areas;
    std::transform(shapes.begin(), shapes.end(), std::back_inserter(areas),
        [](const auto& s) { return s->area(); });
    std::cout << "所有面积（transform）：";
    for (double a : areas) std::cout << " " << a;
    std::cout << std::endl;

    // 4. std::partition - 分区：圆形在前，矩形在后
    auto partitionIt = std::partition(shapes.begin(), shapes.end(),
        [](const auto& s) { return dynamic_cast<Circle*>(s.get()) != nullptr; });  // 使用 dynamic_cast 检查类型
    std::cout << "\n分区后（圆形在前）：" << std::endl;
    std::for_each(shapes.begin(), partitionIt, [](const auto& s) { s->print(); });
    std::cout << "矩形部分：" << std::endl;
    std::for_each(partitionIt, shapes.end(), [](const auto& s) { s->print(); });

    // 5. std::remove_if + erase - 移除面积 < 10 的形状（erase-remove idiom）
    auto removeIt = std::remove_if(shapes.begin(), shapes.end(),
        [](const auto& s) { return s->area() < 10.0; });
    shapes.erase(removeIt, shapes.end());
    std::cout << "\n移除小面积形状后：" << std::endl;
    std::for_each(shapes.begin(), shapes.end(), [](const auto& s) { s->print(); });

    return 0;
}
```

**编译与运行**：
```bash
g++ main.cpp -o stl_algo -std=c++17
./stl_algo
```

**示例输出摘要**（实际值可能因 M_PI 精度而异）：
```
原始形状：
圆形，半径 = 5
矩形，宽 = 4，高 = 6
圆形，半径 = 3
矩形，宽 = 2，高 = 3
圆形，半径 = 1

按面积排序后：
圆形，半径 = 1
矩形，宽 = 2，高 = 3
矩形，宽 = 4，高 = 6
圆形，半径 = 3
圆形，半径 = 5

总面积（accumulate）：139.95

所有面积（transform）： 3.14 6 24 28.27 78.54

分区后（圆形在前）：
圆形，半径 = 1
圆形，半径 = 3
圆形，半径 = 5
矩形部分：
矩形，宽 = 2，高 = 3
矩形，宽 = 4，高 = 6

移除小面积形状后：
矩形，宽 = 4，高 = 6
圆形，半径 = 3
圆形，半径 = 5
```

**代码分析**：
- **sort**：自定义 lambda 比较器，实现多态排序。
- **accumulate**：累加器初始值为 0.0，lambda 处理每个元素。
- **transform**：输出到新 vector，使用 back_inserter 自动扩容。
- **partition**：返回分区点迭代器，动态类型检查（OOP 整合）。
- **remove_if**：逻辑移除后用 erase 物理删除，避免无效元素。
- **智能指针作用**：容器中 unique_ptr 确保排序/分区时不泄漏内存，移动语义支持高效重排。

## 高级用法与优化
- **并行执行**（C++17+）：如 `std::sort(std::execution::par, ...)`，适用于大容器。
- **Ranges（C++20）**：`std::ranges::sort(shapes, std::less{}, &Shape::area);` 更简洁。
- **自定义算法**：结合 functor 或 lambda 扩展功能。
- **性能测试**：对于 N>10^6，使用 profiled 工具（如 gprof）优化算法选择。
- **错误处理**：算法不抛异常，但 lambda 内需 catch；容器空时检查 begin()!=end()。

