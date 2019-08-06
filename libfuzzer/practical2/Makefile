SANITIZE_LIB=
SANITIZE_TARGET=
fuzz_target: fuzzme.o fuzzme.cc
	clang++ $(SANITIZE_TARGET) $< fuzz.cc -g -o demo-libfuzzer

fuzzme.o: fuzzme.cc
	clang++ $(SANITIZE_LIB) -c -g $^ -o $@

PHONY: clean
clean:
	rm -f demo-libfuzzer *.o
