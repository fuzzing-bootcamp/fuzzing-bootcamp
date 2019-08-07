//
// Created by Code Intelligence
//
#include <string>

#include "fuzzme.h"
#include "message.pb.h"
#include "src/libfuzzer/libfuzzer_macro.h"

protobuf_mutator::protobuf::LogSilencer log_silencer;

#define PROTOBUF_MUTATOR 0

#ifdef PROTOBUF_MUTATOR

// your fuzz target here 

#else

extern "C" int LLVMFuzzerTestOneInput(const char *Data, size_t Size) {
  FuzzMe(Data, Size);
  return 0;
}

#endif
