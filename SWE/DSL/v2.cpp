#include <map> 
#include <string> 
#include <memory> 
#include <vector> 
#include <iostream> 
#include <sstream>

// Global memory for our DSL 
std::map<std::string, int> symbolTable;

struct Node {
    virtual ~Node() = default;
    virtual int evaluate() = 0;
};

// New Node : Looks up a variable name in the symbol table 
struct VariableNode : Node {
    std::string name;
    VariableNode(std::string n) : name(n){}
    int evaluate() override {
        if(symbolTable.find(name) != symbolTable.end()){
            return symbolTable[name];
        }
        std::cerr << "Error : Undefined variable '" << name << "' \n";
        return 0;
    }
};

struct NumberNode : Node {
    int value;
    NumberNode(int v) : value(v) {}
    int evaluate() override {return value;}
};


// To handle assignment of variables 
struct AssignNode : Node {
    std::string varName;
    std::unique_ptr<Node> valueNode;

    AssignNode(std::string name, std::unique_ptr<Node> val):varName(name), valueNode(std::move(val)){}

    int evaluate() override {
        int value = valueNode -> evaluate();
        symbolTable[varName] = value;
        return value;
    }
};

// To handle add mult operations 
struct OpNode : Node {
    std::string op;
    std::unique_ptr<Node> left;
    std::unique_ptr<Node> right;

    OpNode(std::string o, std::unique_ptr<Node> l, std::unique_ptr<Node> r): op(o), left(std::move(l)), right(std::move(r)){}

    int evaluate() override {
        if(op == "add") return left->evaluate() + right->evaluate();
        if(op == "mult") return left->evaluate() * right->evaluate();
        return 0;
    }
};


// parser using a simple recursive descent approach 
class Parser {
    std::vector<std::string> tokens;
    size_t pos = 0;

public: 
    Parser(const std::vector<std::string>& t): tokens(t){}

    std::unique_ptr<Node> parse(){
        const std::string& token = tokens[pos++];

        if(token == "add" || token == "mult"){
            auto left = parse();
            auto right = parse();
            return std::make_unique<OpNode>(token, std::move(left), std::move(right));
        }else{
            return std::make_unique<NumberNode>(std::stoi(token));
        }
    }
};

void run_nested_dsl(const std::string& input){
    // Basic Lexer: split by space 
    std::stringstream ss(input);
    std::string t;
    std::vector<std::string> tokens;
    while(ss >> t) tokens.push_back(t);

    if(tokens.empty())return;

    Parser p(tokens);
    auto root = p.parse();
    std::cout << "AST Result: " << root->evaluate() << std::endl;
}

int main(){
    //Input: "add 10 mult 2 3" translates to 10 + (2*3) 
    std::string code = "mult 10 mult 2 3";
    std::cout <<"Executing: " << code << std::endl;
    run_nested_dsl(code);
    return 0;
}