global ft_strlen

section .text

ft_strlen:
		xor  rax, rax			; rax = 0
		cmp  rdi, 0				; check if src == NULL
		jz   .cycle_quit

.cycle:							; loop
		cmp  byte [rdi+rax], 0		; check if byte == 0
		jz   .cycle_quit
		inc  rax				; incremetn counter
		jmp  short .cycle		; jump

.cycle_quit:
		ret
