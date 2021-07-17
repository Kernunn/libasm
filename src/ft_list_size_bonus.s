global ft_list_size

section .text

ft_list_size:
	xor  rax, rax
.loop:
	cmp  rdi, 0
	jz   .quit
	mov  rdi, [rdi+8]
	inc  rax
	jmp  .loop

.quit:
	ret
