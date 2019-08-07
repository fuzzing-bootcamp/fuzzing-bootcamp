if [[ $FUZZING_ENGINE == "hooks" ]]; then
  # Link ASan runtime so we can hook memcmp et al.
  LIB_FUZZING_ENGINE="$LIB_FUZZING_ENGINE -fsanitize=address"
fi
$CXX $CXXFLAGS $SCRIPT_DIR/target.cc -DCERT_PATH=\"$SCRIPT_DIR/\" BUILD/libssl.a BUILD/libcrypto.a $LIB_FUZZING_ENGINE -I BUILD/include -o find_heartbleed
rm -rf runtime
cp -rf $SCRIPT_DIR/runtime .
