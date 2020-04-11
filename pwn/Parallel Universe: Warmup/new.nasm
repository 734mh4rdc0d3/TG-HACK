;	This program reads an Integer from the user and displays it on the screen
;	readInput.nasm
;	Author: Shubham Kumar


global _start

section .text

	

_start:
	
	mov eax, 0x3
	mov ebx, 0x1
	mov ecx, var1
	mov edx, 0x0a
	int 0x80
	
	mov eax, 0x4
	mov ebx, 0x1
	mov ecx, var1
	mov edx, 0xa
	int 0x80

	mov ebx, eax
	mov eax, 0x4
	mov ecx, var2
	mov edx, 1024
	
	mov eax, 0x1
	mov ebx, 0x4
	int 0x80

section .data

	message: db "Enter a number: ", 0x00
	mlen equ $-message

section .bss
	var1 resb 10
	var2 rest 1024
