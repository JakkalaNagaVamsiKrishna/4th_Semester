#include<bits/stdc++.h> 
using namespace std;

int main(){
    vector<string> types = {"KHEL", "AAOO", "VAR", "ON_KEY", "LOOP", "SET", "IF", "TATA", "TOKKOR", "DOT", "PLUS", "STAR", "MINUS", "LESS", "MORE", "IDF", "INT" };
    for(auto x: types){
        cout << "| { kind = " << x << "; text; lit_val } -> " << endl;
        cout << "\"" << x << "\" ^ text ^ \" \" ^ lit_val ^ \"\\n\"^ print_tokens rest_toks" << endl;
        cout << endl;
    }
    return 0;
}