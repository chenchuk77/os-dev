;
; function to print hex representation (str) of DX
;

print_hex:
  pusha
  mov bx, 5

next_char:
  mov ax, dx        ; get the value
  and ax, 0000000000001111b        ; mask
  cmp al, 9         ; need to check if 0123456789 or ABCDEF
  jle a_number

a_letter:
  add al, 55        ; ASCII(65) = A [need to add 55 because A=10]
  jmp add_char

a_number:
  add al, 48        ; ASCII(48) = 0

add_char:
  mov [HEX_OUT+bx], al
  shr dx, 4         ; next digit (shift right 4 bits)
  dec bx
  cmp bx, 1
  jne next_char

print:
  mov bx, HEX_OUT
  call print_string
  popa
  ret

; DATA
HEX_OUT: db '0x0000', 0

