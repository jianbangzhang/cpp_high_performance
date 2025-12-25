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
