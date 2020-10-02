%include "io.inc"

section .text
global CMAIN
CMAIN:
    push ebp
    mov ebp, esp

    mov eax, 211    ; to be broken down into powers of 2
    mov ebx, 1      ; stores the current power

    ; TODO - print the powers of 2 that generate number stored in EAXte
power:
    test al, bl
    jz zero
    
    PRINT_UDEC 4, bl
    NEWLINE
    sub al, bl
zero:
    test al, al
    jz finish
    shl bl, 1
    jmp power;
finish:
    leave
    ret
