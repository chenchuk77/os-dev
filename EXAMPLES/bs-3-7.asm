;
; in 16 bit mode , 16 bit = 64K addresses. so using cs/ds/es/ss as base address
; then base*16 + offset ( becomes 2^4 blocks of 2^16 = 2^20 =~ 1MB )
;
; [org 0x7c00]            ; Tell the assembler where this code will be loaded
;                         ; 0x7c00 is the place to load the boot sector
;
; to manually load the program into 0x7c00 (historical reasons, this is where bochs starts...)
; we need to set ds

mov ah, 0x0e            ; prepare for BIOS interrupt call

mov al, [the_secret]    ; will not print, since ds is not set ( the_secret label offsets from ds*16)
int 0x10

mov bx, 0x7c0
mov ds, bx              ; set ds=0x7c0 (will become 0x7c00 when ds=ds*16 when calculate final address)
mov al, [the_secret]    ; will print because ds is now set so the_secret = the_secret + 16*ds = the_secret + 0x7c00
int 0x10

mov al, [es:the_secret] ; not works because es unset
int 0x10

mov bx, 0x7c0           ; this should do
mov es, bx
mov al, [es:the_secret]
int 0x10

mov bx, 5               ;;; unreachable code
jmp $                   ; jump here (hex code: 0xEB 0xFE)

the_secret:             ; "X" = 0x58
  db "X"

times 510-($-$$) db 0   ; 510 - (here-start_of_program) - fill with '0'
dw 0xaa55               ; magic number (end_of_boot_sector)
