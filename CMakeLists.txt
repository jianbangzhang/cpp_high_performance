cmake_minimum_required(VERSION 3.20)
project(CppPerformanceGuide VERSION 1.0 LANGUAGES CXX)

# ============================================================================
# 全局配置
# ============================================================================

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# 导出 compile_commands.json（用于 IDE 和工具）
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# ============================================================================
# 编译器检测与旗标设置
# ============================================================================

message(STATUS "Compiler: ${CMAKE_CXX_COMPILER_ID} ${CMAKE_CXX_COMPILER_VERSION}")
message(STATUS "Build type: ${CMAKE_BUILD_TYPE}")

# GCC/Clang 通用旗标
if(CMAKE_CXX_COMPILER_ID MATCHES "GNU|Clang")
    # 警告设置
    add_compile_options(
        -Wall
        -Wextra
        -Wpedantic
        -Wconversion
        -Wsign-conversion
    )
    
    # Debug 模式
    if(CMAKE_BUILD_TYPE STREQUAL "Debug")
        add_compile_options(
            -O0
            -g3
            -ggdb
            -fno-omit-frame-pointer
            -fsanitize=address
            -fsanitize=undefined
        )
        add_link_options(
            -fsanitize=address
            -fsanitize=undefined
        )
    endif()
    
    # Release 模式 - 极致优化
    if(CMAKE_BUILD_TYPE STREQUAL "Release")
        add_compile_options(
            -O3
            -march=native
            -mtune=native
            -flto=auto
            -funroll-loops
            -ftree-vectorize
            -ffast-math
            -DNDEBUG
        )
        add_link_options(
            -O3
            -flto=auto
            -s  # Strip symbols
        )
        
        # 显示向量化信息（可选）
        if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
            add_compile_options(-fopt-info-vec-optimized)
        endif()
    endif()
    
    # RelWithDebInfo 模式
    if(CMAKE_BUILD_TYPE STREQUAL "RelWithDebInfo")
        add_compile_options(
            -O2
            -g
            -march=native
        )
    endif()

# MSVC 旗标
elseif(MSVC)
    # 警告设置
    add_compile_options(
        /W4
        /permissive-
    )
    
    # Release 模式
    if(CMAKE_BUILD_TYPE STREQUAL "Release")
        add_compile_options(
            /O2
            /Ob2
            /Oi
            /Ot
            /GL
            /Gy
            /arch:AVX2
            /fp:fast
            /DNDEBUG
        )
        add_link_options(
            /LTCG
            /OPT:REF
            /OPT:ICF
        )
    endif()
endif()

# ============================================================================
# CPU 特性检测
# ============================================================================

include(CheckCXXCompilerFlag)

# 检测 AVX2 支持
check_cxx_compiler_flag("-mavx2" COMPILER_SUPPORTS_AVX2)
if(COMPILER_SUPPORTS_AVX2)
    message(STATUS "AVX2 support: YES")
    option(ENABLE_AVX2 "Enable AVX2 optimizations" ON)
else()
    message(STATUS "AVX2 support: NO")
    option(ENABLE_AVX2 "Enable AVX2 optimizations" OFF)
endif()

# 检测 AVX-512 支持
check_cxx_compiler_flag("-mavx512f" COMPILER_SUPPORTS_AVX512)
if(COMPILER_SUPPORTS_AVX512)
    message(STATUS "AVX-512 support: YES")
    option(ENABLE_AVX512 "Enable AVX-512 optimizations" OFF)  # 默认关闭
else()
    message(STATUS "AVX-512 support: NO")
    option(ENABLE_AVX512 "Enable AVX-512 optimizations" OFF)
endif()

# ============================================================================
# 依赖库查找
# ============================================================================

# Google Benchmark（可选）
find_package(benchmark QUIET)
if(benchmark_FOUND)
    message(STATUS "Google Benchmark found")
else()
    message(STATUS "Google Benchmark not found - using custom benchmark")
endif()

# Threads
find_package(Threads REQUIRED)

# ============================================================================
# 公共库：工具函数
# ============================================================================

