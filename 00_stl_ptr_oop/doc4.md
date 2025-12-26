# C++ 智能指针 + 类编程 + 设计模式 深度整合指南

本节将深入探讨现代 C++ 中**智能指针**、**面向对象类编程**以及**经典设计模式**的结合使用。我们将重点分析如何使用 `unique_ptr`、`shared_ptr`、`weak_ptr` 来实现安全、高效、清晰的所有权转移，从而自然地实现 GoF（Gang of Four）23 种设计模式中的许多模式，避免传统裸指针带来的内存泄漏、悬空指针和复杂手动管理问题。

## 1. 智能指针在类编程中的核心作用

在现代 C++（C++11 及以上），类设计应遵循以下原则：

- **资源管理使用 RAII**：所有动态资源（内存、文件、锁、句柄）都应封装在类中。
- **所有权明确**：使用智能指针表达对象生命周期的所有权语义。
- **优先使用 unique_ptr**：表示独占所有权（默认选择）。
- **必要时使用 shared_ptr**：多对象共享同一资源。
- **使用 weak_ptr 打破循环引用**。

### 常见类成员智能指针用法

```cpp
class Widget {
private:
    std::unique_ptr<Impl> pimpl;                  // Pimpl 惯用法（独占）
    std::shared_ptr<Texture> texture;             // 共享资源（如图形纹理）
    std::weak_ptr<Parent> parent;                 // 观察者模式，避免循环引用

public:
    Widget();
    void setParent(std::shared_ptr<Parent> p) {
        parent = p;  // weak_ptr 从 shared_ptr 构造
    }
};
```

## 2. 智能指针如何重塑经典设计模式

以下是几个典型设计模式在使用智能指针后的现代实现方式对比。

### 2.1 单例模式（Singleton）——线程安全 + 自动销毁

传统问题：全局静态对象析构顺序不确定、易泄漏。

现代实现（推荐）：

```cpp
class Singleton {
private:
    struct Impl {
        // 实际数据
        Impl() { std::cout << "Singleton created\n"; }
        ~Impl() { std::cout << "Singleton destroyed\n"; }
    };

    static std::unique_ptr<Impl> instance;
    static std::once_flag init_flag;

    Singleton() = delete;

public:
    static Impl& get() {
        std::call_once(init_flag, []() {
            instance = std::make_unique<Impl>();
        });
        return *instance;
    }

    // 可选：手动重置（测试用）
    static void reset() {
        instance.reset();
    }
};

std::unique_ptr<Singleton::Impl> Singleton::instance;
std::once_flag Singleton::init_flag;
```

优点：自动销毁（程序结束时）、线程安全、无 Meyer’s Singleton 析构顺序问题。

### 2.2 工厂模式（Factory）——返回智能指针

```cpp
class Shape {
public:
    virtual ~Shape() = default;
    virtual void draw() = 0;
};

class Circle : public Shape { public: void draw() override { /* ... */ } };
class Rectangle : public Shape { public: void draw() override { /* ... */ } };

class ShapeFactory {
public:
    static std::unique_ptr<Shape> create(std::string type) {
        if (type == "circle")    return std::make_unique<Circle>();
        if (type == "rectangle") return std::make_unique<Rectangle>();
        return nullptr;
    }
};

// 使用
auto shape = ShapeFactory::create("circle");  // 自动管理生命周期
shape->draw();
```

优点：调用者无需 delete，异常安全。

### 2.3 观察者模式（Observer）——避免循环引用

传统裸指针容易造成 Subject ↔ Observer 循环引用导致泄漏。

现代实现使用 weak_ptr：

```cpp
class Observer {
public:
    virtual ~Observer() = default;
    virtual void update(const std::string& msg) = 0;
};

class Subject {
private:
    std::vector<std::weak_ptr<Observer>> observers;

public:
    void attach(std::shared_ptr<Observer> obs) {
        observers.push_back(obs);
    }

    void notify(const std::string& msg) {
        for (auto it = observers.begin(); it != observers.end(); ) {
            if (auto obs = it->lock()) {  // 尝试提升为 shared_ptr
                obs->update(msg);
                ++it;
            } else {
                it = observers.erase(it);  // 已销毁，清理
            }
        }
    }
};

// 使用
auto observer = std::make_shared<ConcreteObserver>();
auto subject = std::make_shared<Subject>();
subject->attach(observer);  // 无循环引用风险
```

