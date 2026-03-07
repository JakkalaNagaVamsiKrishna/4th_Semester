cmake_minimum_required(VERSION 3.20)
project(MyDSL LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)

include(FetchContent)
FetchContent_Declare(
    Catch2
    GIT_REPOSITORY https://github.com/catchorg/Catch2.git
    GIT_TAG        v3.5.2
)
FetchContent_MakeAvailable(Catch2)


# Organize out code into a library for testing 
add_subdirectory(src)

enable_testing()
add_subdirectory(tests) 