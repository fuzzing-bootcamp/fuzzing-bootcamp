#include <string.h>

int main(int argc, char **argv) {
    int stack_array[5];
    for (int i = 0; i < strlen(argv[1]); i++) {
        stack_array[i] = argv[1][i];
    }
    return 0;
}