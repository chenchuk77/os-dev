[bits 16]
switch_to_pm:               ; Switch to protected mode
    cli                     ; clear interrupts (ignore all)

    lgdt [gdt_descriptor]   ; Load our global descriptor table, which defines
                            ; the protected mode segments ( e.g. for code and data )
    mov eax, cr0            ; To make the switch to protected mode, need to set
    or  eax, 0x1            ; first bit of CR0 , a control register
    mov cr0, eax


    jmp CODE_SEG:init_pm    ; Make a far jump (new segment) to 32 bit code
                            ; it also forces CPU to flush its cache of pre-fetched and
                            ; real mode decoded instructions, which can cause problems.

[bits 32]
init_pm:                    ; Init registers and the stack once in PM

    mov ax, DATA_SEG        ; in PM old segment from REAL16 mode are meaningless
    mov ds, ax              ; pointing to
    mov es, ax
    mov fs, ax
    mov gs, ax

    mov ebp, 0x90000        ; update stack pointer to top of free space
    mov esp, ebp

    call BEGIN_PM           ; call the PM label