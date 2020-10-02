%include "io.inc"

;rotunjirea unui numar

section .data
    n    dq 31.9
    print_format db "numarul rotunjit: %f", 10, 0
section .text
global CMAIN
CMAIN:
    fld qword[n]
    frndint
    
    sub esp, 8
    fstp qword[esp]

    push print_format
    call printf
    add esp, 12
     
    ;write your code here
    xor eax, eax
    ret