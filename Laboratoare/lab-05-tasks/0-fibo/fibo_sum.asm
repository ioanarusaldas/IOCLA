%include "io.inc"
section .data
    N dd 9 ; compute the sum of the first N fibonacci numbers
    
section .text
global CMAIN
CMAIN:
    push ebp
    mov ebp, esp
    mov ecx, 7      ; N=numarul de termeni= 9-2=7 (pt ca eax e primul termen si ebx al doilea termen)
    mov eax, 1
    mov ebx, 1
    mov edx, 0
fi:
    xchg edx, ebx
    add ebx, edx
    add eax,ebx
   loop fi

    ; TODO: calculate the sum of first N fibonacci numbers
    ;       (f(0) = 0, f(1) = 1)
    ;       store the sum in eax
    ;       use loop instruction 

    PRINT_STRING "Sum first "
    PRINT_DEC 4, [N]
    PRINT_STRING " fibo is "
    PRINT_UDEC 4, eax

    xor eax, eax
    leave
	ret
