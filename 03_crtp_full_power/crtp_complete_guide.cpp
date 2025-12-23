// crtp_complete_guide.cpp
// CRTP (Curiously Recurring Template Pattern) 完全指南
// 包含：静态多态、Mixin、接口检查、零开销抽象

#include <iostream>
#include <vector>
#include <chrono>
#include <memory>
#include <concepts>
#include <type_traits>

// ============================================================================
// 第一部分：传统虚函数 vs CRTP 性能对比
// ============================================================================

// 传统虚函数方式
class ShapeVirtual {
public:
    virtual ~ShapeVirtual() = default;
    virtual double area() const = 0;
    virtual double perimeter() const = 0;
};

class CircleVirtual : public ShapeVirtual {
    double radius;
public:
    explicit CircleVirtual(double r) : radius(r) {}
    double area() const override { return 3.14159 * radius * radius; }
    double perimeter() const override { return 2 * 3.14159 * radius; }
};

class RectangleVirtual : public ShapeVirtual {
    double width, height;
public:
    RectangleVirtual(double w, double h) : width(w), height(h) {}
    double area() const override { return width * height; }
    double perimeter() const override { return 2 * (width + height); }
};

// CRTP 方式
template<typename Derived>
class ShapeCRTP {
public:
    double area() const {
        return static_cast<const Derived*>(this)->area_impl();
    }
    
    double perimeter() const {
        return static_cast<const Derived*>(this)->perimeter_impl();
    }
};

class CircleCRTP : public ShapeCRTP<CircleCRTP> {
    double radius;
public:
    explicit CircleCRTP(double r) : radius(r) {}
    double area_impl() const { return 3.14159 * radius * radius; }
    double perimeter_impl() const { return 2 * 3.14159 * radius; }
};

class RectangleCRTP : public ShapeCRTP<RectangleCRTP> {
    double width, height;
public:
    RectangleCRTP(double w, double h) : width(w), height(h) {}
    double area_impl() const { return width * height; }
    double perimeter_impl() const { return 2 * (width + height); }
};

// ============================================================================
// 第二部分：CRTP Mixin 模式
// ============================================================================

// Mixin 1: 计数功能
template<typename Derived>
class Countable {
    inline static size_t count = 0;
public:
    Countable() { ++count; }
    ~Countable() { --count; }
    static size_t get_count() { return count; }
};

// Mixin 2: 可打印
template<typename Derived>
class Printable {
public:
    void print() const {
        std::cout << static_cast<const Derived*>(this)->to_string() << "\n";
    }
};

// Mixin 3: 可比较
template<typename Derived>
class Comparable {
public:
    bool operator<(const Derived& other) const {
        return static_cast<const Derived*>(this)->compare(other) < 0;
    }
    
    bool operator==(const Derived& other) const {
        return static_cast<const Derived*>(this)->compare(other) == 0;
    }
    
    bool operator>(const Derived& other) const {
        return static_cast<const Derived*>(this)->compare(other) > 0;
    }
};

// 使用多个 Mixin
class Person : public Countable<Person>,
               public Printable<Person>,
               public Comparable<Person> {
    std::string name;
    int age;
public:
    Person(std::string n, int a) : name(std::move(n)), age(a) {}
    
    std::string to_string() const {
        return name + " (" + std::to_string(age) + " years old)";
    }
    
    int compare(const Person& other) const {
        return age - other.age;
    }
    
    int get_age() const { return age; }
};

// ============================================================================
// 第三部分：编译期接口检查（C++20 Concepts）
// ============================================================================

// 定义 Shape 的 Concept
template<typename T>
concept Shape = requires(const T& t) {
    { t.area() } -> std::convertible_to<double>;
    { t.perimeter() } -> std::convertible_to<double>;
};

// 通用算法，只接受满足 Shape concept 的类型
template<Shape S>
double total_area(const std::vector<S>& shapes) {
    double sum = 0.0;
    for (const auto& shape : shapes) {
        sum += shape.area();
    }
    return sum;
}

// ============================================================================
// 第四部分：高级 CRTP - 链式调用构建器
// ============================================================================

template<typename Derived>
class Builder {
public:
    Derived& set_name(const std::string& name) {
        static_cast<Derived*>(this)->name_ = name;
        return static_cast<Derived&>(*this);
    }
    
    Derived& set_value(int value) {
        static_cast<Derived*>(this)->value_ = value;
        return static_cast<Derived&>(*this);
    }
};

class Config : public Builder<Config> {
    friend class Builder<Config>;
    std::string name_;
    int value_ = 0;
public:
    void display() const {
        std::cout << "Config: " << name_ << " = " << value_ << "\n";
    }
};

