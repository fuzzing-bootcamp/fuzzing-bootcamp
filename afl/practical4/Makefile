afl: fuzzme.cc fuzz_fuzzme_afl.cc
	AFL_HARDEN=1 afl-g++ -c -g fuzzme.cc -o fuzzme.o
	AFL_HARDEN=1 afl-g++ -g fuzzme.o fuzz_fuzzme_afl.cc -o demo-afl


PHONY: clean
clean:
	rm -f demo-afl *.o