add_library(common INTERFACE)
target_include_directories(common INTERFACE ${CMAKE_SOURCE_DIR}/common)
target_compile_features(common INTERFACE cxx_std_20)

# ============================================================================
# Chapter 1: 编译器旗标
# ============================================================================

add_executable(chapter01_demo
    chapter01_compiler_flags/matrix_benchmark.cpp
)
target_link_libraries(chapter01_demo PRIVATE common)

# 创建多个版本用于对比
add_executable(chapter01_O0 chapter01_compiler_flags/matrix_benchmark.cpp)
target_compile_options(chapter01_O0 PRIVATE -O0)

add_executable(chapter01_O2 chapter01_compiler_flags/matrix_benchmark.cpp)
target_compile_options(chapter01_O2 PRIVATE -O2)

add_executable(chapter01_O3 chapter01_compiler_flags/matrix_benchmark.cpp)
target_compile_options(chapter01_O3 PRIVATE -O3)

add_executable(chapter01_O3_native chapter01_compiler_flags/matrix_benchmark.cpp)
target_compile_options(chapter01_O3_native PRIVATE -O3 -march=native)

# ============================================================================
# Chapter 2: 数据布局（SoA vs AoS）
# ============================================================================

add_executable(chapter02_aos_vs_soa
    chapter02_data_layout/aos_vs_soa_benchmark.cpp
)
target_link_libraries(chapter02_aos_vs_soa PRIVATE common)

# ============================================================================
# Chapter 3: CRTP
# ============================================================================

add_executable(chapter03_crtp
    chapter03_crtp/crtp_complete_guide.cpp
)
target_link_libraries(chapter03_crtp PRIVATE common)

# ============================================================================
# Chapter 4: 表达式模板
# ============================================================================

add_executable(chapter04_expression_templates
    chapter04_expression_templates/matrix_et.cpp
)
target_link_libraries(chapter04_expression_templates PRIVATE common)

# ============================================================================
# Chapter 5: SIMD
# ============================================================================

add_executable(chapter05_simd
    chapter05_simd/simd_complete_guide.cpp
)
target_link_libraries(chapter05_simd PRIVATE common)

# 根据 CPU 特性添加编译旗标
if(ENABLE_AVX2)
    if(CMAKE_CXX_COMPILER_ID MATCHES "GNU|Clang")
        target_compile_options(chapter05_simd PRIVATE -mavx2 -mfma)
    elseif(MSVC)
        target_compile_options(chapter05_simd PRIVATE /arch:AVX2)
    endif()
endif()

if(ENABLE_AVX512)
    if(CMAKE_CXX_COMPILER_ID MATCHES "GNU|Clang")
        target_compile_options(chapter05_simd PRIVATE -mavx512f)
    elseif(MSVC)
        target_compile_options(chapter05_simd PRIVATE /arch:AVX512)
    endif()
endif()

# ============================================================================
# Chapter 6: 内存分配器
# ============================================================================

add_executable(chapter06_allocators
    chapter06_allocators/pool_allocator.cpp
)
target_link_libraries(chapter06_allocators PRIVATE common)

# ============================================================================
# Chapter 7: 无锁数据结构
# ============================================================================

add_executable(chapter07_lockfree
    chapter07_lockfree/spsc_queue.cpp
)
target_link_libraries(chapter07_lockfree PRIVATE common Threads::Threads)

# ============================================================================
# Chapter 8: constexpr
# ============================================================================

add_executable(chapter08_constexpr
    chapter08_constexpr/compile_time_json.cpp
)
target_link_libraries(chapter08_constexpr PRIVATE common)

# ============================================================================
# 测试目标
# ============================================================================

enable_testing()

# 功能测试
add_test(NAME test_aos_vs_soa COMMAND chapter02_aos_vs_soa)
add_test(NAME test_crtp COMMAND chapter03_crtp)
add_test(NAME test_simd COMMAND chapter05_simd)

# ============================================================================
# 自定义目标
# ============================================================================

