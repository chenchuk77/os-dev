
// simple c program
//
// compile with:
// $ gcc -ffreestanding -c basic.c -o basic.o
//
// see object file:
// $ objdump -d basic.o
//
// link with:
// $ ld -o basic.bin -Ttext 0x0 --oformat binary basic.o
//
// disassemble with:
// $ ndisasm -b 32 basic.bin > basic.dis
//
int my_function () {
    return 0xbaba ;
}

/* NOTE: disasm may dump data as commands... only the below code is relevant ...
00000000  55                push ebp
00000001  48                dec eax
00000002  89E5              mov ebp,esp
00000004  B8BABA0000        mov eax,0xbaba
00000009  5D                pop ebp
0000000A  C3                ret
*/
