# jemalloc设计

📦 **GitHub 仓库（官方、可读源码）**
🔗 **[jemalloc/jemalloc GitHub 仓库（源码主仓库）](https://github.com/jemalloc/jemalloc?utm_source=chatgpt.com)** — jemalloc 是通用的 malloc(3) 内存分配器，实现注重**减少内存碎片与可扩展并发支持**。最新归档至只读，但源码仍然是最权威的阅读与分析对象。([GitHub][1])

---

## **📘 jemalloc 源码解析：总体架构与核心设计**

jemalloc 的源码设计极富工程性，它把内存分配从“全局堆 + 简单策略”提升到**多层、分级、最小锁竞争的高性能内存分配器**。总体结构主要包括以下部分：

---

## **1️⃣ 目标与背景**

**目标设计**：

* **高并发性能**：通过分配区（arenas）和线程缓存减少锁竞争。
* **低碎片**：通过 size classes、runs/chunks、精细内存管理减少内存浪费。
* **可调优与监控**：提供配置、统计、调试钩子。

jemalloc 最初由 Jason Evans 于 2005 年开发，在 FreeBSD 的 libc 中成为默认 malloc 实现，并广泛用于 **Firefox、Redis、Rust 等** 项目中。([知乎专栏][2])

---

## **2️⃣ 内存分配的基本单位**

### **Chunk（大块内存）**

jemalloc 从操作系统以固定大小的块（**chunk**，默认多为 2 MiB）来管理虚拟内存。
底层使用 **`mmap()` / `munmap()` / `madvise()` 等系统调用** 来请求与释放内存，chunk 是 allocator 的基本大单位（即 arena 管理的基本对象）。([我叫尤加利][3])

每个 chunk 的元数据通过结构体（如 `extent_node_t`）来记录，这些元数据指示 chunk 的当前状态（已用/未用/部分使用）。

### **Run / Region / Bin / Size Classes**

* **Size Class**：针对 small allocations（比如 8 B、16 B、32 B 等）和 large allocations（页为单位的较大块）有不同的分类。
* **Run**：一个 chunk 通常划分成多个 run，它含有多个固定大小的 region（可分配块）。
* **Bin**：同一种 size class 对应一个 bin ，管理所有可用的 run。
* **Region**：真正返回给用户的可用内存块。

这种层次结构有：

```
Arena
 ├── ChunkList (chunks)
 │    ├── Run (对应 size classes)
 │    │    ├── Regions
 │    │    └── Bitmap 管理空闲/已分配区
 │    └── 元数据
```

jemalloc 采用这种层次化分配，使 small size requests 在 O(1) 时间内完成，并减少碎片。([OWenT][4])

---

## **3️⃣ Arena：并发与线程本地策略**

### **线程分配区（Arena）**

相比 glibc 默认 malloc 的 “单堆 + 全局锁”，jemalloc 引入 **多个 Arena**：

* 每个线程在第一次分配时随机或轮转地被分配一个 Arena。
* 线程后续的分配操作就在该 Arena 中进行，无需全局锁。

这极大提升多线程环境下 malloc/free 的并发性能。
由于 Arena 之间隔离线程分配上下文，锁争用下降，吞吐量提升。([OWenT][4])

### **线程缓存（Thread Cache / tcache）**

为了进一步减少从 arena 取内存的开销，jemalloc 维护了 **线程本地缓存**，类似于 tcmalloc 的设计，但整合到自身架构中。

线程缓存的作用：

* 缓存小尺寸分配对象，避免与 arena 锁竞争。
* 垃圾回收：当线程缓存过多未使用内存时，会被回收回 arena。

---

## **4️⃣ Small vs Large vs Huge 分配**

jemalloc 内部分配策略按大小分类：

| 类型        | 描述                           | 管理方式                 |
| --------- | ---------------------------- | -------------------- |
| **small** | 小于某个阈值的 frequent allocations | bins + runs + bitmap |
| **large** | 介于 small 和 huge 之间           | 页级别分配                |
| **huge**  | 极大块内存                        | 直接通过 chunk 分配        |

其中 small allocation 使用 bins + run bitmap 结构，提供了**快速常数时间**分配与回收。([OWenT][4])

---

## **5️⃣ Metadata 获取与常数时间操作**

jemalloc 设计了**元数据映射机制**来在常数时间里获取分配块的元信息（如某个 region 属于哪个 run）。
这种设计避免了昂贵的遍历过程，是它高性能的关键之一。([我叫尤加利][3])

---

## **6️⃣ 线程安全与锁机制**

虽然 arena 减少了争用，但仍需要锁来保护元数据。
为了减少锁粒度，jemalloc 采取：

* 对每个 size class 的 bin 加独立锁，而不是对整个 heap 加锁。
* 线程本地缓存大幅减少对这些锁的需求。

这种细粒度的锁设计降低线程竞争，是其相对于 ptmalloc 的优势。([OWenT][4])

---

## **7️⃣ 垃圾页（dirty/clean）回收机制**

为了减少碎片与内核占用，jemalloc 引入 **dirty/clean 区域**管理：

* **Clean**：未曾初始化或未写入的页，可直接分配。
* **Dirty**：已写过的页，可能需要 purge 回收（如 `madvise(MADV_DONTNEED)`）。

优先尝试从 dirty 区查找可用块，减缓对 OS 的系统调用压力。([OWenT][4])

---

## **8️⃣ 给开发者的 introspection 接口**

jemalloc 还提供丰富的运行时 introspection / 控制接口：

* `mallctl()` / `je_mallctl()`：运行时获取统计、调参。
* heap profiling、碎片分析工具支持。

这些是 jemalloc 强于其他 allocator 的额外功能。([GitHub][5])

---

## **📚 推荐学习视频与资料**

📖 jemalloc 官方 Wiki（含背景、配置与使用介绍）：
🔗 **[jemalloc Wiki（配置与使用指南）](https://github.com/jemalloc/jemalloc/wiki?utm_source=chatgpt.com)**

📄 jemalloc 源码与原理分析（中文笔记，含 page/chunk/arena/run/bins 等章节）：
🔗 **[jemalloc 源码分析详解（youjiali1995）](https://youjiali1995.github.io/allocator/jemalloc/?utm_source=chatgpt.com)**

📌 这些资料配合源码仓库阅读，可以帮助你理解 jemalloc 的内部设计与实现原理。

---

## **小结：jemalloc 实现关键点**

| 特性    | 实现机制                   | 效果                     |
| ----- | ---------------------- | ---------------------- |
| 高并发   | Arena + 线程缓存           | 锁竞争小                   |
| 低碎片   | size class + run + bin | 内存利用更好                 |
| 快速分配  | 常数时间结构 + bitmap        | 常见 small allocation 迅速 |
| 可观察性  | mallctl + profiling    | 可调优 & 分析               |
| 跨平台支持 | mmap + extent 管理       | 支持大内存场景                |

jemalloc 核心源码结构的理解对于高性能内存管理、操作系统内核内存子系统、数据库与高并发服务的性能调优至关重要。

---


[1]: https://github.com/jemalloc/jemalloc?utm_source=chatgpt.com "jemalloc/jemalloc"
[2]: https://zhuanlan.zhihu.com/p/642471269?utm_source=chatgpt.com "内存管理特性分析（十五）:内存分配器之jemalloc技术原理分析- 知乎"
[3]: https://youjiali1995.github.io/allocator/jemalloc/?utm_source=chatgpt.com "jemalloc 源码分析 - 我叫尤加利"
[4]: https://owent.net/2013/867.html?utm_source=chatgpt.com "ptmalloc,tcmalloc和jemalloc内存分配策略研究 - I'm OWenT"
[5]: https://github.com/jemalloc/jemalloc/wiki/getting-started?utm_source=chatgpt.com "Getting Started · jemalloc/jemalloc Wiki"
