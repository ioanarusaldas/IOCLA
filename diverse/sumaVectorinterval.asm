%include "io.inc"
extern scanf
section .data
    vect dd 1,2,3,4,5,6,7,8,9,10
    length dd 10
    uint_format    db "%zu",0
section .bss
    par1: resd 1
    par2: resd 1
section .text
suma:
    push ebp
    mov ebp,esp
    mov ebx, [ebp+8]
   ; mov eax,[ebp+12]
    mov ecx,[ebp+16]
    PRINT_DEC 4, ecx
    NEWLINE
    mov ebx,[ebp+12]
    PRINT_DEC 4, ebx
    NEWLINE
    xor edx,edx
    
    ;PRINT_DEC 4, ebx
    ;NEWLINE
    ;PRINT_DEC 4, [eax]
    
parcurgere:
    mov eax,[ebp+8]
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
    
    push par1
    push uint_format
    call scanf
    add esp,8
    mov eax, dword[par1]
    push eax
  ;  mov eax,0
  ;  mov ebx,7
    push par2
    push uint_format
    call scanf
    add esp,8
    mov eax, dword[par2]
    push eax
   ; push eax
    ;push ebx
    push vect
    call suma
    add esp,12
    PRINT_DEC 4, eax
    NEWLINE
    
    
    
    
  leave
  ret