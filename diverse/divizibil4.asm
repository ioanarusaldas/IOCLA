%include "io.inc"

;verifica daca un numar este divizibil cu 4

section .text
global CMAIN
CMAIN:
    push ebp
    mov ebp, esp
    
    mov eax, 0xfd110008
    mov ecx, 0x00000001
    
    push eax
    and eax, ecx
    cmp eax, ecx
    je exit
    
    shl ecx,1
    pop eax
    and eax, ecx
    cmp eax, ecx
    je exit
    PRINT_STRING "ESTE DIVIZIBIL CU 4"
    
    
    
exit:
    ;write your code here
    xor eax, eax
    leave
    ret