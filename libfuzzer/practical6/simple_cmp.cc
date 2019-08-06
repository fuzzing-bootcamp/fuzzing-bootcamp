#include <string.h>
#include <stdint.h>
#include <stdlib.h>
#include <iostream>
#include <algorithm>

int simple_cmp(char *data, size_t size) {
    if (std::string(data, size) == "asdfghjklqwertyuiopzxcvbnmfdsafsdafsdaaafdsafdsafdsafd") {
        abort();
    }
    return 0;
}

extern "C" int LLVMFuzzerTestOneInput(char *Data, size_t Size) {
    simple_cmp(Data, Size);
    return 0;
}
