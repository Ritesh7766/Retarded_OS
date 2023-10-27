[org 0x7c00]

mov si, variablename
mov ah, 0x0e
loop:
    mov al, [si]
    cmp al, 0
    je exit
    int 0x10
    inc si
    jmp loop

variablename:
    db "Goose rule the world", 0

exit:
    jmp $
    times 510-($-$$) db 0
    db 0x55, 0xaa  

