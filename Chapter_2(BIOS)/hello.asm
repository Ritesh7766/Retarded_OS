mov ah, 0x0e
mov al, 'A'
int 0x10

loop:
    inc al
    int 0x10
    cmp al, 'Z' - 1
    jle loop

jmp $
times 510-($-$$) db 0
db 0x55, 0xaa