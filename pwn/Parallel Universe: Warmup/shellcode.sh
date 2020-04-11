#!/bin/bash
echo '[-] 32-Bit Assembly to Shellcode converter '
echo ''
echo ''
echo '[+] Assembling with Nasm ... '
nasm -f elf64 -o $1.o $1.nasm
echo '[+] Linking ...'
ld  -o $1 $1.o
echo ''
echo '[+] Generating shellcode ...'
for i in $(objdump -d ./$1 |grep "^ " |cut -f2); do echo -n '\x'$i >> sc.txt; done; echo
cat sc.txt
echo''
echo '[+] Checking for null bytes ...'
cat sc.txt |grep 00
rm sc.txt
echo ''
echo '[+] Done.'
objdump -d $1 -M intel
