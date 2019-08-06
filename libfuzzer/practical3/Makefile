demo-afl: fuzz.cc fuzzme.o
	afl-g++ $(CXXFLAGS) -g -o $@ $^

fuzzme.o: fuzzme.cc
	afl-g++ $(CXXFLAGS) -c -g -o $@ $^

PHONY: clean
clean:
	rm -f demo-afl *.o