// ============================================================================
// 第五部分：CRTP 表达式模板（预览）
// ============================================================================

template<typename E>
class VecExpression {
public:
    double operator[](size_t i) const {
        return static_cast<const E&>(*this)[i];
    }
    
    size_t size() const {
        return static_cast<const E&>(*this).size();
    }
};

class Vec : public VecExpression<Vec> {
    std::vector<double> data;
public:
    explicit Vec(size_t n = 0) : data(n) {}
    Vec(std::initializer_list<double> list) : data(list) {}
    
    // 从表达式构造（关键！）
    template<typename E>
    Vec(const VecExpression<E>& expr) : data(expr.size()) {
        const E& e = static_cast<const E&>(expr);
        for (size_t i = 0; i < size(); ++i) {
            data[i] = e[i];
        }
    }
    
    double operator[](size_t i) const { return data[i]; }
    double& operator[](size_t i) { return data[i]; }
    size_t size() const { return data.size(); }
    
    template<typename E>
    Vec& operator=(const VecExpression<E>& expr) {
        const E& e = static_cast<const E&>(expr);
        data.resize(e.size());
        for (size_t i = 0; i < e.size(); ++i) {
            data[i] = e[i];
        }
        return *this;
    }
};

template<typename E1, typename E2>
class VecSum : public VecExpression<VecSum<E1, E2>> {
    const E1& lhs;
    const E2& rhs;
public:
    VecSum(const E1& l, const E2& r) : lhs(l), rhs(r) {}
    
    double operator[](size_t i) const {
        return lhs[i] + rhs[i];
    }
    
    size_t size() const { return lhs.size(); }
};

template<typename E1, typename E2>
VecSum<E1, E2> operator+(const VecExpression<E1>& lhs, const VecExpression<E2>& rhs) {
    return VecSum<E1, E2>(static_cast<const E1&>(lhs), static_cast<const E2&>(rhs));
}

// ============================================================================
// 性能测试
// ============================================================================

template<typename Func>
double benchmark(const std::string& name, Func func, int iterations) {
    auto start = std::chrono::high_resolution_clock::now();
    func();
    auto end = std::chrono::high_resolution_clock::now();
    
    double ns = std::chrono::duration<double, std::nano>(end - start).count() / iterations;
    std::cout << name << ": " << ns << " ns per call\n";
    return ns;
}

// ============================================================================
// 主程序
// ============================================================================

