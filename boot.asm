ORG 0
BITS 16
_start:
    jmp short start
    nop

times 33 db 0 ; for bios parameter block

start:
    jmp 0x7c0:step2

step2:
    cli ; clear interrupts
    mov ax, 0x7c0
    mov ds, ax ; data segment
    mov es, ax ; extra segment
    mov ax, 0x7c00;
    mov ss, ax
    mov sp, 0

    sti ; enable interrupts
    mov si, message
    call print
    jmp $

print:
    mov bx, 0
.loop:
    lodsb
    cmp al, 0
    je .done
    call print_char
    jmp .loop
.done:
    ret

print_char:
    mov ah, 0eh
    int 0x10
    ret

message: db 'Hello World!', 0

times 510-($ - $$) db 0
dw 0xAA55