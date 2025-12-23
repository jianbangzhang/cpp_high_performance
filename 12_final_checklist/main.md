# Chapter 12: 上线前必跑的 27 条终极 Checklist ✅

> **目标**: 防止性能翻车，确保每一滴性能都被榨干

## 📋 完整 Checklist

### 第一阶段：编译器与构建系统 (1-7)

- [ ] **1. 使用 Release 构建模式**
  ```bash
  cmake -DCMAKE_BUILD_TYPE=Release ..
  # 确保没有 -g, -O0 等调试选项
  ```

- [ ] **2. 启用编译器优化旗标**
  ```bash
  # GCC/Clang
  -O3 -march=native -mtune=native
  
  # MSVC
  /O2 /arch:AVX2
  ```

- [ ] **3. 启用 LTO (Link-Time Optimization)**
  ```bash
  # GCC/Clang
  -flto=auto
  
  # MSVC
  /GL /LTCG
  ```

- [ ] **4. 运行 PGO (Profile-Guided Optimization)**
  ```bash
  # 步骤 1: 插桩编译
  g++ -O3 -fprofile-generate program.cpp -o program
  
  # 步骤 2: 用典型工作负载运行
  ./program < typical_input.txt
  
  # 步骤 3: 使用 profile 重新编译
  g++ -O3 -fprofile-use program.cpp -o program_optimized
  ```

- [ ] **5. 禁用不必要的特性**
  ```cpp
  // 如果不需要异常
  -fno-exceptions
  
  // 如果不需要 RTTI
  -fno-rtti
  
  // 禁用断言
  -DNDEBUG
  ```

- [ ] **6. 检查并移除调试符号**
  ```bash
  strip --strip-all program
  
  # 或编译时
  -s  # GCC/Clang
  ```

- [ ] **7. 验证编译器版本**
  ```bash
  # 使用最新的稳定版编译器
  gcc --version    # >= GCC 14
  clang --version  # >= Clang 18
  ```

### 第二阶段：代码层面优化 (8-14)

- [ ] **8. 数据布局已优化（AoS → SoA）**
  ```cpp
  // ❌ 不好
  struct Particle {
      float x, y, z, vx, vy, vz, mass;
  };
  std::vector<Particle> particles;
  
  // ✅ 好
  struct ParticleSystem {
      std::vector<float> x, y, z;
      std::vector<float> vx, vy, vz;
      std::vector<float> mass;
  };
  ```

- [ ] **9. 热点循环已向量化**
  ```bash
  # 检查向量化报告
  g++ -O3 -march=native -fopt-info-vec program.cpp
  
  # 确保关键循环显示 "vectorized" 或 "SIMD"
  ```

- [ ] **10. 内存分配已优化**
  ```cpp
  // ✅ 预分配
  vector.reserve(expected_size);
  
  // ✅ 使用自定义分配器
  std::vector<T, PoolAllocator<T>> vec;
  
  // ✅ 避免频繁分配
  // 复用对象池
  ```

- [ ] **11. 缓存命中率已优化**
  ```cpp
  // ✅ 数据对齐
  alignas(64) float data[N];
  
  // ✅ 避免 False Sharing
  struct alignas(64) CacheLine {
      int counter;
      char padding[60];
  };
  ```

- [ ] **12. 分支预测已优化**
  ```cpp
  // ✅ 使用 likely/unlikely 宏
  if ([[likely]] common_case) { ... }
  if ([[unlikely]] rare_case) { ... }
  
  // ✅ 避免不可预测的分支
  // 使用查表法或 SIMD 掩码操作
  ```

- [ ] **13. 字符串操作已优化**
  ```cpp
  // ✅ 使用 string_view 避免拷贝
  void process(std::string_view sv);
  
  // ✅ 预分配字符串容量
  str.reserve(expected_length);
  
  // ✅ 使用 SSO (Small String Optimization)
  // 保持字符串 < 15 字节时性能最好
  ```

- [ ] **14. 虚函数已最小化**
  ```cpp
  // ✅ 在性能关键路径使用 CRTP
  template<typename Derived>
  class Base { ... };
  
  // ✅ 或者使用 final 关键字帮助编译器去虚化
  class Derived final : public Base { ... };
  ```

