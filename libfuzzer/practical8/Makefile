all: demo-plain demo-custom
demo-plain: zlib.cc
	clang++ -fsanitize=fuzzer -o $@ -lz $<

demo-custom: zlib.cc
	clang++ -DCUSTOM_MUTATOR -fsanitize=fuzzer -lz -o $@ $<

clean:
	rm -rf demo-*
