cmake_minimum_required(VERSION 3.14)
project(f360in LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 14)

add_executable(${EXECUTABLE_NAME} WIN32
  runner.cpp
)
target_link_libraries(${EXECUTABLE_NAME} PRIVATE flutter flutter_wrapper_app)
