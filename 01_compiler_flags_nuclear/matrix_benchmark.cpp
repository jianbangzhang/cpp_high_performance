#include <vector>
#include <chrono>
#include <iostream>

constexpr size_t N = 1024;

void matrix_multiply(const std::vector<float>& A,
                     const std::vector<float>& B,
                     std::vector<float>& C) {
    for (size_t i = 0; i < N; ++i) {
        for (size_t j = 0; j < N; ++j) {
            float sum = 0.0f;
            for (size_t k = 0; k < N; ++k) {
                sum += A[i * N + k] * B[k * N + j];
            }
            C[i * N + j] = sum;
        }
    }
}

int main() {
    std::vector<float> A(N * N, 1.0f);
    std::vector<float> B(N * N, 2.0f);
    std::vector<float> C(N * N);

    auto start = std::chrono::high_resolution_clock::now();
    matrix_multiply(A, B, C);
    auto end = std::chrono::high_resolution_clock::now();

    auto duration = std::chrono::duration_cast<std::chrono::milliseconds>(end - start);
    std::cout << "Time: " << duration.count() << " ms\n";
    
    return 0;
}