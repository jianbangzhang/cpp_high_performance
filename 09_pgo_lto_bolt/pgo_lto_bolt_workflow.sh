#!/bin/bash
# PGO + LTO + BOLT 二进制优化完整工作流
# 演示如何榨干最后 5-10% 的性能

set -e

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

print_header() {
    echo -e "${BLUE}================================================${NC}"
    echo -e "${BLUE}  $1${NC}"
    echo -e "${BLUE}================================================${NC}"
}

print_success() {
    echo -e "${GREEN}✓ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠ $1${NC}"
}

print_error() {
    echo -e "${RED}✗ $1${NC}"
}


# ============================================================================
# Phase 1: Baseline (无优化)
# ============================================================================

print_header "Phase 1: Baseline Build"

echo "Building baseline version (no optimizations)..."
g++ -std=c++20 -O0 benchmark_program.cpp -o benchmark_baseline

if [ -f benchmark_baseline ]; then
    print_success "Baseline build complete"
    echo ""
    
    echo "Running baseline benchmark..."
    ./benchmark_baseline > baseline_result.txt
    BASELINE_TIME=$(grep "Total time:" baseline_result.txt | awk '{print $3}')
    echo "Baseline time: $BASELINE_TIME seconds"
    echo ""
else
    print_error "Baseline build failed"
    exit 1
fi

# ============================================================================
# Phase 2: Standard Optimization (-O3)
# ============================================================================

print_header "Phase 2: Standard Optimization (-O3)"

echo "Building with -O3..."
g++ -std=c++20 -O3 -march=native benchmark_program.cpp -o benchmark_O3

if [ -f benchmark_O3 ]; then
    print_success "O3 build complete"
    echo ""
    
    echo "Running O3 benchmark..."
    ./benchmark_O3 > o3_result.txt
    O3_TIME=$(grep "Total time:" o3_result.txt | awk '{print $3}')
    echo "O3 time: $O3_TIME seconds"
    
    # 计算加速比
    SPEEDUP=$(echo "scale=2; $BASELINE_TIME / $O3_TIME" | bc)
    echo "Speedup vs baseline: ${SPEEDUP}x"
    echo ""
else
    print_error "O3 build failed"
    exit 1
fi

# ============================================================================
# Phase 3: Link-Time Optimization (LTO)
# ============================================================================

print_header "Phase 3: Link-Time Optimization (LTO)"

echo "Building with -O3 -flto..."
g++ -std=c++20 -O3 -march=native -flto=auto \
    benchmark_program.cpp -o benchmark_lto

if [ -f benchmark_lto ]; then
    print_success "LTO build complete"
    echo ""
    
    echo "Running LTO benchmark..."
    ./benchmark_lto > lto_result.txt
    LTO_TIME=$(grep "Total time:" lto_result.txt | awk '{print $3}')
    echo "LTO time: $LTO_TIME seconds"
    
    SPEEDUP_LTO=$(echo "scale=2; $O3_TIME / $LTO_TIME" | bc)
    echo "Speedup vs O3: ${SPEEDUP_LTO}x"
    
    TOTAL_SPEEDUP=$(echo "scale=2; $BASELINE_TIME / $LTO_TIME" | bc)
    echo "Total speedup vs baseline: ${TOTAL_SPEEDUP}x"
    echo ""
else
    print_error "LTO build failed"
    exit 1
fi

# ============================================================================
# Phase 4: Profile-Guided Optimization (PGO)
# ============================================================================

print_header "Phase 4: Profile-Guided Optimization (PGO)"

echo "Step 1: Building with instrumentation..."
g++ -std=c++20 -O3 -march=native -flto=auto \
    -fprofile-generate \
    benchmark_program.cpp -o benchmark_pgo_instrument

if [ -f benchmark_pgo_instrument ]; then
    print_success "Instrumented build complete"
    echo ""
    
    echo "Step 2: Running instrumented binary to collect profile..."
    ./benchmark_pgo_instrument > /dev/null 2>&1
    
    if [ -f *.gcda ]; then
        print_success "Profile data collected"
        echo ""
        
        echo "Step 3: Building with profile-guided optimization..."
        g++ -std=c++20 -O3 -march=native -flto=auto \
            -fprofile-use \
            benchmark_program.cpp -o benchmark_pgo
        
        if [ -f benchmark_pgo ]; then
            print_success "PGO build complete"
            echo ""
            
            echo "Running PGO benchmark..."
            ./benchmark_pgo > pgo_result.txt
            PGO_TIME=$(grep "Total time:" pgo_result.txt | awk '{print $3}')
            echo "PGO time: $PGO_TIME seconds"
            
            SPEEDUP_PGO=$(echo "scale=2; $LTO_TIME / $PGO_TIME" | bc)
            echo "Speedup vs LTO: ${SPEEDUP_PGO}x"
            
            TOTAL_SPEEDUP_PGO=$(echo "scale=2; $BASELINE_TIME / $PGO_TIME" | bc)
            echo "Total speedup vs baseline: ${TOTAL_SPEEDUP_PGO}x"
            echo ""
        else
            print_error "PGO build failed"
        fi
    else
        print_warning "No profile data generated"
    fi
