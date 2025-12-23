#include <iostream>
#include <vector>
#include <chrono>
#include <random>
#include <cmath>
#include <iomanip>

// ============================================================================
// AoS: Array of Structures（传统方式）
// ============================================================================
struct Particle_AoS {
    float x, y, z;        // 位置
    float vx, vy, vz;     // 速度
    float mass;           // 质量
    float _padding;       // 对齐填充（可选）
};

class ParticleSystem_AoS {
public:
    std::vector<Particle_AoS> particles;

    ParticleSystem_AoS(size_t count) : particles(count) {
        std::mt19937 rng(42);
        std::uniform_real_distribution<float> dist(-10.0f, 10.0f);
        
        for (auto& p : particles) {
            p.x = dist(rng);
            p.y = dist(rng);
            p.z = dist(rng);
            p.vx = dist(rng);
            p.vy = dist(rng);
            p.vz = dist(rng);
            p.mass = 1.0f;
        }
    }

    // 更新粒子位置（典型操作：只访问位置和速度，不访问质量）
    void update(float dt) {
        for (auto& p : particles) {
            p.x += p.vx * dt;
            p.y += p.vy * dt;
            p.z += p.vz * dt;
        }
    }

    // 计算动能（访问速度和质量）
    float compute_kinetic_energy() const {
        float total = 0.0f;
        for (const auto& p : particles) {
            float v2 = p.vx * p.vx + p.vy * p.vy + p.vz * p.vz;
            total += 0.5f * p.mass * v2;
        }
        return total;
    }
};

// ============================================================================
// SoA: Structure of Arrays（缓存友好方式）
// ============================================================================
class ParticleSystem_SoA {
public:
    std::vector<float> x, y, z;       // 位置
    std::vector<float> vx, vy, vz;    // 速度
    std::vector<float> mass;          // 质量

    ParticleSystem_SoA(size_t count) {
        x.resize(count);
        y.resize(count);
        z.resize(count);
        vx.resize(count);
        vy.resize(count);
        vz.resize(count);
        mass.resize(count);

        std::mt19937 rng(42);
        std::uniform_real_distribution<float> dist(-10.0f, 10.0f);
        
        for (size_t i = 0; i < count; ++i) {
            x[i] = dist(rng);
            y[i] = dist(rng);
            z[i] = dist(rng);
            vx[i] = dist(rng);
            vy[i] = dist(rng);
            vz[i] = dist(rng);
            mass[i] = 1.0f;
        }
    }

    // 更新粒子位置
    void update(float dt) {
        const size_t count = x.size();
        for (size_t i = 0; i < count; ++i) {
            x[i] += vx[i] * dt;
            y[i] += vy[i] * dt;
            z[i] += vz[i] * dt;
        }
    }

    // 计算动能
    float compute_kinetic_energy() const {
        float total = 0.0f;
        const size_t count = x.size();
        for (size_t i = 0; i < count; ++i) {
            float v2 = vx[i] * vx[i] + vy[i] * vy[i] + vz[i] * vz[i];
            total += 0.5f * mass[i] * v2;
        }
        return total;
    }
};

// ============================================================================
// 混合 SoA: 按访问模式分组（高级技巧）
// ============================================================================
class ParticleSystem_HybridSoA {
public:
    // 经常一起访问的数据放在一起
    struct PositionVelocity {
        float x, y, z;
        float vx, vy, vz;
    };
    
    std::vector<PositionVelocity> pos_vel;
    std::vector<float> mass;  // 不常访问的数据单独存储

    ParticleSystem_HybridSoA(size_t count) : pos_vel(count), mass(count) {
        std::mt19937 rng(42);
        std::uniform_real_distribution<float> dist(-10.0f, 10.0f);
        
        for (size_t i = 0; i < count; ++i) {
            pos_vel[i].x = dist(rng);
            pos_vel[i].y = dist(rng);
            pos_vel[i].z = dist(rng);
            pos_vel[i].vx = dist(rng);
            pos_vel[i].vy = dist(rng);
            pos_vel[i].vz = dist(rng);
            mass[i] = 1.0f;
        }
    }

