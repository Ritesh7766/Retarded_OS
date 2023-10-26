mov bl, 32
mov bh, 0
mov ah, 0x0e
mov al, 'A'
int 0x10

loop:
    add al, bl
    inc al
    inc bh
    int 0x10
    neg bl
    cmp bh, 24
    jle loop

jmp $
times 510-($-$$) db 0
db 0x55, 0xaa