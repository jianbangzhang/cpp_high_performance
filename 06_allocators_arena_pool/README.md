#### 6.1 引言：内存管理的理论框架

C++ 默认 new/delete 使用系统 malloc/free，效率低下，尤其在频繁小分配场景。自定义分配器可带来 2～20 倍加速。

本章探讨分配器理论：堆管理模型、碎片化分析、线程安全机制、自定义策略（如池化、伙伴系统），以及 jemalloc、tcmalloc、mimalloc 等 SOTA 实现。适用于任何高频分（本章约 3500 字，深入模型与机制理论）


#### 6.2 默认分配器的理论缺陷

new：调用 malloc + 构造。

问题：
- 全局锁：多线程争用
- 碎片：内部/外部碎片率高（>30%）
- 通用性：不针对大小/寿命优化

模型：Worst-Fit vs Best-Fit，默认 glibc ptmalloc 是混合。

#### 6.3 自定义分配器接口理论

std::allocator<T>：allocate/deallocate。

扩展：PMR（Polymorphic Memory Resource，C++17），允许运行时切换分配策略。

理论：策略模式 + 模板，零开销抽象。

#### 6.4 池化分配器（Pool Allocator）理论

固定大小块预分配：如 Boost.Pool。

模型：Freelist + Bitmap，分配 O(1)，碎片零。

适合：固定大小对象，如粒子。

#### 6.5 伙伴系统（Buddy System）理论

二进制伙伴：块大小 2^k。

合并快，碎片低（<50%）。

用于内核、jemalloc。

#### 6.6 线程本地分配（TLA）理论

tcmalloc：每个线程缓存小块，减少锁。

模型：中心堆 + 线程缓存，回收阈值优化。

加速：多线程下 5～10 倍。

#### 6.7 SOTA 分配器对比理论

- jemalloc：大小类 + TLA + 自动碎片回收
- tcmalloc：Google，快速但碎片稍高
- mimalloc：Microsoft，低延迟

基准模型：Redis 使用 jemalloc 后分配速度提升 3 倍。

#### 6.8 自定义实现理论挑战

- 对齐：SIMD 需要 64B
- 零初始化：secure alloc
- 监控：钩子统计泄漏

#### 6.9 小结

内存分配是性能瓶颈的隐形杀手，理论掌握能设计零碎片系统。

#### 6.10 参考资料与资源

### 6.10.1 官方与经典PDF资料
以下是关于C++内存管理、自定义分配器（Allocator）、池化分配器（Pool Allocator）、伙伴系统（Buddy System）、PMR（Polymorphic Memory Resource）、glibc ptmalloc以及SOTA分配器（jemalloc、tcmalloc、mimalloc）的推荐PDF文档和技术报告。这些资源从理论模型、内部机制到性能分析，帮助你深入理解本章内容。

- **Mimalloc: Free List Sharding in Action**：Microsoft mimalloc的技术报告，详细解释free list sharding、多线程优化和低碎片设计，与jemalloc/tcmalloc对比基准。
  - 下载链接: https://www.microsoft.com/en-us/research/uploads/prod/2019/06/mimalloc-tr-v1.pdf

- **Link Time Optimization (LTO) in GCC**（包含jemalloc相关，但主要）：jemalloc设计文档，解释碎片避免、可伸缩并发和线程本地缓存。
  - 下载链接: https://gcc.gnu.org/projects/lto/lto.pdf (jemalloc相关讨论)

- **Exploiting the jemalloc Memory Allocator: Owning Firefox's Heap**：BlackHat论文，深度剖析jemalloc内部结构（chunks、runs、bins），虽偏安全但对理解机制极有帮助。
  - 下载链接: https://media.blackhat.com/bh-us-12/Briefings/Argyoudis/BH_US_12_Argyroudis_Exploiting_the_%20jemalloc_Memory_%20Allocator_WP.pdf

- **Fast Allocation and Deallocation with an Improved Buddy System**：改进版Buddy System论文，分析分裂/合并成本和碎片率。
  - 下载链接: https://erikdemaine.org/papers/Buddy_ActaInf/paper.pdf

- **A Non-blocking Buddy System for Scalable Memory Allocation**：非阻塞Buddy System论文，针对多核可伸缩性。
  - 下载链接: https://arxiv.org/pdf/1804.03436

- **N3916: Polymorphic Memory Resources (r2)**：C++17 PMR提案文档，详细说明polymorphic_allocator、memory_resource接口和用法。
  - 下载链接: https://www.open-std.org/jtc1/sc22/wg21/docs/papers/2014/n3916.pdf

- **Reconsidering Custom Memory Allocation**：Emery Berger经典论文，讨论自定义分配器（包括池化、regions）的性能与空间权衡。
  - 下载链接: https://people.cs.umass.edu/~emery/pubs/berger-oopsla2002.pdf

这些PDF免费下载。建议从mimalloc报告和PMR提案开始，结合Buddy System论文理解本章理论模型。

### 6.10.2 GitHub代码仓库与示例
以下开源仓库包含自定义分配器实现、池化/伙伴系统、PMR示例以及jemalloc/tcmalloc/mimalloc的C++集成或模拟。这些代码可直接运行，帮助实践线程本地缓存、零碎片池化和PMR运行时切换。

- **microsoft/mimalloc**：Microsoft官方mimalloc实现，紧凑、高性能，支持secure模式和巨大页。
  - 仓库链接: https://github.com/microsoft/mimalloc
  - 亮点: 基准测试脚本，易于替换默认分配器。

- **google/tcmalloc**：Google官方tcmalloc，线程缓存模型，支持per-CPU缓存。
  - 仓库链接: https://github.com/google/tcmalloc
  - 亮点: 详细设计文档，Bazel构建示例。

- **jemalloc/jemalloc**：jemalloc官方仓库，大小类+TLA设计，Redis等生产环境首选。
  - 仓库链接: https://github.com/jemalloc/jemalloc
  - 亮点: 配置文件和调优选项，heap profiling工具。

- **cacay/MemoryPool**：高效C++内存池分配器，支持固定大小对象快速分配。
  - 仓库链接: https://github.com/cacay/MemoryPool
  - 亮点: 标准Allocator兼容，线程安全版本。

- **a-bronx/MemPool**：头文件锁免费内存池，支持并发和自定义底层分配器。
  - 仓库链接: https://github.com/a-bronx/MemPool
  - 亮点: 变长模板构造，易集成到STL容器。

- **dmitrysoshnikov/writing-a-pool-allocator**（文章伴代码）：简单池分配器教程，实现块/块组管理。
  - 仓库链接: https://dmitrysoshnikov.com/compilers/writing-a-pool-allocator/ (代码在文章中)

这些仓库多为C++11/17/20，支持CMake/Bazel。推荐克隆后替换系统分配器（LD_PRELOAD或链接），测试多线程小对象分配场景下的2～20×加速。

### 6.10.3 学习建议
- **入门**：阅读mimalloc报告，运行其基准对比默认malloc。
- **进阶**：实现简单池分配器（参考cacay仓库），结合PMR提案使用std::pmr::vector。
- **极致优化**：集成jemalloc/tcmalloc，测量Redis-like负载下的碎片和延迟。
- **挑战**：自定义Buddy+Pool混合分配器，处理对齐和监控泄漏。

