#!/bin/bash

# C++ Performance Guide - Quick Start Script
# 一键编译并运行所有性能示例

set -e  # 遇到错误立即退出

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 打印带颜色的消息
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

# 检测操作系统
detect_os() {
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        OS="linux"
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        OS="macos"
    elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
        OS="windows"
    else
        OS="unknown"
    fi
}

# 检测编译器
detect_compiler() {
    if command -v g++ &> /dev/null; then
        COMPILER="g++"
        COMPILER_VERSION=$(g++ --version | head -n1)
        print_success "Found GCC: $COMPILER_VERSION"
    elif command -v clang++ &> /dev/null; then
        COMPILER="clang++"
        COMPILER_VERSION=$(clang++ --version | head -n1)
        print_success "Found Clang: $COMPILER_VERSION"
    else
        print_error "No C++ compiler found! Please install GCC or Clang."
        exit 1
    fi
}

# 检测 CPU 特性
detect_cpu_features() {
    print_header "Detecting CPU Features"
    
    if [[ "$OS" == "linux" ]]; then
        if grep -q avx2 /proc/cpuinfo; then
            HAS_AVX2=true
            print_success "AVX2 support detected"
        else
            HAS_AVX2=false
            print_warning "AVX2 not available"
        fi
        
        if grep -q avx512 /proc/cpuinfo; then
            HAS_AVX512=true
            print_success "AVX-512 support detected"
        else
            HAS_AVX512=false
            print_warning "AVX-512 not available"
        fi
    elif [[ "$OS" == "macos" ]]; then
        if sysctl -a | grep -q AVX2; then
            HAS_AVX2=true
            print_success "AVX2 support detected"
        else
            HAS_AVX2=false
            print_warning "AVX2 not available"
        fi
        HAS_AVX512=false
    else
        HAS_AVX2=false
        HAS_AVX512=false
        print_warning "CPU feature detection not supported on this OS"
    fi
    echo ""
}

# 检测依赖
check_dependencies() {
    print_header "Checking Dependencies"
    
    # CMake
    if command -v cmake &> /dev/null; then
        CMAKE_VERSION=$(cmake --version | head -n1)
        print_success "CMake: $CMAKE_VERSION"
    else
        print_warning "CMake not found (optional, but recommended)"
    fi
    
    # Make
    if command -v make &> /dev/null; then
        print_success "Make found"
    fi
    
    # perf (Linux only)
    if [[ "$OS" == "linux" ]] && command -v perf &> /dev/null; then
        print_success "perf found (for performance analysis)"
    fi
    
    echo ""
}

# 创建构建目录
setup_build_dir() {
    print_header "Setting Up Build Directory"
    
    if [ -d "build" ]; then
        print_warning "Build directory exists, cleaning..."
        rm -rf build
    fi
    
    mkdir -p build
    cd build
    print_success "Build directory created"
    echo ""
}

# 使用 CMake 构建
build_with_cmake() {
    print_header "Building with CMake (Recommended)"
    
    cmake .. \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_CXX_COMPILER=$COMPILER \
        -DCMAKE_CXX_FLAGS="-O3 -march=native -mtune=native"
    
    cmake --build . -j$(nproc 2>/dev/null || sysctl -n hw.ncpu 2>/dev/null || echo 4)
    
    print_success "Build completed!"
    echo ""
}

# 直接编译单个文件（无 CMake）
build_single_file() {
    local source=$1
    local output=$2
    local extra_flags=$3
    
    echo -e "${BLUE}Compiling: $source${NC}"
    
    $COMPILER -std=c++20 -O3 -march=native -mtune=native \
        $extra_flags \
        $source -o $output \
        -pthread
    
    if [ $? -eq 0 ]; then
        print_success "Successfully built: $output"
    else
        print_error "Failed to build: $output"
        return 1
    fi
}

# 运行单个基准测试
run_benchmark() {
    local name=$1
    local executable=$2
    
    print_header "Running: $name"
    
    if [ -f "$executable" ]; then
        ./$executable
        echo ""
    else
        print_error "Executable not found: $executable"
    fi
}

# 快速模式：不使用 CMake
quick_mode() {
    print_header "Quick Mode: Direct Compilation"
    
    mkdir -p quick_build
    cd quick_build
    
    # Chapter 2: AoS vs SoA
    if [ -f "../chapter02_data_layout/aos_vs_soa_benchmark.cpp" ]; then
        build_single_file \
            "../chapter02_data_layout/aos_vs_soa_benchmark.cpp" \
            "aos_vs_soa" \
            ""
        
        if [ -f "aos_vs_soa" ]; then
            run_benchmark "Chapter 2: AoS vs SoA" "aos_vs_soa"
        fi
    fi
    
    # Chapter 3: CRTP
    if [ -f "../chapter03_crtp/crtp_complete_guide.cpp" ]; then
        build_single_file \
            "../chapter03_crtp/crtp_complete_guide.cpp" \
            "crtp_demo" \
            ""
        
        if [ -f "crtp_demo" ]; then
            run_benchmark "Chapter 3: CRTP" "crtp_demo"
        fi
    fi
    
    # Chapter 5: SIMD
    if [ -f "../chapter05_simd/simd_complete_guide.cpp" ]; then
        local simd_flags=""
        if [ "$HAS_AVX2" = true ]; then
            simd_flags="-mavx2 -mfma"
        fi
        
        build_single_file \
            "../chapter05_simd/simd_complete_guide.cpp" \
            "simd_demo" \
            "$simd_flags"
        
        if [ -f "simd_demo" ]; then
            run_benchmark "Chapter 5: SIMD" "simd_demo"
        fi
    fi
    
    cd ..
}

