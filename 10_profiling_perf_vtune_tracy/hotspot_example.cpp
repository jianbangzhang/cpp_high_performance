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