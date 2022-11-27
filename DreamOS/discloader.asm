
disc_load:
    push dx
    mov ah, 0x02 ; указатель на чтение

    mov al, dh ; кол-во секторов
    mov ch, 0x00 ; Выбрать нулевой цилиндр
    mov dh, 0x00 ; Выбрать нулевую головку
    mov cl, 0x02 ; С какого сектора начинать
    mov dl, 80h

    int 13h ; прерывание чтения диска

    jc disc_error

    pop dx

    cmp dh, al
    jne disc_sectors_error

    jmp disc_success
    jmp disc_exit
disc_success:
    mov bx, success_msg
    call print_string
    jmp disc_exit

disc_error:
    push ax
    mov bx, disc_error_msg
    call print_string
    mov bx, ax
    call print_string
    pop ax
    jmp disc_loop
disc_sectors_error:
    mov bx, disc_sectors_error_msg
	call print_string
disc_loop:
    jmp $
disc_exit:
    ret

success_msg db "Disc was read successfully", 0xA, 0
disc_error_msg db "Disc wasnt read successfully. Disc error", 0
disc_sectors_error_msg db "Disc wasnt read successfully. Sectors error", 0