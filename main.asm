format BINARY
include "write.asm"

org 0x7c00
use16
_start:
	mov ah, 0x0e
	mov al, 'S'
	mov bh, 0
	mov bl, 0
	int 10h
	call write_str


finish:
	times 510+_start-finish db 0
	db 0x55, 0xAA
