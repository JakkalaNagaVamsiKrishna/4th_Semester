#include <map> 
#include <string> 
#include <memory> 
#include <vector> 
#include <iostream> 
#include <sstream>
#include <fstream> 

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

        if(token == "set"){
            std::string varName = tokens[pos++];

            auto value = parse();
            return std::make_unique<AssignNode>(varName, std::move(value));
        }

        if(token == "add" || token == "mult"){
            auto left = parse();
            auto right = parse();
            return std::make_unique<OpNode>(token, std::move(left), std::move(right));
        }
        
        
        if(isdigit(token[0])){
            return std::make_unique<NumberNode>(std::stoi(token));
        }else{
            return std::make_unique<VariableNode>(token);
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


//function to process each line of an external file
void process_line(std::string line){
    if(line.empty() || line[0] == '#') return;
    try{
        run_nested_dsl(line);
    }catch (const std::exception& e){
        std::cerr << "Runtime Error: " << e.what() << std::endl;
    }
}

int main(int argc, char* argv[]){
    //MODE 1: Script File Execution 
    if(argc > 1){
        std::ifstream file(argv[1]);
        if(file.is_open()){
            std::cerr << "could not open " << argv[1] << std::endl; 
            return 1;
        }
        std::string line;
        while(std::getline(file, line)){
            process_line(line);
        }
    }

    //MODE 2: Interactive REPL 
    else{
        std::cout << "DSL Interactive Shell (type 'exit' to quit)" << std::endl;
        std::string line;
        while(true){
            std::cout << ">>> "; //classic REPL prompt 
            if(!std::getline(std::cin, line) || line == "exit") break;
            process_line(line);
        }
    }
    return 0;
}