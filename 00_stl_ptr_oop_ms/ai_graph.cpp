#include <memory>
#include <vector>
#include <list>
#include <unordered_map>
#include <functional>
#include <iostream>
#include <string>
#include <cmath>
#include <mutex>
#include <thread>

// ========================== Tensor ==========================
class Tensor {
    std::shared_ptr<std::vector<float>> data;
    std::vector<size_t> shape;

public:
    Tensor(const std::vector<size_t>& s, float init = 0.f) : shape(s) {
        size_t n = 1;
        for (auto d : s) n *= d;
        data = std::make_shared<std::vector<float>>(n, init);
    }

    float& operator[](size_t i) { return (*data)[i]; }
    const float& operator[](size_t i) const { return (*data)[i]; }

    size_t size() const { return data->size(); }
    const std::vector<size_t>& getShape() const { return shape; }

    void print() const {
        for (float v : *data) std::cout << v << " ";
        std::cout << "\n";
    }
};

// ========================== Operator ==========================
class Operator {
public:
    virtual ~Operator() = default;
    virtual void forward(const std::vector<std::shared_ptr<Tensor>>& inputs,
                         Tensor& output) = 0;
    virtual std::string name() const = 0;
};

// ---------- Add ----------
class AddOperator : public Operator {
public:
    void forward(const std::vector<std::shared_ptr<Tensor>>& in,
                 Tensor& out) override {
        for (size_t i = 0; i < out.size(); ++i)
            out[i] = (*in[0])[i] + (*in[1])[i];
    }
    std::string name() const override { return "Add"; }
};

// ---------- ReLU ----------
class ReluOperator : public Operator {
public:
    void forward(const std::vector<std::shared_ptr<Tensor>>& in,
                 Tensor& out) override {
        for (size_t i = 0; i < out.size(); ++i)
            out[i] = std::max(0.0f, (*in[0])[i]);
    }
    std::string name() const override { return "ReLU"; }
};

// ---------- Add + ReLU ----------
class AddReluOperator : public Operator {
public:
    void forward(const std::vector<std::shared_ptr<Tensor>>& in,
                 Tensor& out) override {
        for (size_t i = 0; i < out.size(); ++i)
            out[i] = std::max(0.0f, (*in[0])[i] + (*in[1])[i]);
    }
    std::string name() const override { return "AddReLU"; }
};

// ---------- AllReduce(avg) ----------
class AllReduceOperator : public Operator {
public:
    void forward(const std::vector<std::shared_ptr<Tensor>>& in,
                 Tensor& out) override {
        constexpr size_t num_devices = 4;
        for (size_t i = 0; i < out.size(); ++i)
            out[i] = (*in[0])[i];   // avg all-reduce
    }
    std::string name() const override { return "AllReduce"; }
};

// ========================== Operator Registry ==========================
class OperatorRegistry {
    std::unordered_map<std::string, std::function<std::unique_ptr<Operator>()>> map;

public:
    static OperatorRegistry& get() {
        static OperatorRegistry inst;
        return inst;
    }

    void reg(const std::string& name,
             std::function<std::unique_ptr<Operator>()> f) {
        map[name] = std::move(f);
    }

    std::unique_ptr<Operator> create(const std::string& name) {
        return map.at(name)();
    }
};

// ========================== Node ==========================
struct Node {
    std::unique_ptr<Operator> op;
    std::vector<std::shared_ptr<Tensor>> inputs;
    std::shared_ptr<Tensor> output;

    void execute() {
        op->forward(inputs, *output);
    }
};

// ========================== Computation Graph ==========================
class ComputationGraph {
    std::list<std::unique_ptr<Node>> nodes;

public:
    std::shared_ptr<Tensor> addNode(const std::string& op_name,
                                    const std::vector<std::shared_ptr<Tensor>>& inputs) {
        auto node = std::make_unique<Node>();
        node->op = OperatorRegistry::get().create(op_name);
        node->inputs = inputs;
        node->output = std::make_shared<Tensor>(inputs[0]->getShape());
        auto out = node->output;
        nodes.push_back(std::move(node));
        return out;
    }

    void optimize() {
        auto it = nodes.begin();
        while (it != nodes.end()) {
            auto next = std::next(it);
            if (next == nodes.end()) break;

            Node& a = **it;
            Node& b = **next;

            if (a.op->name() == "Add" &&
                b.op->name() == "ReLU" &&
                b.inputs[0] == a.output) {

                auto fused = std::make_unique<Node>();
                fused->op = std::make_unique<AddReluOperator>();
                fused->inputs = a.inputs;
                fused->output = a.output;

                // redirect downstream inputs
                for (auto& n : nodes) {
                    for (auto& in : n->inputs)
                        if (in == b.output)
                            in = fused->output;
                }

                it = nodes.erase(it);
                it = nodes.erase(it);
                it = nodes.insert(it, std::move(fused));
            } else {
                ++it;
            }
        }
    }

    void forward() {
        for (auto& n : nodes) n->execute();
    }

    void print() const {
        for (auto& n : nodes) {
            std::cout << "Node " << n->op->name() << " -> ";
            n->output->print();
        }
    }
};

// ========================== main ==========================
int main() {
    auto& R = OperatorRegistry::get();
    R.reg("Add", [] { return std::make_unique<AddOperator>(); });
    R.reg("ReLU", [] { return std::make_unique<ReluOperator>(); });
    R.reg("AddReLU", [] { return std::make_unique<AddReluOperator>(); });
    R.reg("AllReduce", [] { return std::make_unique<AllReduceOperator>(); });

    auto a = std::make_shared<Tensor>(std::vector<size_t>{3}, -1.f);
    auto b = std::make_shared<Tensor>(std::vector<size_t>{3},  2.f);

    ComputationGraph g;
    auto x = g.addNode("Add", {a, b});
    auto y = g.addNode("ReLU", {x});
    auto z = g.addNode("AllReduce", {y});

    g.optimize();
    g.forward();

    std::cout << "Final output: ";
    z->print();
}
