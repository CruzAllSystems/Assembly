section .dat
msg db "Enter a String up to 50 characters", 10
msg_leng equ $ - msg
newline db 10

section .bss
buffer resb 10
length equ $ - buffer ;length of input string

section .text
global _start
_start:

;write 
mov eax, 4
mov ebx, 1
mov ecx, msg
mov edx, msg_leng
int 80h

;read
mov eax, 3
mov ebx, 2
mov ecx, buffer
mov edx, 50
int 80h

;echo
mov eax, 4
mov ebx, 1
mov ecx, buffer
mov edx, 50
int 80h



mov eax, length
mov ebx, buffer



capitalize:
sub BYTE [ebx], 32
inc ebx
dec eax
jnz capitalize


mov edx, length
mov ecx, buffer
mov ebx, 1
mov eax, 4
int 80h

mov edx, 1
mov ecx, newline
mov ebx, 1
mov eax, 4
int 80h


mov eax, length
mov ebx, buffer


mov eax, length
mov ebx, buffer

lowerCase:
add BYTE [ebx], 32
inc ebx
dec eax
jnz lowerCase

mov edx, length
mov ecx, buffer
mov ebx, 1
mov eax, 4
int 80h

mov edx, 1
mov ecx, newline
mov ebx, 1
mov eax, 4
int 80h

mov ebx, 0
mov eax, 1
int 80h