int main() {
    std::cout << "================================================\n";
    std::cout << "  CRTP Complete Guide\n";
    std::cout << "================================================\n\n";

    // ========================================
    // 测试 1: 虚函数 vs CRTP 性能
    // ========================================
    std::cout << "Test 1: Virtual Function vs CRTP Performance\n";
    std::cout << "------------------------------------------------\n";
    
    constexpr int N = 1'000'000;
    
    // 虚函数版本
    std::vector<std::unique_ptr<ShapeVirtual>> virtual_shapes;
    for (int i = 0; i < 100; ++i) {
        virtual_shapes.push_back(std::make_unique<CircleVirtual>(5.0));
        virtual_shapes.push_back(std::make_unique<RectangleVirtual>(4.0, 6.0));
    }
    
    double virtual_time = benchmark("Virtual Function", [&]() {
        double sum = 0.0;
        for (int iter = 0; iter < N; ++iter) {
            for (const auto& shape : virtual_shapes) {
                sum += shape->area();
            }
        }
        // 防止编译器优化掉计算
        asm volatile("" : : "r,m"(sum) : "memory");
    }, N * virtual_shapes.size());
    
    // CRTP 版本（使用 vector 而非多态）
    std::vector<CircleCRTP> crtp_circles;
    std::vector<RectangleCRTP> crtp_rectangles;
    for (int i = 0; i < 100; ++i) {
        crtp_circles.emplace_back(5.0);
        crtp_rectangles.emplace_back(4.0, 6.0);
    }
    
    double crtp_time = benchmark("CRTP (monomorphic)", [&]() {
        double sum = 0.0;
        for (int iter = 0; iter < N; ++iter) {
            for (const auto& shape : crtp_circles) {
                sum += shape.area();
            }
            for (const auto& shape : crtp_rectangles) {
                sum += shape.area();
            }
        }
        // 防止编译器优化掉计算
        asm volatile("" : : "r,m"(sum) : "memory");
    }, N * (crtp_circles.size() + crtp_rectangles.size()));
    
    std::cout << "\nSpeedup: " << (virtual_time / crtp_time) << "x\n\n";

    // ========================================
    // 测试 2: Mixin 模式
    // ========================================
    std::cout << "Test 2: CRTP Mixin Pattern\n";
    std::cout << "------------------------------------------------\n";
    
    Person alice("Alice", 30);
    Person bob("Bob", 25);
    Person charlie("Charlie", 35);
    
    std::cout << "Total persons created: " << Person::get_count() << "\n";
    
    alice.print();
    bob.print();
    charlie.print();
    
    std::cout << "Alice > Bob? " << (alice > bob ? "Yes" : "No") << "\n";
    std::cout << "Bob < Charlie? " << (bob < charlie ? "Yes" : "No") << "\n\n";

    // ========================================
    // 测试 3: Concept 约束
    // ========================================
    std::cout << "Test 3: Concept-based Interface Checking\n";
    std::cout << "------------------------------------------------\n";
    
    std::vector<CircleCRTP> circles = { CircleCRTP(1.0), CircleCRTP(2.0), CircleCRTP(3.0) };
    std::cout << "Total area of circles: " << total_area(circles) << "\n\n";
    
    // 编译期检查：以下代码无法编译（Person 不满足 Shape concept）
    // std::vector<Person> persons = { alice, bob };
    // total_area(persons);  // 编译错误！

    // ========================================
    // 测试 4: Builder 模式
    // ========================================
    std::cout << "Test 4: CRTP Builder Pattern\n";
    std::cout << "------------------------------------------------\n";
    
    Config config;
    config.set_name("Timeout")
          .set_value(3000)
          .display();
    std::cout << "\n";

    // ========================================
    // 测试 5: 表达式模板预览
    // ========================================
    std::cout << "Test 5: Expression Templates (Preview)\n";
    std::cout << "------------------------------------------------\n";
    
    Vec a = {1.0, 2.0, 3.0, 4.0};
    Vec b = {5.0, 6.0, 7.0, 8.0};
    Vec c = {9.0, 10.0, 11.0, 12.0};
    
    // 零临时对象！但需要显式构造
    Vec result(a + b + c);  // 或者用赋值: Vec result; result = a + b + c;
    
    std::cout << "a + b + c = ";
    for (size_t i = 0; i < result.size(); ++i) {
        std::cout << result[i] << " ";
    }
    std::cout << "\n\n";

    // ========================================
    // 内存占用分析
    // ========================================
    std::cout << "Memory Footprint Analysis\n";
    std::cout << "------------------------------------------------\n";
    std::cout << "ShapeVirtual:    " << sizeof(ShapeVirtual) << " bytes (vtable pointer)\n";
    std::cout << "CircleVirtual:   " << sizeof(CircleVirtual) << " bytes\n";
    std::cout << "ShapeCRTP:       " << sizeof(ShapeCRTP<CircleCRTP>) << " bytes (empty)\n";
    std::cout << "CircleCRTP:      " << sizeof(CircleCRTP) << " bytes (no overhead!)\n\n";

    std::cout << "================================================\n";
    std::cout << "Summary\n";
    std::cout << "================================================\n";
    std::cout << "✓ CRTP 优势:\n";
    std::cout << "  1. 零运行时开销（完全内联）\n";
    std::cout << "  2. 编译期多态\n";
    std::cout << "  3. 无虚表指针开销\n";
    std::cout << "  4. 更好的缓存局部性\n\n";
    std::cout << "✓ 虚函数优势:\n";
    std::cout << "  1. 真正的运行时多态\n";
    std::cout << "  2. 异构容器（std::vector<Base*>）\n";
    std::cout << "  3. 动态加载\n\n";
    std::cout << "✓ 选择建议:\n";
    std::cout << "  - 性能关键路径 + 编译期已知类型 → CRTP\n";
    std::cout << "  - 需要真正运行时多态 → Virtual Function\n";
    std::cout << "  - 库/框架设计 → 混合使用\n";
    std::cout << "================================================\n";

    return 0;
}

/* 编译与运行:

基础版本:
  g++ -std=c++20 -O2 crtp_complete_guide.cpp -o crtp_demo
  ./crtp_demo

优化版本:
  g++ -std=c++20 -O3 -march=native crtp_complete_guide.cpp -o crtp_demo_opt
  ./crtp_demo_opt

查看内联情况:
  g++ -std=c++20 -O3 -march=native -S crtp_complete_guide.cpp
  # 查看生成的汇编代码，CRTP 方法应该完全内联

预期结果:
  - Virtual function: ~2-5 ns per call
  - CRTP (monomorphic): ~0.3-0.8 ns per call (内联后接近 0)
  - Speedup: 4-10x
  
关键点:
  1. CRTP 的函数调用在 -O3 下完全内联
  2. 无虚表查找开销
  3. 更好的缓存局部性（数据紧密排列）
  4. 编译器可以进行更激进的优化
*/