else
    print_error "Instrumented build failed"
fi

# 清理 profile 数据
rm -f *.gcda *.gcno

# ============================================================================
# Phase 5: BOLT (Binary Optimization and Layout Tool)
# ============================================================================

print_header "Phase 5: BOLT Optimization"

# 检查 BOLT 是否可用
if command -v llvm-bolt &> /dev/null; then
    echo "BOLT found, proceeding with optimization..."
    
    # 注意：BOLT 需要特殊的编译选项
    echo "Step 1: Rebuilding with BOLT-compatible flags..."
    clang++ -std=c++20 -O3 -march=native -flto=thin \
        -Wl,--emit-relocs \
        benchmark_program.cpp -o benchmark_bolt_input
    
    if [ -f benchmark_bolt_input ]; then
        print_success "BOLT input binary created"
        echo ""
        
        echo "Step 2: Collecting BOLT profile..."
        perf record -e cycles:u -j any,u -o perf.data -- ./benchmark_bolt_input > /dev/null 2>&1
        
        if [ -f perf.data ]; then
            echo "Step 3: Converting perf data..."
            perf2bolt ./benchmark_bolt_input -p perf.data -o benchmark_bolt_input.fdata
            
            echo "Step 4: Optimizing with BOLT..."
            llvm-bolt ./benchmark_bolt_input -o benchmark_bolt \
                -data=benchmark_bolt_input.fdata \
                -reorder-blocks=ext-tsp \
                -reorder-functions=hfsort \
                -split-functions \
                -split-all-cold \
                -dyno-stats
            
            if [ -f benchmark_bolt ]; then
                print_success "BOLT optimization complete"
                echo ""
                
                echo "Running BOLT benchmark..."
                ./benchmark_bolt > bolt_result.txt
                BOLT_TIME=$(grep "Total time:" bolt_result.txt | awk '{print $3}')
                echo "BOLT time: $BOLT_TIME seconds"
                
                SPEEDUP_BOLT=$(echo "scale=2; $PGO_TIME / $BOLT_TIME" | bc)
                echo "Speedup vs PGO: ${SPEEDUP_BOLT}x"
                
                TOTAL_SPEEDUP_BOLT=$(echo "scale=2; $BASELINE_TIME / $BOLT_TIME" | bc)
                echo "Total speedup vs baseline: ${TOTAL_SPEEDUP_BOLT}x"
                echo ""
            else
                print_error "BOLT optimization failed"
            fi
        else
            print_warning "Failed to collect perf data"
        fi
    else
        print_error "BOLT input build failed"
    fi
else
    print_warning "BOLT not found, skipping BOLT optimization"
    echo "To install BOLT:"
    echo "  Ubuntu: apt install llvm-14"
    echo "  macOS: brew install llvm"
    echo ""
fi

# ============================================================================
# 结果总结
# ============================================================================

print_header "Optimization Results Summary"

cat << EOF

┌─────────────────────────────────────────────────────────┐
│                   Performance Summary                    │
├─────────────────────────────────────────────────────────┤
│ Configuration      │ Time (s)  │ vs Baseline │ vs Prev │
├───────────────────┼───────────┼─────────────┼─────────┤
│ Baseline (-O0)    │ ${BASELINE_TIME:-N/A}      │ 1.00x       │ -       │
│ -O3               │ ${O3_TIME:-N/A}      │ ${SPEEDUP:-N/A}x       │ -       │
│ -O3 + LTO         │ ${LTO_TIME:-N/A}      │ ${TOTAL_SPEEDUP:-N/A}x       │ ${SPEEDUP_LTO:-N/A}x    │
│ -O3 + LTO + PGO   │ ${PGO_TIME:-N/A}      │ ${TOTAL_SPEEDUP_PGO:-N/A}x       │ ${SPEEDUP_PGO:-N/A}x    │
│ Full Stack + BOLT │ ${BOLT_TIME:-N/A}      │ ${TOTAL_SPEEDUP_BOLT:-N/A}x       │ ${SPEEDUP_BOLT:-N/A}x    │
└───────────────────┴───────────┴─────────────┴─────────┘

