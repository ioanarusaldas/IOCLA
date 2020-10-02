%include "io.inc"

section .data
source_text: db "ABCABCBABCBABCBBBABABBCBABCBAAACCCB", 0
;source_text: db "ABABC", 0
substring: db "BABC", 0

source_length: resd 1
substr_length: dd 4

print_format: db "Substring found at index: ", 0

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    push ebp
    mov ebp, esp

     ; TODO: Fill source_length with the length of the source_text string.
    cld              ; setăm DF = 0
    mov al, 0      ; char-ul pe care vrem să îl căutăm
    mov edi, source_text  ; zona de memorie în care căutăm
    repne scasb           ; Find the length of the string using scasb.
    sub edi, source_text
    dec edi
    mov [source_length], edi
    PRINT_UDEC 4, [source_length]
    NEWLINE
    
    mov ebx ,[source_length]
    mov ecx, [substr_length]
    cld
    mov edi,source_text
    mov esi, substring
l:   
    mov ecx, [substr_length]
     repe cmpsb 
       sub esi, substring
       cmp ecx,0
       je eq;
       jmp noeq;
      ;sub edi, source_text
      
noeq:
      mov esi, substring
       cmp edi,source_text+source_length
       je final
      jmp l
eq:
    mov eax,edi
    sub eax, source_text
    sub eax,[substr_length]
    mov esi, substring
    PRINT_UDEC 4, eax
    NEWLINE
    cmp ecx,0
    je final
    jmp l;
final:

    ; Find the length of the string using scasb.

    ; TODO: Print the start indices for all occurrences of the substring in source_text

    leave
    ret
