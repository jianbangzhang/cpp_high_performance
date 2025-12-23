// 编译期计算 + constexpr 一切
// 包含：constexpr 算法、JSON 解析、单位系统、静态反射

#include <iostream>
#include <array>
#include <string_view>
#include <algorithm>
#include <chrono>

// ============================================================================
// Part 1: 基础 constexpr 函数
// ============================================================================

// 编译期计算阶乘
constexpr int factorial(int n) {
    return n <= 1 ? 1 : n * factorial(n - 1);
}

// 编译期计算斐波那契
constexpr int fibonacci(int n) {
    if (n <= 1) return n;
    
    int a = 0, b = 1;
    for (int i = 2; i <= n; ++i) {
        int temp = a + b;
        a = b;
        b = temp;
    }
    return b;
}

// 编译期判断是否为质数
constexpr bool is_prime(int n) {
    if (n < 2) return false;
    if (n == 2) return true;
    if (n % 2 == 0) return false;
    
    for (int i = 3; i * i <= n; i += 2) {
        if (n % i == 0) return false;
    }
    return true;
}

// 编译期计算前 N 个质数
template<size_t N>
constexpr auto generate_primes() {
    std::array<int, N> primes{};
    int count = 0;
    int candidate = 2;
    
    while (count < N) {
        if (is_prime(candidate)) {
            primes[count++] = candidate;
        }
        ++candidate;
    }
    
    return primes;
}

// ============================================================================
// Part 2: 编译期字符串处理
// ============================================================================

constexpr size_t string_length(const char* str) {
    size_t len = 0;
    while (str[len] != '\0') ++len;
    return len;
}

constexpr bool string_equal(const char* a, const char* b) {
    while (*a && *b) {
        if (*a != *b) return false;
        ++a;
        ++b;
    }
    return *a == *b;
}

constexpr int string_to_int(const char* str) {
    int result = 0;
    bool negative = false;
    
    if (*str == '-') {
        negative = true;
        ++str;
    }
    
    while (*str >= '0' && *str <= '9') {
        result = result * 10 + (*str - '0');
        ++str;
    }
    
    return negative ? -result : result;
}

// 编译期哈希函数（FNV-1a）
constexpr size_t hash_string(const char* str) {
    size_t hash = 14695981039346656037ULL;
    while (*str) {
        hash ^= static_cast<size_t>(*str++);
        hash *= 1099511628211ULL;
    }
    return hash;
}

// ============================================================================
// Part 3: 编译期 JSON 解析器（简化版）
// ============================================================================

struct JsonValue {
    enum class Type { Null, Bool, Int, String };
    
    Type type;
    int int_value;
    bool bool_value;
    const char* string_value;
    
    constexpr JsonValue() : type(Type::Null), int_value(0), 
                           bool_value(false), string_value(nullptr) {}
    
    constexpr bool is_null() const { return type == Type::Null; }
    constexpr bool is_bool() const { return type == Type::Bool; }
    constexpr bool is_int() const { return type == Type::Int; }
    constexpr bool is_string() const { return type == Type::String; }
    
    constexpr int as_int() const { return int_value; }
    constexpr bool as_bool() const { return bool_value; }
    constexpr const char* as_string() const { return string_value; }
};

class JsonParser {
private:
    const char* json_;
    size_t pos_ = 0;
    
    constexpr void skip_whitespace() {
        while (json_[pos_] == ' ' || json_[pos_] == '\t' || 
               json_[pos_] == '\n' || json_[pos_] == '\r') {
            ++pos_;
        }
    }
    
    constexpr bool match(char c) {
        skip_whitespace();
        if (json_[pos_] == c) {
            ++pos_;
            return true;
        }
        return false;
    }
    
public:
    constexpr JsonParser(const char* json) : json_(json) {}
    
    constexpr JsonValue parse_value() {
        skip_whitespace();
        
        // Parse number
        if (json_[pos_] == '-' || (json_[pos_] >= '0' && json_[pos_] <= '9')) {
            JsonValue value;
            value.type = JsonValue::Type::Int;
            value.int_value = string_to_int(json_ + pos_);
            
            if (json_[pos_] == '-') ++pos_;
            while (json_[pos_] >= '0' && json_[pos_] <= '9') ++pos_;
            
            return value;
        }
        
        // Parse bool
        if (json_[pos_] == 't') {
            pos_ += 4;  // "true"
            JsonValue value;
            value.type = JsonValue::Type::Bool;
            value.bool_value = true;
            return value;
        }
        
        if (json_[pos_] == 'f') {
            pos_ += 5;  // "false"
            JsonValue value;
            value.type = JsonValue::Type::Bool;
            value.bool_value = false;
            return value;
        }
        
        // Parse string
        if (json_[pos_] == '"') {
            ++pos_;
            const char* start = json_ + pos_;
            while (json_[pos_] != '"' && json_[pos_] != '\0') ++pos_;
            ++pos_;
            
            JsonValue value;
            value.type = JsonValue::Type::String;
            value.string_value = start;
            return value;
        }
        
        return JsonValue{};
    }
};

