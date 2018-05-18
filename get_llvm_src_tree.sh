#!/bin/bash

version=6.0.0

#get LLVM
wget --retry-connrefused --tries=100 releases.llvm.org/$version/llvm-$version.src.tar.xz
tar -xf llvm-$version.src.tar.xz
mv llvm-$version.src llvm
rm llvm-$version.src.tar.xz

#get Clang
wget --retry-connrefused --tries=100 releases.llvm.org/$version/cfe-$version.src.tar.xz
tar -xf cfe-$version.src.tar.xz
mv cfe-$version.src clang
rm cfe-$version.src.tar.xz

#get Clang-extra tools
wget --retry-connrefused --tries=100 releases.llvm.org/$version/clang-tools-extra-$version.src.tar.xz
tar -xf clang-tools-extra-$version.src.tar.xz
mv clang-tools-extra-$version.src extra
rm clang-tools-extra-$version.src.tar.xz

#get lld
wget --retry-connrefused --tries=100 releases.llvm.org/$version/lld-$version.src.tar.xz
tar -xf lld-$version.src.tar.xz
mv lld-$version.src lld
rm lld-$version.src.tar.xz

#get polly
wget --retry-connrefused --tries=100 releases.llvm.org/$version/polly-$version.src.tar.xz
tar -xf polly-$version.src.tar.xz
mv polly-$version.src polly
rm polly-$version.src.tar.xz

#get compiler-rt
wget --retry-connrefused --tries=100 releases.llvm.org/$version/compiler-rt-$version.src.tar.xz
tar -xf compiler-rt-$version.src.tar.xz
mv compiler-rt-$version.src compiler-rt
rm compiler-rt-$version.src.tar.xz

#get lldb
wget --retry-connrefused --tries=100 releases.llvm.org/$version/lldb-$version.src.tar.xz
tar -xf lldb-$version.src.tar.xz
mv lldb-$version.src lldb
rm lldb-$version.src.tar.xz

#get libc++
wget --retry-connrefused --tries=100 releases.llvm.org/$version/libcxx-$version.src.tar.xz
tar -xf libcxx-$version.src.tar.xz
mv libcxx-$version.src libcxx
rm libcxx-$version.src.tar.xz

#get libc++abi
wget --retry-connrefused --tries=100 releases.llvm.org/$version/libcxxabi-$version.src.tar.xz
tar -xf libcxxabi-$version.src.tar.xz
mv libcxxabi-$version.src libcxxabi
rm libcxxabi-$version.src.tar.xz

#get libunwind
wget --retry-connrefused --tries=100 releases.llvm.org/$version/libunwind-$version.src.tar.xz
tar -xf libunwind-$version.src.tar.xz
mv libunwind-$version.src libunwind
rm libunwind-$version.src.tar.xz


#Set up llvm, clang, compiler-rt, lldb, libs for inline build 
cd clang/tools
ln -s ../../extra
cd ../..
cd llvm/tools
ln -s ../../clang .
ln -s ../../lldb .
ln -s ../../lld . 
ln -s ../../polly . 
cd ../projects
ln -s ../../compiler-rt .
ln -s ../../libunwind .
ln -s ../../libcxxabi .
ln -s ../../libcxx .
cd ../..

