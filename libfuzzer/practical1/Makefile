all: demo-read_overflow demo-write_overflow demo-memory_leak

demo-write_overflow: write_overflow.c
	clang $(CFLAGS) -O0 -g $^ -o $@

demo-read_overflow: read_overflow.c
	clang $(CFLAGS) -O0 -g $^ -o $@

demo-memory_leak: memory_leak.c
	clang $(CFLAGS) -O0 -g $^ -o $@

PHONY: clean
clean:
	rm -rf demo-*
