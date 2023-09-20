; Performing basic arithmetic in NASM x86_64 Assembly
; Author: Andrew Jarombek
; Date: 9/20/2023

section .data
    num1 dd 5
    num2 dd 10
    expected dd 16
    result dd 0

    ; Error message to print if the addition assertion fails
    add_error_message db 'Addition assertion failed!', 0

section .text
    global main

main:
    mov eax, [num1]
    mov ebx, [num2]

    ; Perform addition
    add eax, ebx

    ; Store the result in the result variable
    mov [result], eax

    ; Assert that the result is equal to the expected value
    cmp eax, [expected]
    jne add_error

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

add_error:
    ; Assertion failed, handle the failure.
    ; Print an error message
    mov eax, 4  ; write system call
    mov ebx, 1  ; file descriptor (stdout)
    mov ecx, add_error_message
    mov edx, 27 ; message length
    int 0x80

    ; Exit the program with an error code
    mov eax, 1
    xor ebx, ebx
    inc ebx
    int 0x80
