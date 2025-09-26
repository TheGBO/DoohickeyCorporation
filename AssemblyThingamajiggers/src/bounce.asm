BITS 16
ORG 0x7C00

; Initialize
call clearScr      ; clear screen once

mainLoop:
    call drawCall
    call updateCall
    call frameDelay
    jmp mainLoop

; Update ball position & bounce
updateCall:
    ; load position and velocity (1 byte each)
    mov al, [posX]
    mov bl, [posY]

    add al, [velX]
    add bl, [velY]

    ; clamp bottom
    cmp bl, 23
    jle _checkTop
    call clampY
    mov bl, 23         ; prevent going past bottom
    jmp _afterClamp

_checkTop:
    cmp bl, 0
    jge _afterClamp
    call clampY
    mov bl, 0          ; prevent going past top

_afterClamp:
    mov [posX], al
    mov [posY], bl
    ret

; Bounce: reverse Y velocity
clampY:
    neg byte [velY]
    ret

drawCall:
    ; Set cursor position
    mov ah, 02h
    mov bh, 0
    mov dl, [posX]      ; column (0-79)
    mov dh, [posY]      ; row (0-23)
    int 10h

    ; Print character
    mov ah, 0Eh
    mov al, 'o'
    mov bh, 0
    mov bl, 07h
    int 10h
    ret

; Simple frame delay
frameDelay:
    pusha
    mov ah, 86h         ; bios wait function
    mov cx, 0x0001
    mov dx, 0x86A0      ; arouidn 0.1s delay
    int 15h
    popa
    ret

; Clear screen once
clearScr:
    mov ah, 0x00
    mov al, 0x03        ; text mode 80x25
    int 0x10
    ret

; Variables
posX: db 1
posY: db 1
velX: db 1
velY: db 1

; Bootloader padding
times 510-($-$$) db 0
dw 0xAA55
