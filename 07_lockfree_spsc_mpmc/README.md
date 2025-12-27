#### 7.1 引言：并发模型的理论演进与锁的根本缺陷

在现代多核系统中，并发性能已成为决定程序吞吐量与延迟的关键因素。传统基于互斥锁（mutex）的同步机制虽简单，却存在深刻的理论缺陷：锁导致线程阻塞、上下文切换、优先级反转、死锁风险，以及最严重的缓存一致性流量爆炸（Cache Coherence Traffic）。

锁自由（Lock-Free）和无等待（Wait-Free）数据结构是并发编程的理论巅峰，它们保证在任意调度下系统整体进度（System-Wide Progress），彻底消除阻塞。典型场景下，锁自由结构可比细粒度锁快 5～100 倍，无等待结构在高争用下可达 1000 倍以上加速。

本章将深入探讨锁自由/无等待的理论基础、进度条件（Progress Conditions）、线性化点（Linearization Points）、ABA 问题解决策略、通用构造方法（如 Hazard Pointer、RCU、Harris-Michael 链表），以及现代硬件原语（CAS、LL/SC、HTM）的理论模型。

#### 7.2 并发进度条件的严格理论定义

Maurice Herlihy 在 1991 年提出三层进度条件：

1. **Obstruction-Free**：单个线程孤立运行时终将完成操作。最弱条件，实现最简单。
2. **Lock-Free**：系统整体终将有某个线程完成操作。至少保证系统进度，无饥饿。
3. **Wait-Free**：每个线程在有限步内完成操作。最强条件，最难实现，但延迟有界。

数学模型：Lock-Free 保证全局进度，复杂度通常 O(n) 最坏情况；Wait-Free 保证个体进度，最坏情况独立于争用线程数。

性能权衡：Wait-Free > Lock-Free > Fine-Grained Locking > Coarse-Grained Locking。

#### 7.3 锁的理论缺陷深度剖析

- **阻塞开销**：线程睡眠 → 上下文切换 ≈ 数千 cycles
- **convoy 效应**：醒来线程重新争用锁，形成队列
- **缓存失效风暴**：锁释放时，所有等待线程的缓存行同时失效（Thundering Herd）
- **不公平性**：可能导致饥饿

理论模型：在 64 核系统高争用下，std::mutex 吞吐量随核数增加反而下降（MESI 协议开销主导）。

#### 7.4 原子原语的理论基础

现代 CPU 提供：
- Compare-And-Swap (CAS)：bool cas(T* addr, T expected, T desired)
- Load-Link/Store-Conditional (LL/SC)：ARM 等架构
- Double-Word CAS (DCAS)：部分硬件支持
- Transactional Memory (HTM)：Intel TSX、IBM Power

CAS 是锁自由构造的核心。理论上，CAS 是通用原语（Consensus Number ∞），可实现任意并发对象。

#### 7.5 ABA 问题的理论本质与解决策略

ABA：线程 A 读值 X → 被抢占 → 其他线程改 X→Y→再改回 X → A 用过时 X 做 CAS 成功，导致逻辑错误。

经典案例：链表删除节点。

解决方案理论：
1. **带标签的 CAS**（版本计数器）：128 位 CAS（x86 cmpxchg16b）
2. **Hazard Pointer**：线程公布将访问指针，其他线程延迟回收
3. **Read-Copy-Update (RCU)**：读侧无锁，写侧复制新版本，优雅期后回收
4. **垃圾回收辅助**：如 Rust 的 Arc，或 epoch-based reclamation

#### 7.6 经典锁自由数据结构理论剖析

1. **Harris-Michael 链表**  
   标记删除位 + CAS 物理删除。线性化点在成功 CAS 时。Lock-Free。

2. **Treiber 栈**  
   CAS 顶指针。简单经典 Lock-Free 栈。

3. **M&S 队列**（Michael-Scott Queue）  
   双指针（head/tail）无界队列。入队/出队均 Lock-Free。

4. **Dining Philosophers 无等待解决方案**  
   使用 Wait-Free 寄存器构造。

#### 7.7 通用 Wait-Free 构造理论

Herlihy 的 Universal Construction：使用共识对象（如 multi-word CAS）模拟任意顺序对象为 Wait-Free。

现代简化：Kogan-Petrank 算法，使用 Fast-Path-Slow-Path 模式，多数情况 Lock-Free，少数帮助机制升级为 Wait-Free。

#### 7.8 硬件事务内存（HTM）的理论模型

Intel Restricted Transactional Memory (RTM)：xbegin/xend。

理论优势：投机执行，冲突回滚。最佳情况零开销。

局限：容量有限（L1 大小）、不可预测回滚。

混合策略：HTM 主路径 + Lock-Free 回退路径。

#### 7.9 真实世界理论案例

- Facebook F14 HashMap：Lock-Free + Hazard Pointer，QPS 比 folly::AtomicHashMap 高 3～5 倍
- Java ConcurrentLinkedQueue：M&S 队列变体
- Linux 内核 RCU：读侧零锁，实时系统延迟降低 90%
- Redis：单线程但内部使用 Lock-Free 结构优化

#### 7.10 设计锁自由结构的理论原则

