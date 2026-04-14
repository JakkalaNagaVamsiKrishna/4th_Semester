#include <bits/stdc++.h> 
using namespace std;

class Base {
public:
    virtual void show(){}
};

class Derived : public Base {
public:
    void display(){
        cout << "Derived class";
    }
};

int main(){
    double x = 10.5;
    int y = static_cast<int>(x);
    cout << y << endl;

    Base* ptr = new Derived;
    Derived* dptr = dynamic_cast<Derived*>(ptr);

    if(dptr != nullptr){
        dptr->display();
    }else{
        cout << "Conversion failed";
    }

    // const int x = 10;
    // int* p = const_cast<int*>(&x);

    int a = 65;
    char* p = reinterpret_cast<char*>(&a);
    cout << *p;
    return 0;
}