### 第三阶段：并发与多线程 (15-19)

- [ ] **15. 锁竞争已最小化**
  ```cpp
  // ✅ 使用无锁数据结构
  folly::MPMCQueue<T>
  
  // ✅ 减小临界区
  {
      std::lock_guard lock(mutex);
      // 只保护必需的代码
  }
  
  // ✅ 使用读写锁
  std::shared_mutex rwlock;
  ```

- [ ] **16. False Sharing 已避免**
  ```cpp
  // ✅ 每个线程的数据对齐到独立 cache line
  struct alignas(64) ThreadLocal {
      int counter;
      // 确保 padding
  };
  ```

- [ ] **17. 线程数量已调优**
  ```cpp
  // ✅ 根据任务类型选择线程数
  // CPU 密集: num_threads = num_cores
  // I/O 密集: num_threads = 2 * num_cores
  unsigned int threads = std::thread::hardware_concurrency();
  ```

- [ ] **18. 内存顺序已优化**
  ```cpp
  // ✅ 使用最弱的内存顺序
  std::atomic<int> counter;
  
  // 对于简单计数器
  counter.fetch_add(1, std::memory_order_relaxed);
  
  // 对于同步点
  flag.store(true, std::memory_order_release);
  ```

- [ ] **19. 任务粒度已调优**
  ```cpp
  // ✅ 避免过细粒度（线程创建开销）
  // ✅ 避免过粗粒度（负载不均）
  // 经验值: 每个任务 > 10ms
  ```

### 第四阶段：性能分析与验证 (20-25)

- [ ] **20. 使用 perf 分析热点**
  ```bash
  # 采样运行
  perf record -g ./program
  
  # 查看报告
  perf report
  
  # 查看缓存未命中
  perf stat -e cache-misses,cache-references ./program
  ```

- [ ] **21. 检查 CPU 时间分布**
  ```bash
  # 使用 flamegraph
  perf script | stackcollapse-perf.pl | flamegraph.pl > flame.svg
  
  # 确保没有意外的热点
  ```

- [ ] **22. 验证向量化效果**
  ```bash
  # 查看汇编
  g++ -S -O3 -march=native program.cpp
  grep -E "vmovaps|vaddps|vmulps" program.s
  
  # 或使用 godbolt.org
  ```

- [ ] **23. 测量内存带宽利用率**
  ```bash
  # 使用 perf
  perf stat -e cycles,instructions,L1-dcache-load-misses,LLC-load-misses ./program
  
  # 理想情况: IPC > 1.5, Cache miss rate < 5%
  ```

- [ ] **24. 运行 Sanitizers**
  ```bash
  # Address Sanitizer (内存错误)
  g++ -fsanitize=address -g program.cpp
  
  # Thread Sanitizer (数据竞争)
  g++ -fsanitize=thread -g program.cpp
  
  # Undefined Behavior Sanitizer
  g++ -fsanitize=undefined -g program.cpp
  ```

- [ ] **25. 基准测试在目标硬件上运行**
  ```cpp
  // ✅ 在生产环境相同的 CPU 架构上测试
  // ✅ 考虑 NUMA 影响
  // ✅ 测试冷启动和热启动性能
  ```

### 第五阶段：二进制与部署 (26-27)

- [ ] **26. 运行 BOLT 优化（可选）**
  ```bash
  # 需要 LLVM BOLT
  llvm-bolt program -o program.bolt \
      -reorder-blocks=ext-tsp \
      -reorder-functions=hfsort \
      -split-functions \
      -split-all-cold
  ```

- [ ] **27. 最终性能回归测试**
  ```bash
  # ✅ 与基准版本对比
  # ✅ 多次运行取平均值
  # ✅ 测试各种输入大小
  # ✅ 检查 P50, P99, P99.9 延迟
  ```

## 🎯 快速检查脚本

创建一个自动化脚本 `performance_check.sh`：

