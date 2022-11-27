use16
org 0x7c00



start: 
    mov bp, 0x9000
    mov sp, bp
    
    mov bx, msg_start
    call print_string
    mov bx, 0x9000
    mov dh, 2
    
    call disc_load

    call switch_to_pm
    jmp $
include "gdt.asm"
include "print.asm"
include "discloader.asm"
include "switch.asm"

include "print_vga.asm"

use32
BEGIN_PM:
    mov ebx, msg_prot_mode
    call print_string_pm

 
    jmp $

msg_start db "Bootloader start in 16bit Real mode", 0xA, 0
msg_prot_mode db "Successfully landed in 32bit Protected mode", 0

times 510-($-$$) db 0
dw 0xaa55 

times 256 dw 0xdada					
times 256 dw 0xface