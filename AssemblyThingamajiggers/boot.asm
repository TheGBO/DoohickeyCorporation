BITS 16
;ORG 0x7C00
global clearScreen
global start
global printX

start:
    call clearScreen
    call printX
.halt:
    hlt
    jmp .halt

; Clear screen (scroll up entire window with attribute)
clearScreen:
    pusha
    mov ah, 0x00
    mov al, 0x03
    int 0x10
    popa
    ret

printX:
    pusha
    mov ah, 0x0e
    mov al, 'X'
    int 0x10
    popa
    ret

times 510-($-$$) db 0
dw 0xAA55
