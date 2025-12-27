# C++ 智能指针与内存管理器、调度器的深度整合指南

本节探讨现代 C++ 中**智能指针**与两种高级资源管理机制的结合使用：

1. **自定义内存管理器（Allocator / Memory Pool）**  
2. **调度器（Scheduler）** —— 典型指协程（Coroutine）、任务系统（Task System）、线程池等异步执行框架

智能指针的核心职责是**自动管理动态内存生命周期**，而内存管理器和调度器则负责**优化分配性能**和**控制执行流程**。将三者巧妙结合，可以构建高性能、安全、现代化的系统级代码（如游戏引擎、网络服务器、实时系统）。

## 1. 智能指针与自定义内存管理器（Allocator）

标准 `new/delete` 在高频分配/释放场景下性能较差（锁争用、碎片化）。自定义 Allocator 可以显著提升性能，而智能指针可以无缝与之协作。

### 1.1 为 std::shared_ptr / unique_ptr 指定自定义 Allocator

#### 方法一：自定义 Deleter（推荐，灵活）

```cpp
#include <memory>
#include <iostream>

// 简单内存池示例（固定大小块）
class MemoryPool {
private:
    struct Block { Block* next; };
    Block* free_list;
    const size_t block_size;
    const size_t pool_size;

public:
    MemoryPool(size_t bsize, size_t count) : block_size(bsize), pool_size(count) {
        free_list = reinterpret_cast<Block*>(::operator new(bsize * count));
        for (size_t i = 0; i < count - 1; ++i) {
            Block* b = reinterpret_cast<Block*>(reinterpret_cast<char*>(free_list) + i * bsize);
            b->next = reinterpret_cast<Block*>(reinterpret_cast<char*>(b) + bsize);
        }
        reinterpret_cast<Block*>(reinterpret_cast<char*>(free_list) + (count-1)*bsize)->next = nullptr;
    }

    void* allocate() {
        if (!free_list) throw std::bad_alloc();
        Block* block = free_list;
        free_list = free_list->next;
        return block;
    }

    void deallocate(void* p) {
        Block* block = static_cast<Block*>(p);
        block->next = free_list;
        free_list = block;
    }

    ~MemoryPool() { ::operator delete(free_list); }
};

// 使用自定义 deleter 的智能指针
template<typename T>
using PooledUniquePtr = std::unique_ptr<T, std::function<void(T*)>>;

template<typename T>
PooledUniquePtr<T> make_pooled_unique(MemoryPool& pool) {
    void* mem = pool.allocate();
    T* obj = new(mem) T();  // placement new
    return PooledUniquePtr<T>(obj, [&](T* p) {
        if (p) {
            p->~T();           // 显式调用析构
            pool.deallocate(p);
        }
    });
}

// shared_ptr 版本（需状态共享）
class PooledSharedPtr {
private:
    MemoryPool& pool;
    std::shared_ptr<void> ptr;  // 使用 void 持有内存块

public:
    template<typename T, typename... Args>
    static PooledSharedPtr create(MemoryPool& p, Args&&... args) {
        void* mem = p.allocate();
        T* obj = new(mem) T(std::forward<Args>(args)...);
        PooledSharedPtr result;
        result.pool = p;
        result.ptr = std::shared_ptr<void>(obj, [&p](void* ptr) {
            static_cast<T*>(ptr)->~T();
            p.deallocate(ptr);
        });
        return result;
    }

    template<typename T>
    T* get() const { return static_cast<T*>(ptr.get()); }
};
```

#### 方法二：为 STL 容器指定 Allocator（智能指针间接受益）

```cpp
template<typename T>
using PoolAllocator = MyPoolAllocator<T>;  // 自定义 allocator 满足 STL 要求

std::vector<std::unique_ptr<Enemy>, PoolAllocator<std::unique_ptr<Enemy>>> enemies;
// 或
std::unordered_map<int, std::shared_ptr<Node>, std::hash<int>, std::equal_to<int>,
                   PoolAllocator<std::pair<const int, std::shared_ptr<Node>>>> node_map;
```

**优势**：
- 高频对象（如粒子、弹幕、AI节点）分配速度提升 10~100 倍
- 减少内存碎片
- 智能指针仍保证异常安全和无泄漏

## 2. 智能指针与调度器（Scheduler）的整合

调度器常见于：
- 协程任务系统（如 C++20 coroutine、Boost.Asio、folly::coro）
- 游戏引擎任务图（Task Graph）
- 线程池 + future/promise

智能指针在此扮演**任务对象生命周期管理**的关键角色。

### 2.1 协程 + 智能指针（C++20 coroutine 示例）

