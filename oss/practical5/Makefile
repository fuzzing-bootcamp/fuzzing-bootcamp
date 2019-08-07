CXX          = clang++
PROTOC       = protoc

CXXFLAGS     = -fsanitize=fuzzer,address -Wall -O1 -g
CXXFLAGS    += `pkg-config --cflags protobuf`
CXXFLAGS    += -Ilibprotobuf-mutator
LDFLAGS      = `pkg-config --libs protobuf`

BIN    = fuzz
PROTOS = message.pb.cc

all: $(PROTOS) $(BIN)

LIB_FUZZER_MUTATOR_OBJ = $(patsubst %.cc, libprotobuf-mutator/src/libfuzzer/%.o, libfuzzer_macro.cc libfuzzer_mutator.cc)
PROTOBUF_MUTATOR_OBJ   = $(patsubst %.cc, libprotobuf-mutator/src/%.o, binary_format.cc mutator.cc text_format.cc utf8_fix.cc)

OBJ = fuzzme.o fuzz.o message.pb.o $(LIB_FUZZER_MUTATOR_OBJ) $(PROTOBUF_MUTATOR_OBJ)

message.pb.h: message.proto
	$(PROTOC) --cpp_out . $^
message.pb.cc: message.proto
	$(PROTOC) --cpp_out . $^

$(BIN): $(OBJ)
	$(CXX) $(CXXFLAGS) $(LDFLAGS) $^ -o $@

%.o: %.cc
	$(CXX) $(CXXFLAGS) -c $^ -o $@

PHONY: clean
clean:
	rm -f $(BIN) message.pb.cc message.pb.h
	find . -name '*.o' | xargs rm
