#### 9.1 引言：二进制优化的理论层次与反馈驱动编译

传统编译器优化局限于单翻译单元，而现代二进制优化利用运行时 profile 数据反馈指导全局优化。PGO（Profile-Guided Optimization）、LTO（Link-Time Optimization）、BOLT（Binary Optimization and Layout Tool）构成终极三连，可榨干最后 5%～30% 性能。

本章深入探讨反馈驱动优化的理论模型、热点偏差、布局优化、信息论基础，以及三大工具的协同机理。

#### 9.2 PGO 的理论基础

PGO 分两阶段：
1. Instrumentation 编译，运行代表性负载收集分支/调用频率
2. 使用 profile 数据重新编译

优化类型：
- 热点内联（高频调用函数强制内联）
- 分支预测布局（hot path 放 if，cold path 放 else）
- 值预测（Value Profiling）

理论模型：基于马尔可夫链的控制流图，最大化热点路径缓存对齐与分支预测命中。

实测收益：SPEC CPU 2017 中 PGO 平均提升 10%～25%。

#### 9.3 LTO 的理论机制

链接时优化，跨翻译单元内联、死代码消除、常量传播。

ThinLTO：并行化权衡。

理论优势：打破 .o 文件边界，实现全程序视角。

#### 9.4 BOLT 的理论创新

Facebook 2021 开源 BOLT（Binary Optimization and Layout Tool）。

核心思想：后链接阶段重排函数/基本块布局。

理论基础：
- 函数重排：相同调用者/被调用者相邻，改善 I-Cache 命中
- 基本块重排：热点路径线性化
- 巨型基本块（Huge Pages）映射

信息论视角：最小化指令 fetch entropy。

实测：MySQL + BOLT 提升 15%～20%，Redis 提升 10%。

#### 9.5 三者协同理论流程

终极流：
1. -O3 -flto -fprofile-generate 编译 → 运行训练负载
2. -fprofile-use 重新编译 + ThinLTO
3. 生成最终二进制 → BOLT 应用 profile 重排

理论叠加：PGO ≈15%、LTO ≈10%、BOLT ≈15%，总计 1.2～3 倍。

#### 9.6 Profile 数据质量的理论要求

代表性：覆盖主要路径、负载分布。

多样性：避免过拟合单一输入。

#### 9.7 小结

PGO + LTO + BOLT 代表了反馈驱动二进制优化的理论巅峰，是榨干最后性能的必备手段。
