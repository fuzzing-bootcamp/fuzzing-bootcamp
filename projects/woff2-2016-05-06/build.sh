#!/bin/bash
# Copyright 2016 Google Inc. All Rights Reserved.
# Licensed under the Apache License, Version 2.0 (the "License");
. $(dirname $0)/../custom-build.sh $1 $2
. $(dirname $0)/../common.sh

build_fuzzer
for f in font.cc normalize.cc transform.cc woff2_common.cc woff2_dec.cc woff2_enc.cc glyph.cc table_tags.cc variable_length.cc woff2_out.cc; do
  $CXX $CXXFLAGS -std=c++11  -I ../src/BROTLI/dec -I ../src/BROTLI/enc -c ../src/SRC/src/$f &
done
for f in ../src/BROTLI/dec/*.c ../src/BROTLI/enc/*.cc; do
  $CXX $CXXFLAGS -c $f &
done
wait

if [[ $FUZZING_ENGINE == "hooks" ]]; then
  # Link ASan runtime so we can hook memcmp et al.
  LIB_FUZZING_ENGINE="-fsanitize=address"
fi
set -x
$CXX $CXXFLAGS *.o $LIB_FUZZING_ENGINE $SCRIPT_DIR/target.cc -I ../src/SRC/src -o woff2-2016-05-06-fsanitize_fuzzer
