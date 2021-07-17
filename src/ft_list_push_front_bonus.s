global ft_list_push_front

extern malloc

ft_create_elem:
	push rdi
	mov  rdi, 16
	call malloc
	cmp  rax, 0
	jz   .return
	pop  rdi
	mov  [rax], rdi
	mov  rdx, qword 0
	mov  [rax + 8], rdx 

.return:
	ret

ft_list_push_front:
	cmp  rdi, 0
	jz   .quit
	
	push rdi
	mov  rdi, rsi
	call ft_create_elem
	pop  rdi
	
	cmp  rax, 0
	jz   .quit
	mov  rdx, [rdi]
	mov  [rax+8], rdx
	mov  [rdi], rax

.quit:
	ret
