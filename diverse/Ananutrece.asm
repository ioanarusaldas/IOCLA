%include "io.inc"

section .data
    string db "Ana nu trece la iocla", 0
    
section .bss
    string2: resb 30
    
section .text
global CMAIN
CMAIN:
    push ebp
    mov ebp, esp
    mov eax, string
   
    xor edx, edx
  
repetare:
    xor ecx, ecx
    mov cl, byte[eax]
    
    test cl, cl
    je exit
    
    cmp cl, 65
    je next
    
    cmp cl , 97
    je next
    
    mov [string2 + edx], cl
    inc eax
    inc edx
    jmp repetare
    
next:
    inc eax
    jmp repetare


   
exit: 
    PRINT_STRING string2
    ;write your code here
    xor eax, eax
    leave
    ret