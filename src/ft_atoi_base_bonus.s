global ft_atoi_base

section .text

ft_sign:
	cmp  [rdi], byte '-'
	jz   .minus
	mov  r10, 1
	cmp  [rdi], byte '+'
	jnz  .return
	inc  rdi
	jmp  .return

.minus:
	mov  r10, -1
	inc  rdi

.return:
	ret

ft_base:
	xor  rcx, rcx

.loop:
	cmp  byte [rsi + rcx], 0
	jz   .end_loop
	cmp  byte [rsi + rcx], '+'
	jz   .error
	cmp  byte [rsi + rcx], '-'
	jz   .error
	xor  rax, rax
	mov  r9b, [rsi + rcx] 

.inner_loop:
	cmp  rax, rcx
	jae  .inner_loop_quit
	cmp  r9b, [rsi+rax]
	jz   .error
	inc  rax
	jmp  .inner_loop

.inner_loop_quit:
	inc  rcx
	jmp  .loop

.end_loop:
	cmp  rcx, 2
	jae  .quit

.error:
	xor  rcx, rcx

.quit:
	ret

ft_atoi_base:
	cmp  rdi, 0				; rdi - str
	jz   .error				; rsi - base str
	cmp  rsi, 0				; rcx - base
	jz   .error				; r8 - j
	call ft_base			; r9 - tmp
	xor  rax, rax			; r10 - sign
	cmp  rcx, 0				; rax - answer
	jz   .error
	call ft_sign
.loop:
	cmp  byte [rdi], 0
	jz   .return
	mov  r9b, [rdi]
	xor  r8, r8
.inner_loop:
	cmp  r9b, [rsi+r8]
	jz   .inner_loop_quit
	cmp  [rsi+r8], byte 0
	jz   .inner_loop_quit
	inc  r8
	jmp  .inner_loop
.inner_loop_quit:
	cmp  r8, rcx
	jz   .error
	imul rcx
	push rax
	mov  rax, r8
	imul r10
	pop  rdx
	add  rax, rdx
	inc  rdi
	jmp  .loop

.error:
	xor  rax, rax

.return:
	ret