1. 操作分解为小 CAS 序列
2. 帮助机制（Helping）：慢线程被快线程帮助完成
3. 内存回收延迟化
4. 线性化点明确定义，便于形式验证

#### 7.11 小结

锁自由与无等待代表了并发编程的理论极限：系统在任意争用下保持高吞吐与低延迟。掌握其理论，能让你设计出在大规模多核系统上线性扩展的数据结构，是高并发服务器、实时系统、数据库内核工程师的必备素养。

#### 7.12 参考资料与资源

### 7.12.1 官方与经典PDF资料
以下是关于锁自由（Lock-Free）和无等待（Wait-Free）并发数据结构、进度条件、ABA问题、Hazard Pointer、RCU、Harris-Michael链表、Treiber栈、Michael-Scott队列以及硬件事务内存（HTM）的推荐PDF文档和技术论文。这些资源从理论定义、证明到实际实现，帮助你深入掌握本章并发模型的理论极限。

- **Wait-Free Synchronization**：Maurice Herlihy 1991 年经典论文，严格定义Obstruction-Free、Lock-Free和Wait-Free进度条件，并证明CAS的通用性。
  - 下载链接: https://cs.brown.edu/~mph/Herlihy91/p124-herlihy.pdf

- **A Pragmatic Implementation of Non-Blocking Linked-Lists**：Timothy L. Harris 2001 年论文，提出Harris锁自由链表（标记删除位），解决ABA问题的前身。
  - 下载链接: https://www.cl.cam.ac.uk/research/srg/netos/papers/2001-caslists.pdf

- **Simple, Fast, and Practical Non-Blocking and Blocking Concurrent Queue Algorithms**：Maged M. Michael 和 Michael L. Scott 1996 年论文，提出经典Lock-Free M&S队列。
  - 下载链接: https://www.cs.rochester.edu/u/scott/papers/1996_PODC_queues.pdf

- **Hazard Pointers: Safe Memory Reclamation for Lock-Free Objects**：Maged M. Michael 2004 年论文，提出Hazard Pointers解决内存回收和ABA问题。
  - 下载链接: https://www.cs.otago.ac.nz/cosc440/readings/hazard-pointers.pdf

- **User-Level Implementations of Read-Copy Update**：Mathieu Desnoyers 等 2012 年论文，用户空间RCU实现，读侧零锁。
  - 下载链接: https://www.efficios.com/pub/rcu/urcu-main.pdf

- **Transactional Memory: Architectural Support for Lock-Free Data Structures**：Maurice Herlihy 和 J. Eliot B. Moss 1993 年论文，提出硬件事务内存（HTM）概念。
  - 下载链接: (经典论文，可搜索ISCA 1993)

这些PDF免费下载。建议从Herlihy 1991开始，建立进度条件理论基础，再阅读具体结构论文。

### 7.12.2 GitHub代码仓库与示例
以下开源仓库包含锁自由/无等待数据结构的完整实现、基准测试和内存回收方案（如Hazard Pointers、RCU）。这些代码多为C++，涵盖栈、队列、链表、哈希表等，可直接运行验证本章性能模型。

- **concurrencykit/ck**：Concurrency Kit官方仓库，高性能并发原语、锁自由栈/队列/链表、Hazard Pointers和Epoch-based回收。
  - 仓库链接: https://github.com/concurrencykit/ck
  - 亮点: 生产级实现，支持多种内存回收，基准测试齐全。

- **DNedic/lockfree**：标准C++11锁自由数据结构集合，包括栈、队列、链表，支持有界/无界。
  - 仓库链接: https://github.com/DNedic/lockfree
  - 亮点: 纯C++11，无外部依赖，易于集成。

- **rigtorp/awesome-lockfree**：锁自由/无等待编程资源精选，包括Boost.Lockfree、libcds等库链接。
  - 仓库链接: https://github.com/rigtorp/awesome-lockfree
  - 亮点: 一站式资源列表，包含SPSC/MPMC队列、栈实现。

- **khizmax/libcds**：C++并发数据结构库，包含Michael哈希表、Feldman Wait-Free哈希、Harris/Michael链表。
  - 仓库链接: https://github.com/khizmax/libcds
  - 亮点: 多种锁自由/细粒度锁实现，支持迭代器。

- **cameron314/concurrentqueue**：单生产者/多消费者锁自由队列（M&S变体），高性能。
  - 仓库链接: https://github.com/cameron314/concurrentqueue
  - 亮点: Moodycamel出品，广泛用于生产环境。

这些仓库支持C++11/17/20，CMake构建。推荐克隆后运行基准，对比锁 vs 锁自由在高争用下的5～100倍加速。

### 7.12.3 学习建议
- **入门**：阅读Herlihy 1991 PDF，运行concurrencykit/ck的栈/队列示例。
- **进阶**：实现Harris链表（参考DNedic仓库），结合Hazard Pointers解决内存回收。
- **极致优化**：研究libcds的Wait-Free哈希，测试RCU读侧零锁优势。
- **验证**：使用awesome-lockfree列表扩展，测量线性化点和ABA处理开销。

通过这些资源，你将能设计在大规模多核系统上线性扩展的并发结构。如果需要特定结构的扩展代码或基准，请提供细节！


