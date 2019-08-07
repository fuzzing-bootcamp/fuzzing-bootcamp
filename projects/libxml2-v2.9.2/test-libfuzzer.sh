#!/bin/bash
# Copyright 2016 Google Inc. All Rights Reserved.
# Licensed under the Apache License, Version 2.0 (the "License");
set -x
. $(dirname $0)/../common.sh

 rm -rf $CORPUS
mkdir $CORPUS
[ -e libxml-2.9.2-fuzzer ] && ./libxml-2.9.2-fuzzer -artifact_prefix=$CORPUS/ -jobs=$JOBS -dict=afl/dictionaries/xml.dict -workers=$JOBS $CORPUS -max_len=64
grep "AddressSanitizer: heap-buffer-overflow\|ERROR: LeakSanitizer: detected memory leaks" fuzz-0.log
