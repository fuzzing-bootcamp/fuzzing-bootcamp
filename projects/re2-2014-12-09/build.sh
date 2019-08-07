#!/bin/bash
# Copyright 2017 Google Inc. All Rights Reserved.
# Licensed under the Apache License, Version 2.0 (the "License");
. $(dirname $0)/../custom-build.sh $1 $2
. $(dirname $0)/../common.sh

CXXFLAGS="${CXXFLAGS} -std=gnu++98"

build_lib() {
  rm -rf BUILD
  cp -rf ../src/SRC BUILD
  (cd BUILD && make clean &&  make -j)
}

build_lib
build_fuzzer

if [[ $FUZZING_ENGINE == "hooks" ]]; then
  # Link ASan runtime so we can hook memcmp et al.
  LIB_FUZZING_ENGINE="$LIB_FUZZING_ENGINE -fsanitize=address"
fi
set -x
$CXX $CXXFLAGS ${SCRIPT_DIR}/target.cc  -I BUILD/ BUILD/obj/libre2.a -lpthread $LIB_FUZZING_ENGINE -o $EXECUTABLE_NAME_BASE
