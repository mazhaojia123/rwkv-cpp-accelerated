#!/bin/bash
rm release -r
mkdir release
nvcc --std=c++17 ./storygen.cpp ../../include/rwkv/cuda/rwkv.cu -I../../include -o ./release/storygen

# VERSION="Release"

# mkdir build
# cd build
# cmake ..
# cmake --build . --config ${VERSION}