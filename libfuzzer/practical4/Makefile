export AFL_USE_ASAN=1

demo-afl-persistent: fuzzme.o fuzz.cc
	afl-clang-fast++ -g $^ -o $@

fuzzme.o: fuzzme.cc
	afl-clang-fast++ -c -g -o $@ $^

PHONY: clean
clean:
	rm -rf demo-afl-persistent *.o
