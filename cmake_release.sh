#!/bin/sh

cd ..
INSTALL_PATH=/usr/local/
cd release-build

cmake -G "Ninja" -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_C_COMPILER=clang \
  -DCMAKE_CXX_COMPILER=clang++ \
  -DLLVM_ENABLE_ASSERTIONS=OFF \
  -DLLVM_BUILD_TESTS=OFF \
  -DLLVM_BUILD_EXAMPLES=OFF \
  -DLLVM_INCLUDE_TESTS=OFF\
  -DLLVM_INCLUDE_EXAMPLES=OFF \
  -DLLVM_TARGETS_TO_BUILD="X86" \
  -DBUILD_SHARED_LIBS=OFF \
  -DLLVM_BINUTILS_INCDIR=/usr/include \
  -DCMAKE_INSTALL_PREFIX=$INSTALL_PATH \
  -DLLVM_PARALLEL_LINK_JOBS="2" \
  ../llvm

