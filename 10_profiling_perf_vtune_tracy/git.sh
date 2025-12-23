# 安装火焰图工具
git clone https://github.com/brendangregg/FlameGraph.git
cd FlameGraph

# 采样数据
perf record -F 99 -a -g -- sleep 60

# 生成火焰图
perf script | ./stackcollapse-perf.pl | ./flamegraph.pl > flame.svg