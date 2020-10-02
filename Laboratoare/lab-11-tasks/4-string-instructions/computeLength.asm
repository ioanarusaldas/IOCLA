global computeLength1
global computeLength2

section .text
computeLength1:
	push ebp
	mov ebp, esp
;TODO: Implement byte count using a software loop
				
	mov esp, ebp
	pop ebp
	ret

computeLength2:
	push ebp
	mov ebp, esp
;TODO: Implement byte count using a hardware loop

	mov esp, ebp
	pop ebp
	ret