```cpp
#include <coroutine>
#include <memory>
#include <iostream>

struct Task {
    struct promise_type {
        Task get_return_object() { return {}; }
        std::suspend_never initial_suspend() { return {}; }
        std::suspend_never final_suspend() noexcept { return {}; }
        void return_void() {}
        void unhandled_exception() { std::terminate(); }
    };
};

class Service {
private:
    std::shared_ptr<int> resource;  // 共享资源

public:
    Service() : resource(std::make_shared<int>(42)) {}

    Task do_work() {
        std::cout << "Work on resource: " << *resource << "\n";
        co_await std::suspend_always{};  // 模拟异步
        std::cout << "Work done\n";
        // resource 自动随 Service 生命周期管理
    }
};

Task async_main(std::shared_ptr<Service> svc) {
    co_await svc->do_work();
    co_await svc->do_work();
}
```

**关键点**：
- `shared_ptr<Service>` 传入协程，确保协程挂起期间 Service 不被销毁
- 避免悬空引用

### 2.2 任务系统 + 智能指针（线程池任务队列）

```cpp
class TaskSystem {
private:
    std::queue<std::function<void()>> tasks;
    std::mutex mtx;
    std::condition_variable cv;
    std::vector<std::thread> workers;
    bool stop = false;

public:
    TaskSystem(size_t num_threads = std::thread::hardware_concurrency()) {
        for (size_t i = 0; i < num_threads; ++i) {
            workers.emplace_back([this] {
                while (true) {
                    std::function<void()> task;
                    {
                        std::unique_lock<std::mutex> lock(mtx);
                        cv.wait(lock, [this] { return stop || !tasks.empty(); });
                        if (stop && tasks.empty()) return;
                        task = std::move(tasks.front());
                        tasks.pop();
                    }
                    task();
                }
            });
        }
    }

    template<typename F, typename... Args>
    void submit(std::shared_ptr<typename std::result_of<F(Args...)>::type> result,
                F&& f, Args&&... args) {
        auto task = [f = std::forward<F>(f),
                     args = std::make_tuple(std::forward<Args>(args)...),
                     result]() mutable {
            // 使用 shared_ptr 传递结果
            *result = std::apply(f, std::move(args));
        };
        {
            std::lock_guard<std::mutex> lock(mtx);
            tasks.push(std::move(task));
        }
        cv.notify_one();
    }

    ~TaskSystem() {
        {
            std::lock_guard<std::mutex> lock(mtx);
            stop = true;
        }
        cv.notify_all();
        for (auto& w : workers) w.join();
    }
};
```

### 2.3 典型模式：Actor 模型（消息传递）

```cpp
class Actor {
protected:
    virtual void receive(std::unique_ptr<Message> msg) = 0;

public:
    void send(std::unique_ptr<Message> msg) {
        // 放入调度器消息队列
        Scheduler::instance().post(this, std::move(msg));
    }
};

class Scheduler {
public:
    static Scheduler& instance() {
        static Scheduler s;
        return s;
    }

    void post(Actor* actor, std::unique_ptr<Message> msg) {
        // 线程安全入队
        queue.push({actor, std::move(msg)});
    }

private:
    struct Item { Actor* actor; std::unique_ptr<Message> msg; };
    std::queue<Item> queue;
    // + worker threads
};
```

**优势**：
- `unique_ptr<Message>` 确保消息独占所有权，无拷贝
- Actor 间解耦，调度器控制执行顺序

## 3. 最佳实践总结

| 场景                        | 推荐智能指针          | 搭配机制                     | 原因                                                                 |
|-----------------------------|-----------------------|------------------------------|----------------------------------------------------------------------|
| 高频小对象分配（如粒子）    | unique_ptr + custom deleter | 内存池                       | 极致性能 + 自动回收                                                  |
| 共享资源（如纹理、配置）    | shared_ptr            | 单例 + allocator             | 多模块共享，引用计数安全                                             |
| 协程任务                    | shared_ptr（传入）    | C++20 coroutine              | 确保挂起期间对象存活                                                 |
| 异步任务结果传递            | shared_ptr<result>    | future / promise             | 多任务等待同一结果                                                   |
| 消息系统                    | unique_ptr<Message>   | 调度器消息队列               | 零拷贝传递，独占所有权                                               |
| 树/图结构节点               | unique_ptr<Child>     | 自定义 allocator             | 清晰拥有关系 + 批量快速分配                                          |

## 结语

智能指针不仅是内存安全的工具，更是现代 C++ 系统架构的**桥梁**：

- 与**内存管理器**结合 → 实现高性能、低碎片的资源分配
- 与**调度器**结合 → 构建安全、可维护的并发/异步系统

在游戏引擎（如 Unreal、Unity C++ 部分）、高性能服务器（如 Nginx 模块、Redis 扩展）、嵌入式系统中，这种组合已成为标准实践。
