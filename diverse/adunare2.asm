 %include "io.inc"

section .data
   word_num1 dd 0xff543210
   word_num2 dd 0x00111111
   result_word resd 2
   big_num1 dd 0x11111111, 0x22222222, 0x33333333
   big_num2 dd 0xffffffff, 0x22222222, 0x33333333
   result_4word resd 4
   num_array1 dd 0x11111111, 0x22222222, 0x33333333, 0x12111211, 0x22232242, 0xff333333, 0xff123456, 0xff123456, 0xff123456
   num_array2 dd 0xffffffff, 0x22922252, 0x33033338, 0x12111211, 0x22232242, 0xff333333, 0xff123456, 0xff123456, 0xff123456
   result_array resd 12
   length dd 3

section .text
global main
main:
    push ebp
    mov ebp, esp
    mov eax, [word_num1]
    add eax, [word_num2]
    mov [result_word],eax
    PRINT_HEX 4, [result_word]
    NEWLINE

    ;TODO a, b, c: Implement the array sum starting with double word sum incrementally solving subsequent task b and c.
    mov ecx, 2
    pushfd
sum:
   
    popfd
    cmp ecx,-1
    je out
    mov eax,[big_num1+ecx*4]
    add eax, [big_num2+ecx*4]
    jnc result  ;verificare carry
    add dword[result_4word+ecx*4-4], 1  ;adun carry
result:
    add [result_4word+ecx*4], eax
    pushfd
    dec ecx ;trece urmator octet
    jmp sum
out:   
   xor ecx,ecx
   
print1:
    PRINT_HEX 4, [result_4word+ecx*4]   ;afisare rezultat adunare 4 octeti
    inc ecx
    cmp ecx ,3
    jne print1
    
    NEWLINE
    xor ebx,ebx
    xor edx,edx
next:
    mov ecx,2
    
vect:   ;parcurgere elemente 
    cmp ecx, -1
    je salt
    mov eax,[num_array1 + ebx + ecx*4]
    add eax,[num_array2 + ebx + ecx*4]
    jnc result1
    add dword[result_array+edx+(ecx+1)*4-4], 1
result1:   
    add [result_array+edx+(ecx+1)*4], eax   

    dec ecx ;parcurgere octeti
    jmp vect
 salt:  
    add ebx,12
    add edx,16
    cmp ebx,36
    jl next
 
 xor edx, edx
 xor ecx,ecx

print_vect:;afisare suma elemente vector 4 octeti
    xor ecx,ecx
print_el:
    cmp ecx,4
    je nextel
    PRINT_HEX 4, [result_array+edx+ecx*4]
    inc ecx
    jmp print_el
nextel:
    NEWLINE
    cmp edx,32
    je out1
    add edx,16
    jmp print_vect
    
out1:    
    leave
    ret
