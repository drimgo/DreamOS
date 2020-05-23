use64

msg db "Hello, DReamOS", 0xA, 0
len = $-msg

write_str:	
	mov rax, 4
	mov rbx, 1
	mov rcx, msg
	mov rdx, len
	int 0x80
