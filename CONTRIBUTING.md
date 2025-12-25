# 贡献指南 🤝

感谢你对 C++ 高性能编程完全指南项目的兴趣！本文档将帮助你了解如何为项目做出贡献。

## 📋 目录

- [行为准则](#行为准则)
- [如何贡献](#如何贡献)
- [代码规范](#代码规范)
- [提交规范](#提交规范)
- [测试要求](#测试要求)
- [文档规范](#文档规范)

---

## 行为准则

我们致力于营造一个开放、友好、包容的环境。参与本项目即表示你同意遵守以下准则：

- ✅ 尊重不同的观点和经验
- ✅ 优雅地接受建设性批评
- ✅ 关注对社区最有利的事情
- ✅ 对其他社区成员表示同理心
- ❌ 禁止使用性化的语言或图像
- ❌ 禁止人身攻击或政治攻击
- ❌ 禁止骚扰行为

---

## 如何贡献

### 报告 Bug

在提交 Bug 报告前，请先：

1. 搜索现有的 Issue，避免重复
2. 使用最新版本重现问题
3. 确定这是代码问题而非使用问题

**Bug 报告应包含**:

```markdown
**环境信息**
- 操作系统: [e.g., Ubuntu 22.04]
- 编译器: [e.g., GCC 14.1]
- CPU: [e.g., Intel Core i7-12700K]

**重现步骤**
1. 执行 '...'
2. 观察到 '...'
3. 预期结果 '...'

**实际结果**
[清晰描述实际发生的情况]

**预期结果**
[清晰描述你期望发生的情况]

**相关日志/截图**
[如果适用，添加日志或截图]
```

### 建议新功能

**功能建议应包含**:

```markdown
**功能描述**
清晰简洁地描述你想要的功能

**动机**
为什么需要这个功能？它解决了什么问题？

**替代方案**
你考虑过哪些其他解决方案？

**额外上下文**
任何其他有助于理解的信息
```

### 提交代码

1. **Fork 仓库**
   ```bash
   [https://github.com/jianbangzhang/cpp_high_performance.git](https://github.com/jianbangzhang/cpp_high_performance.git)
   cd cpp-performance-guide
   ```

2. **创建特性分支**
   ```bash
   git checkout -b feature/your-feature-name
   # 或
   git checkout -b fix/your-bug-fix
   ```

3. **进行修改**
   - 遵循代码规范
   - 添加测试
   - 更新文档

4. **提交更改**
   ```bash
   git add .
   git commit -m "feat: add new optimization technique"
   ```

5. **推送到 GitHub**
   ```bash
   git push origin feature/your-feature-name
   ```

6. **创建 Pull Request**
   - 提供清晰的 PR 描述
   - 链接相关的 Issue
   - 等待 Review

---

## 代码规范

### C++ 代码风格

我们遵循修改后的 [Google C++ Style Guide](https://google.github.io/styleguide/cppguide.html)：

#### 命名规范

```cpp
// 类名：PascalCase
class DataProcessor { };

// 函数名：snake_case
void process_data() { }

// 变量名：snake_case
int user_count = 0;

// 常量：kPascalCase
constexpr int kMaxBufferSize = 1024;

// 私有成员变量：trailing underscore
class Widget {
private:
    int width_;
    int height_;
};

// 宏：UPPER_CASE
#define MAX_ITERATIONS 100
```

#### 格式化

```cpp
// 使用 clang-format
// .clang-format 文件:
BasedOnStyle: Google
IndentWidth: 4
ColumnLimit: 100
```

运行格式化：
```bash
clang-format -i your_file.cpp
```

#### 注释规范

```cpp
// 文件头注释
/**
 * @file custom_allocator.cpp
 * @brief 高性能内存分配器实现
 * @author Your Name
 * @date 2025-01-01
 */

// 函数注释
/**
 * @brief 分配指定大小的内存块
 * @param size 需要分配的字节数
 * @param alignment 对齐要求（字节）
 * @return 指向分配内存的指针，失败返回 nullptr
 * @throws std::bad_alloc 内存不足时抛出
 */
void* allocate(size_t size, size_t alignment = alignof(std::max_align_t));

// 复杂逻辑注释
// 使用 Three-Pass 算法进行矩阵分解:
// Pass 1: 计算主元
// Pass 2: 更新子矩阵
// Pass 3: 回代求解
```

#### 性能要求

所有新增代码必须：

1. **基准测试**: 提供性能测试代码
   ```cpp
   BENCHMARK(NewFeature) {
       // 测试代码
   }
   ```

2. **性能对比**: 与现有方案对比
   ```markdown
   | 实现 | 时间 (ms) | 加速比 |
   |------|----------|--------|
   | 原实现 | 100 | 1.0× |
   | 新实现 | 25 | 4.0× |
   ```

3. **内存分析**: 报告内存使用
   ```bash
   valgrind --tool=massif ./benchmark
   ```

---

## 提交规范

我们使用 [Conventional Commits](https://www.conventionalcommits.org/) 规范：

### 提交类型

- `feat`: 新功能
- `fix`: Bug 修复
- `perf`: 性能优化
- `docs`: 文档更新
- `style`: 代码格式（不影响功能）
- `refactor`: 重构（既非新增功能，也非修复 Bug）
- `test`: 测试相关
- `chore`: 构建过程或辅助工具的变动

### 提交消息格式

```
<type>(<scope>): <subject>

<body>

<footer>
```

**示例**:

```
feat(simd): add AVX-512 support for vector operations

Implement AVX-512 intrinsics for vector addition, multiplication,
and dot product operations. Benchmarks show 2x improvement over
AVX2 on Intel Xeon processors.

Closes #123
```

```
perf(allocator): optimize pool allocator lock contention

Replace mutex with lock-free stack for free list management.
Reduces allocation time by 40% under high contention.

Benchmark results:
- Before: 850 ns/op
- After: 510 ns/op (1.67x faster)

Fixes #456
```

---

## 测试要求

### 单元测试

所有新功能必须包含单元测试：

```cpp
// test_allocator.cpp
#include <gtest/gtest.h>
#include "pool_allocator.hpp"

TEST(PoolAllocator, BasicAllocation) {
    PoolAllocator<int> alloc;
    int* ptr = alloc.allocate(1);
    
    ASSERT_NE(ptr, nullptr);
    *ptr = 42;
    EXPECT_EQ(*ptr, 42);
    
    alloc.deallocate(ptr, 1);
}

TEST(PoolAllocator, Performance) {
    constexpr int N = 10000;
    
    auto start = std::chrono::high_resolution_clock::now();
    
    PoolAllocator<int> alloc;
    for (int i = 0; i < N; ++i) {
        int* ptr = alloc.allocate(1);
        alloc.deallocate(ptr, 1);
    }
    
    auto end = std::chrono::high_resolution_clock::now();
    auto duration = std::chrono::duration<double, std::nano>(end - start).count();
    
    // 性能目标: < 100 ns per operation
    EXPECT_LT(duration / N, 100.0);
}
```

### 基准测试

使用 Google Benchmark：

```cpp
// benchmark_allocator.cpp
#include <benchmark/benchmark.h>
#include "pool_allocator.hpp"

static void BM_PoolAllocator(benchmark::State& state) {
    PoolAllocator<int> alloc;
    
    for (auto _ : state) {
        int* ptr = alloc.allocate(1);
        benchmark::DoNotOptimize(ptr);
        alloc.deallocate(ptr, 1);
    }
}
BENCHMARK(BM_PoolAllocator);

static void BM_StdAllocator(benchmark::State& state) {
    std::allocator<int> alloc;
    
    for (auto _ : state) {
        int* ptr = alloc.allocate(1);
        benchmark::DoNotOptimize(ptr);
        alloc.deallocate(ptr, 1);
    }
}
BENCHMARK(BM_StdAllocator);

BENCHMARK_MAIN();
```

### 运行测试

```bash
# 构建测试
mkdir build && cd build
cmake .. -DCMAKE_BUILD_TYPE=Release -DENABLE_TESTING=ON
make

# 运行单元测试
ctest --output-on-failure

# 运行基准测试
./benchmark_allocator --benchmark_repetitions=10
```

---

## 文档规范

### README 文件

每个新章节都应包含 `README.md`：

```markdown
# Chapter X: 主题名称

> **目标**: 一句话描述学习目标

## 关键内容

- 概念 1
- 概念 2
- 概念 3

## 示例代码

[链接到示例]

## 性能提升

| 优化前 | 优化后 | 加速比 |
|--------|--------|--------|
| 100 ms | 25 ms | 4.0× |

## 参考资源

- [文章 1]
- [视频 2]
```

### 代码注释

- 所有公开 API 必须有 Doxygen 注释
- 复杂算法需要说明原理
- 性能关键代码需要解释优化思路

### 教程文档

- 使用清晰的标题层次
- 提供完整的代码示例
- 包含性能对比数据
- 添加"最佳实践"部分

---

## 审查流程

### Pull Request Checklist

提交 PR 前，请确认：

- [ ] 代码遵循项目风格指南
- [ ] 所有测试通过
- [ ] 添加了必要的测试
- [ ] 更新了相关文档
- [ ] 提交消息符合规范
- [ ] 没有引入编译警告
- [ ] 性能没有退化

### Review 过程

1. **自动检查**: CI 运行测试和静态分析
2. **代码审查**: 至少一位维护者审查
3. **性能验证**: 验证性能提升
4. **文档审查**: 检查文档完整性
5. **合并**: 所有检查通过后合并

---

## 联系方式

- **Issue**: 技术问题和 Bug 报告
- **Discussion**: 功能讨论和想法分享
- **Email**: whdx072018@foxmail.com

---

## 许可证

贡献到本项目的代码将使用 [MIT License](LICENSE) 发布。

---

## 致谢

感谢所有为本项目做出贡献的开发者！

[![Contributors](https://contrib.rocks/image?repo=yourusername/cpp-performance-guide)](https://github.com/yourusername/cpp-performance-guide/graphs/contributors)

---

**祝你编码愉快！🚀**