    void update(float dt) {
        for (auto& pv : pos_vel) {
            pv.x += pv.vx * dt;
            pv.y += pv.vy * dt;
            pv.z += pv.vz * dt;
        }
    }

    float compute_kinetic_energy() const {
        float total = 0.0f;
        for (size_t i = 0; i < pos_vel.size(); ++i) {
            const auto& pv = pos_vel[i];
            float v2 = pv.vx * pv.vx + pv.vy * pv.vy + pv.vz * pv.vz;
            total += 0.5f * mass[i] * v2;
        }
        return total;
    }
};

// ============================================================================
// 性能测试框架
// ============================================================================
template<typename Func>
double benchmark(const std::string& name, Func func, int iterations = 1000) {
    // 预热
    func();
    
    auto start = std::chrono::high_resolution_clock::now();
    for (int i = 0; i < iterations; ++i) {
        func();
    }
    auto end = std::chrono::high_resolution_clock::now();
    
    double ms = std::chrono::duration<double, std::milli>(end - start).count();
    double avg_ms = ms / iterations;
    
    std::cout << std::left << std::setw(40) << name 
              << std::right << std::setw(10) << std::fixed << std::setprecision(3) 
              << avg_ms << " ms/iter" << std::endl;
    
    return avg_ms;
}

// ============================================================================
// 主程序
// ============================================================================
int main() {
    constexpr size_t PARTICLE_COUNT = 1'000'000;  // 100 万个粒子
    constexpr int ITERATIONS = 100;
    constexpr float DT = 0.016f;  // 60 FPS

    std::cout << "================================================\n";
    std::cout << "  AoS vs SoA Performance Benchmark\n";
    std::cout << "================================================\n";
    std::cout << "Particle count: " << PARTICLE_COUNT << "\n";
    std::cout << "Iterations: " << ITERATIONS << "\n";
    std::cout << "================================================\n\n";

    // 创建粒子系统
    std::cout << "Initializing particle systems...\n";
    ParticleSystem_AoS aos(PARTICLE_COUNT);
    ParticleSystem_SoA soa(PARTICLE_COUNT);
    ParticleSystem_HybridSoA hybrid(PARTICLE_COUNT);
    std::cout << "Done!\n\n";

    // 测试 1: Update（只访问位置和速度）
    std::cout << "Test 1: Update particles (position + velocity only)\n";
    std::cout << "------------------------------------------------\n";
    
    double aos_update_time = benchmark("AoS Update", 
        [&]() { aos.update(DT); }, ITERATIONS);
    
    double soa_update_time = benchmark("SoA Update", 
        [&]() { soa.update(DT); }, ITERATIONS);
    
    double hybrid_update_time = benchmark("Hybrid SoA Update", 
        [&]() { hybrid.update(DT); }, ITERATIONS);

    std::cout << "\nSpeedup:\n";
    std::cout << "  SoA vs AoS:        " << std::fixed << std::setprecision(2) 
              << (aos_update_time / soa_update_time) << "x\n";
    std::cout << "  Hybrid vs AoS:     " 
              << (aos_update_time / hybrid_update_time) << "x\n\n";

    // 测试 2: Kinetic Energy（访问速度和质量）
    std::cout << "Test 2: Compute kinetic energy (velocity + mass)\n";
    std::cout << "------------------------------------------------\n";
    
    double aos_ke_time = benchmark("AoS Kinetic Energy", 
        [&]() { volatile float ke = aos.compute_kinetic_energy(); (void)ke; }, 
        ITERATIONS);
    
    double soa_ke_time = benchmark("SoA Kinetic Energy", 
        [&]() { volatile float ke = soa.compute_kinetic_energy(); (void)ke; }, 
        ITERATIONS);
    
    double hybrid_ke_time = benchmark("Hybrid SoA Kinetic Energy", 
        [&]() { volatile float ke = hybrid.compute_kinetic_energy(); (void)ke; }, 
        ITERATIONS);

    std::cout << "\nSpeedup:\n";
    std::cout << "  SoA vs AoS:        " 
              << (aos_ke_time / soa_ke_time) << "x\n";
    std::cout << "  Hybrid vs AoS:     " 
              << (aos_ke_time / hybrid_ke_time) << "x\n\n";

    // 内存占用分析
    std::cout << "================================================\n";
    std::cout << "Memory Footprint Analysis\n";
    std::cout << "================================================\n";
    
    size_t aos_size = sizeof(Particle_AoS) * PARTICLE_COUNT;
    size_t soa_size = sizeof(float) * 7 * PARTICLE_COUNT;  // 7 个数组
    size_t hybrid_size = sizeof(ParticleSystem_HybridSoA::PositionVelocity) * PARTICLE_COUNT 
                       + sizeof(float) * PARTICLE_COUNT;

    std::cout << "AoS:        " << (aos_size / 1024.0 / 1024.0) << " MB\n";
    std::cout << "SoA:        " << (soa_size / 1024.0 / 1024.0) << " MB\n";
    std::cout << "Hybrid SoA: " << (hybrid_size / 1024.0 / 1024.0) << " MB\n\n";

    std::cout << "Particle sizes:\n";
    std::cout << "  AoS Particle:        " << sizeof(Particle_AoS) << " bytes\n";
    std::cout << "  SoA per element:     " << sizeof(float) * 7 << " bytes\n";
    std::cout << "  Hybrid per element:  " 
              << sizeof(ParticleSystem_HybridSoA::PositionVelocity) + sizeof(float) 
              << " bytes\n\n";

    // 缓存行分析
    std::cout << "================================================\n";
    std::cout << "Cache Line Analysis (assuming 64-byte cache line)\n";
    std::cout << "================================================\n";
    
    constexpr size_t CACHE_LINE = 64;
    size_t aos_particles_per_line = CACHE_LINE / sizeof(Particle_AoS);
    size_t soa_floats_per_line = CACHE_LINE / sizeof(float);

    std::cout << "AoS: " << aos_particles_per_line 
              << " particles per cache line\n";
    std::cout << "SoA: " << soa_floats_per_line 
              << " elements per cache line\n\n";

    std::cout << "Cache efficiency for Update operation:\n";
    std::cout << "  AoS: accesses 6 floats (pos+vel), wastes 2 floats (mass+padding)\n";
    std::cout << "  SoA: accesses only needed data, no waste\n";
    std::cout << "  Efficiency: SoA is ~" 
              << (sizeof(Particle_AoS) / (sizeof(float) * 6)) 
              << "x more cache-efficient\n\n";

    std::cout << "================================================\n";
    std::cout << "Summary & Recommendations\n";
    std::cout << "================================================\n";
    std::cout << "✓ Use SoA when:\n";
    std::cout << "  - Operations access only subset of fields\n";
    std::cout << "  - Working with large datasets (>L3 cache)\n";
    std::cout << "  - Need SIMD/vectorization\n\n";
    std::cout << "✓ Use AoS when:\n";
    std::cout << "  - Always access all fields together\n";
    std::cout << "  - Small datasets (fits in L1/L2 cache)\n";
    std::cout << "  - Object-oriented design is critical\n\n";
    std::cout << "✓ Use Hybrid SoA when:\n";
    std::cout << "  - Different access patterns for different operations\n";
    std::cout << "  - Can group frequently co-accessed fields\n";
    std::cout << "================================================\n";

    return 0;
}

/* 编译与运行:

基础版本:
  g++ -std=c++20 -O2 aos_vs_soa_benchmark.cpp -o benchmark
  ./benchmark

优化版本:
  g++ -std=c++20 -O3 -march=native aos_vs_soa_benchmark.cpp -o benchmark_opt
  ./benchmark_opt

超级优化版本（需要先运行 PGO）:
  g++ -std=c++20 -O3 -march=native -fprofile-generate aos_vs_soa_benchmark.cpp -o benchmark_pgo
  ./benchmark_pgo
  g++ -std=c++20 -O3 -march=native -fprofile-use aos_vs_soa_benchmark.cpp -o benchmark_pgo_opt
  ./benchmark_pgo_opt

预期结果 (Intel Core i7, -O3 -march=native):
  Update operation: SoA 3-8x faster than AoS
  Kinetic energy:   SoA 2-4x faster than AoS
  
原因:
  1. 缓存命中率提升 (AoS: ~65%, SoA: ~95%)
  2. 编译器更容易向量化 SoA 代码
  3. 避免加载不需要的数据
*/
