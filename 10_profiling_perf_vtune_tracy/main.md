# Chapter 10: 热点分析神器完全指南 🔍

> **目标**: 掌握 perf、VTune、Tracy 等工具，找到 100× 优化机会

## 📋 目录

- [perf: Linux 性能分析利器](#perf-linux-性能分析利器)
- [Intel VTune Profiler](#intel-vtune-profiler)
- [Tracy Profiler: 实时性能分析](#tracy-profiler-实时性能分析)
- [其他工具](#其他工具)
- [综合案例](#综合案例)

---

## perf: Linux 性能分析利器

### 安装 perf

```bash
# Ubuntu/Debian
sudo apt-get install linux-tools-common linux-tools-generic

# CentOS/RHEL
sudo yum install perf

# Arch Linux
sudo pacman -S perf

# 验证安装
perf --version
```

### 基础用法

#### 1. perf stat - 统计性能计数器

```bash
# 基础统计
perf stat ./your_program

# 示例输出:
# Performance counter stats for './your_program':
#
#       1,234.56 msec task-clock                #    0.999 CPUs utilized          
#              12      context-switches          #    9.722 K/sec                  
#               0      cpu-migrations            #    0.000 K/sec                  
#           1,234      page-faults               #    0.999 M/sec                  
#   5,123,456,789      cycles                    #    4.150 GHz                    
#   3,456,789,012      instructions              #    0.67  insn per cycle         
#     789,012,345      branches                  #  639.234 M/sec                  
#      12,345,678      branch-misses             #    1.56% of all branches        
#
#       1.235678901 seconds time elapsed
```

#### 2. 详细的性能计数器

```bash
# CPU 周期和指令
perf stat -e cycles,instructions,branches,branch-misses ./program

# 缓存性能
perf stat -e cache-references,cache-misses,L1-dcache-loads,L1-dcache-load-misses ./program

# 完整的缓存层次
perf stat -e L1-dcache-loads,L1-dcache-load-misses,\
             LLC-loads,LLC-load-misses,\
             dTLB-loads,dTLB-load-misses ./program

# 前端与后端停顿
perf stat -e cpu-cycles,stalled-cycles-frontend,stalled-cycles-backend ./program

# 内存带宽
perf stat -e cpu/event=0xd1,umask=0x01/,cpu/event=0xd1,umask=0x02/ ./program
```

#### 3. perf record - 采样分析

```bash
# 基础采样（默认采样 cycles）
perf record ./program

# 指定采样频率
perf record -F 997 ./program  # 997 Hz (避免周期性偏差)

# 采样特定事件
perf record -e cache-misses ./program

# 采样调用图
perf record -g ./program

# 采样所有 CPU
perf record -a ./program

# 查看采样结果
perf report

# 交互式报告（推荐）
perf report -i perf.data
```

#### 4. perf report - 分析结果

```bash
# 默认查看
perf report

# 按调用者排序
perf report --sort=parent

# 显示源代码
perf report --stdio

# 生成调用图
perf report --stdio -g

# 导出为文本
perf report --stdio > report.txt

# 查看汇编代码
perf annotate <function_name>
```

#### 5. 火焰图生成

```bash
# 安装火焰图工具
git clone https://github.com/brendangregg/FlameGraph.git
cd FlameGraph

# 采样数据
perf record -F 99 -a -g -- sleep 60

# 生成火焰图
perf script | ./stackcollapse-perf.pl | ./flamegraph.pl > flame.svg

# 在浏览器中打开
firefox flame.svg
```

### 高级用法

#### 缓存未命中分析

```bash
# L1 缓存
perf stat -e L1-dcache-loads,L1-dcache-load-misses ./program

# 计算未命中率
# Miss Rate = L1-dcache-load-misses / L1-dcache-loads

# 详细分析
perf record -e mem:0x<address>:rw ./program
perf report
```

#### 分支预测分析

```bash
# 采样分支未命中
perf record -e branch-misses ./program

# 查看分支统计
perf stat -e branches,branch-misses ./program

# 分支预测准确率 = 1 - (branch-misses / branches)
```

#### CPU 前端与后端分析

```bash
# 前端停顿（指令获取）
perf stat -e stalled-cycles-frontend ./program

# 后端停顿（执行单元）
perf stat -e stalled-cycles-backend ./program

# 详细的流水线分析
perf stat -e cycles,instructions,\
             stalled-cycles-frontend,stalled-cycles-backend,\
             resource_stalls.any ./program
```

### 实战示例

```cpp
// hotspot_example.cpp
#include <vector>
#include <algorithm>

void hot_function() {
    std::vector<int> data(1000000);
    for (int i = 0; i < 1000; ++i) {
        std::sort(data.begin(), data.end());
    }
}

void cold_function() {
    int sum = 0;
    for (int i = 0; i < 100; ++i) {
        sum += i;
    }
}

int main() {
    for (int i = 0; i < 100; ++i) {
        hot_function();  // 99% 的时间
        cold_function(); // 1% 的时间
    }
    return 0;
}
```

```bash
# 编译
g++ -std=c++20 -O2 -g hotspot_example.cpp -o hotspot

# 性能分析
perf record -g ./hotspot

# 查看报告
perf report

# 预期输出（简化）:
# 99.00%  hotspot  [.] hot_function
#  0.80%  hotspot  [.] std::sort
#  0.20%  hotspot  [.] cold_function
```

---

## Intel VTune Profiler

### 安装

```bash
# 下载并安装 Intel oneAPI
# https://www.intel.com/content/www/us/en/developer/tools/oneapi/vtune-profiler.html

# 或使用独立版本
wget https://registrationcenter-download.intel.com/akdlm/irc_nas/...
sudo sh ./vtune_installer.sh

# 验证
vtune --version
```

### 基础用法

#### 1. Hotspot Analysis（热点分析）

```bash
# 命令行模式
vtune -collect hotspots -result-dir ./vtune_results -- ./your_program

# 查看结果
vtune -report hotspots -result-dir ./vtune_results

# 导出为 CSV
vtune -report hotspots -format csv -result-dir ./vtune_results > hotspots.csv
```

#### 2. Microarchitecture Analysis（微架构分析）

```bash
# 采集微架构数据
vtune -collect uarch-exploration -result-dir ./vtune_uarch -- ./program

# 查看关键指标
vtune -report summary -result-dir ./vtune_uarch

# 示例输出:
# Clockticks:                    100.0
# CPI Rate:                      1.2      (理想值: < 1.0)
# Front-End Bound:               15%      (目标: < 20%)
# Back-End Bound:                45%      (目标: < 50%)
# Retiring:                      30%      (目标: > 50%)
# Bad Speculation:               10%      (目标: < 10%)
```

#### 3. Memory Access Analysis（内存访问分析）

```bash
# 内存访问分析
vtune -collect memory-access -result-dir ./vtune_memory -- ./program

# NUMA 分析
vtune -collect memory-access -knob analyze-mem-objects=true \
      -result-dir ./vtune_numa -- ./program

# 查看 NUMA 统计
vtune -report summary -result-dir ./vtune_numa
```

#### 4. Threading Analysis（线程分析）

```bash
# 线程性能分析
vtune -collect threading -result-dir ./vtune_threading -- ./program

# 查看线程利用率
vtune -report summary -result-dir ./vtune_threading

# 锁争用分析
vtune -collect threading -knob analyze-locks=true \
      -result-dir ./vtune_locks -- ./program
```

### GUI 模式

```bash
# 启动 VTune GUI
vtune-gui

# 或者打开已有结果
vtune-gui ./vtune_results/vtune_results.vtune
```

### 关键指标解读

| 指标 | 目标值 | 说明 |
|------|--------|------|
| CPI (Cycles Per Instruction) | < 1.0 | 每条指令的平均周期数 |
| Front-End Bound | < 20% | 指令获取瓶颈 |
| Back-End Bound | < 50% | 执行单元瓶颈 |
| Retiring | > 50% | 有效完成的指令 |
| Bad Speculation | < 10% | 分支预测错误 |
| L1 Cache Hit Rate | > 95% | L1 缓存命中率 |
| L3 Cache Hit Rate | > 80% | L3 缓存命中率 |
| Memory Bandwidth | 接近峰值 | 内存带宽利用率 |

---

## Tracy Profiler: 实时性能分析

### 安装

```bash
# 克隆仓库
git clone https://github.com/wolfpld/tracy.git
cd tracy

# 构建服务器（查看器）
cd profiler/build/unix
make release
./Tracy-release

# 构建客户端库
cd ../../../
mkdir build && cd build
cmake ..
make
```

### 集成到项目

```cpp
// your_project.cpp
#include "Tracy.hpp"

void expensive_function() {
    ZoneScoped;  // 自动追踪这个函数
    
    // 你的代码
    for (int i = 0; i < 1000000; ++i) {
        // ...
    }
}

void another_function() {
    ZoneScopedN("CustomName");  // 自定义名称
    
    {
        ZoneScopedN("Inner Loop");
        for (int i = 0; i < 100; ++i) {
            // ...
        }
    }
}

int main() {
    ZoneScoped;
    
    for (int frame = 0; frame < 1000; ++frame) {
        FrameMark;  // 标记帧边界（游戏/渲染）
        
        expensive_function();
        another_function();
    }
    
    return 0;
}
```

### 编译配置

```cmake
# CMakeLists.txt
find_package(Tracy REQUIRED)

add_executable(your_program your_project.cpp)
target_link_libraries(your_program PRIVATE Tracy::TracyClient)

# 启用 Tracy
target_compile_definitions(your_program PRIVATE TRACY_ENABLE)
```

### 使用 Tracy

1. 启动 Tracy 服务器（查看器）
2. 运行你的程序（自动连接）
3. 实时查看性能数据

### Tracy 的优势

- ✅ **实时分析**: 无需等待程序结束
- ✅ **低开销**: < 1% 性能影响
- ✅ **帧分析**: 完美适配游戏/渲染
- ✅ **内存追踪**: 跟踪内存分配
- ✅ **GPU 分析**: 支持 OpenGL/Vulkan/DirectX

---

## 其他工具

### 1. gprof (GNU Profiler)

```bash
# 编译时启用 profiling
g++ -pg program.cpp -o program

# 运行程序
./program

# 生成 gmon.out
# 查看报告
gprof program gmon.out > analysis.txt
```

**优点**: 内置，简单  
**缺点**: 开销大，不支持现代特性

### 2. Valgrind (Callgrind)

```bash
# 运行 Callgrind
valgrind --tool=callgrind ./program

# 生成 callgrind.out.<pid>
# 可视化（需要 KCachegrind）
kcachegrind callgrind.out.<pid>
```

**优点**: 详细的调用图  
**缺点**: 非常慢（10-50× 减速）

### 3. Google Profiler (gperftools)

```bash
# 安装
sudo apt-get install google-perftools libgoogle-perftools-dev

# CPU Profiling
LD_PRELOAD=/usr/lib/libprofiler.so CPUPROFILE=prof.out ./program
pprof --text ./program prof.out

# Heap Profiling
LD_PRELOAD=/usr/lib/libtcmalloc.so HEAPPROFILE=heap.out ./program
pprof --text ./program heap.out.0001.heap
```

### 4. Instruments (macOS)

```bash
# 从 Xcode 启动
# Xcode -> Open Developer Tool -> Instruments

# 或命令行
instruments -t "Time Profiler" ./program
```

---

## 综合案例：完整的性能优化流程

### 案例：优化数据处理管道

```cpp
// data_pipeline.cpp
#include <vector>
#include <algorithm>
#include <numeric>
#include <iostream>

struct DataRecord {
    int id;
    double value;
    std::string category;
};

// 版本 1: 未优化
double process_data_v1(const std::vector<DataRecord>& data) {
    std::vector<DataRecord> filtered;
    
    // 过滤
    for (const auto& record : data) {
        if (record.value > 100.0) {
            filtered.push_back(record);
        }
    }
    
    // 排序
    std::sort(filtered.begin(), filtered.end(),
        [](const auto& a, const auto& b) { return a.value < b.value; });
    
    // 计算总和
    double sum = 0.0;
    for (const auto& record : filtered) {
        sum += record.value;
    }
    
    return sum;
}

int main() {
    std::vector<DataRecord> data(1000000);
    // 初始化数据...
    
    for (int i = 0; i < 100; ++i) {
        double result = process_data_v1(data);
    }
    
    return 0;
}
```

### Step 1: 使用 perf 找出热点

```bash
# 编译
g++ -std=c++20 -O2 -g data_pipeline.cpp -o pipeline

# 分析
perf record -g ./pipeline
perf report

# 发现：
# 60% 时间在 std::sort
# 20% 时间在 vector::push_back
# 15% 时间在内存分配
```

### Step 2: 使用 VTune 分析微架构

```bash
vtune -collect uarch-exploration -result-dir vtune_results -- ./pipeline
vtune -report summary -result-dir vtune_results

# 发现：
# - Back-End Bound: 65% (内存瓶颈)
# - L3 Cache Miss Rate: 25% (缓存未命中严重)
# - Memory Bandwidth: 仅 30% 利用率
```

### Step 3: 优化版本

```cpp
// 版本 2: 优化后
double process_data_v2(const std::vector<DataRecord>& data) {
    std::vector<DataRecord> filtered;
    filtered.reserve(data.size() / 2);  // 预分配
    
    // 使用 copy_if 替代手动循环
    std::copy_if(data.begin(), data.end(), std::back_inserter(filtered),
        [](const auto& r) { return r.value > 100.0; });
    
    // 并行排序
    std::sort(std::execution::par_unseq, 
              filtered.begin(), filtered.end(),
              [](const auto& a, const auto& b) { return a.value < b.value; });
    
    // 使用 accumulate
    return std::accumulate(filtered.begin(), filtered.end(), 0.0,
        [](double sum, const auto& r) { return sum + r.value; });
}
```

### Step 4: 验证优化效果

```bash
# 重新分析
perf stat -e cycles,instructions,cache-misses,branches,branch-misses \
    ./pipeline_v2

# 对比结果:
# v1: 2.5 seconds, 45% cache miss rate
# v2: 0.8 seconds, 12% cache miss rate
# 加速比: 3.1x
```

---

## 🎯 性能分析 Checklist

- [ ] **确定目标**: 延迟 or 吞吐量？
- [ ] **建立基准**: 测量当前性能
- [ ] **找出热点**: 使用 perf/VTune
- [ ] **分析原因**: 缓存？分支？内存？
- [ ] **针对优化**: 具体问题具体解决
- [ ] **验证效果**: 重新测量
- [ ] **回归测试**: 确保正确性
- [ ] **持续监控**: 防止性能退化

## 📚 推荐资源

- [Brendan Gregg's Blog](http://www.brendangregg.com/perf.html)
- [Intel VTune Documentation](https://www.intel.com/content/www/us/en/develop/documentation/vtune-help/top.html)
- [Tracy Manual](https://github.com/wolfpld/tracy/releases)
- [Linux perf Examples](http://www.brendangregg.com/perf.html)

---

**下一章**: [Chapter 11 - 真实世界 SOTA 项目源码剖析](../chapter11_real_world/README.md)
