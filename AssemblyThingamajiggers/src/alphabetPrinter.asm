BITS 16
ORG 0x7C00

mov ah, 0x00 ;Video mode
mov al, 0x03 ;text settings
int 0x10 ;clear


mov ah, 0x0E ;teletype mode
mov al, 'A' ;letter A

print:
    int 0x10 ;print what's on al
    inc al ;next char, al++
    mov bl, al; backup current character
    cmp al, 'Z' + 1 ;is al >= Z? if yes, end the program
    je finish
    mov al, bl
    jmp print ;no branching? continue to print. 


finish: 
    hlt 
    jmp $

times 510-($-$$) db 0
dw 0xAA55
