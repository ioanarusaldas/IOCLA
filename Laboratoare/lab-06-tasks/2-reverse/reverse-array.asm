%include "io.inc"

section .data

%define ARRAY_LEN 7

    input dd 122, 184, 199, 242, 263, 845, 911
    output times ARRAY_LEN dd 0

section .text
global CMAIN
CMAIN:
    xor ecx, ecx
    
stiva:
    push dword[ input+4*ecx]
    inc ecx
    cmp ecx, ARRAY_LEN
    jb stiva
    xor ecx, ecx
stiva2:
    pop dword[output +4*ecx]
    inc ecx
    cmp ecx, ARRAY_LEN
    jb stiva2
    
    ; TODO push the elements of the array on the stack
    ; TODO retrieve the elements (pop) from the stack into the output array

    PRINT_STRING "Reversed array:"
    NEWLINE
    xor ecx, ecx
print_array:
    PRINT_UDEC 4, [output + 4 * ecx]
    NEWLINE
    inc ecx
    cmp ecx, ARRAY_LEN
    jb print_array

    xor eax, eax
    ret
