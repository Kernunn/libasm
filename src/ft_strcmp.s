global ft_strcmp

section .text

ft_strcmp:
		cmp  rdi, 0
		jz   .cycle_quit		; check if pointer == NULL
		cmp  rsi, 0
		jz   .cycle_quit
		cld						; set direction (from low to high addres)

.cycle:
		cmp  byte [rdi], 0		; check if str1 is end
		jz   .cycle_quit
		cmpsb					; cmp [rdi] and [rsi] and inc rdi, inc rsi, and set flags
		je  .cycle
		jmp  .false				; if [rsi] and [rdi] not equal => false

.cycle_quit:
		cmp  byte [rsi], 0		; [rsi] == 0, check [rdi] == 0?
		jz   .true				; yes => rdi and rsi equal
		mov  rax, -1			; no => eax = [rdi] - 0 (eax - return)
		jmp  .quit

.false:
		jb  .great
.less:
		mov  rax, -1
		jmp  .quit
.great:
		mov  rax, 1
		jmp  .quit

.true:
		xor  rax, rax			; str1 and str2 is equal => return(0);

.quit:
		ret
