
# [C++ OOP from GateSmashers]( https://youtube.com/playlist?list=PLxCzCOWd7aiF6yRNI5OHQsnUJQfl7Geqj&si=SWcht47VGRrPRI7S)

>[!Note] *Classes* : 
members (variables) and methods(functions)

>[!Note] *Access Specifiers* : 

| Access Specifiers | within class | in derived class | outside class |
| ----------------- | ------------ | ---------------- | ------------- |
| Private           | Yes          | No               | No            |
| Protected         | Yes          | Yes              | No            |
| Public            | Yes          | Yes              | Yes           |


>[!Note] *Friend Classes* :
a friend class is a special class that can access private and protected members of another class 

Syntax : 
```cpp
 class X{
 private :
   int a = 5;
   
   friend class Y;
  };
  class Y{
   public:
     void show(X obj){
       cout << obj.a << endl;
     }
  };
```

Here, Y can access the private and protected members of X but not vice versa.

>[!Note] *Friend Function* :
a friend function is a special function that can access private and protected members of another class .

Syntax:
```cpp
class Box{
  int length = 10;
  friend void show(Box);
};
```

here , show function can access all members of Box class .

>[!Note] *Constructors* :
A constructor is a special function of a class that automatically gets invoked / called when an object is created.

1. same name as the class.
2. No return type (not even void).
3. Must be public.

>[!Note] *Destructors*:
A destructor is a special member function in a class that automatically called when an object goes out of scope or is deleted.

It is used to release the resources like memory, files or network connections.
1. same name as the class with ~ (tilde) before it.
2. No parameter, No return type not even void.
3. automatically called when object is destroyed.
4. Only one destructor per class.
5. No overloading allowed.
```cpp
class Demo {
public:
  Demo(){
  //constructor body
  }
  
  ~Demo(){
  //destructor body
  }
}
```

Order of calling when multiple objects are initiated.

 ```cpp
 int main(){   // the order of callig is like a stack
   Demo d1;    // call constructor 1
   Demo d2;    // call constructor 2
               // call destructor 2
               // call destructor 1
   return 0;
 }
 ```

 >[!Note] *Default constructor*:
when you create a copy of an object using another object of the same class , C++ automatically copies the values of all data members - Default copying.

```cpp
class Student{
public:
  int roll;
  string name;
};

int main(){
   student s1;
   s1.roll = 101;
   s1.name = "Amit";
   student s2=s1; //or student s2(s1);
   cout << s2.roll << s2.name;
   // output 101 Amit
}
```

>[!Note] Copy Constructor:
By using this we can select which values should be copied and what should be the value of other members.

```cpp
class Student {
private:
  int roll;
  string name;
public:
  Student(int r, string n){
  roll = r;
  name = n;
  }
  Student(const student &s){
    roll = s.roll;
    name = "";
  }
};
```

> [!Note] *Inheritance*:
Inheritance is a mechanism in OOP that allows one class (derived/child) to acquire the properties & behaviors (data members & member functions) of another class (base / parent).

Any change in base class will be reflected in derived class.

```cpp
class Base{
 // members of Base class 
};

class derived: visibility_mode Base{
  // members of derived class
};
```

```cpp
class Parent{
Public:
  int car;
Protected:
  int money;
Private:
  int secret;
};

class Child: public Parent{
  
};
```

**only affects if security level is increased otherwise no effect.**


>[!Note]  *Types of Inheritance*:

> [!Note] Single Inheritance : A derived class inherits from one base class

```cpp
class Base {
public:
  int add(int a, int b){
     return a+b;
  }
};
class Derived : private Base{
public:
int f1(int a,int b){
   return add(a,b);
}
};
int main(void){
 Derived b1;         // we cannot use b1.add()
 cout << b1.f1(2,3); // because we used visibility private so 
}   // add becomes private and can only be used inside the derived class
```

>[!Note] Multiple Inheritance : A derived class inherits from more than one base class 

```cpp
class A{
public:
  void show(){
  cout << "Show A" << endl;
  }
};
class B{
public:
   void show(){
   cout << "Show B" << endl;
   }
};
class C : public A, public B{
public:
  void show(){
     show()   //A::show() calls the show method in class A same with B
  }
};
int main(){
  C obj;
  obj.show() // A::obj.show() calls the show method in class A
}
```

>[!Note] Multilevel Inheritance : A class inherits from a derived class forming a chain

>[!Note] Heirarchical Inheritance : Multiple classes inherit from a single base class.

>[!Note] Hybrid Inheritance : A combination of two or more types of inheritance.

>[!Note] *Encapsulation* :
Encapsulation means wrapping data(variables) & methods(functions) together into a single unit(class) and controlling access to that data.

>[!Note] *Data Hiding* :
Data hiding is a part of encapsulation where the internal details are hidden from the outside world using access modifiers (private, protected and public).

>[!Note] *Abstraction* :
Abstraction means showing only the essential features of the object while hiding the unnecessary details

>[!N] *Polymorphism* :
Polymorphism in OOPS means "many forms"- the ability of one function, operator, or object to behave differently based on the context.

Compile time polymorphism :
```cpp
class Print {
public :
  void display(int x){
    cout << x;              // either the type or number of parameters should 
  }                         // be different.
  void display(double y){
    cout << y;
  }
};
```
 this is also an example of function overloading.
 
Runtime Polymorphism:

  Method Overriding:
     Method overriding means redefining a function of the base class in the derived class with the same function name, same parameter list, and same return type.
```cpp
class A{
public:
  void show(){
	  cout << "I am Base";
  }
};
class B: public A{
public:
   void show(){
	cout << "I am derived";
   }
};
int main(){
  B b1,b2;
  b1.show(); // outputs "I am derived"
  // to use the show method of the base 
  b2.A::show();
}
```

 *Virtual Function* :
 ```cpp
 class Base {
 public :
   /* virtual */void show(){
     cout << "Show Base";
   }
 };
 class Derived : public Base{
 public:
	 void show(){
	 cout << "Derived show";
	 }
 };
                // before writing virtual infront of function return type 
 int main(){    // the output will be "Show Base" because function overriding 
   Base* ptr;   // is not done 
   Derived d;   // after writing virtual the output will be "Derived show"
   ptr = &d;
   ptr -> show();
 }
 ```
 
>[!Note] *Final Keyword* :
final is mainly used to prevent inheritance (on classes) and to prevent overriding (on virtual functions). In Java, it can be used to make a variable value constant. 


```cpp
// Preventing inheritance
class Base final{
public:
	void show(){
		cout << "Base class";
	}
};
class Derived : public Base { // we already used final keyword so we cannot inherit from the base class
};
```

```cpp
// Preventing overriding
class Base {
public:
	virtual void display() final{
		cout << "Base class";
	}
};
class Derived : public Base {
public : 
	void display(){   // we will get a compile time error because we used final keyword previously 
		cout << "I am Derived";
	}
};
```

