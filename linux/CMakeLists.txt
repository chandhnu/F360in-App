cmake_minimum_required(VERSION 3.10)
project(f360in LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 14)

add_executable(${EXECUTABLE_NAME}
  main.cc
)

target_link_libraries(${EXECUTABLE_NAME} PRIVATE flutter)