# 完整模式：使用 CMake
full_mode() {
    setup_build_dir
    build_with_cmake
    
    print_header "Running All Benchmarks"
    
    # 运行所有可用的基准测试
    for benchmark in chapter*_*; do
        if [ -x "$benchmark" ]; then
            run_benchmark "$(basename $benchmark)" "$benchmark"
        fi
    done
    
    cd ..
}

# 性能对比模式
comparison_mode() {
    print_header "Performance Comparison Mode"
    
    mkdir -p comparison_build
    cd comparison_build
    
    local test_file="../chapter02_data_layout/aos_vs_soa_benchmark.cpp"
    
    if [ ! -f "$test_file" ]; then
        print_error "Test file not found: $test_file"
        cd ..
        return 1
    fi
    
    # O0
    echo -e "${YELLOW}Building with -O0...${NC}"
    $COMPILER -std=c++20 -O0 $test_file -o benchmark_O0 -pthread
    
    # O2
    echo -e "${YELLOW}Building with -O2...${NC}"
    $COMPILER -std=c++20 -O2 $test_file -o benchmark_O2 -pthread
    
    # O3
    echo -e "${YELLOW}Building with -O3...${NC}"
    $COMPILER -std=c++20 -O3 $test_file -o benchmark_O3 -pthread
    
    # O3 + march=native
    echo -e "${YELLOW}Building with -O3 -march=native...${NC}"
    $COMPILER -std=c++20 -O3 -march=native $test_file -o benchmark_O3_native -pthread
    
    echo ""
    print_header "Running Comparisons"
    
    echo -e "${YELLOW}=== -O0 ===${NC}"
    ./benchmark_O0 2>&1 | head -20
    echo ""
    
    echo -e "${YELLOW}=== -O2 ===${NC}"
    ./benchmark_O2 2>&1 | head -20
    echo ""
    
    echo -e "${YELLOW}=== -O3 ===${NC}"
    ./benchmark_O3 2>&1 | head -20
    echo ""
    
    echo -e "${YELLOW}=== -O3 -march=native ===${NC}"
    ./benchmark_O3_native 2>&1 | head -20
    echo ""
    
    cd ..
}

# 清理
cleanup() {
    print_header "Cleaning Up"
    
    rm -rf build quick_build comparison_build
    find . -name "*.o" -delete
    find . -name "*.gcda" -delete
    find . -name "*.gcno" -delete
    
    print_success "Cleanup complete"
}

# 显示帮助
show_help() {
    cat << EOF
C++ Performance Guide - Quick Start Script

Usage: $0 [MODE]

Modes:
  quick       Quick mode: Direct compilation without CMake (default)
  full        Full mode: Use CMake for complete build
  compare     Comparison mode: Test different optimization levels
  clean       Clean all build artifacts
  help        Show this help message

Examples:
  $0              # Run in quick mode
  $0 full         # Full build with CMake
  $0 compare      # Compare optimization levels
  $0 clean        # Clean build artifacts

Requirements:
  - C++20 compiler (GCC 14+ or Clang 18+)
  - CMake 3.20+ (for full mode)
  - Linux/macOS/Windows (with MSYS2 or Cygwin)

EOF
}

# 主函数
main() {
    print_header "C++ Performance Guide - Quick Start"
    
    detect_os
    detect_compiler
    detect_cpu_features
    check_dependencies
    
    local mode=${1:-quick}
    
    case $mode in
        quick)
            quick_mode
            ;;
        full)
            full_mode
            ;;
        compare|comparison)
            comparison_mode
            ;;
        clean)
            cleanup
            ;;
        help|-h|--help)
            show_help
            ;;
        *)
            print_error "Unknown mode: $mode"
            show_help
            exit 1
            ;;
    esac
    
    print_header "All Done!"
    echo ""
    echo "Next steps:"
    echo "  1. Check the output above for performance results"
    echo "  2. Read the detailed documentation in each chapter"
    echo "  3. Experiment with the code and parameters"
    echo "  4. Run 'perf' or other profilers for deeper analysis"
    echo ""
    echo "Happy optimizing! 🚀"
}

# 运行主函数
main "$@"
