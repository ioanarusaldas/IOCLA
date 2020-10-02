;CITIRE ELEMENTE VECTOR CU SCANF
%include "io.inc"
extern printf
extern scanf
section .data
    vect dd 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
    length dd 10
    uint_format    db "%zu", 0
     uint_format_newline    db "%zu", 10, 0
section .bss
;    num resd 1
    vect2: resd 10
section .text
write:
    push ebp
    mov ebp, esp
    xor ecx,ecx
    mov eax, [ebp+8]
    ;PRINT_DEC 4, [eax]
    mov ebx, [ebp+12]
    ;PRINT_DEC 4, [ebx]
    
elemente1:
    mov eax, [ebp+8]
    mov eax,[eax+ecx*4] 
    ; PRINT_DEC 4, eax
    ; NEWLINE 
    push ecx
    push eax
   push uint_format_newline
    call printf
    add esp, 8
   pop ecx
   inc ecx
    mov ebx, [ebp+12]
    ;PRINT_DEC 4, ebx]
    mov ebx,[ebx]
    cmp ecx, ebx
    jne elemente1
        
end1:
    leave
   ret
   
read:
    push ebp
    mov ebp, esp
    xor ecx,ecx
    mov eax, [ebp+8]
    ;PRINT_DEC 4, [eax]
    mov ebx, [ebp+12]
    ;PRINT_DEC 4, [ebx]
    
elemente:
    push ecx
    push eax
    push uint_format
    call scanf
    add esp, 4
    pop eax
    pop ecx
    add eax,4

    inc ecx
    mov ebx, [ebp+12]
    mov ebx,[ebx]
    cmp ecx, ebx
    jne elemente
    
    
end:
   leave
   ret


global CMAIN
CMAIN:
    push ebp
    mov ebp,esp
    ;write your code here
    xor eax, eax
    push length
    push vect2
    call read
    add esp, 8
     push length
    push vect2
   call write
    add esp, 8
    leave
    ret
