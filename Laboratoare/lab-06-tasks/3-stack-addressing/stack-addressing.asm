%include "io.inc"

%define NUM 5

section .data
string1 db "mere", 0
string2 db "are ",0
string3 db "Ana ", 0

section .text
global CMAIN
CMAIN:
    mov ebp, esp
    ; TODO 1: replace every push by an equivalent sequence of commands
    mov ecx, NUM
push_nums:
   ; push ecx
    sub esp, 4
    mov [esp], ecx
    loop push_nums
   ; pushing a string on the stack

   ; push 0
    xor eax, eax
    sub esp, 4
    mov eax,[string1]
    mov [esp], eax
    ;push "mere"
    xor eax, eax
    sub esp, 4
    mov eax,"are "
    mov [esp], eax
    ;push "are "
    xor eax,eax
    sub esp, 4
    mov eax,"Ana "
    mov [esp], eax
    ;push "Ana "

    ; TODO 2: print the stack in "address: value" format in the range of [ESP:EBP]
    ; (from low addresses to high addresses, byte by byte)
    
    xor eax, eax
    mov eax, esp
print:
    cmp eax, ebp
    je string
    
    PRINT_STRING "0x"
    PRINT_HEX 4, eax
    PRINT_STRING ":"
    PRINT_DEC 1, [eax]
    NEWLINE
    inc eax
    jmp print

    ; TODO 3: print the string byte by byte
    
string:
    xor eax, eax
    mov eax, esp
    mov ecx, 12
str:
    PRINT_CHAR [eax]    
    inc eax
    loop str
    mov ecx, NUM
    NEWLINE
    mov eax, ebp
    sub eax, 20
   
str2:
    PRINT_UDEC 4, [eax]
    ;loop str2
    NEWLINE
    add eax, 4
    cmp eax, ebp
    jl str2

    ; TODO 4: print the array element by element

    ; restore the previous value of the EBP (Base Pointer)
final:
    mov esp, ebp

    ; exit without errors
    xor eax, eax
    ret
