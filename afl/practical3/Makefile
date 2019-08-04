all: fuzz-parse-command

fuzz-parse-command: lib-static fuzz_parse_command.c
	AFL_HARDEN=1 afl-gcc fuzz_parse_command.c libtest.a -o fuzz-target-parse

lib-static: mylibrary.c
	AFL_HARDEN=1 afl-gcc -c mylibrary.c -o mylibrary.o
	ar rcs libtest.a mylibrary.o

lib-shared: mylibrary.c
	AFL_HARDEN=1 afl-gcc -fPIC -shared mylibrary.c -o libMylib.so

PHONY: clean
clean:
	rm -f fuzz-target-* *.o *.a *.so