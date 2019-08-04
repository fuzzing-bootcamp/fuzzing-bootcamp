afl: fuzzme.cc fuzz_fuzzme_afl.cc
	g++ -c -g fuzzme.cc -o fuzzme.o
	g++ -g fuzzme.o fuzz_fuzzme_afl.cc -o demo-afl


PHONY: clean
clean:
	rm -f demo-afl *.o
