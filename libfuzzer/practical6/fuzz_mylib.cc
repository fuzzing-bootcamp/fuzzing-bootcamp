extern "C" {
#include "mylibrary.h"
}

extern "C" int LLVMFuzzerTestOneInput(char *Data, size_t Size) {
    parse_command(Data, Size);
    return 0;
}