EOF

# ============================================================================
# 二进制大小对比
# ============================================================================

print_header "Binary Size Analysis"

echo "Binary sizes:"
echo "------------------------------------------------"
if [ -f benchmark_baseline ]; then
    echo "Baseline:    $(stat -f%z benchmark_baseline 2>/dev/null || stat -c%s benchmark_baseline) bytes"
fi
if [ -f benchmark_O3 ]; then
    echo "-O3:         $(stat -f%z benchmark_O3 2>/dev/null || stat -c%s benchmark_O3) bytes"
fi
if [ -f benchmark_lto ]; then
    echo "-O3 + LTO:   $(stat -f%z benchmark_lto 2>/dev/null || stat -c%s benchmark_lto) bytes"
fi
if [ -f benchmark_pgo ]; then
    echo "-O3 + PGO:   $(stat -f%z benchmark_pgo 2>/dev/null || stat -c%s benchmark_pgo) bytes"
fi
if [ -f benchmark_bolt ]; then
    echo "Full + BOLT: $(stat -f%z benchmark_bolt 2>/dev/null || stat -c%s benchmark_bolt) bytes"
fi
echo ""

# ============================================================================
# 最佳实践建议
# ============================================================================

print_header "Best Practices & Recommendations"

cat << 'EOF'

1. LTO (Link-Time Optimization):
   ✓ Always enable for production builds
   ✓ Typical speedup: 5-20%
   ✓ Cost: Longer compile time
   ✓ Flags: -flto=auto (GCC/Clang), /LTCG (MSVC)

2. PGO (Profile-Guided Optimization):
   ✓ Use for performance-critical applications
   ✓ Typical speedup: 10-30% over -O3
   ✓ Key: Use representative workload
   ✓ Workflow:
     Step 1: Build with -fprofile-generate
     Step 2: Run with typical input
     Step 3: Rebuild with -fprofile-use

3. BOLT (Binary Optimization):
   ✓ Final 5-15% improvement
   ✓ Best for CPU-bound applications
   ✓ Requires Clang/LLVM
   ✓ Use after PGO for maximum benefit

4. Combining All Three:
   ✓ Total speedup: 1.5-3x over -O3 alone
   ✓ Production deployment standard
   ✓ Essential for: Databases, compilers, servers

5. When NOT to Use:
   ✗ Debug builds
   ✗ Rapid iteration development
   ✗ I/O-bound applications
   ✗ Small, simple programs

6. Recommended Workflow:
   Development:  -O2 -g
   Testing:      -O3 -march=native
   Production:   -O3 -flto -fprofile-use
   Critical:     + BOLT

EOF

# ============================================================================
# 清理
# ============================================================================

<!-- print_header "Cleanup"

read -p "Clean up generated files? (y/N) " -n 1 -r
echo ""

if [[ $REPLY =~ ^[Yy]$ ]]; then
    rm -f benchmark_* *.txt *.gcda *.gcno perf.data *.fdata
    print_success "Cleanup complete"
else
    echo "Files kept for inspection"
fi

echo ""
print_header "Optimization Complete!"
echo ""
echo "Next steps:"
echo "  1. Review the performance summary above"
echo "  2. Apply these techniques to your project"
echo "  3. Measure, measure, measure!"
echo ""

exit 0 -->

# ============================================================================
# 使用说明
# ============================================================================

: << 'USAGE'
使用方法:
  chmod +x chapter09_pgo_lto_bolt_workflow.sh
  ./chapter09_pgo_lto_bolt_workflow.sh

依赖项:
  - GCC 14+ or Clang 18+
  - perf (Linux only, for BOLT)
  - llvm-bolt (optional, for BOLT)

预期结果:
  - LTO:  1.05-1.20x speedup
  - PGO:  1.10-1.40x speedup over LTO
  - BOLT: 1.05-1.15x speedup over PGO
  - Total: 1.5-3x speedup over -O3

实际应用:
  - Chrome/Chromium 使用 PGO + LTO
  - GCC 编译器本身使用 PGO
  - LLVM 使用 BOLT 优化自身
  - MySQL/PostgreSQL 使用 PGO

编译时间影响:
  - LTO: +20-50%
  - PGO: +100% (需要两次编译 + 运行)
  - BOLT: +5-10% (后处理)
USAGE