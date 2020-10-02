%include "io.inc"

section .text
global CMAIN
CMAIN:
    ;cele doua multimi se gasesc in eax si ebx
    mov eax, 139 ; 7 3 1 0
    mov ebx, 169 ;7 5 3 0
    PRINT_DEC 4, eax ; afiseaza prima multime
    NEWLINE
    PRINT_DEC 4, ebx ; afiseaza cea de-a doua multime
    NEWLINE
    
    mov ecx, eax
    or ecx,ebx
    PRINT_STRING "reuniune: "
    PRINT_DEC 4, ecx 
    NEWLINE ; TODO1: reuniunea a doua multimi
    
    or ecx, 20
    PRINT_STRING "multime dupa adaugare element: "
    PRINT_DEC 4, ecx 
    
    mov ecx, eax
    and ecx, ebx
    NEWLINE
    PRINT_STRING "intersectie: "
    PRINT_DEC 4, ecx 
    
    mov ecx, eax
    not ecx
    NEWLINE
    PRINT_STRING "multimea nr lipsa: "
    PRINT_DEC 4, ecx 
    
    mov ecx, eax
    and ecx, 254
    NEWLINE
    PRINT_STRING "prima multime fara 0: "
    PRINT_DEC 4, ecx 
    
    mov ecx, eax
    and ecx, ebx
    not ecx
    and eax, ecx
    NEWLINE
    PRINT_STRING "diferenta: "
    PRINT_DEC 4, ecx 

    xor eax, eax
    ret
