ORG 0x7c00
BITS 16

start:
    mov ah, 0eh  /* command to print */
    mov ax, 'A' /* arguement to print */
    mov bx, 0 /* set page no. */
    int 0x10 /* interrupt(vudeo teletype output) */

    jmp $


times 510- ($ - $$) db 0  /* Pads the rest of the boot sector with zeros so that the total size becomes exactly 510 bytes */
dw 0xAA55 /* intel machines are little endian */