# 运行所有基准测试
add_custom_target(run_all_benchmarks
    COMMAND echo "Running Chapter 1: Compiler Flags..."
    COMMAND chapter01_demo
    COMMAND echo ""
    COMMAND echo "Running Chapter 2: AoS vs SoA..."
    COMMAND chapter02_aos_vs_soa
    COMMAND echo ""
    COMMAND echo "Running Chapter 3: CRTP..."
    COMMAND chapter03_crtp
    COMMAND echo ""
    COMMAND echo "Running Chapter 5: SIMD..."
    COMMAND chapter05_simd
    DEPENDS 
        chapter01_demo 
        chapter02_aos_vs_soa 
        chapter03_crtp 
        chapter05_simd
    COMMENT "Running all performance benchmarks"
)

# 编译器优化对比
add_custom_target(compare_optimizations
    COMMAND echo "=== O0 ==="
    COMMAND chapter01_O0
    COMMAND echo ""
    COMMAND echo "=== O2 ==="
    COMMAND chapter01_O2
    COMMAND echo ""
    COMMAND echo "=== O3 ==="
    COMMAND chapter01_O3
    COMMAND echo ""
    COMMAND echo "=== O3 + march=native ==="
    COMMAND chapter01_O3_native
    DEPENDS
        chapter01_O0
        chapter01_O2
        chapter01_O3
        chapter01_O3_native
    COMMENT "Comparing different optimization levels"
)

# PGO (Profile-Guided Optimization) 工作流
if(CMAKE_CXX_COMPILER_ID MATCHES "GNU|Clang")
    add_custom_target(pgo_generate
        COMMAND ${CMAKE_COMMAND} -E echo "Building with PGO instrumentation..."
        COMMAND ${CMAKE_COMMAND} 
            -DCMAKE_BUILD_TYPE=Release 
            -DCMAKE_CXX_FLAGS="-fprofile-generate" 
            -DCMAKE_EXE_LINKER_FLAGS="-fprofile-generate"
            ..
        COMMAND ${CMAKE_COMMAND} --build . --target chapter01_demo
        COMMENT "Building with PGO instrumentation"
    )
    
    add_custom_target(pgo_run
        COMMAND ${CMAKE_COMMAND} -E echo "Running PGO instrumented binary..."
        COMMAND ./chapter01_demo
        DEPENDS pgo_generate
        COMMENT "Running PGO training"
    )
    
    add_custom_target(pgo_use
        COMMAND ${CMAKE_COMMAND} -E echo "Building with PGO optimization..."
        COMMAND ${CMAKE_COMMAND} 
            -DCMAKE_BUILD_TYPE=Release 
            -DCMAKE_CXX_FLAGS="-fprofile-use" 
            -DCMAKE_EXE_LINKER_FLAGS="-fprofile-use"
            ..
        COMMAND ${CMAKE_COMMAND} --build . --target chapter01_demo
        DEPENDS pgo_run
        COMMENT "Building with PGO optimization"
    )
endif()

# ============================================================================
# 安装配置
# ============================================================================

install(TARGETS 
    chapter01_demo
    chapter02_aos_vs_soa
    chapter03_crtp
    chapter05_simd
    DESTINATION bin
)

install(DIRECTORY 
    chapter01_compiler_flags/
    chapter02_data_layout/
    chapter03_crtp/
    chapter05_simd/
    DESTINATION share/cpp-performance-guide
    FILES_MATCHING PATTERN "*.md" PATTERN "*.cpp" PATTERN "*.hpp"
)

# ============================================================================
# 打印配置摘要
# ============================================================================

message(STATUS "")
message(STATUS "========================================")
message(STATUS "C++ Performance Guide Configuration")
message(STATUS "========================================")
message(STATUS "Build type:    ${CMAKE_BUILD_TYPE}")
message(STATUS "C++ Standard:  C++${CMAKE_CXX_STANDARD}")
message(STATUS "Compiler:      ${CMAKE_CXX_COMPILER_ID} ${CMAKE_CXX_COMPILER_VERSION}")
message(STATUS "AVX2:          ${ENABLE_AVX2}")
message(STATUS "AVX-512:       ${ENABLE_AVX512}")
message(STATUS "Install:       ${CMAKE_INSTALL_PREFIX}")
message(STATUS "========================================")
message(STATUS "")
