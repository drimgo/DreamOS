
use16
org 0x7c00



start: 
    mov bp, 0x8000
    mov sp, bp
    
    mov bx, msg
    call print_string
    mov bx, 0x9000
    mov dh, 2
    call disc_load

    jmp $

include "print.asm"
include "discloader.asm"


msg db "Bootloader start", 0xA, 0

times 510-($-$$) db 0
dw 0xaa55 

times 256 dw 0xdada					
times 256 dw 0xface