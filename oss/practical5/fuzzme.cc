#include <algorithm>
#include <cstring>
#include <fstream>
#include <iostream>
#include <string>

#include "fuzzme.h"
#include "message.pb.h"
#include "src/libfuzzer/libfuzzer_macro.h"

const size_t BUFFER_SIZE = 5;
char BUFFER[BUFFER_SIZE];

int FuzzMe(const char *Data, size_t Size) {
  pb::Msg msg;
  std::string s(Data, Size);

  if (!msg.ParseFromString(s)) return -1;

  if (msg.greeting() == "BUG") {
    return msg.greeting().data()[msg.session_id()];
  }

  return 0;
}