global ft_strcpy

section .text

ft_strcpy:
		push rdi

		cmp  rdi, 0
		jz   .cycle_quit		; check if pointer == NULL
		cmp  rsi, 0
		jz   .cycle_quit
		cld						; set direction (from low to high addres)

.cycle:
		cmp  byte [rsi], 0		; check if str is end
		jz   .cycle_quit
		movsb					; copy from [rsi] to [rdi] and inc rsi, inc rdi
		jmp  .cycle

.cycle_quit:
		mov rax, 0
		mov [rdi], rax
		pop rax
		ret
