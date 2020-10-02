%include "io.inc"

section .data
    string db "Ana mere", 0
    substring db "are", 0
    pos db 4

    
section .bss
    aux: resb 30
    
section .text
global CMAIN
CMAIN:
    push ebp
    mov ebp,esp
    mov ebx,[pos]
    mov eax,string
    add eax , ebx
    xor edx,edx
cauta:
    xor ecx,ecx
   ; PRINT_DEC 4,ebx
    mov cl,byte[eax]
    ;PRINT_CHAR[
    mov byte[aux+edx],cl
    inc eax
    inc edx
    cmp cl, 0
    jne cauta
    
    mov ebx,[pos]
    xor eax,eax
    mov eax,substring
   ; PRINT_STRING [eax]
    ;NEWLINE
   ; dec ebx
adauga:
    xor ecx,ecx
    mov cl,byte[eax]
   ; PRINT_CHAR cl
    ;NEWLINE
    mov byte[string+ebx],cl

    inc eax
    inc ebx
    cmp cl, 0
    jne adauga
 
    xor eax,eax
    mov eax,aux
    mov byte[string+ebx-1],' '
   
adauga2:
    xor ecx,ecx
    mov cl,byte[eax]

    mov byte[string+ebx],cl

    inc eax
    inc ebx
    cmp cl, 0
    jne adauga2
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
   PRINT_STRING [string]
    leave
    ret