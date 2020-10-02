;PRINTARE ELEMENTE VECTOR CU PRINTF
%include "io.inc"
extern printf
section .data
    vect dd 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
    length dd 10
    uint_format_newline    db "%zu", 10, 0
section .bss
;    num resd 1
section .text
write:
    push ebp
    mov ebp, esp
    xor ecx,ecx
    mov eax, [ebp+8]
    ;PRINT_DEC 4, [eax]
    mov ebx, [ebp+12]
    ;PRINT_DEC 4, [ebx]
    
elemente:
    mov eax, [ebp+8]
    mov eax,[eax+ecx*4] 
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
    push vect
   call write
    add esp, 8
    leave
    ret