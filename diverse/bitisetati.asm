%include "io.inc"


;verifica cati biti sunt setati intr-un numar


section .text
global CMAIN
CMAIN:
    push ebp
    mov ebp, esp
    
    mov eax, 0xfd11418d
    mov ecx, 0x00000001
    
    xor edx, edx
    xor ebx, ebx
contor:
     push eax
     inc edx
     and eax, ecx
     cmp eax, ecx
     je aduna
     shl ecx,1
     pop eax
     cmp edx, 32
     je exit
     jmp contor
     
aduna:
    inc ebx
    shl ecx,1
     pop eax
     cmp edx, 32
     je exit
     jmp contor
    
    
exit:

    PRINT_DEC 4, EBX
    ;write your code here
    xor eax, eax
    leave
    ret