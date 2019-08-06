demo-corpus: fuzz.cc
	clang++ -fsanitize=address,fuzzer -o $@ $<
clean:
	rm -rf demo-corpus
