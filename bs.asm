;
; A simple boot sector program that demonstrates addressing.
;

[org 0x7c00]        ; tell NASM where this code will be loaded


mov bx, HELLO_MSG
call print_string

mov bx, GOODBYE_MSG
call print_string

mov dx, 0x12ab
call print_hex

jmp $               ; Hang

%include "print_string.asm"
%include "print_hex.asm"

; Data
HELLO_MSG:
db 'Hello, World !', 0

GOODBYE_MSG:
db 'Goodbye !', 0

			        ; Padding and magic BIOS number.
times 510-($-$$) db 0
dw 0xaa55
