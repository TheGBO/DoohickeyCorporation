BITS 16
ORG 0x7C00


; Clear screen (scroll up entire window with attribute)
mov ah, 0x00
mov al, 0x03
int 0x10

mov si, 0
mov cl, 10
     
theloop:
    call print
    dec cl
    cmp cl, 0
    jne theloop

jmp $ ; Do nothing                         
;functions
print:
    mov ah, 0x0e  
    mov si, 0
    mov byte [spaces], 20
_putspace:
    mov al, ' '
    int 0x10
    dec byte [spaces]
    cmp byte [spaces], 0
    jne _putspace
_printchar:
; Teletype mode
; Character that will be printed            
    mov al, [msg + si]        
; Bios call to print character
    int 0x10          
; Next character        
    add si, 1      
; Null terminated thingy           
    cmp byte [msg + si], 0    
; Continue 
    jne _printchar
    ret 

; DATA
; Memory definition of the string
msg:
    db "Haiiii :3 >_< hewwo ^^ hiiiii x3", 0x0D, 0x0A, 0
spaces:
    db 0

; Magic number
times 510-($-$$) db 0
dw 0xAA55
