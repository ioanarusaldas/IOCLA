%include "io.inc"
section .data
    n dw 23
section .bss
    n2 resw 1
    


section .text
global CMAIN
CMAIN:
    push ebp
    mov ebp, esp
     
    mov ax,1
    shl ax,15
    
    mov bx,1
    shl bx,14
    
    mov cx,[n]
repeta:    
    cmp bx,1
    je exit
    test ax,cx
    jz caz1 ;prim bit 0
    jmp caz2 ;prim bit 1
 
caz1:
    test bx,cx  
    jz faraschimb   ;ambii biti 0
    jmp schimbare1
    
faraschimb:
    push ax
    mov ax,word[n2]
    imul ax, 100
    mov word[n2],ax
    pop ax
    shr ax,1
    shr bx,1
    jmp repeta
schimbare1:
    push ax
    mov ax,word[n2]
    imul ax, 100
    add ax,2
    mov word[n2],ax
    pop ax
    shr ax,1
    shr bx,1
    jmp repeta
caz2:
    test bx,cx  
    jnz faraschimb2   ;ambii biti 1
    jmp schimbare2
faraschimb2:
    push ax
    mov ax,word[n2]
    imul ax, 100
    add ax,3
    mov word[n2],ax
    pop ax
    shr ax,1
    shr bx,1
    jmp repeta
schimbare2:
    push ax
    mov ax,word[n2]
    imul ax, 100
    add ax,1
    mov word[n2],ax
    pop ax
    shr ax,1
    shr bx,1
    jmp repeta
    
    
    
    
    
    
    
    ;and 
    
  
exit:
        PRINT_UDEC 4,[n2]
    xor eax, eax
    leave
    ret