#!/bin/bash

#Use `svn info` to find revision number
REVISION=330642

if [ -d llvm ]
then
  cd llvm
  svn up -r $REVISION
  cd ..
else
  svn co -r $REVISION http://llvm.org/svn/llvm-project/llvm/trunk llvm
fi 

if [ -d clang ]
then
  cd clang
  svn up -r $REVISION
  cd ..
else
  svn co -r $REVISION http://llvm.org/svn/llvm-project/cfe/trunk clang
fi

if [ ! -d llvm/tools/clang ]
then
  ln -s `pwd`/clang llvm/tools/
fi

if [ -d extra ]
then
  cd extra
  svn up -r $REVISION
  cd ..
else
  svn co -r $REVISION http://llvm.org/svn/llvm-project/clang-tools-dxtra/trunk extra
fi

if [ ! -d llvm/tools/clang/tools/extra ]
then
  ln -s `pwd`/extra llvm/tools/clang/tools
fi

if [ -d lld ]
then
  cd lld
  svn up -r $REVISION
  cd ..
else
  svn co -r $REVISION http://llvm.org/svn/llvm-project/lld/trunk lld
fi

if [ ! -d llvm/tools/lld ]
then
  ln -s `pwd`/lld llvm/tools
fi

if [ -d polly ]
then
  cd polly
  svn up -r $REVISION
  cd ..
else
  svn co -r $REVISION http://llvm.org/svn/llvm-project/polly/trunk polly
fi

if [ ! -d llvm/tools/polly ]
then
  ln -s `pwd`/polly llvm/tools
fi 

if [ -d compiler-rt ]
then
  cd compiler-rt
  svn up -r $REVISION
  cd ..
else
  svn co -r $REVISION http://llvm.org/svn/llvm-project/compiler-rt/trunk compiler-rt
fi

if [ ! -d llvm/projects/compiler-rt ]
then
  ln -s `pwd`/compiler-rt llvm/projects
fi

./scripts/install-cfi-files.sh

if [ ! -d debug-build ]
then
mkdir debug-build
fi

if [ ! -d release-build ]
then
mkdir release-build
fi 

cd debug-build
../scripts/cmake_debug.sh

cd ../release-build
../scripts/cmake_release.sh
