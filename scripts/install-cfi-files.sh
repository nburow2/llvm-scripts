#!/bin/bash

#This script softlinks our modified files into the LLVM source tree

#Path to llvm source tree
llvm=`pwd`/llvm
clang=`pwd`/clang
src=`pwd`/src
runtime=`pwd`/compiler-rt
musl=`pwd`/musl/src

#clang codegen
ccg=$clang/lib/CodeGen

#clang driver
cdriver=$clang/lib/Driver

#llvm include
llvminc=$llvm/include/llvm

#llvm codegen
lcg=$llvm/lib/CodeGen

#llvm IR
lir=$llvm/lib/IR

#llvm transforms
ltrans=$llvm/lib/Transforms

#llvm IPO
lipo=$ltrans/IPO

#compiler-rt directory
crtlib=$runtime/lib

rm $lipo/LowerTypeTests.cpp
ln -s $src/LowerTypeTests.cpp $lipo

rm $ccg/CGClass.cpp
ln -s $src/CGClass.cpp $ccg

rm $ccg/ItaniumCXXABI.cpp
ln -s $src/ItaniumCXXABI.cpp $ccg

rm $ccg/MicrosoftCXXABI.cpp
ln -s $src/MicrosoftCXXABI.cpp $ccg

rm $ccg/CodeGenFunction.h
ln -s $src/CodeGenFunction.h $ccg

#rm $lir/Function.cpp
#ln -s $src/Function.cpp $lir