### 2.4 组合模式（Composite）——树结构管理

使用 unique_ptr 表达“拥有”关系：

```cpp
class Component {
public:
    virtual ~Component() = default;
    virtual void operation() = 0;
};

class Leaf : public Component {
public:
    void operation() override { /* ... */ }
};

class Composite : public Component {
private:
    std::vector<std::unique_ptr<Component>> children;

public:
    void add(std::unique_ptr<Component> child) {
        children.push_back(std::move(child));
    }

    void operation() override {
        for (auto& child : children) {
            child->operation();
        }
    }
};

// 使用
auto root = std::make_unique<Composite>();
root->add(std::make_unique<Leaf>());
root->add(std::make_unique<Leaf>());
```

优点：树节点自动销毁，无需递归 delete。

### 2.5 Pimpl 惯用法（Pointer to Implementation）

隐藏实现细节，减少编译依赖：

```cpp
// widget.h
class Widget {
private:
    class Impl;                         // 前向声明
    std::unique_ptr<Impl> pimpl;        // 独占实现

public:
    Widget();
    ~Widget();                         // 自动销毁 Impl
    Widget(Widget&&) noexcept;         // 支持移动
    Widget& operator=(Widget&&) noexcept;

    void doSomething();
};

// widget.cpp
class Widget::Impl {
public:
    void doSomething() { /* 大量实现 */ }
};

Widget::Widget() : pimpl(std::make_unique<Impl>()) {}
Widget::~Widget() = default;  // 自动调用 Impl 析构

void Widget::doSomething() { pimpl->doSomething(); }
```

优点：头文件不包含实现细节，编译更快，二进制兼容性更好。

### 2.6 策略模式（Strategy）——共享行为对象

```cpp
class Strategy {
public:
    virtual ~Strategy() = default;
    virtual int execute(int a, int b) = 0;
};

class Add : public Strategy {
public:
    int execute(int a, int b) override { return a + b; }
};

class Context {
private:
    std::shared_ptr<Strategy> strategy;

public:
    void setStrategy(std::shared_ptr<Strategy> s) {
        strategy = s;
    }

    int run(int a, int b) {
        return strategy->execute(a, b);
    }
};

// 多个 Context 可共享同一 Strategy 实例
auto addStrategy = std::make_shared<Add>();
Context c1, c2;
c1.setStrategy(addStrategy);
c2.setStrategy(addStrategy);
```

## 3. 智能指针使用最佳实践总结

| 场景                          | 推荐智能指针       | 原因                                                                 |
|-------------------------------|---------------------|----------------------------------------------------------------------|
| 独占所有权（最常见）          | `unique_ptr`        | 零开销、支持移动、自动销毁                                           |
| 多对象共享同一资源            | `shared_ptr`        | 引用计数自动管理生命周期                                             |
| 父子/观察者关系（可能循环）   | `weak_ptr`          | 打破循环引用，不影响计数                                             |
| 返回多态对象                  | `unique_ptr`        | 调用者获得所有权，无需 delete                                        |
| 容器存储多态对象              | `vector<unique_ptr<T>>` | 避免对象切片，安全多态                                               |
| 跨模块共享资源（如配置、缓存）| `shared_ptr`        | 生命周期由最后使用者决定                                             |
| 禁止拷贝，只允许移动          | `unique_ptr`        | 强制表达独占语义                                                     |

## 4. 避免的常见陷阱

- 不要将 `this` 指针直接构造 shared_ptr（可能导致多次 delete）。
  - 正确方式：继承 `std::enable_shared_from_this<T>`
- 不要在 shared_ptr 之间形成循环引用 → 使用 weak_ptr 打破。
- 不要混用智能指针和裸指针所有权转移。
- 不要在容器中使用 shared_ptr 存储本应独占的对象（性能浪费）。

## 总结

在现代 C++ 中，**智能指针不再是“可选工具”，而是类设计和设计模式实现的核心基石**。它们让代码：

- **更安全**：杜绝内存泄漏和悬空指针
- **更清晰**：所有权语义一目了然
- **更高效**：unique_ptr 几乎零开销
- **更现代**：自然支持移动语义和异常安全

掌握智能指针 + 类编程 + 设计模式的结合，就真正掌握了现代 C++ 的精髓。

