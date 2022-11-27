CC = fasm
LIBS = print.asm
LIBS_OBJ = print.o
.PHONY: default compile build run
default: build run
compile: 
	
	fasm boot.asm boot.bin
	
#build: 
#	cat boot.bin print.bin discloader.bin > os.bin