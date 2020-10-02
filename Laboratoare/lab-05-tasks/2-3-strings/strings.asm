%include "io.inc"

section .data
    string db "Lorem ipsum dolor sit amet.", 0
    print_strlen db "strlen: ", 10, 0
    print_occ db "occurences of `i`:", 10, 0

    occurences dd 0
    length dd 0    
    char db 'i'

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    push ebp
    mov ebp, esp

    ; TODO1: compute the length of a string
    cld              ; setăm DF = 0
    mov al, 0      ; char-ul pe care vrem să îl căutăm
    mov edi, string  ; zona de memorie în care căutăm
    repne scasb 
    sub edi, string
    dec edi
    mov [length], edi

    ; TODO1: save the result in at address length

    ; print the result of strlen
    PRINT_STRING print_strlen
    PRINT_UDEC 4, [length]
    NEWLINE
    
    xor eax, eax
    xor ebx, ebx
    mov ecx,[length]
    mov al, [char]
    mov edi, string
cauta: 
    repnz scasb
    cmp ecx,0
    je print
    inc ebx
    jmp cauta
    
    ; TODO2: compute the number of occurences

    ; TODO2: save the result in at address occurences

    ; print the number of occurences of the char
print:
    mov byte[occurences],bl
     PRINT_STRING print_occ
    PRINT_UDEC 4, [occurences]
    NEWLINE

    xor eax, eax
    leave
    ret
