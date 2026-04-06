#ifndef BODY_H 
#define BODY_H 

#include "Math/Vector2.h" 

namespace MyEngine{
    class Body {
        public:
            Vector2 position;
            Body(float x, float y);
            void updatePosition(Vector2 velocity);
    };
}

#endif 