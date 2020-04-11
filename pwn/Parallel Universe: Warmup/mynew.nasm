section	.text
   global _start    
	
_start:                
   ;open the file for reading
      
   mov eax, 0x3
   mov ebx, 0x1
   mov ecx, file_name
   mov edx, 0xa
   int 0x80


   xor eax, eax
   mov  al, 5
   mov ebx, ecx
   xor ecx, ecx             ;for read only access
   mov edx, 0444          ;read, write and execute by all
   int  0x80
	
   mov  [fd_in], eax
    
   ;read from file
   xor eax, eax
   mov  al, 3
   mov ebx, [fd_in]
   mov ecx, info
   xor edx, edx
   mov  dl, 0x26
   int 0x80
    
   ; close the file
   xor eax,eax
   mov  al, 6
   mov ebx, [fd_in]
   int  0x80    
	
   ; print the info 
   xor eax, eax
   mov  al, 4
   xor ebx, ebx
   mov  bl, 1
   mov ecx, info
   xor edx, edx
   mov  dl, 0x26
   int 0x80
   xor eax,eax
   mov	al,1             ;system call number (sys_exit)
   int	0x80              ;call kernel

section	.data


section .bss
fd_out resb 1
fd_in  resb 1
info resb  38
file_name resb 10
