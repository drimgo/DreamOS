print_string:
    pusha
    mov ah, 0x0e

loop_cycl:
    mov al, [bx]
    cmp al, 0
    je return

    jmp print_char

print_char:
    int 10h
    inc bx
    jmp loop_cycl

return:
    popa
    ret

