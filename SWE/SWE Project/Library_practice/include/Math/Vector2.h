#ifndef VECTOR2_H 
#define VECTOR2_H 

namespace MyEngine {
    struct Vector2 {
        float x, y;
        Vector2(float _x, float _y);
        void print() const;
    };
}

#endif 