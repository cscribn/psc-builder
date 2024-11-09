#!/bin/bash

# See https://github.com/ckosmic/sm64ex-psc/blob/psc/build_psc.sh

cd /retroarch || exit

TOOLCHAIN="../PSC-CrossCompile-Toolchain/armv8-sony-linux-gnueabihf"
export SYSROOT=${TOOLCHAIN}"/armv8-sony-linux-gnueabihf/sysroot"
export BINPATH=${TOOLCHAIN}"/bin"

export CROSS=${BINPATH}/armv8-sony-linux-gnueabihf-

export CC=${CROSS}gcc
export CXX=${CROSS}g++
export AS=${CROSS}as
export LD=${CROSS}ld
export RANLIB=${CROSS}ranlib
export STRIP=${CROSS}strip
export AR=${CROSS}ar

export LIBS="-L"${SYSROOT}"/usr/lib"
export CFLAGS="-I"${SYSROOT}"/usr/include"
export COMPILER=gcc

make -f Makefile.psclassic retroarch
