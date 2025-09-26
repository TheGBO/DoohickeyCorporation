BITS 16
ORG 0x1000           ; Kernel load address

start_kernel:
    cli
    xor ax, ax
    mov ds, ax
    mov es, ax

    ; Print 'A' 10 times using BIOS teletype
    mov cx, 10
.print_loop:
    mov ah, 0x0e      ; BIOS teletype
    mov al, 'A'
    int 0x10
    loop .print_loop

.halt:
    hlt
    jmp .halt