```bash
#!/bin/bash

echo "====================================="
echo "  C++ Performance Checklist"
echo "====================================="

# 检查编译旗标
echo "
[1] Checking build configuration..."
if grep -q "CMAKE_BUILD_TYPE.*Release" CMakeCache.txt; then
    echo "✅ Release mode enabled"
else
    echo "❌ Not in Release mode!"
fi

# 检查优化级别
echo "
[2] Checking optimization flags..."
if gcc -Q --help=optimizers | grep -q "O3.*enabled"; then
    echo "✅ -O3 enabled"
else
    echo "⚠️  -O3 not detected"
fi

# 检查 LTO
echo "
[3] Checking LTO..."
if gcc -flto -Q --help=optimizers | grep -q "flto.*enabled"; then
    echo "✅ LTO enabled"
else
    echo "⚠️  LTO not enabled"
fi

# 检查符号
echo "
[4] Checking binary size..."
SIZE=$(stat -f%z program 2>/dev/null || stat -c%s program)
echo "Binary size: $((SIZE / 1024)) KB"

# 运行性能测试
echo "
[5] Running performance test..."
time ./program < test_input.txt

# 检查缓存性能
echo "
[6] Checking cache performance..."
perf stat -e cache-misses,cache-references ./program < test_input.txt 2>&1 | \
    grep -E "cache-misses|cache-references"

echo "
====================================="
echo "  Checklist Complete!"
echo "====================================="
```

## 📊 性能目标参考

### CPU 指标
- **IPC (Instructions Per Cycle)**: > 1.5
- **分支预测准确率**: > 95%
- **L1 Cache 命中率**: > 95%
- **L3 Cache 命中率**: > 85%

### 内存指标
- **内存带宽利用率**: > 50%（理论峰值）
- **TLB Miss**: < 1%
- **Page Fault**: < 0.1%

### 延迟指标
- **P50 延迟**: < 目标 × 1.2
- **P99 延迟**: < 目标 × 3
- **P99.9 延迟**: < 目标 × 10

## 🔍 常见性能陷阱

### ❌ 陷阱 1: 过早优化
```cpp
// 不要在没有 profiling 的情况下盲目优化
// 先测量，再优化
```

### ❌ 陷阱 2: 忽略内存对齐
```cpp
// 导致跨 cache line 访问
struct Bad {
    char c;
    int64_t x;  // 可能未对齐
};

// ✅ 正确
struct alignas(8) Good {
    char c;
    char padding[7];
    int64_t x;
};
```

### ❌ 陷阱 3: 不必要的拷贝
```cpp
// ❌
void process(std::string s);  // 拷贝

// ✅
void process(const std::string& s);  // 引用
void process(std::string_view s);    // 更好
```

### ❌ 陷阱 4: 锁粒度过大
```cpp
// ❌
void bad() {
    std::lock_guard lock(mutex);
    heavy_computation();  // 不需要锁保护
    shared_data.update();
}

// ✅
void good() {
    auto result = heavy_computation();
    std::lock_guard lock(mutex);
    shared_data.update(result);
}
```

## 📈 性能提升总结

如果你完成了所有 27 条检查：

| 优化项 | 典型提升 |
|--------|---------|
| 编译器优化 (1-7) | 1.5-5× |
| 代码优化 (8-14) | 2-10× |
| 并发优化 (15-19) | 线性扩展 |
| 性能分析 (20-25) | 发现瓶颈 |
| 二进制优化 (26-27) | 1.1-1.3× |
| **总体** | **10-100×** |

## 🎓 推荐工具链

- **编译器**: GCC 14 / Clang 18 / MSVC 19.41
- **性能分析**: perf, VTune, Tracy Profiler
- **内存检查**: Valgrind, AddressSanitizer
- **基准测试**: Google Benchmark
- **可视化**: FlameGraph, Speedscope

## 📚 延伸阅读

1. [Agner Fog's Optimization Manuals](https://www.agner.org/optimize/)
2. [Intel Optimization Manual](https://software.intel.com/content/www/us/en/develop/articles/intel-sdm.html)
3. [Compiler Explorer](https://godbolt.org/)
4. [Performance Analysis Guide for Intel Processors](https://www.intel.com/content/www/us/en/develop/documentation/vtune-help/top.html)

---

## ✨ 最后的话

性能优化是一门艺术，也是一门科学。记住：

> "Premature optimization is the root of all evil" - Donald Knuth

但：

> "Premature pessimization is the root of all suffering" - Chandler Carruth

**在关键路径上，每一纳秒都很重要。**

祝你榨干每一滴性能！🚀
