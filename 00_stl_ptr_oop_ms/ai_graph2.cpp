#include <iostream>
#include <vector>
#include <memory>
#include <list>
#include <unordered_map>
#include <functional>
#include <algorithm>

// ======================= Tensor (move-only, zero-copy) =======================
class Tensor {
public:
    using Buffer = std::vector<float>;

private:
    std::shared_ptr<Buffer> data_;
    std::vector<size_t> shape_;

public:
    explicit Tensor(std::vector<size_t> shape, float init = 0.f)
        : data_(std::make_shared<Buffer>(numel(shape), init)),
          shape_(std::move(shape)) {}

    // move-only
    Tensor(const Tensor&)            = delete;
    Tensor& operator=(const Tensor&) = delete;
    Tensor(Tensor&&)                 = default;
    Tensor& operator=(Tensor&&)      = default;

    float& operator[](size_t i)             { return (*data_)[i]; }
    const float& operator[](size_t i) const { return (*data_)[i]; }

    size_t size() const { return data_->size(); }
    const std::vector<size_t>& shape() const { return shape_; }

    void print() const {
        for (auto v : *data_) std::cout << v << " ";
        std::cout << "\n";
    }

private:
    static size_t numel(const std::vector<size_t>& s) {
        size_t n = 1;
        for (auto d : s) n *= d;
        return n;
    }
};

using TensorPtr = std::shared_ptr<Tensor>;

// ======================= Operator (pure OOP) =======================
class Operator {
public:
    virtual ~Operator() = default;

    virtual void forward(const std::vector<TensorPtr>& inputs,
                         Tensor& output) = 0;

    virtual const char* name() const = 0;
};

// ---------- Add ----------
class AddOp final : public Operator {
public:
    void forward(const std::vector<TensorPtr>& in,
                 Tensor& out) override {
        for (size_t i = 0; i < out.size(); ++i)
            out[i] = (*in[0])[i] + (*in[1])[i];
    }
    const char* name() const override { return "Add"; }
};

// ---------- ReLU ----------
class ReLUOp final : public Operator {
public:
    void forward(const std::vector<TensorPtr>& in,
                 Tensor& out) override {
        for (size_t i = 0; i < out.size(); ++i)
            out[i] = std::max(0.0f, (*in[0])[i]);
    }
    const char* name() const override { return "ReLU"; }
};

// ---------- Add + ReLU (fused) ----------
class AddReLUOp final : public Operator {
public:
    void forward(const std::vector<TensorPtr>& in,
                 Tensor& out) override {
        for (size_t i = 0; i < out.size(); ++i)
            out[i] = std::max(0.0f, (*in[0])[i] + (*in[1])[i]);
    }
    const char* name() const override { return "AddReLU"; }
};

// ---------- AllReduce(avg mock) ----------
class AllReduceOp final : public Operator {
public:
    void forward(const std::vector<TensorPtr>& in,
                 Tensor& out) override {
        // avg all-reduce mock (identity)
        for (size_t i = 0; i < out.size(); ++i)
            out[i] = (*in[0])[i];
    }
    const char* name() const override { return "AllReduce"; }
};

// ======================= Operator Registry =======================
class OpRegistry {
    using Factory = std::function<std::unique_ptr<Operator>()>;
    std::unordered_map<std::string, Factory> map_;

public:
    static OpRegistry& instance() {
        static OpRegistry inst;
        return inst;
    }

    void reg(const std::string& name, Factory f) {
        map_[name] = std::move(f);
    }

    std::unique_ptr<Operator> create(const std::string& name) const {
        return map_.at(name)();
    }
};

// ======================= Node =======================
struct Node {
    std::unique_ptr<Operator> op;
    std::vector<TensorPtr> inputs;
    TensorPtr output;

    void run() {
        op->forward(inputs, *output);
    }
};

// ======================= Computation Graph =======================
class Graph {
    std::list<std::unique_ptr<Node>> nodes_;

public:
    TensorPtr add(const std::string& op,
                  std::vector<TensorPtr> inputs) {
        auto node = std::make_unique<Node>();
        node->op = OpRegistry::instance().create(op);
        node->inputs = std::move(inputs);
        node->output = std::make_shared<Tensor>(node->inputs[0]->shape());
        TensorPtr out = node->output;
        nodes_.push_back(std::move(node));
        return out;
    }

    // Add + ReLU fusion
    void optimize() {
        auto it = nodes_.begin();
        while (it != nodes_.end()) {
            auto nxt = std::next(it);
            if (nxt == nodes_.end()) break;

            Node& a = **it;
            Node& b = **nxt;

            if (std::string(a.op->name()) == "Add" &&
                std::string(b.op->name()) == "ReLU" &&
                b.inputs[0] == a.output) {

                auto fused = std::make_unique<Node>();
                fused->op = std::make_unique<AddReLUOp>();
                fused->inputs = a.inputs;
                fused->output = a.output;

                // redirect downstream uses
                for (auto& n : nodes_) {
                    for (auto& in : n->inputs)
                        if (in == b.output)
                            in = fused->output;
                }

                it = nodes_.erase(it);
                it = nodes_.erase(it);
                it = nodes_.insert(it, std::move(fused));
            } else {
                ++it;
            }
        }
    }

    void forward() {
        for (auto& n : nodes_)
            n->run();
    }
};

// ======================= main =======================
int main() {
    auto& R = OpRegistry::instance();
    R.reg("Add",       [] { return std::make_unique<AddOp>(); });
    R.reg("ReLU",      [] { return std::make_unique<ReLUOp>(); });
    R.reg("AddReLU",   [] { return std::make_unique<AddReLUOp>(); });
    R.reg("AllReduce", [] { return std::make_unique<AllReduceOp>(); });

    TensorPtr a = std::make_shared<Tensor>(std::vector<size_t>{3}, -1.f);
    TensorPtr b = std::make_shared<Tensor>(std::vector<size_t>{3},  2.f);

    Graph g;
    auto x = g.add("Add",       {a, b});
    auto y = g.add("ReLU",      {x});
    auto z = g.add("AllReduce", {y});

    g.optimize();
    g.forward();

    std::cout << "Final output: ";
    z->print();
}