constexpr JsonValue parse_json(const char* json) {
    JsonParser parser(json);
    return parser.parse_value();
}

// ============================================================================
// Part 4: 编译期单位系统
// ============================================================================

template<int M, int L, int T>  // Mass, Length, Time 的指数
struct Unit {
    double value;
    
    constexpr Unit(double v = 0.0) : value(v) {}
};

// 基本单位
using Scalar = Unit<0, 0, 0>;
using Meter = Unit<0, 1, 0>;
using Second = Unit<0, 0, 1>;
using Kilogram = Unit<1, 0, 0>;

// 导出单位
using Velocity = Unit<0, 1, -1>;      // m/s
using Acceleration = Unit<0, 1, -2>;  // m/s²
using Force = Unit<1, 1, -2>;         // kg·m/s² (牛顿)
using Energy = Unit<1, 2, -2>;        // kg·m²/s² (焦耳)

// 运算符重载
template<int M, int L, int T>
constexpr Unit<M, L, T> operator+(Unit<M, L, T> a, Unit<M, L, T> b) {
    return Unit<M, L, T>(a.value + b.value);
}

template<int M, int L, int T>
constexpr Unit<M, L, T> operator-(Unit<M, L, T> a, Unit<M, L, T> b) {
    return Unit<M, L, T>(a.value - b.value);
}

template<int M1, int L1, int T1, int M2, int L2, int T2>
constexpr Unit<M1+M2, L1+L2, T1+T2> operator*(Unit<M1, L1, T1> a, Unit<M2, L2, T2> b) {
    return Unit<M1+M2, L1+L2, T1+T2>(a.value * b.value);
}

template<int M1, int L1, int T1, int M2, int L2, int T2>
constexpr Unit<M1-M2, L1-L2, T1-T2> operator/(Unit<M1, L1, T1> a, Unit<M2, L2, T2> b) {
    return Unit<M1-M2, L1-L2, T1-T2>(a.value / b.value);
}

// 字面量运算符
constexpr Meter operator""_m(long double v) { return Meter(v); }
constexpr Meter operator""_m(unsigned long long v) { return Meter(v); }
constexpr Second operator""_s(long double v) { return Second(v); }
constexpr Second operator""_s(unsigned long long v) { return Second(v); }
constexpr Kilogram operator""_kg(long double v) { return Kilogram(v); }
constexpr Kilogram operator""_kg(unsigned long long v) { return Kilogram(v); }

// ============================================================================
// Part 5: 编译期容器
// ============================================================================

template<typename T, size_t N>
class ConstexprVector {
private:
    std::array<T, N> data_{};
    size_t size_ = 0;

public:
    constexpr ConstexprVector() = default;
    
    constexpr void push_back(const T& value) {
        if (size_ < N) {
            data_[size_++] = value;
        }
    }
    
    constexpr const T& operator[](size_t i) const { return data_[i]; }
    constexpr T& operator[](size_t i) { return data_[i]; }
    
    constexpr size_t size() const { return size_; }
    constexpr bool empty() const { return size_ == 0; }
    
    constexpr const T* begin() const { return data_.data(); }
    constexpr const T* end() const { return data_.data() + size_; }
    
    constexpr T* begin() { return data_.data(); }
    constexpr T* end() { return data_.data() + size_; }
};

// 编译期排序
template<typename T, size_t N>
constexpr auto sort_array(std::array<T, N> arr) {
    for (size_t i = 0; i < N; ++i) {
        for (size_t j = i + 1; j < N; ++j) {
            if (arr[j] < arr[i]) {
                T temp = arr[i];
                arr[i] = arr[j];
                arr[j] = temp;
            }
        }
    }
    return arr;
}

// ============================================================================
// Part 6: 静态反射（简化版）
// ============================================================================

template<typename T>
struct TypeName {
    static constexpr const char* value = "unknown";
};

#define REGISTER_TYPE(T) \
    template<> struct TypeName<T> { \
        static constexpr const char* value = #T; \
    }

REGISTER_TYPE(int);
REGISTER_TYPE(float);
REGISTER_TYPE(double);
REGISTER_TYPE(bool);

template<typename T>
constexpr const char* type_name() {
    return TypeName<T>::value;
}

// ============================================================================
// Part 7: 编译期状态机
// ============================================================================

enum class State { Idle, Running, Stopped, Error };

template<State CurrentState>
struct StateMachine {
    static constexpr State state = CurrentState;
    
