demo-simple-cmp-fail: simple_cmp.cc
	clang++ -fsanitize=address -fsanitize-coverage=bb,trace-pc /usr/lib/clang/6.0.1/lib/linux/libclang_rt.fuzzer-x86_64.a $< -o $@

demo-simple-cmp: simple_cmp.cc
	clang++ $< -o $@

mylib.o: mylibrary.c
	clang -c -fsanitize=address -fsanitize-coverage=bb,trace-pc $< -o $@

demo-mylib: mylib.o fuzz_mylib.cc
	clang++ -fsanitize=address -fsanitize-coverage=bb,trace-pc /usr/lib/clang/6.0.1/lib/linux/libclang_rt.fuzzer-x86_64.a  $^ -o $@

.PHONY: clean
clean:
	rm -rf *.o demo-*
