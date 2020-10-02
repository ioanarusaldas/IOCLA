%include "io.inc"
%define ARRAY_SIZE    10

section .data
    byte_array db -8, 19, -12, 3, -6, 10, -128, 19, 78, -102
    ;intreaba de 200
    print_pozitiv db "Nr. pozitive: ", 0
    print_negativ db "Nr. negative: ", 0
    
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    mov ecx, ARRAY_SIZE     
    xor eax, eax            
    xor ebx, ebx   
    xor edx, edx 
pozitiv:
    mov al, byte[byte_array+ ecx-1]
    cmp al, 0
    js negativ
    inc ebx
   jmp end
negativ:
     inc edx
end:
    loop pozitiv;
    
     PRINT_STRING print_pozitiv
     PRINT_UDEC 4, ebx
     NEWLINE
     PRINT_STRING print_negativ
     PRINT_UDEC 4, edx
 
    ret