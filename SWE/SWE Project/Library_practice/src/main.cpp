#include <iostream> 
#include "Physics/Body.h" 

int main(){
    MyEngine::Body player(0.0f, 0.0f);
    MyEngine::Vector2 velocity(5.0f, 2.5f);

    player.updatePosition(velocity);

    std::cout << "Player moved to : ";
    player.position.print();\

    return 0;
}