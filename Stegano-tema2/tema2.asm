%include "include/io.inc"
;%include "io.inc"
;Savu Ioana Rusalda-325CB


extern atoi
extern printf
extern exit

; Functions to read/free/print the image.
; The image is passed in argv[1].
extern read_image
extern free_image
; void print_image(int* image, int width, int height);
extern print_image

; Get image's width and height.
; Store them in img_[width, height] variables.
extern get_image_width
extern get_image_height

section .data
	use_str db "Use with ./tema2 <task_num> [opt_arg1] [opt_arg2]", 10, 0

section .bss
    task:       resd 1
    img:        resd 1
    img_width:  resd 1
    img_height: resd 1

section .text
global main

;in functia print afisez mesajul decriptat,cheia,si linia la care s-a gasit mesajul
print:
   push ebp
   mov ebp, esp
   
   mov eax,[ebp + 16] ;linie
   mov ebx ,[ebp + 12];latimea imaginii
   
   push eax ;salvez linia pe stiva
   xor edx,edx
   mul ebx  ;linie*latime
   mov ebx,4
   mul ebx  ;linie*latime*4  
   
   mov ebx, [ebp + 20];cheia
label:
    mov ecx, [ebp + 8];adresa imaginii
    mov ecx, [ecx + eax]; iau pixelul de la inceputul liniei pe care se afla propozitia
    mov ebx, [ebp + 20];cheia
    xor ecx,ebx
    cmp ecx,0 ;verific daca s-a ajuns la finalul propozitiei
    je end1
    add eax,4   ;trec la urmatorul caracter
    PRINT_CHAR ecx ;printez caracterul
    jmp label
end1:
    NEWLINE
    PRINT_DEC 4, ebx ; printez cheia
    pop eax ;scot linia de pe stiva
    NEWLINE
    PRINT_DEC 4, eax ;printez linia
    leave 
    ret
;in functia bruteforce_singlebyte_xor decodific mesajul
bruteforce_singlebyte_xor:
    push ebp
    mov ebp, esp
    
    mov ebx, [ebp + 12]; salvez in ebx latimea imaginii
    mov ecx,0   ;setez contor pe 0 
    xor edx,edx
parcurgere:
    mov edx, [ebp + 8] ;salvez adresa imaginii in edx
    mov edx, [edx]
    mov eax, [ebp + 16];salvez dimensiunea imaginii in eax
     
    cmp ecx, eax;verific daca am ajuns la finalul imaginii
    je end
    mov edx, [edx + ecx*4];iau inceputul imaginii

    push ecx ; salvez ecx pe stiva
    xor eax,eax ;setez pe 0 eax
    
xorare:
    mov cl,dl ;mut pixelul in cl pentru a evita modificarea lui in urma xorarii
    xor cl,al ;xorez cu o cheie
    cmp cl,'r' ;vad daca am gasit inceputul cuvantului revient
    je gasit
    cmp al,255; verific daca am folosit toate numerele pe un octet
    je continue
    inc al
    jmp xorare
continue:
    pop ecx ; scot vechiul ecx de pe stiva pentru a continua iterarea prin imagine
    inc ecx ;trec la urmatorul pixel
    jmp parcurgere
gasit:
    pop ecx ; iau de pe stiva vechiul ecx
    push ecx;pun ecx-ul pe siva pentru a nu ii aduce modificari
    ;==================
    ;verific 'e' 
    inc ecx ;trec la urmatorul pixel pentru a verifica daca este a doua litera din cuvant
    mov edx, [ebp + 8];iau adresa imaginii
    mov edx,[edx]
    mov edx, [edx + ecx*4];iau pixelul cautat
    xor dl,al ;il xorez cu cheia gasita anterior
    cmp dl,'e';verific daca este a doua litera din cuvant
    jne continue
    ;==================
    ;verific identic si pentru 'v'
    inc ecx 
    mov edx, [ebp + 8]
    mov edx,[edx]
    mov edx, [edx + ecx*4]
    xor dl,al 
    cmp dl,'v'
    jne continue
    ;==================
    ;verific 'i' 
    inc ecx 
    mov edx, [ebp + 8]
    mov edx,[edx]
    mov edx, [edx + ecx*4]
    xor dl,al 
    cmp dl,'i'
    jne continue
    ;==================
    ;verific 'e' 
    inc ecx 
    mov edx, [ebp + 8]
    mov edx,[edx]
    mov edx, [edx + ecx*4]
    xor dl,al 
    cmp dl,'e'
    jne continue
    ;==================
    ;verific 'n' 
    inc ecx 
    mov edx, [ebp + 8]
    mov edx,[edx]
    mov edx, [edx + ecx*4]
    xor dl,al
    cmp dl,'n'
    jne continue
    ;==================
    ;verific 't' 
    inc ecx 
    mov edx, [ebp + 8]
    mov edx,[edx]
    mov edx, [edx + ecx*4]
    xor dl,al 
    cmp dl,'t'
    jne continue
   
    pop ecx;iau vechiul ecx de pe stiva 
    push eax 
    mov ebx, [ebp + 12]; iau latimea imaginii
    xor edx,edx
    ;pun in eax atat linia cat si scheia 
    mov eax,ecx 
    div ebx
    shl eax,16  ;shiftez pentru a face loc in eax pt ambele rezultate
    xor ecx, ecx
    pop ecx
    mov ax,cx
