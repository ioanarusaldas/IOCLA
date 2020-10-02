%include "io.inc"
section .text
section .data
    val1 dd 0xfd110008
    val2 dd 0x0fff8888
global CMAIN
CMAIN:
    push ebp
    mov ebp,esp
    
    mov eax, 0x80000000
    mov ebx, [val2]
   ; PRINT_HEX 4,ebx
   push ebx
   and ebx,eax
   cmp ebx,eax
   jne exit
   pop ebx
   PRINT_STRING "Are bit de semn activat"
   NEWLINE
   
exit: 
    leave
    ret