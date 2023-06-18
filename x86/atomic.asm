; Using atomic instructions in NASM x86_64 Assembly
; Author: Andrew Jarombek
; Date: 6/18/2023

section .data
    ; Example integer value to operate on
    ; The 'dd' directive creates a double word (4 bytes) containing value 42 and stores it in the variable 'value'
    value dd 42

section .text
    ; The 'global' directive makes the label 'main' available to the linker.
    global main

extern __atomix_fetch_add
extern __atomix_fetch_sub

main:
    ; Set the value to add
    mov esi, 5

    ; Load the memory address of the value
    mov edi, value

    ; Invoke __atomix_fetch_add
    call __atomix_fetch_add

    ; After the call, the updated value is stored in [edi]
    ; You can access the updated value and use it as needed

    ; Set the value to subtract
    mov esi, 10

    ; Load the memory address of the value
    mov edi, value

    ; Invoke __atomix_fetch_sub
    call __atomix_fetch_sub

    ; After the call, the updated value is stored in [edi]
    ; You can access the updated value and use it as needed

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

__atomix_fetch_add:
    ; Atomically adds the value in esi to the memory location pointed by rdi.
    ; The lock prefix ensures that the operation is atomic.
    ; The original value stored at the memory location is returned in eax.
    lock xadd [rdi], esi

    ; Doubles the value in esi.
    add esi, esi

    ; Returns control from the function.
    ret

__atomix_fetch_sub:
    ; Atomically subtracts the value in esi from the memory location pointed by rdi.
    ; The lock prefix ensures that the operation is atomic.
    ; The original value stored at the memory location is returned in eax.
    lock xadd [rdi], esi

    ; Negates the value in esi.
    neg esi

    ; Returns control from the function.
    ret
