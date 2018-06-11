#!/bin/bash

# compile, link and disassemble
#

if [[ -z "$1" ]]; then echo "missing input c file."; exit 1; fi

# removing the '.c' from the filname
FILE=$(echo $1 | cut -d "." -f1)

echo "compiling ${FILE}.c ..."
gcc -ffreestanding -c ${FILE}.c -o ${FILE}.o

echo "generating printable object representation"
objdump -d ${FILE}.o > ${FILE}.obj

echo "linking ${FILE}.o ..."
ld -o ${FILE}.bin -Ttext 0x0 --oformat ${FILE}.o

echo "disassembling ${FILE}.bin"
ndisasm -b 32 ${FILE}.bin > ${FILE}.dis

ls -lstr ${FILE}.*

echo "done."


