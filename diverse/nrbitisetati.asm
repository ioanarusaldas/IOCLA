%include "io.inc"
section .text
section .data
    val1 dd 0xfd110008
    val2 dd 0x0fff8888
    vect dd 0xfd110008,0x0fff8888
    length dd 2
global CMAIN
CMAIN:
;=================================
    ;NR biti variabila
    push ebp
    mov ebp,esp
    
    xor ecx,ecx
    mov edx, 0x80000000
    mov eax, 0x000000001
    mov ebx, [val1]
cauta:
   push ebx
   and ebx,eax
   cmp ebx,eax
   jne nu1
   inc ecx
nu1:
   pop ebx
   shl eax,1
   cmp eax,edx
   jne cauta
   
exit: 
   and ebx,eax
   cmp ebx,eax
   jne nu
   inc ecx
nu:
    PRINT_DEC 4,ecx
    NEWLINE
    
    
;=================================
    ;NR biti vector

    xor ecx,ecx
    xor edx,edx
    xor eax,eax
    xor ebx,ebx
   ; mov ebx,0x80000000
   ; push ebx
repet:
   ; mov ebx,0x80000000
    mov eax,[vect+ecx*4]
    PRINT_HEX 4, eax
    NEWLINE
    mov ebx,0x000000001
Fornumber:
    push eax
    and eax,ebx
    cmp eax,ebx
    jne out1
    inc edx
out1: 
   pop eax
   shl ebx,1
  ;pop ebx
  ;push ebx
   cmp ebx,0x80000000
   jne Fornumber
   
   test eax,0x80000000
   jz salt
   inc edx
salt:   
   inc ecx
   cmp ecx,[length]  
   jne repet  
    
   PRINT_DEC 4,edx
    NEWLINE
    leave
    ret