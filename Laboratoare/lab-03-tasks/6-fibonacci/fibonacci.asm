%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ecx, 7       ; vrem sa aflam al N-lea numar; N = 7
    ; TODO: calculati al N-lea numar fibonacci (f(0) = 0, f(1) = 1)
    mov eax, 0
    mov ebx, 1
fi:
    xchg eax, ebx
    add ebx, eax
    ;dec ecx
    ;cmp ecx,1
   ; jg fi
   loop fi
    PRINT_DEC 4, eax
    ret