; Read some sectors from the boot disk using our disk_read function

[org 0x7c00]

    mov [BOOT_DRIVE], dl        ; BIOS stores boot drive in DL

    mov bp, 0x8000
    mov sp, bp                  ; Set stack safely to 0x8000

    mov bx, 0x9000              ; Load 5 sectors to 0x0000 (ES):0x9000 (BX)
    mov dh, 5                   ; from the boot disk.
    mov dl, [BOOT_DRIVE]
    call disk_load

    mov dx, [0x9000]            ; Print first loaded word (0xdada at address 0x9000)
    call print_hex

    mov dx, [0x9000 + 512]      ; Print the first word from 2nd loaded sector (0xface)
    call print_hex

    jmp $

%include "print_string.asm"     ; reusing functions
%include "print_hex.asm"
%include "disk_load.asm"

; Global variables
BOOT_DRIVE: db 0                ; Bootsector padding
times 510 -($ - $$) db 0
dw 0xaa55

times 256 dw 0xdada             ; BIOS loadS only the first 512 byte sector from disk.
times 256 dw 0xface             ; adding 2 blocks of 512 bytes (should NOT be overwritten !)