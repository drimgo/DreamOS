
use16
org 0x7c00

start: 
    mov bx, msg
    call print_string

    jmp $


include "print.asm"
msg db "Bootloader start", 0

times 510-($-$$) db 0
dw 0xaa55 