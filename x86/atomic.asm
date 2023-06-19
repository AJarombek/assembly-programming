; Using atomic instructions in NASM x86_64 Assembly
; Author: Andrew Jarombek
; Date: 6/18/2023

section .data
    ; Example integer value to operate on
    ; The 'dd' directive creates a double word (4 bytes) containing value 42 and stores it in the variable 'add_value'
    add_value dd 42

    ; Error message to print if the addition assertion fails
    add_error_message db 'Addition assertion failed!', 0

section .text
    ; The 'global' directive makes the label 'main' available to the linker.
    global main

extern __atomic_fetch_add

main:
    ; Set the value to add
    mov esi, 5

    ; Load the memory address of the value
    mov edi, add_value

    ; Invoke __atomic_fetch_add
    call __atomic_fetch_add

    ; After the call, the updated value is stored in [edi]
    ; You can access the updated value and use it as needed

    ; Assertion: Check if the updated value is equal to 47
    cmp dword [edi], 47

    ; Conditional jump instruction that transfers the control flow to the assertion_failed label
    ; if the previous comparison (cmp) resulted in a "not equal" condition.
    jne assertion_failed_add

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

assertion_failed_add:
    ; Assertion failed, handle the failure (e.g., print an error message, exit program with an error code)

    ; Print an error message
    mov eax, 4  ; write system call
    mov ebx, 1  ; file descriptor (stdout)
    mov ecx, sub_error_message
    mov edx, 27 ; message length
    int 0x80

    ; Exit the program with an error code
    mov eax, 1
    xor ebx, ebx
    inc ebx
    int 0x80

__atomic_fetch_add:
    ; Atomically adds the value in esi to the memory location pointed by rdi.
    ; The lock prefix ensures that the operation is atomic.
    ; The original value stored at the memory location is returned in eax.
    lock xadd [rdi], esi

    ; Doubles the value in esi.
    add esi, esi

    ; Returns control from the function.
    ret
