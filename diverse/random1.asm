%include "io.inc"
extern rand
extern time
extern srand
extern scanf
extern printf
extern puts


section .data
    uint_format    db "%zu", 0
    uint_format_newline    db "%zu", 10, 0
    msg    db "Insert number: ", 0
    is_smaller_string db "Numarul introdus este mai mic", 0
    is_larger_string db "Numarul introdus este mai mare", 0


section .bss
    num resd 1
    num2 resd 1


section .text


; TODO c: Create read_cmp() function.
read_cmp:
    push ebp
    mov ebp, esp
    
    push num2
    push uint_format
    call scanf  ;citire
    mov eax, [num]
    mov ebx, [num2]

    add esp, 8
    cmp ebx, eax    ;comparare numere
    jg mare
    cmp ebx, eax
    je end
mic:
    PRINT_STRING "Numarul introdus este mai mic"
    NEWLINE
    mov eax, 0 
    jmp end

mare:
    PRINT_STRING "Numarul introdus este mai mare"
    NEWLINE
    mov eax,0

end:
    cmp ebx, eax
    je return_0
    leave
    ret
return_0:
    mov eax, 1
    leave
    ret



global main
main:
    push ebp
    mov ebp, esp


    ; TODO a: Call srand(time(0)) and then rand() and store return value modulo 100 in num.
    push dword 0
    call time
    pop ecx
    push eax
    call srand
    pop ecx

    call rand   ;generare numar random
    mov ecx, 100
    div ecx
    mov [num], edx  ;mutare rest numar
    PRINT_STRING "restul impartirii la 100:"
    NEWLINE

   ; Debug only: Print value of num to check it was properly initialized.
    push dword [num]
    push uint_format_newline
    call printf
    add esp, 8

    ; Comment this out when doing TODO b. Uncomment it when doing TODO c and d.
    jmp make_call
    
    ; TODO b: Read numbers from keyboard in an infinite loop.
    mov ecx,10
scan:
    push ecx
    push num2
    push uint_format ;citire numar
    call scanf
    add esp, 8
    pop ecx
    
    push ecx
    push dword[num2]
    push uint_format_newline
    call printf ;afisare numar
    add esp,8
    pop ecx
 
    sub ecx, 1
    cmp ecx, 0
    jne scan

make_call:
    
    ; TODO d:
    ;bucla infinita pana cand rezultatul e 0
infinit:
    call read_cmp
    PRINT_DEC 4, eax    
    cmp eax,1
    je infinit
   



    ; Return 0.
    xor eax, eax
    leave
    ret
