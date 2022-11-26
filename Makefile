CC = fasm
LIBS = print.asm
LIBS_OBJ = print.o
.PHONY: default compile build run
default: build run
compile: $(LIBS)
	fasm print.asm print.bin
	fasm boot.asm boot.bin
build: boot.asm $(LIBS_OBJ)
	cat boot.bin print.bin > os.bin