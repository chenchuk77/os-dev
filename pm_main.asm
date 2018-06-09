;
; A boot sector program that enters 32bit Protected mode
;

[org 0x7c00]                ; tell NASM where this code will be loaded

    mov bp, 0x9000          ; set the stack
    mov sp, bp

    mov bx, MSG_REAL_MODE
    call print_string

    call switch_to_pm       ; never returns
    jmp $

%include "includes/print_string.asm"
%include "includes/print_hex.asm"
%include "includes/gdt.asm"
%include "includes/switch_to_pm.asm"

[bits 32]
BEGIN_PM:                   ; after switching anf initializing protected mode

    mov ebx, MSG_PROT_MODE
    ;call print_string_pm

    jmp $                   ; hang

; Global vars
MSG_REAL_MODE db "Started in 16 - bit Real Mode", 0
MSG_PROT_MODE db "Successfully landed in 32 - bit Protected Mode", 0

; Bootsector padding
times 510 - ($ - $$) db 0
dw 0xaa55