%include "io.inc"
section .data
    str1: dd "Ana nu trece la iocla",0
    length dd 10
section .bss
    str2: resb 50
section .text
global CMAIN
CMAIN:
    push ebp
    mov ebp,esp
    
    mov eax,str1
    xor edx,edx
parcurgere:
    xor ecx,ecx
    mov cl,byte[eax]
     cmp cl,0
    je done
    ;PRINT_CHAR cl
    ;NEWLINE
    cmp cl,'A'
    je next
    cmp cl,'a'
    je next
    
copy:
    mov byte[str2+edx],cl
    ;PRINT_CHAR cl
     PRINT_CHAR [str2+edx]
    inc edx
  
    
next:
    add eax,1
   ; PRINT_STRING [eax]
    jmp parcurgere
    
    
done:  
  
    PRINT_STRING str2
    NEWLINE
    PRINT_STRING str1
  leave
  ret