#include "Physics/Body.h" 

namespace MyEngine{
    Body::Body(float x, float y): position(x, y) {} 

    void Body::updatePosition(Vector2 velocity){
        position.x += velocity.x;
        position.y += velocity.y;
    }
}