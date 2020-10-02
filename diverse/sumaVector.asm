%include "io.inc"
section .data
    vect dd 1,2,3,4,5,6,7,8,9,10
    length dd 10
section .text

suma:
    push ebp
    mov ebp,esp
    mov ebx, [ebp+8]
   ; mov eax,[ebp+12]
    xor ecx,ecx
    xor edx,edx
    
    ;PRINT_DEC 4, ebx
    ;NEWLINE
    ;PRINT_DEC 4, [eax]
    
parcurgere:
    mov eax,[ebp+12]
    mov eax,[eax+ecx*4]
    add edx,eax
    inc ecx
    cmp ecx,ebx
    jne parcurgere

end1:
    mov eax,edx
    leave
    ret
    
    
    
    
    
global CMAIN
CMAIN:
    push ebp
    mov ebp,esp
    
    mov eax,[length]
    push vect
    push eax
    call suma
    add esp,8
    PRINT_DEC 4, eax
    NEWLINE
    
    
    
    
  leave
  ret