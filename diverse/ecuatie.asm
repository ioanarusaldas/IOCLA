%include "io.inc"
extern puts

section .data
    vect dd 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
    length dd 10
section .text
global CMAIN
ecuatie:
    push ebp
    mov ebp, esp
    mov eax,[ebp+8]
    mov ebx,[ebp+12]
    mov ecx, 7
    mul ecx
    add eax,ebx
end:
    leave
    ret
    
print:
    push ebp
    mov ebp, esp
    mov eax, [ebp+8]
   ; PRINT_DEC 4,[eax]
    mov ebx, [ebp+12]
    mov ebx,[ebx]
    xor ecx, ecx
parcurgere:
  
    PRINT_DEC 4,[eax+ecx*4]
    PRINT_CHAR ' '
    inc ecx
    cmp ecx,ebx
    jne parcurgere

end2:
    leave
    ret
    
apply:
    push ebp
    mov ebp, esp
    ;PRINT_STRING "mama"
    mov eax,[ebp+8]
    ;PRINT_STRING "mama"
    ; PRINT_DEC 4,[eax]
     ;NEWLINE
    mov ebx,[ebp+12]
    mov edx,[ebp+16]
    xor ecx,ecx
    
elemente:
     mov eax,[ebp+8]
   ;  PRINT_DEC 4,[eax]
    ; NEWLINE
     mov eax,[eax+ecx*4]
     mov edx,[ebp+16]
     push ecx
     push edx
     push eax
     call ecuatie
     add esp,8
     pop ecx
     mov ebx,[ebp+12]
     mov edx,[ebp+8]
    ; mov eax,[ebp+8]
     mov dword[edx+ecx*4],eax
     inc ecx
     cmp ecx,ebx
     jne elemente

end3:
    leave
    ret
    
CMAIN:
    push ebp
    mov ebp, esp

    mov eax,2
    mov ebx,5
    push ebx
    push eax
    call ecuatie
    add esp, 8
    PRINT_DEC 4, eax
    NEWLINE
    
    push length
    push vect
    call print
    add esp, 8
    NEWLINE
    
    mov edx, 0
    mov ecx,[length]  
   ; mov ecx,[ecx]
    push edx
    push ecx
    push vect
    call apply
    add esp, 12
    
    push length
    push vect
    call print
    add esp, 8

    leave
    ret
