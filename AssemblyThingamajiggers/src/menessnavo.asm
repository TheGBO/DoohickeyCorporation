BITS 16
ORG 0x7C00

; Clear screen (scroll up entire window with attribute)
mov ah, 0x00
mov al, 0x03
int 0x10

_print:
    mov ah, 0x0e
    mov si, 0
_printch: ; print character
    mov al, [msg + si]
    int 0x10
    inc si ; incrementar
    cmp byte [msg + si], 0
    jne _printch
jmp $

msg:
    db "MENES ESNAVO" ,0 
    ; 0
times 510-($-$$) db 0
dw 0xAA55
