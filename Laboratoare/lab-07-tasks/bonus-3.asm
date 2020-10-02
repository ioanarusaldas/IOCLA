%include "io.inc"
extern printf

section .data
    before_format db "before %s", 13, 10, 0
    after_format db "after %s", 13, 10, 0
    mystring db "ana", 0, "are", 0, "mere", 0
    len dd 10

section .text
global CMAIN

toupper:
    push ebp
    mov ebp, esp
    mov eax, [ebp + 8]
    mov ecx, 10
test_one_byte:
    mov bl, byte [eax]
    ;test bl, bl
    cmp ecx,0
    je out
    cmp bl,110
    jl add1
    cmp bl,110
    jge sub1
add1:
    cmp bl,0
    je space
    add bl,13
    mov byte [eax],bl
     inc eax
    dec ecx
    jmp test_one_byte
sub1:
    cmp bl,0
    je space
    sub bl,13
    mov byte [eax],bl
     inc eax
     dec ecx
    jmp test_one_byte
    ; TODO
space:
    mov bl, 0x20
    mov byte [eax],bl
    inc eax
;    dec ecx
    jmp test_one_byte

    
out:
    leave
    ret

CMAIN:
    push ebp
    mov ebp, esp

    push mystring
    push before_format
    call printf
    add esp, 8

    push mystring
    call toupper
    add esp, 4

    push mystring
    push after_format
    call printf
    add esp, 8

    leave
    ret
