#include <array>
#include <immintrin.h>
#include <iostream>
#include <stdexcept>

// 1. 表达式模板基类
template<typename E>
class MatExpr {
public:
    float operator()(int i, int j) const {
        return static_cast<const E&>(*this)(i, j);
    }
    int rows() const { return static_cast<const E&>(*this).rows(); }
    int cols() const { return static_cast<const E&>(*this).cols(); }
};

// 2. 矩阵加法表达式
template<typename E1, typename E2>
class MatAdd : public MatExpr<MatAdd<E1, E2>> {
    const E1& u_;
    const E2& v_;
public:
    MatAdd(const E1& u, const E2& v) : u_(u), v_(v) {
        // 可选：运行时检查尺寸一致
        if (u.rows() != v.rows() || u.cols() != v.cols())
            throw std::runtime_error("Matrix size mismatch in addition");
    }

    float operator()(int i, int j) const { return u_(i, j) + v_(i, j); }
    int rows() const { return u_.rows(); }
    int cols() const { return u_.cols(); }
};

// 3. 关键：为 MatExpr 之间定义 operator+ （支持链式加法）
template<typename E1, typename E2>
MatAdd<E1, E2> operator+(const MatExpr<E1>& a, const MatExpr<E2>& b) {
    return MatAdd<E1, E2>(static_cast<const E1&>(a), static_cast<const E2&>(b));
}

// 4. 实际存储的矩阵（继承自 MatExpr）
template<int Rows, int Cols>
class Matrix : public MatExpr<Matrix<Rows, Cols>> {
    alignas(32) std::array<float, Rows * Cols> data_;

public:
    Matrix() { data_.fill(0.0f); }

    // 从表达式赋值（触发延迟计算）
    template<typename E>
    Matrix& operator=(const MatExpr<E>& expr) {
        const auto& e = static_cast<const E&>(expr);

        // 运行时检查尺寸匹配
        if (e.rows() != Rows || e.cols() != Cols) {
            throw std::runtime_error("Matrix assignment: size mismatch");
        }

        if constexpr (Cols % 8 == 0) {
            // AVX2 向量化版本
            for (int i = 0; i < Rows; ++i) {
                for (int j = 0; j < Cols; j += 8) {
                    __m256 v = _mm256_setr_ps(
                        e(i, j+0), e(i, j+1), e(i, j+2), e(i, j+3),
                        e(i, j+4), e(i, j+5), e(i, j+6), e(i, j+7));
                    _mm256_store_ps(&data_[i * Cols + j], v);
                }
            }
        } else {
            // 标量回退
            for (int i = 0; i < Rows; ++i)
                for (int j = 0; j < Cols; ++j)
                    data_[i * Cols + j] = e(i, j);
        }
        return *this;
    }

    // 支持直接读写
    float operator()(int i, int j) const { return data_[i * Cols + j]; }
    float& operator()(int i, int j)       { return data_[i * Cols + j]; }

    int rows() const { return Rows; }
    int cols() const { return Cols; }

    // 方便初始化
    void fill(float value) { data_.fill(value); }
};

// 测试代码
int main() {
    Matrix<100, 100> A, B, C, D;

    // 初始化
    for (int i = 0; i < 100; ++i)
        for (int j = 0; j < 100; ++j) {
            A(i, j) = 1.0f;
            B(i, j) = 2.0f;
            C(i, j) = 3.0f;
        }

    // 这行现在完全合法！并且只会循环一次（表达式被融合）
    D = A + B + C;

    std::cout << "D(0,0) = " << D(0,0) << " (should be 6)\n";  // 1+2+3
    std::cout << "D(99,99) = " << D(99,99) << "\n";

    return 0;
}