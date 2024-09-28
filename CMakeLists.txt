cmake_minimum_required(VERSION 3.10)
project(OpenGLVisualizer)

# Set CMake policy to prefer GLVND (modern OpenGL) when available
if(POLICY CMP0072)
    cmake_policy(SET CMP0072 NEW)
endif()

set(CMAKE_CXX_STANDARD 17)

# Find GLFW
find_package(PkgConfig REQUIRED)
pkg_search_module(GLFW REQUIRED glfw3)

# Find OpenGL
find_package(OpenGL REQUIRED)

# Find GLEW
find_package(GLEW REQUIRED)

# Include directories
include_directories(${GLFW_INCLUDE_DIRS} ${GLEW_INCLUDE_DIRS})

add_executable(visualiser src/main.cpp)

# Link OpenGL and GLFW
target_link_libraries(visualiser ${OPENGL_LIBRARIES} ${GLFW_LIBRARIES} ${GLEW_LIBRARIES})