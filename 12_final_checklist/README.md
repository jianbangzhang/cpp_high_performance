#### 12.1 引言：上线前检查的理论重要性与风险模型

上线前 checklist 是防止性能翻车的最后防线。基于 Murphy 定律（凡是可能出错的事必会出错），系统性检查可覆盖 90%+ 潜在问题。

本章列出 27 条终极 checklist，每条偏重理论解释：为什么检查、潜在风险模型、如何验证、量化阈值。适用于所有项目，防止从微小疏忽导致灾难性崩溃。

#### 12.2 Checklist 分类理论

分三类：
- **编译构建**：旗标、优化一致性
- **运行时验证**：基准、负载测试
- **监控部署**：异常捕获、回滚机制

风险模型：故障树分析（FTA），每条检查降低特定分支概率。

#### 12.3 27 条 Checklist 详解

1. **编译旗标一致性**：确保 release 构建用 -O3 -march=native 等。风险：debug 旗标上线，性能降 10×。验证：cmake --build . --config Release。

2. **LTO/PGO 启用**：检查是否应用。风险：未内联热点。阈值：构建时间增加 <2×。

3. **数据布局审计**：审视热点结构是否 SoA。风险：缓存 Miss 率 >20%。

4. **SIMD 覆盖率**：godbolt 检查自动向量化。风险：未用 AVX，性能降 4×。

5. **内存分配器替换**：用 tcmalloc/jemalloc。风险：默认 malloc 碎片 >50%。

6. **锁使用审计**：最小化 mutex，用锁自由替代。风险：争用下吞吐降 100×。

7. **constexpr 覆盖**：热点配置 constexpr。风险：运行时解析开销。

8. **热点剖析**：perf/VTune 跑基准。阈值：Top 热点 <10% 时间。

9. **基准测试套件**：覆盖典型/最坏负载。风险：生产不符测试。

10. **内存泄漏检查**：valgrind/ASan。阈值：零泄漏。

11. **线程安全验证**：TSan 检测数据竞争。

12. **浮点一致性**：检查 -ffast-math 后数值稳定。

13. **代码覆盖率**：gcov >80%。

14. **压力测试**：模拟峰值负载。阈值：无崩溃。

15. **缓存预热**：基准前热身循环。

16. **I/O 优化**：异步/零拷贝。

17. **网络延迟模拟**：tc 工具加延迟。

18. **异常处理覆盖**：try-catch 审计。

19. **日志级别**：release 用 ERROR 以上。

20. **依赖版本锁**：固定第三方库版本。

21. **跨平台测试**：x86/ARM。

22. **安全审计**：buffer overflow 等。

23. **回滚计划**：A/B 测试部署。

24. **监控集成**：Prometheus/Grafana。

25. **文档更新**：性能指标入 doc。

26. **同行审阅**：至少两人审核优化。

27. **最终基准比较**：前后版本 diff >预期加速。

#### 12.4 实施 checklist 的理论流程

PDCA 循环：Plan（规划检查）、Do（执行）、Check（验证）、Act（修复）。

自动化：集成到 CI/CD。

#### 12.5 小结

这 27 条 checklist 是经验的理论结晶，严格执行可将上线风险降至最低，防止翻车。


#### 12.6 参考资料与资源

### 12.6.1 GitHub代码仓库与示例
以下开源仓库包含性能检查清单脚本、CI/CD 自动化配置、性能测试框架以及生产监控集成示例，帮助你将本章 checklist 自动化落地。

- **google/sre-checklists**：Google SRE 官方检查清单集合，涵盖 Incident Response、Post-Mortem、Launch Checklist 等。
  - 仓库链接: https://github.com/google/sre-checklists
  - 亮点: 生产就绪审查模板，可直接扩展成本章 checklist。

- **joelparkerhenderson/performance-checklist**：系统性性能优化 checklist，涵盖编译旗标、SIMD、内存分配器、剖析工具等。
  - 仓库链接: https://github.com/joelparkerhenderson/performance-checklist
  - 亮点: 与本章高度重合，包含验证脚本示例。

- **google/benchmark** + **catch2/catch2**：Google Benchmark + Catch2 组合，用于构建基准测试套件，支持 CI 集成。
  - 仓库链接: https://github.com/google/benchmark & https://github.com/catch2/Catch2
  - 亮点: 自动化基准比较（前后版本 diff）。

- **valgrind/valgrind** & **google/sanitizers**：Valgrind/ASan/TSan 官方仓库，用于内存泄漏、数据竞争检测。
  - 仓库链接: https://github.com/valgrind/valgrind & https://github.com/google/sanitizers
  - 亮点: CI 中集成脚本示例。

- **prometheus/prometheus**：Prometheus 官方仓库，生产监控集成首选。
  - 仓库链接: https://github.com/prometheus/prometheus
  - 亮点: Grafana 仪表盘 + Alertmanager 配置。

这些仓库支持 CI/CD 集成（GitHub Actions、GitLab CI）。推荐将 joelparkerhenderson/performance-checklist 与 google/sre-checklists 合并，构建自动化脚本。

### 12.6.2 学习建议
- **入门**：阅读Google SRE Book，复制 sre-checklists 模板扩展成本章 27 条。
- **进阶**：在 CI 中集成 Google Benchmark + Sanitizers，实现自动化基准与泄漏检查。
- **极致落地**：结合Prometheus + Grafana，实现上线后监控与回滚阈值警报。
- **自动化**：使用 GitHub Actions 脚本强制执行 checklist，失败即阻断部署。

通过这些资源，你将把本章 checklist 从理论转化为生产级防线，彻底防止性能翻车。如果需要特定条目的自动化脚本或扩展 checklist，请提供细节！
