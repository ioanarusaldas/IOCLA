%include "io.inc"
extern printf
section .data
    str1: dd "Ana trece la iocla",0
    length: dd 30
    chr: dd "x"
section .text
    
schimb:
    push ebp
    mov ebp,esp
    
    mov eax,[ebp+8]
    PRINT_STRING [eax]
    NEWLINE
    mov ebx,[ebp+16]
   
    mov ecx,[ebp+12]
   
cauta:
   
    cmp byte[eax+ecx],bh
    jne sari
    mov byte[eax+ecx],bl
   
sari:
    dec ecx
    cmp ecx,0
    jne cauta

out:
    leave 
    ret

global CMAIN
CMAIN:
    
  push ebp
  mov ebp,esp
  
  xor eax,eax
  mov al,'x'
  mov ah, 'a'
  
  push eax
  
  ;xor eax,eax
  push Dword[length]
  
  push str1
  call schimb
  add esp,12
    PRINT_STRING[str1]
    
 
    
   
exit:

    leave
    ret