    constexpr auto start() const {
        if constexpr (CurrentState == State::Idle) {
            return StateMachine<State::Running>{};
        } else {
            return *this;
        }
    }
    
    constexpr auto stop() const {
        if constexpr (CurrentState == State::Running) {
            return StateMachine<State::Stopped>{};
        } else {
            return *this;
        }
    }
    
    constexpr bool can_start() const {
        return CurrentState == State::Idle;
    }
    
    constexpr bool can_stop() const {
        return CurrentState == State::Running;
    }
};

// ============================================================================
// 主程序：演示所有功能
// ============================================================================

int main() {
    std::cout << "================================================\n";
    std::cout << "  Constexpr & Compile-Time Computation Guide\n";
    std::cout << "================================================\n\n";

    // ========================================
    // 演示 1: 基础编译期计算
    // ========================================
    std::cout << "Demo 1: Basic Compile-Time Computation\n";
    std::cout << "------------------------------------------------\n";
    
    constexpr int fact5 = factorial(5);
    constexpr int fib10 = fibonacci(10);
    constexpr bool is_17_prime = is_prime(17);
    
    std::cout << "factorial(5) = " << fact5 << " (computed at compile time)\n";
    std::cout << "fibonacci(10) = " << fib10 << " (computed at compile time)\n";
    std::cout << "is_prime(17) = " << std::boolalpha << is_17_prime << "\n\n";
    
    // 生成前 10 个质数
    constexpr auto primes = generate_primes<10>();
    std::cout << "First 10 primes: ";
    for (auto p : primes) std::cout << p << " ";
    std::cout << "\n\n";

    // ========================================
    // 演示 2: 编译期字符串处理
    // ========================================
    std::cout << "Demo 2: Compile-Time String Processing\n";
    std::cout << "------------------------------------------------\n";
    
    constexpr const char* str1 = "Hello";
    constexpr const char* str2 = "Hello";
    constexpr const char* str3 = "World";
    
    constexpr size_t len = string_length(str1);
    constexpr bool equal = string_equal(str1, str2);
    constexpr bool not_equal = string_equal(str1, str3);
    constexpr size_t hash = hash_string("compile_time_hash");
    
    std::cout << "string_length(\"Hello\") = " << len << "\n";
    std::cout << "\"Hello\" == \"Hello\": " << equal << "\n";
    std::cout << "\"Hello\" == \"World\": " << not_equal << "\n";
    std::cout << "hash(\"compile_time_hash\") = " << hash << "\n\n";

    // ========================================
    // 演示 3: 编译期 JSON 解析
    // ========================================
    std::cout << "Demo 3: Compile-Time JSON Parsing\n";
    std::cout << "------------------------------------------------\n";
    
    constexpr auto port = parse_json("8080");
    constexpr auto enabled = parse_json("true");
    
    std::cout << "JSON \"8080\" parsed as int: " << port.as_int() << "\n";
    std::cout << "JSON \"true\" parsed as bool: " << enabled.as_bool() << "\n\n";
    
    static_assert(port.is_int());
    static_assert(port.as_int() == 8080);
    static_assert(enabled.as_bool() == true);

    // ========================================
    // 演示 4: 编译期单位系统
    // ========================================
    std::cout << "Demo 4: Compile-Time Unit System\n";
    std::cout << "------------------------------------------------\n";
    
    constexpr auto distance = 100.0_m;
    constexpr auto time = 10.0_s;
    constexpr auto velocity = distance / time;  // 自动推导为 Velocity
    
    std::cout << "Distance: " << distance.value << " m\n";
    std::cout << "Time: " << time.value << " s\n";
    std::cout << "Velocity: " << velocity.value << " m/s\n";
    
    // 类型安全！以下代码无法编译：
    // auto wrong = distance + time;  // 编译错误：不能将距离和时间相加
    
    constexpr auto mass = 5.0_kg;
    constexpr auto acceleration = velocity / time;
    constexpr auto force = mass * acceleration;  // F = ma
    
    std::cout << "Force: " << force.value << " N (Newton)\n\n";

    // ========================================
    // 演示 5: 编译期排序
    // ========================================
    std::cout << "Demo 5: Compile-Time Sorting\n";
    std::cout << "------------------------------------------------\n";
    
    constexpr std::array<int, 8> unsorted = {64, 34, 25, 12, 22, 11, 90, 88};
    constexpr auto sorted = sort_array(unsorted);
    
    std::cout << "Unsorted: ";
    for (auto x : unsorted) std::cout << x << " ";
    std::cout << "\nSorted:   ";
    for (auto x : sorted) std::cout << x << " ";
    std::cout << "\n\n";

    // ========================================
    // 演示 6: 静态反射
    // ========================================
    std::cout << "Demo 6: Static Reflection\n";
    std::cout << "------------------------------------------------\n";
    
    std::cout << "type_name<int>() = " << type_name<int>() << "\n";
    std::cout << "type_name<float>() = " << type_name<float>() << "\n";
    std::cout << "type_name<double>() = " << type_name<double>() << "\n\n";

    // ========================================
    // 演示 7: 编译期状态机
    // ========================================
    std::cout << "Demo 7: Compile-Time State Machine\n";
    std::cout << "------------------------------------------------\n";
    
    constexpr StateMachine<State::Idle> idle_machine;
    constexpr auto running_machine = idle_machine.start();
    constexpr auto stopped_machine = running_machine.stop();
    
    std::cout << "Can start from Idle? " << idle_machine.can_start() << "\n";
    std::cout << "Can stop from Running? " << running_machine.can_stop() << "\n";
    std::cout << "Can start from Stopped? " << stopped_machine.can_start() << "\n\n";
    
    static_assert(idle_machine.can_start());
    static_assert(running_machine.can_stop());
    static_assert(!stopped_machine.can_start());

    // ========================================
    // 性能对比
    // ========================================
    std::cout << "================================================\n";
    std::cout << "Performance Comparison\n";
    std::cout << "================================================\n\n";
    
    std::cout << "Compile-time vs Runtime:\n";
    std::cout << "------------------------------------------------\n";
    
    // 运行时计算
    auto start = std::chrono::high_resolution_clock::now();
    volatile int runtime_result = 0;
    for (int i = 0; i < 1'000'000; ++i) {
        runtime_result += factorial(10);
    }
    auto end = std::chrono::high_resolution_clock::now();
    auto runtime_ns = std::chrono::duration<double, std::nano>(end - start).count() / 1'000'000;
    
    std::cout << "Runtime factorial(10):      " << runtime_ns << " ns/call\n";
    std::cout << "Compile-time factorial(10): 0 ns/call (no runtime cost!)\n\n";
    
    std::cout << "Benefits of constexpr:\n";
    std::cout << "  1. Zero runtime overhead\n";
    std::cout << "  2. Type safety at compile time\n";
    std::cout << "  3. Catch errors before runtime\n";
    std::cout << "  4. Enable template metaprogramming\n";
    std::cout << "  5. Smaller binary size (no runtime code)\n\n";

    // ========================================
    // 使用场景
    // ========================================
    std::cout << "================================================\n";
    std::cout << "When to Use Constexpr\n";
    std::cout << "================================================\n\n";
    
    std::cout << "✓ Perfect for:\n";
    std::cout << "  - Configuration constants\n";
    std::cout << "  - Lookup tables\n";
    std::cout << "  - Mathematical constants\n";
    std::cout << "  - Type traits and metaprogramming\n";
    std::cout << "  - Static assertions\n";
    std::cout << "  - Compile-time validation\n\n";
    
    std::cout << "✗ Not suitable for:\n";
    std::cout << "  - I/O operations\n";
    std::cout << "  - Dynamic memory allocation (before C++20)\n";
    std::cout << "  - Runtime-only values\n";
    std::cout << "  - Very complex computations (compilation time)\n\n";

    std::cout << "================================================\n";
    std::cout << "Real-World Examples\n";
    std::cout << "================================================\n\n";
    
    std::cout << "1. Embedded Systems:\n";
    std::cout << "   - Lookup tables computed at compile time\n";
    std::cout << "   - Zero runtime initialization cost\n\n";
    
    std::cout << "2. Game Engines:\n";
    std::cout << "   - String hashing for fast lookups\n";
    std::cout << "   - Physics constants\n\n";
    
    std::cout << "3. Cryptography:\n";
    std::cout << "   - S-boxes and permutation tables\n";
    std::cout << "   - Compile-time key expansion\n\n";

    return 0;
}

/* 编译与运行:

基础版本:
  g++ -std=c++20 -O2 constexpr_complete_guide.cpp -o constexpr_demo
  ./constexpr_demo

查看编译期计算效果:
  g++ -std=c++20 -O3 -S constexpr_complete_guide.cpp
  # 查看汇编，constexpr 的值应该是直接嵌入的常量

测试编译时间:
  time g++ -std=c++20 -O2 constexpr_complete_guide.cpp -o constexpr_demo

预期结果:
  - 所有 constexpr 计算在编译期完成
  - 运行时开销为 0
  - 二进制中直接包含计算结果
  - 类型安全在编译期检查

关键特性:
  1. C++11: constexpr 函数
  2. C++14: 放宽 constexpr 限制
  3. C++17: constexpr lambda
  4. C++20: constexpr new/delete
  5. C++23: constexpr 更多 STL

最佳实践:
  1. 默认使用 constexpr（如果可能）
  2. 配合 static_assert 进行编译期检查
  3. 使用 if constexpr 进行编译期分支
  4. 注意编译时间影响
*/
