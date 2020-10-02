%include "io.inc"

section .data
    ; TODO a: Define arr1, arr2 and res arrays.
    arr1 dd 10,34,67,80,13,1,3,8,9,12
    arr2 dd 15,10,10,30,40,50,36,70,80,90
    
section .bss
    res resd 10

section .text
global main

main:
    mov ebp, esp; for correct debugging
    push ebp
    mov ebp, esp

    ; TODO b: Compute res[0] and res[n-1].
    
    mov eax, dword[arr1]    ;primul element din arr1
    mov ebx, dword[arr2+36] ;ultimul element din arr2
    add eax, ebx            ;suma
    mov dword[res], eax     ;stocare in res
    
    mov eax, dword[arr1+36] ;ultimul element arr1
    mov ebx, dword[arr2]    ;primul element arr2
    add eax, ebx            ;suma
    mov dword[res+36], eax  ;stocare in res
   
   PRINT_STRING "res[0]="
   PRINT_DEC 4, [res]
   NEWLINE
   
   PRINT_STRING "res[n-1]="
   PRINT_DEC 4, [res+36]
   NEWLINE
   
    ; TODO d: Compute cross sums in res[i].
    mov ecx,9
    mov edx,0
suma:
    mov eax, dword[arr1+edx*4]  ;elemente arr1 de la 0 la 9
    mov ebx, dword[arr2+ecx*4]  ;elemente arr2 de la 9 la 0
    add eax, ebx
    mov dword[res+4*edx], eax   ;stocare suma
    sub ecx,1
    add edx,1
    cmp ecx,0
    je next
    jmp suma
next: 
    xor ecx,ecx
    PRINT_STRING "VECTORI element[i] pt fiecare vector"
    NEWLINE
labelone:
    PRINT_UDEC 4, [arr1+ecx*4]
    PRINT_CHAR ' '
    PRINT_UDEC 4, [arr2+ecx*4]
    PRINT_CHAR ' '
    PRINT_UDEC 4, [res+ecx*4]
    PRINT_CHAR ' '
    NEWLINE
    inc ecx
    cmp ecx , 10
    jne labelone
    
end:
   
    ; List first and last item in each array.
    PRINT_STRING "primul element al fiecarui vector"
    NEWLINE
    PRINT_UDEC 4, [arr1]
    NEWLINE
    PRINT_UDEC 4, [arr2]
    NEWLINE
    PRINT_UDEC 4, [res]
    NEWLINE
    PRINT_STRING "ultimul element al fiecarui vector"
    NEWLINE
    PRINT_UDEC 4, [arr1+36]
    NEWLINE
    PRINT_UDEC 4, [arr2+36]
    NEWLINE
    PRINT_UDEC 4, [res+36]
    NEWLINE

    ; Return 0.    
    xor eax, eax
    leave
    ret