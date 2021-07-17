global ft_write

extern __errno_location

section .text

ft_write:
	mov  rax, 1
	syscall
	mov  rcx, 0xfffff000
	cmp  rax, rcx
	jb   .return
	mov  rdx, rax
	call __errno_location
	xor  rcx, rcx
	sub	 rcx, rdx
	mov  [rax], rcx
	mov  rax, -1

.return:
	ret
