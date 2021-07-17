global ft_list_sort

section .text

ft_list_sort:
	mov  r8, 1					; rdi - **begin
	cmp  rdi, 0					; rsi - cmp
	jz   .quit					; r8 - i
	xor  rax, rax				; r9 - tmp_list
	cmp  [rdi], rax				; r10 - tmp_data
	jz   .quit
.loop:
	cmp  r8, 0
	jz   .quit
	mov  r9, [rdi]
	xor  r8, r8
.inner_loop:
	mov  rax, [r9+8]
	cmp  rax, 0
	jz   .loop
	
	push rdi
	push rsi
	mov  rdi, [r9]
	mov  rdx, rsi
	mov  rsi, [rax]
	call rdx
	pop  rsi
	pop  rdi
	cmp  rax, 0
	jle  .quit_if
	mov  r10, [r9]
	mov  r11, [r9+8]
	mov  rdx, [r11]
	mov  [r9], rdx
	mov  [r11], r10
	inc  r8
.quit_if:
	mov  r9, [r9+8]
	jmp  .inner_loop
.quit:
	ret

print_list:
	mov  rax, [rdi]
	cmp  rax, 0
	jz   .quit
.loop:
	mov  rdi, 1
	mov  rsi, [rax]
	mov  rdx, 2
	push rax
	mov  rax, 1
	syscall
	pop  rax
	mov  rax, [rax+8]
	cmp  rax, 0
	jz   .quit
	jmp  .loop
.quit:
	ret
