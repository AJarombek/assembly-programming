; Guess the number game in NASM x86_64 Assembly
; Author: Andrew Jarombek
; Date: 10/1/2023

section .data
    number dd 62 ; The number to guess

section .text
    global main

main:
    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80
