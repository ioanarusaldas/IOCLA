;Savu Ioana Rusalda - 325CB

%include "includes/io.inc"
;%include "io.inc"

extern getAST
extern freeAST

section .bss
    ; La aceasta adresa, scheletul stocheaza radacina arborelui
    root: resd 1

section .text
global main

atoi:                   ;functie de conversie string-numar
    push ebp
    mov ebp, esp
    mov ebx, [ebp + 8] ;in ebx se muta adresa primului element din stiva
    xor edx, edx
    xor eax, eax
    xor ecx, ecx
string:
    mov dl, byte [ebx]   ;in dl se muta primul caracter din string
    cmp dl, '-'          ;verifica daca acest caracter este - 
    jne pozitiv          ;daca primul caracter nu e "-" numarul este pozitiv
    inc ecx              ;registru ecx este folosit pentru a memora daca a 
                                ;fost gasit un numar  negativ
    inc ebx              
    mov dl, [ebx]        ;daca numarul este negativ se muta in dl urmatorul 
                                ;caracter din string
pozitiv:    
    inc ebx
    
    cmp dl,'0'          ;verific daca caracterul este cifra
    jb end
    cmp dl, '9'
    ja end
    
    imul eax,10
    sub dl, '0'         ;transform caracterul in cifra 
    add eax, edx
    
    jmp string
minus:

   imul eax, -1         ;inmultire cu -1 pentru numerele negative
   leave
   ret
end:
    cmp ecx,0
    jne minus          ;daca ecx a ramas 0 inseamna ca stringul reprezinta 
                            ;un numar pozitiv
    leave
    ret
;-----------------------------------------------------    
tree:
    push ebp
    mov ebp, esp
    mov ebx, [ebp + 8]  ;in ebx se muta adresa primului element din stiva
    mov eax, [ebx]
    mov dx,[eax]        ; in dx se muta primul element din string

    cmp dl, '+'
    je addition
    cmp dl, '*'
    je multiplication
    cmp dl, '/'
    je division
    cmp dl, '-'
    je verify
    
    jmp number
    
verify:                ;verifc daca "-" provine de la operatia de scadere sau
    cmp dh,0                ;de la un numar negativ
    je decrease
    
number:
        mov eax,[ebx]
        push ecx        ;adaug valoare locala pe stiva pentru pastrare
        push eax        ;adauga pe stiva parametrul functiei
        call atoi       ;apel functie conversie
        pop ecx         ;scot de pe stiva parametrul functiei
        pop ecx         ;scot de pe stiva valoarea pastrata
        
        leave
        ret
  
addition:  
    mov ebx, [ebp + 8]  
    add ebx, 4          ;deplasare pe fiu stang
    mov ebx,[ebx]
    
    push ebx
    call tree           ;apel recursiv
    mov ecx,eax        ;salvez in ecx rezultatul intors de functie
    pop ebx  
           
    mov ebx, [ebp + 8]
    add ebx, 8          ;deplasare pe fiu drept
    mov ebx,[ebx]
    
    push ecx            ;adaug valoare locala pe stiva pentru pastrare
    push ebx            ;adauga pe stiva parametrul functiei    
    call tree           ;apel recursiv
    pop ebx             ;scot de pe stiva parametrul functiei
    pop ecx             ;scot de pe stiva valoarea pastrata
  
    add  eax,ecx        ;realizare adunare cu rezultatul stocat in eax
    leave
    ret
    
multiplication: 
    mov ebx, [ebp + 8] 
    add ebx, 4          ;deplasare pe fiu stang
    mov ebx,[ebx]
    
    push ebx
    call tree           ;apel recursiv
    mov ecx,eax         ;salvez in ecx rezultatul intors de functie
    pop ebx  
    
    mov ebx, [ebp + 8]
    add ebx, 8          ;deplasare copil drept 
    mov ebx,[ebx]
    
    push ecx           ;adaug valoare locala pe stiva pentru pastrare 
    push ebx           ;adauga pe stiva parametrul functiei  
    call tree          ;apel recursiv
    pop ebx            ;scot de pe stiva parametrul functiei
    pop ecx            ;scot de pe stiva valoarea pastrata
   
    imul ecx           ;realizare inmultire cu rezultatul stocat in eax 
    leave
    ret
    
decrease:
    mov ebx, [ebp + 8]
    add ebx, 4      ;deplasare fiu stanga
    mov ebx,[ebx]
    
    push ebx
    call tree       ;apel recursiv
    mov ecx,eax     ;salvez in ecx rezultatul intors de functie
    pop ebx 
     
    mov ebx, [ebp + 8]
    add ebx, 8      ;deplasare fiu dreapta
    mov ebx,[ebx]
    
    push ecx        ;adaug valoare locala pe stiva pentru pastrare 
    push ebx        ;adauga pe stiva parametrul functiei  
    call tree       ;apel recursiv
    pop ebx         ;scot de pe stiva parametrul functiei
    pop ecx         ;scot de pe stiva valoarea pastrata
   
    xchg eax,ecx    ;interschimbare valori pt corectitudine
    sub  eax,ecx    ;realizare scadere cu rezultatul stocat in eax
    leave
    ret
    
division:
    mov ebx, [ebp + 8]
    add ebx, 4      ;deplasare fiu stang
    mov ebx,[ebx]
    
    push ebx
    call tree       ;apel recursiv
    mov ecx,eax     ;salvez in ecx rezultatul intors de functie
    pop ebx  
    
    mov ebx, [ebp + 8]
    add ebx, 8      ;deplasare fiu dreapta
    mov ebx,[ebx]
    
    push ecx        ;adaug valoare locala pe stiva pentru pastrare 
    push ebx        ;adauga pe stiva parametrul functiei  
    call tree       ;apel recursiv
    pop ebx         ;scot de pe stiva parametrul functiei
    pop ecx         ;scot de pe stiva valoarea pastrata
  
    xchg eax, ecx   ;interschimbare valori pt corectitudine
    
    cmp eax,0
    jl negative     ;verificare numar negativ
    xor edx,edx 
    
    idiv ecx        ;realizare impartire cu rezultatul stocat in eax
    leave 
    ret
    
negative:
    mov edx ,-1
    idiv ecx        ;realizare impartire cu rezultatul stocat in eax
    leave 
    ret
;----------------------------------------------------------------------
    
main:
    mov ebp, esp; for correct debugging
    ; NU MODIFICATI
    push ebp
    mov ebp, esp
    
    ; Se citeste arborele si se scrie la adresa indicata mai sus
    call getAST
    mov [root], eax     ;adresa structurii
    mov eax,[root]      ;adresa structurii
    
    push eax
    call tree           ;apel functie parcurgere arbore
    PRINT_DEC 4, eax   
    ; NU MODIFICATI
    ; Se elibereaza memoria alocata pentru arbore
    push dword [root]
    call freeAST
    
    xor eax, eax
    leave
    ret
