BITS 16
ORG 0x7C00

start:
    xor ax, ax
    mov ds, ax
    mov es, ax
    
    ; Setup stack
    mov ss, ax
    mov sp, 0x7C00
    
    ; Load kernel from disk to 0x1000
    mov ah, 0x02        ; BIOS read sector function
    mov al, 4           ; Number of sectors to read (adjust as needed)
    mov ch, 0           ; Cylinder number
    mov cl, 2           ; Sector number (sectors start at 1, not 0!)
    mov dh, 0           ; Head number
    mov dl, 0x80        ; Drive number (0x80 for first hard disk)
    mov bx, 0x1000      ; ES:BX = destination buffer (0x1000:0x0000)
    mov es, bx
    mov bx, 0x0000
    int 0x13            ; BIOS disk interrupt
    jc disk_error       ; Jump if error (carry flag set)
    
    ; Jump to kernel
    jmp 0x1000:0x0000

disk_error:
    mov si, error_msg
    mov ah, 0x0E
.print_char:
    lodsb
    cmp al, 0
    je .done
    int 0x10
    jmp .print_char
.done:
    hlt
    jmp .done

error_msg db "Disk error!", 0

times 510-($-$$) db 0
dw 0xAA55