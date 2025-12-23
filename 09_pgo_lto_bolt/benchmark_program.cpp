#include <iostream>
#include <vector>
#include <random>
#include <chrono>
#include <algorithm>

// 模拟复杂的数据处理任务
class DataProcessor {
private:
    std::vector<double> data_;
    std::mt19937 rng_;

public:
    DataProcessor(size_t size) : data_(size), rng_(42) {
        std::uniform_real_distribution<double> dist(0.0, 1000.0);
        for (auto& d : data_) {
            d = dist(rng_);
        }
    }

    // 热点函数 1：排序
    void sort_data() {
        std::sort(data_.begin(), data_.end());
    }

    // 热点函数 2：统计计算
    double compute_statistics() {
        double sum = 0.0;
        double sum_sq = 0.0;
        
        for (const auto& d : data_) {
            sum += d;
            sum_sq += d * d;
        }
        
        double mean = sum / data_.size();
        double variance = sum_sq / data_.size() - mean * mean;
        
        return variance;
    }

    // 热点函数 3：过滤与变换
    std::vector<double> filter_and_transform(double threshold) {
        std::vector<double> result;
        result.reserve(data_.size() / 2);
        
        for (const auto& d : data_) {
            if (d > threshold) {
                result.push_back(d * 1.5 + 100.0);
            }
        }
        
        return result;
    }

    size_t size() const { return data_.size(); }
};

int main(int argc, char* argv[]) {
    const size_t DATA_SIZE = 1'000'000;
    const int ITERATIONS = 100;

    auto start = std::chrono::high_resolution_clock::now();

    for (int iter = 0; iter < ITERATIONS; ++iter) {
        DataProcessor processor(DATA_SIZE);
        
        // 典型工作负载
        processor.sort_data();
        double variance = processor.compute_statistics();
        auto filtered = processor.filter_and_transform(500.0);
        
        // 防止编译器优化掉
        if (variance < 0) {
            std::cout << "Unexpected result\n";
        }
    }

    auto end = std::chrono::high_resolution_clock::now();
    auto duration = std::chrono::duration<double>(end - start).count();

    std::cout << "Total time: " << duration << " seconds\n";
    std::cout << "Iterations: " << ITERATIONS << "\n";
    std::cout << "Time per iteration: " << (duration / ITERATIONS * 1000) << " ms\n";

    return 0;
}