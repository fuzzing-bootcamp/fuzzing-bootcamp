#!/bin/bash
# Copyright 2016 Google Inc. All Rights Reserved.
# Licensed under the Apache License, Version 2.0 (the "License");
. $(dirname $0)/../custom-build.sh $1 $2
. $(dirname $0)/../common.sh

build_lib() {
  rm -rf BUILD afl
  cp -rf ../src/SRC BUILD
  cp -rf ../src/afl afl
  (cd BUILD && CCLD="$CXX $CXXFLAGS" ./configure && make -j $JOBS)
}

build_lib
build_fuzzer

cp afl/dictionaries/xml.dict .

if [[ $FUZZING_ENGINE == "hooks" ]]; then
  # Link ASan runtime so we can hook memcmp et al.
  LIB_FUZZING_ENGINE="$LIB_FUZZING_ENGINE -fsanitize=address"
fi
set -x
$CXX $CXXFLAGS -std=c++11  $SCRIPT_DIR/target.cc -I BUILD/include BUILD/.libs/libxml2.a $LIB_FUZZING_ENGINE -lz -o libxml-2.9.2-fuzzer
