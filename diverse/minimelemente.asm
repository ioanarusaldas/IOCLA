%include "io.inc"
extern printf
 
    vect dd 10, 4, 3, 25, 5, 65, 7, 1, 0, 2
    length dd 10
    uint_format_newline    db "%zu", 10, 0
section .bss
section .text
min:
    push ebp
    mov ebp,esp
    mov eax,[ebp+8]
    mov ebx,[ebp+12]
 ;   mov ebx,[ebx]
    
    xor ecx, ecx
    mov edx,[eax]
 ;   PRINT_UDEC 4, edx
verificare:
    mov eax,[ebp+8]
    mov eax,[eax+ecx*4]
   ; PRINT_UDEC 4, eax
    ;NEWLINE
    ;PRINT_UDEC 4, edx
    cmp eax,edx
    jg continue
    mov edx,eax
    push ecx
continue:
   ; PRINT_UDEC 4, ebx
   ;  NEWLINE
    inc ecx
   ;  PRINT_UDEC 4, ecx
  ;   NEWLINE
    cmp ecx,ebx
    jne verificare
     
end:
    pop ecx
   ; PRINT_UDEC 4, edx
   ; NEWLINE
;    PRINT_UDEC 4, ecx
   ; NEWLINE
    mov eax,[ebp+8]
    push dword[eax+ecx*4] 
    mov ebx,[eax]
    mov dword[eax+ecx*4] ,ebx
    mov eax,[ebp+8]
    pop ebx
    mov dword[eax] ,ebx
    
    mov ecx,0

;afis:
 ;   mov eax,[ebp+8]
 ;   mov eax,[eax+ecx*4]
 ;   PRINT_DEC 4, eax
  ;  PRINT_CHAR ' '
  ;  inc ecx
  ;  cmp ecx,10
   ; jne afis

    
  
    ;mov [eax+ecx*4],
   ; NEWLINE  
     
    
    
    
    leave
    ret
 
sortare:
    push ebp
    mov ebp, esp
    mov eax,[ebp+8]
    mov ecx,10
repet:
    push ecx
    mov edx,ecx
    push edx
    push eax
    call min
    pop eax
    add esp, 4
    add eax,4
    pop ecx
    dec ecx
    cmp ecx,0
    jne repet
end2:
    leave
    ret
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
    jne elemente
    
    
end3:
    leave
   ret

global CMAIN
CMAIN:
    push ebp
    mov ebp,esp
    ;write your code here
    xor eax, eax
    mov ebx, [length]
    push ebx
    push vect
   call min
    add esp, 8
    push vect
    call sortare
    add esp,4
     push length
    push vect
   call write
    add esp, 8
    
   
    
    
    
    
    
    leave
    ret