BITS 16
ORG 0x7C00

; Clear screen (scroll up entire window with attribute)
mov ah, 0x00
mov al, 0x03
int 0x10

times 510-($-$$) db 0
dw 0xAA55
