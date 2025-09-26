BITS 16
ORG 0x7C00

; Set video mode once
mov ah, 0x00
mov al, 0x03
int 0x10

mainLoop:
    call frameDelay
    call drawCall
    call updateCall
    jmp mainLoop

updateCall:
    push ax
    push bx

    mov al, [velX]
    mov bl, [velY]
    mov ah, [posX]
    mov bh, [posY]
    add ah, al
    add bh, bl
    mov [posX], ah
    mov [posY], bh

    pop ax
    pop bx
    ret

drawCall:
    ; Set cursor position
    mov ah, 02h
    mov bh, 0
    mov dl, [posX]      ; col
    mov dh, [posY]      ; row
    int 10h

    ; Print character
    mov ah, 0Eh
    mov al, '#'
    mov bh, 0
    mov bl, 07h
    int 10h
    ret

frameDelay:
    pusha
    mov ah, 0x86
    mov cx, 0x0001
    mov dx, 0x86A0
    int 15h
    popa
    ret

posX:
    db 0
posY:
    db 0
velX:
    db 1
velY:
    db 1

times 510-($-$$) db 0
dw 0xAA55
