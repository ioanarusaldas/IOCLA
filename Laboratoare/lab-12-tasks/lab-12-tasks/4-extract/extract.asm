%include "io.inc"

section .data
    n    dq 421.9461
    print_format1 db "Partea intreaga: %d", 10, 0
    print_format2 db "Partea fractionara: %f", 10, 0

section .text
global CMAIN
CMAIN:
    fld qword[n]
    ; TODO Incarca numarul pe stiva FPU.

    ; TODO Foloseste instructiunea fisttp pentru a salva valoarea
    ; cu trunchiere la intreg.
    sub esp, 4
    fisttp dword[esp]
    ;PRINT_DEC 4,[esp]
    ;add esp, 4
   ; pop eax
   ; mov eax,esp
   ; push eax
    push print_format1
    call printf
    add esp, 4
    ; TODO Afiseaza partea intreaga.
    

    ; TODO Reincarca numarul pe stiva FPU.
    
    fld qword[n]
    
    fisub dword[esp]
    
    sub esp, 8
    fstp qword [esp]

    push print_format2
    call printf
    add esp, 16
    ; TODO Foloseste instructiunea fisub pentru a scadea din n (varful
    ; stivei FPU) partea intreaga obtinuta anterior.

    ; TODO Extrage partea fractionara si afiseaza rezultatul

    xor eax, eax
    ret
