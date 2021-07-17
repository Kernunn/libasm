global ft_list_remove_if

extern free

section .text

ft_list_remove_if:
	cmp  rdi, 0					; rdi - **begin
	jz   .quit					; rsi - *data_ref
	mov  r8, [rdi]				; rdx - int *cmp
	mov  r9, 0					; r8 - *cur

.loop:							; r9 - *prev
	cmp  r8, 0					; r10 - *next
	jz   .quit
	mov  r10, [r8+8]
	push rdi
	mov  rdi, [r8]
	call rdx
	pop  rdi
	cmp  rax, 0
	jz   .if
	mov  r9, r8
	mov  r8, r10
	jmp  .loop
.if:
	cmp  r9, 0
	jnz  .inner_if
	mov  [rdi], r10
	jmp  .quit_if
.inner_if:
	mov  [r9+8], r10
.quit_if:
	push rdi
	push rsi
	push rdx
	push r8
	push r9
	push r10
	mov  rdi, r8
	call free
	pop  r10
	pop  r9
	pop  r8
	pop  rdx
	pop  rsi
	pop  rdi
	mov  r8, r10
	jmp  .loop

.quit:
	ret
