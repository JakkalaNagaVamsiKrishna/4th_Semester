// Lexer : Breaks the raw string into meaningful tokens 
// Parser : analyzes the sequence of tokens to understand the intent 
// Evaluator : Executes the command 

#include <iostream> 
#include <string> 
#include <vector> 
#include <sstream> 
#include <map> 

// 1. The Evaluator : Performs the actual logic 
int execute(const std::string& cmd, int a, int b){
    if (cmd == "add") return a + b ;
    if (cmd == "sub") return a - b ;
    if (cmd == "mult") return a * b ;
    return 0;
}

// 2. The Parser/Lexer : Breaks down and processes input 
void run_dsl(const std::string& input){
    std::stringstream ss(input);
    std::string command;
    int arg1, arg2;

    // Tokenizing and basic parsing logic
    if (ss >> command >> arg1 >> arg2){
        int result = execute(command, arg1, arg2);
        std::cout << "DSL Result: " << result << std::endl;
    }else{
        std::cerr << "Syntax Error: Expected format 'command arg1 arg2'" << std::endl;
    }
}

int main(){
    std::string dsl_code;
    std::cout << "Enter DSL Command " ;
}