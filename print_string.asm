;
; function to print a string pointed by BX
;

print_string:
  pusha

next:               ; fetch each char and check if its a terminator
  mov ax, [bx]
  cmp al, 0
  je end_string

print_char:
  mov ah, 0x0e      ; BIOS print func
  int 0x10
  inc bx
  jmp next

end_string:
  popa
  ret