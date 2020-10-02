%include "io.inc"
%define ARRAY_SIZE    10


section .data
    byte_array db 8, 19, 12, 3, 6, 10, 128, 19, 78, 102
    print_pozitiv db "Nr. pare: ", 0
    print_negativ db "Nr. impare: ", 0
    
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    mov ecx, ARRAY_SIZE     
    xor eax, eax            
    xor ebx, ebx   
    xor edx, edx 

par:
    mov al, byte[byte_array+ ecx-1]
    mov bl, 2
    div bl
    test ah, ah
    ;cmp ah, 1
    ;je impar
    jnz impar
    inc edx
    jmp end
impar:
    jmp end
end:
    loop par
    
     PRINT_STRING print_pozitiv
     PRINT_UDEC 4, edx
     NEWLINE
     xor ebx, ebx
     mov ebx, 10
     sub ebx,edx
     PRINT_STRING print_negativ
     PRINT_UDEC 4, ebx
 
    ret