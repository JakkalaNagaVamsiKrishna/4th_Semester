#include "Math/Vector2.h" 
#include <iostream> 

namespace MyEngine {
    Vector2::Vector2(float _x, float _y): x(_x), y(_y) {} 

    void Vector2::print() const {
        std::cout << "Vector(" << x << ", " << y << ")" << std::endl;
    }
}