end:
    leave
    ret
    
;in functia task_2 am realizat criptarea folosind o cheie predefinita
task2:
    push ebp
    mov ebp, esp
    
    mov ebx, [ebp + 16] ;salvez in ebx adresa imaginii
    mov ebx,[ebx]
    xor ecx,ecx
    xor edx,edx
decodificare:
    mov al ,[ebp + 12] ; cheia
    mov ebx, [ebx + ecx*4] ;linia
    push ecx    ;salvez ecx pe stiva
    mov cl,bl
    xor al,bl ;decriptare cu cheia predefinita
    pop ecx ;recuperez ecx de pe stiva
    xor ebx,ebx
    mov ebx, [ebp + 16] ;adresa imaginii
    mov ebx,[ebx]
    mov [ebx + ecx*4],al ;pun in imagine pixelul dupa decriptare
    xor eax,eax
    mov eax,[ebp + 24] ;dimensiunea imaginii
    cmp ecx, eax ;verificare sfarsit imagine
    je scrie
    inc ecx
    jmp decodificare
scrie:
    xor eax,eax
    xor ebx,ebx
    xor ecx,ecx
    mov eax, [ebp + 8] ;linie
    add eax,1 ;linia pe care urmeaza sa fie criptat noul mesaj
    mov ebx, [ebp + 20] ;latimea imaginii
    ;calculul pozitiei primului pixel de pe linia pe care incepe criptarea
    mov ecx,4   
    mul ecx
    mul ebx
    mov ebx, [ebp + 16] ;adresa imaginii
    mov ebx,[ebx]
    xor ecx,ecx
    ;scrie 'C'
    mov ecx,'C' 
    mov [ebx+eax],ecx
    add eax,4
    ;scrie '''
    mov ecx,39
    mov [ebx+eax],ecx
    add eax,4
    ;scrie 'e'
    mov ecx,'e'
    mov [ebx+eax],ecx
    add eax,4
    ;scrie 's'
    mov ecx,'s'
    mov [ebx+eax],ecx
    add eax,4
    ;scrie 't'
    mov ecx,'t'
    mov [ebx+eax],ecx
    add eax,4
    ;scrie spatiu
    mov ecx,' '
    mov [ebx+eax],ecx
    add eax,4
    ;scrie 'u'
    mov ecx,'u'
    mov [ebx+eax],ecx
    add eax,4
    ;scrie 'n'
    mov ecx,'n'
    mov [ebx+eax],ecx
    add eax,4
    ;scrie spatiu
    mov ecx,' '
    mov [ebx+eax],ecx
    add eax,4
    ;scrie 'p'
    mov ecx,'p'
    mov [ebx+eax],ecx
    add eax,4
    ;scrie 'r'
    mov ecx,'r'
    mov [ebx+eax],ecx
    add eax,4
    ;scrie 'o'
    mov ecx,'o'
    mov [ebx+eax],ecx
    add eax,4
    ;scrie 'v'
    mov ecx,'v'
    mov [ebx+eax],ecx
    add eax,4
    ;scrie 'e'
    mov ecx,'e'
    mov [ebx+eax],ecx
    add eax,4
    ;scrie 'r'
    mov ecx,'r'
    mov [ebx+eax],ecx
    add eax,4
    ;scrie 'b'
    mov ecx,'b'
    mov [ebx+eax],ecx
    add eax,4
    ;scrie 'e'
    mov ecx,'e'
    mov [ebx+eax],ecx
    add eax,4
    ;scrie spatiu
    mov ecx,' '
    mov [ebx+eax],ecx
    add eax,4
    ;scrie 'f'
    mov ecx,'f'
    mov [ebx+eax],ecx
    add eax,4
    ;scrie 'r
    mov ecx,'r'
    mov [ebx+eax],ecx
    add eax,4
    ;scrie 'a'
    mov ecx,'a'
    mov [ebx+eax],ecx
    add eax,4
    ;scrie 'n'
    mov ecx,'n'
    mov [ebx+eax],ecx
    add eax,4
    ;scrie 'c'
    mov ecx,'c'
    mov [ebx+eax],ecx
    add eax,4
    ;scrie 'a'
    mov ecx,'a'
    mov [ebx+eax],ecx
    add eax,4
    ;scrie 'i'
    mov ecx,'i'
    mov [ebx+eax],ecx
    add eax,4
    ;scrie 's'
    mov ecx,'s'
    mov [ebx+eax],ecx
    add eax,4
    ;scrie '.'
    mov ecx,'.'
    mov [ebx+eax],ecx
    add eax,4
    mov ecx,0
    mov [ebx+eax],ecx
key:
    xor eax,eax
    xor ebx,ebx
    mov eax,[ebp+12] ;vechea cheie
    ;calculul noii chei
    mov ebx,2
    mul ebx
    add eax,3
    mov ebx,5
    div ebx
    sub eax,4
    xor ecx,ecx
codificare:
    mov ebx, [ebp + 16] ;adresa imaginii
    mov ebx,[ebx]
    mov ebx, [ebx + ecx*4]
    mov dl,bl
    xor dl,al
    xor ebx,ebx ;codificare cheie noua
    mov ebx, [ebp + 16] ;adresa imaginii
    mov ebx,[ebx]
    mov [ebx + ecx*4],dl ;restabilire pixeli
    push eax
    mov eax,[ebp + 24]
    cmp ecx, eax
    je endT2
    pop eax
    inc ecx
    jmp codificare
endT2:
pop eax
leave
ret
;functia morse_encrypt realizeaza criptarea in cod morse
morse_encrypt:
    push ebp
    mov ebp, esp
    mov ebx, [ebp + 8];iau id
    xor ebx,ebx
    mov eax, [ebp + 12];iau string
    xor ecx,ecx
    mov edx, [ebp + 8] ;byte_id
   ;Pentru fiecare litera din string sar la un label special pentu codificarea literei
string:
    cmp byte[eax+ecx],'A'
    je A
    cmp byte[eax+ecx],'B'
    je B
    cmp byte[eax+ecx],'C'
    je C
    cmp byte[eax+ecx],'D'
    je D
    cmp byte[eax+ecx],'E'
    je E
    cmp byte[eax+ecx],'F'
    je F
    cmp byte[eax+ecx],'G'
    je G
    cmp byte[eax+ecx],'H'
    je H
    cmp byte[eax+ecx],'I'
    je I
    cmp byte[eax+ecx],'J'
    je J
    cmp byte[eax+ecx],'K'
    je K
    cmp byte[eax+ecx],'L'
    je L
    cmp byte[eax+ecx],'M'
    je M
    cmp byte[eax+ecx],'N'
    je N
    cmp byte[eax+ecx],'O'
    je O
    cmp byte[eax+ecx],'P'
    je P
    cmp byte[eax+ecx],'Q'
    je Q
    cmp byte[eax+ecx],'R'
    je R
    cmp byte[eax+ecx],'S'
    je S
    cmp byte[eax+ecx],'T'
    je T
    cmp byte[eax+ecx],'U'
    je U
    cmp byte[eax+ecx],'V'
    je V
    cmp byte[eax+ecx],'W'
    je W
    cmp byte[eax+ecx],'X'
    je X
    cmp byte[eax+ecx],'Y'
    je Y
    cmp byte[eax+ecx],'Z'
    je Z 
    cmp byte[eax+ecx],','
    je virgula
    cmp byte[eax+ecx],0
    je endT3
    pop edx
virgula:
    ;setez codificarea in cod morse a virgulei
    mov ebx, [ebp + 16] ;adresa imaginii
    mov ebx,[ebx]
    push eax
    mov eax,'-'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,'-'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,'.'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,'.'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,'-'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,'-'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,' '
    mov [ebx + edx*4],eax
    inc edx ;incrementez pentru a trece la urmatorul pixel
    inc ecx ;incrementez pentru  trece la urmatoarea litera
    pop eax
    jmp string
A: 
    ;setez codificarea in cod morse a lui A
    mov ebx, [ebp + 16]
    mov ebx,[ebx]
    push eax
    mov eax,'.'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,'-'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,' '
    mov [ebx + edx*4],eax
    inc edx
    inc ecx 
    pop eax
    jmp string
B: 
    ;setez codificarea in cod morse a lui B
    mov ebx, [ebp + 16]
    mov ebx,[ebx]
    push eax
    mov eax,'-'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,'.'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,'.'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,'.'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,' '
    mov [ebx + edx*4],eax
    inc edx
    inc ecx 
    pop eax
    jmp string
C:
    ;setez codificarea in cod morse a lui C
    mov ebx, [ebp + 16]
    mov ebx,[ebx]
    push eax
    mov eax,'-'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,'.'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,'-'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,'.'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,' '
    mov [ebx + edx*4],eax
    inc edx
    inc ecx 
    pop eax
    jmp string

D:
    ;setez codificarea in cod morse a lui D
    mov ebx, [ebp + 16]
    mov ebx,[ebx]
    push eax
    mov eax,'-'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,'.'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,'.'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,' '
    mov [ebx + edx*4],eax
    inc edx
    inc ecx 
    pop eax
    jmp string
E:
    ;setez codificarea in cod morse a lui E
    mov ebx, [ebp + 16]
    mov ebx,[ebx]
    push eax
    mov eax,'.'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,' '
    mov [ebx + edx*4],eax
    inc edx
    inc ecx 
    pop eax
    jmp string
F:
    ;setez codificarea in cod morse a lui F
    mov ebx, [ebp + 16]
    mov ebx,[ebx]
    push eax
    mov eax,'.'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,'.'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,'-'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,'.'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,' '
    mov [ebx + edx*4],eax
    inc edx
    inc ecx 
    pop eax
    jmp string
G:
    ;setez codificarea in cod morse a lui G
    mov ebx, [ebp + 16]
    mov ebx,[ebx]
    push eax 
    mov eax,'-'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,'-'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,'.'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,' '
    mov [ebx + edx*4],eax
    inc edx
    inc ecx 
    pop eax
    jmp string
H:
    ;setez codificarea in cod morse a lui H
    mov ebx, [ebp + 16]
    mov ebx,[ebx]
    push eax
    mov eax,'.'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,'.'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,'.'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,'.'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,' '
    mov [ebx + edx*4],eax
    inc edx
    inc ecx 
    pop eax
    jmp string
I:
    ;setez codificarea in cod morse a lui I
    mov ebx, [ebp + 16]
    mov ebx,[ebx]
    push eax
    mov eax,'.'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,'.'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,' '
    mov [ebx + edx*4],eax
    inc edx
    inc ecx 
    pop eax
    jmp string
J:
    ;setez codificarea in cod morse a lui J
    mov ebx, [ebp + 16]
    mov ebx,[ebx]
    push eax
    mov eax,'.'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,'-'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,'-'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,'-'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,' '
    mov [ebx + edx*4],eax
    inc edx
    inc ecx 
    pop eax
    jmp string
K:
    ;setez codificarea in cod morse a lui K
    mov ebx, [ebp + 16]
    mov ebx,[ebx]
    push eax
    mov eax,'-'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,'.'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,'-'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,' '
    mov [ebx + edx*4],eax
    inc edx
    inc ecx 
    pop eax
    jmp string
L:
    ;setez codificarea in cod morse a lui L
    mov ebx, [ebp + 16]
    mov ebx,[ebx]
    push eax
    mov eax,'.'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,'-'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,'.'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,'.'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,' '
    mov [ebx + edx*4],eax
    inc edx
    inc ecx 
    pop eax
    jmp string
M:
    ;setez codificarea in cod morse a lui M
    mov ebx, [ebp + 16]
    mov ebx,[ebx]
    push eax
    mov eax,'-'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,'-'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,' '
    mov [ebx + edx*4],eax
    inc edx
    inc ecx 
    pop eax
    jmp string
N:
    ;setez codificarea in cod morse a lui N
    mov ebx, [ebp + 16]
    mov ebx,[ebx]
    push eax
    mov eax,'-'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,'.'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,' '
    mov [ebx + edx*4],eax
    inc edx
    inc ecx 
    pop eax
    jmp string
O:
    ;setez codificarea in cod morse a lui O
    mov ebx, [ebp + 16]
    mov ebx,[ebx]
    push eax
    mov eax,'-'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,'-'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,'-'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,' '
    mov [ebx + edx*4],eax
    inc edx
    inc ecx 
    pop eax
    jmp string
P:
    ;setez codificarea in cod morse a lui P
    mov ebx, [ebp + 16]
    mov ebx,[ebx]
    push eax
    mov eax,'.'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,'-'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,'-'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,'.'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,' '
    mov [ebx + edx*4],eax
    inc edx
    inc ecx 
    pop eax
    jmp string
Q:
    ;setez codificarea in cod morse a lui Q
    mov ebx, [ebp + 16]
    mov ebx,[ebx]
    push eax
    mov eax,'-'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,'-'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,'.'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,'-'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,' '
    mov [ebx + edx*4],eax
    inc edx
    inc ecx 
    pop eax
    jmp string
R:
    ;setez codificarea in cod morse a lui R
    mov ebx, [ebp + 16]
    mov ebx,[ebx]
    push eax
    mov eax,'.'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,'-'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,'.'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,' '
    mov [ebx + edx*4],eax
    inc edx
    inc ecx 
    pop eax
    jmp string
S:
    ;setez codificarea in cod morse a lui S
    mov ebx, [ebp + 16]
    mov ebx,[ebx]
    push eax
    mov eax,'.'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,'.'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,'.'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,' '
    mov [ebx + edx*4],eax
    inc edx
    inc ecx 
    pop eax
    jmp string
T:
    ;setez codificarea in cod morse a lui T
    mov ebx, [ebp + 16]
    mov ebx,[ebx]
    push eax
    mov eax,'-'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,' '
    mov [ebx + edx*4],eax
    inc edx
    inc ecx 
    pop eax
    jmp string
U:
    ;setez codificarea in cod morse a lui U
    mov ebx, [ebp + 16]
    mov ebx,[ebx]
    push eax
    mov eax,'.'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,'.'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,'-'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,' '
    mov [ebx + edx*4],eax
    inc edx
    inc ecx 
    pop eax
    jmp string
V:
    ;setez codificarea in cod morse a lui V
    mov ebx, [ebp + 16]
    mov ebx,[ebx]
    push eax
    mov eax,'.'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,'.'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,'.'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,'-'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,' '
    mov [ebx + edx*4],eax
    inc edx
    inc ecx 
    pop eax
    jmp string
W:
    ;setez codificarea in cod morse a lui W
    mov ebx, [ebp + 16]
    mov ebx,[ebx]
    push eax
    mov eax,'.'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,'-'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,'-'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,' '
    mov [ebx + edx*4],eax
    inc edx
    inc ecx 
    pop eax
    jmp string
X:
    ;setez codificarea in cod morse a lui X
    mov ebx, [ebp + 16]
    mov ebx,[ebx]
    push eax
    mov eax,'-'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,'.'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,'.'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,'-'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,' '
    mov [ebx + edx*4],eax
    inc edx
    inc ecx 
    pop eax
    jmp string
Y:
    ;setez codificarea in cod morse a lui Y
    mov ebx, [ebp + 16]
    mov ebx,[ebx]
    push eax
    mov eax,'-'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,'.'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,'-'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,'-'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,' '
    mov [ebx + edx*4],eax
    inc edx
    inc ecx 
    pop eax
    jmp string
Z:
    ;setez codificarea in cod morse a lui Z
    mov ebx, [ebp + 16]
    mov ebx,[ebx]
    push eax
    mov eax,'-'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,'-'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,'.'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,'.'
    mov [ebx + edx*4],eax
    inc edx
    mov eax,' '
    mov [ebx + edx*4],eax
    inc edx
    inc ecx 
    pop eax
    jmp string
   
endT3:
    sub edx,1
    mov eax,0
    mov [ebx + edx*4],eax
    
    leave 
    ret
;functia lsb_encode cripteaza folosind Least Significat Bit 
lsb_encode:
    push ebp
    mov ebp,esp  
    xor ecx,ecx
    mov bh,128 ;masca
    mov edx, [ebp+16];byte_id
    dec edx
    mov eax, [ebp + 12];string
    mov bl ,byte[eax+ecx];prima litera string
stri: 
    mov eax, [ebp + 12];string
    cmp bh,0 ;compara masca cu 0
    jne nextchar
    inc ecx
    cmp bl, 0
    je finalstring
    mov bl ,byte[eax+ecx] ;urmatoarea litera

    cmp bl,0 ;verificare final string
    je endT4
    mov bh,128;refacere masca
nextchar:
    push edx
    xor edx,edx
    mov edx,ebx
    and bl,bh ;veridficare biti character
    cmp bl,0 ; bit caracter 0
    jne caz1
caz0:
    mov bl,dl
    pop edx
    push ecx ;salvez ecx pe stiva
    mov eax, [ebp + 8]; adresa imaginii
    mov eax,[eax]
    xor ecx,ecx
    mov cl,1 ;masca pt ultimul bit
    and cl ,[eax+edx*4];verificare ultim bit pixel
    cmp cl,0 ;ultim bit pixel 0
    je lsb0
lsb1:
    dec dword[eax+edx*4];schimb ultimul bit al pixelului
    pop ecx
    inc edx ;incrementez pentru a trece la pixelul urmator
    shr bh,1    ;shiftez masca pentru a verifica urmatoul bit din string
    jmp stri
lsb0:
    pop ecx ;recuperez de pe stiva
    inc edx ;incrementez pentru a trece la pixelul urmator
    shr bh,1
    jmp stri
caz1:
    mov bl,dl ;restabilesc valoarea din dl
    pop edx
    push ecx
    mov eax, [ebp + 8];adresa imaginii
    mov eax,[eax]
    xor ecx,ecx
    mov cl,1 ;masca ultim bit pixel
    and cl ,[eax+edx*4] 
    cmp cl,0 ;ultim bit pixel 0
    jne lsb0
lsb0inc:
    inc dword[eax+edx*4]
    pop ecx
    inc edx
    shr bh,1
    jmp stri
endT4:
    mov ecx, 9 
    xor ebx,ebx  
    mov bl ,0 ;pun terminatorul de string la finalul stringului
    mov bh,128 ;restabilesc masca
finalstring:
    dec ecx 
    cmp ecx, 0
    je exit1
    cmp bh,0
    jne nextchar

exit1:
    leave
    ret
    
lsb_decode:
    push ebp
    mov ebp,esp  
    mov edx,[ebp + 12];byte_id
    mov ebx, [ebp + 8];adresa imaginii
    mov ebx, [ebx]
    xor ecx, ecx
    xor eax,eax
decode:
    push ecx ;salvez ecx pe stiva
    xor ecx, ecx
    mov cl, 1 ;iau masca 1
    and cl,[ebx + edx*4];verific ultimul bit al pixelului
    add al,cl ;formez characterul prin adaugarea fiecarui bit
    pop ecx ;restabiliesc ecx
    inc ecx; trec la urmatorul pixel
    cmp ecx, 7 ;vad daca am terminat de format un character
    je character
    shl al,1
    inc edx
    jmp decode
character:
    cmp eax,0 ;verific daca am ajuns la final de string
    je endT5
    PRINT_CHAR eax ;printez caracterul
    ;restabilesc registrele pentru urmatorul caracter
    xor ecx,ecx
    mov ecx, -1
    inc edx
    xor eax, eax
    jmp decode   
endT5:
    leave 
    ret


    
main:
    mov ebp, esp; for correct debugging
    ; Prologue
    ; Do not modify!
    push ebp
    mov ebp, esp

    mov eax, [ebp + 8]
    cmp eax, 1
    jne not_zero_param

    push use_str
    call printf
    add esp, 4

    push -1
    call exit

not_zero_param:
    ; We read the image. You can thank us later! :)
    ; You have it stored at img variable's address.
    mov eax, [ebp + 12]
    push DWORD[eax + 4]
    call read_image
    add esp, 4
    mov [img], eax

    ; We saved the image's dimensions in the variables below.
    call get_image_width
    mov [img_width], eax

    call get_image_height
    mov [img_height], eax

    ; Let's get the task number. It will be stored at task variable's address.
    mov eax, [ebp + 12]
    push DWORD[eax + 8]
    call atoi
    add esp, 4
    mov [task], eax

    ; There you go! Have fun! :D
    mov eax, [task]
    cmp eax, 1
    je solve_task1
    cmp eax, 2
    je solve_task2
    cmp eax, 3
    je solve_task3
    cmp eax, 4
    je solve_task4
    cmp eax, 5
    je solve_task5
    cmp eax, 6
    je solve_task6
    jmp done

solve_task1:
    mov eax,[img_height]
    mov ebx, [img_width]
    mul ebx ; latime*inaltime =dimensiune
    push eax ;pun dimensiunea pe stiva pentru a o trimite functiei
    mov eax, [img_width]
    push eax ; pun latimea ca parametru pentru functie
    push img ;pun adresa imaginii pe stiva ca parametru
    call bruteforce_singlebyte_xor
    add esp,12
    xor ebx,ebx
    mov bx,ax 
    push ebx ;pun cheia pe stiva ca parametru
    shr eax,16
    xor ebx,ebx
    mov bx,ax 
    push ebx    ;pun linia pe stiva ca parametru
    mov ecx, [img_width]
    push ecx    ;pun latimea pe stiva ca parametru
    mov ecx,[img]   ;pun adresa imaginii pe stiva
    push ecx
    call print  ;afisez noul mesajul decriptat
    add esp,16
    jmp done
solve_task2:
    mov eax,[img_height]
    mov ebx, [img_width]
    mul ebx ;dimensiunea imaginii
    push eax;pun dimensiunea pe stiva ca parametru
    mov eax, [img_width]
    push eax    ;pun latimea pe stiva ca parametru
    push img    ;pun adresa imaginii pe stiva ca parametru
    call bruteforce_singlebyte_xor
    mov bx,ax
    push ebx ;pun cheia pe stiva ca parametru
    shr eax,16
    xor ebx,ebx
    mov bx,ax
    push ebx ;pun linia pe stiva ca parametru
    call task2
    add esp,20
    mov eax,[img_height] ;pun inaltimea pe stiva ca parametru
    push eax
    mov eax,[img_width] ;pun latimea pe stiva ca parametru
    push eax
    mov eax,[img] ;pun imaginea pe stiva ca parametru
    push eax
    call print_image ;afisez noua imagine
    add esp,12
    jmp done
solve_task3:
    mov eax, [ebp + 12]
    push DWORD[eax + 12]
    pop eax 
    push img;pun adresa imagini pe stiva
    push eax ;pun string pe stiva ca parametru
    mov eax, [ebp + 12]
    push DWORD[eax + 16]
    call atoi ;convertext stringul la cifra
    pop ecx
    push eax ;pun byte-id pe stiva
    call morse_encrypt
    add esp,12
    mov eax,[img_height]
    push eax ;pun pe stiva inaltimea ca si parametru
    mov eax,[img_width];pun pe stiva latimea ca si parametru
    push eax
    mov eax,[img];pun pe stiva imaginea
    push eax
    call print_image;afisez imaginea
    add esp,4
    jmp done
solve_task4:
    mov eax, [ebp + 12]
    push DWORD[eax + 16]
    call atoi ;convertesc stringul la int
    pop ecx
    push eax ;pun byte-id pe stiva ca si parametru
    mov eax, [ebp + 12]
    push DWORD[eax + 12] ;pun string pe stiva ca si parametru
    push img ;pun adresa imaginii pe stiva ca parametru
    call lsb_encode
    add esp,12
    mov eax,[img_height] ;pun pe stiva inaltimea ca si parametru
    push eax
    mov eax,[img_width] ;pun pe stiva latimea ca si parametru
    push eax
    mov eax,[img]   ;pun imaginea pe stiva ca si parametru
    push eax
    call print_image ;printez imaginea
    add esp,12
    jmp done
solve_task5:
    ;push img 
    mov eax, [ebp + 12]
    push DWORD[eax + 12]
    call atoi ;convertesc stringul la int
    push eax
    push img
    call lsb_decode
    add esp,12
    ;push 66
    ;call atoi
    ;PRINT_CHAR eax
    ; TODO Task5
    jmp done
solve_task6:
    ; TODO Task6
    jmp done

    ; Free the memory allocated for the image.
done:
    push DWORD[img]
    call free_image
    add esp, 4

    ; Epilogue
    ; Do not modify!
    xor eax, eax
    leave
    ret
    
