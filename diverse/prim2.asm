%include "io.inc"

extern fgets
extern stdin
extern printf

section .data
    n            dd 7
    format_str   dd "Number: %d", 13, 10, 0
    prime_format dd "isPrime: %d", 13, 10, 0
section .bss
     buffer:         resb 80             ;store my input

section .text


stringToNumber:
    push ebp
    mov ebp,esp
    mov ebx, [ebp+8]    ;accesare sir de caractere
    xor eax,eax
convert:
    xor ecx,ecx
    mov cl, [ebx]   ;primul caracter din sir in cl
    cmp cl, 0       ;verificare final sir
    je end
    sub cl, '0'     ;transforamre caracter in numar
    imul eax, 10    ;alcatuire numar
    add eax,ecx
    inc ebx
    jmp convert

end:   
    leave
    ret

isPrime:
    push ebp
    mov ebp,esp

    mov eax,[ebp+8] ;accesare numar
    cmp eax, 2      ;verificare numar prim par
    je done
    xor edx,edx
    mov ecx,2
    div ecx         ;aflare jumatate numar

    mov ebx,eax
    mov eax,[ebp+8] ;acesare numar
    
    xor ecx,ecx
    xor edx,edx
    mov ecx,2
loop:

    div ecx ;verificare divizori
    cmp edx, 0
    je not_prime

    inc ecx

    mov eax, [ebp+8]
    xor edx, edx
    cmp ecx, ebx
    jl loop
    
    jmp done
    
not_prime:
    mov eax, 0
    jmp done
    
done:
    cmp eax,0
    je exit
    mov eax,1
exit:
    leave
    ret

global main
CMAIN:
    mov ebp, esp; for correct debugging
    push ebp
    mov ebp, esp

    ;TODO a.: allocate space on stack and call fgets
    
    push dword [stdin]              ;fgets need 3 param
    push dword 80                   ;max lenght
    push dword buffer               ;input buffer
    call fgets
    add esp, 12   
 
  ;TODO b.: call stringToNumber and print it using printf
    push eax
    call stringToNumber
    add esp,4
    PRINT_DEC 4, eax
    NEWLINE
    
    ;TODO c.: call isPrime and print result
    
    push eax
    call isPrime
    add esp, 4
     PRINT_DEC 4, eax
    NEWLINE
    
    ;TODO c.: call isPrime and print result

    leave
    ret
