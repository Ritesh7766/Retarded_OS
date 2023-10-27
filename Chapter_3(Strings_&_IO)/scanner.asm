[org 0x7c00]

mov bx, buffer

input:
    mov ah, 0
    int 0x16
    mov ah, 0x0e
    int 0x10
    cmp al, 13
    je new_line
    mov [bx], al
    inc bx
    jmp input

new_line:
    mov ah, 0x0e
    mov al, 13
    int 0x10
    mov al, 10
    int 0x10

print:
    mov byte [bx + 1], 0
    mov bx, buffer
    loop:
        mov al, [bx]
        cmp al, 0
        je exit
        int 0x10
        inc bx
        jmp loop

buffer:
    times 10 db 0

exit:
    jmp $
    times 510-($-$$) db 0
    db 0x55, 0xaa
