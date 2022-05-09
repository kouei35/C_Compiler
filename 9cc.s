	.file	"9cc.c"
	.text
	.comm	token,8,8
	.comm	user_input,8,8
	.globl	primary
	.type	primary, @function
primary:
.LFB5:
	.cfi_startproc
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movl	$40, %edi
	call	consume
	testb	%al, %al
	je	.L2
	movl	$0, %eax
	call	expr
	movq	%rax, 8(%rsp)
	movl	$41, %edi
	call	expect
	movq	8(%rsp), %rax
	jmp	.L3
.L2:
	movl	$0, %eax
	call	expect_number
	movl	%eax, %edi
	call	new_node_num
.L3:
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE5:
	.size	primary, .-primary
	.globl	mul
	.type	mul, @function
mul:
.LFB6:
	.cfi_startproc
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movl	$0, %eax
	call	primary
	movq	%rax, 8(%rsp)
.L9:
	movl	$42, %edi
	call	consume
	testb	%al, %al
	je	.L5
	movl	$0, %eax
	call	primary
	movq	%rax, %rdx
	movq	8(%rsp), %rax
	movq	%rax, %rsi
	movl	$2, %edi
	call	new_node
	movq	%rax, 8(%rsp)
	jmp	.L9
.L5:
	movl	$47, %edi
	call	consume
	testb	%al, %al
	je	.L7
	movl	$0, %eax
	call	primary
	movq	%rax, %rdx
	movq	8(%rsp), %rax
	movq	%rax, %rsi
	movl	$3, %edi
	call	new_node
	movq	%rax, 8(%rsp)
	jmp	.L9
.L7:
	movq	8(%rsp), %rax
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE6:
	.size	mul, .-mul
	.globl	expr
	.type	expr, @function
expr:
.LFB7:
	.cfi_startproc
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movl	$0, %eax
	call	mul
	movq	%rax, 8(%rsp)
.L16:
	movl	$43, %edi
	call	consume
	testb	%al, %al
	je	.L12
	movl	$0, %eax
	call	mul
	movq	%rax, %rdx
	movq	8(%rsp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	new_node
	movq	%rax, 8(%rsp)
	jmp	.L16
.L12:
	movl	$45, %edi
	call	consume
	testb	%al, %al
	je	.L14
	movl	$0, %eax
	call	mul
	movq	%rax, %rdx
	movq	8(%rsp), %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	new_node
	movq	%rax, 8(%rsp)
	jmp	.L16
.L14:
	movq	8(%rsp), %rax
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE7:
	.size	expr, .-expr
	.section	.rodata
.LC0:
	.string	"%s\n"
.LC1:
	.string	" "
.LC2:
	.string	"%*s"
.LC3:
	.string	"^ "
	.text
	.globl	error_at
	.type	error_at, @function
error_at:
.LFB8:
	.cfi_startproc
	subq	$248, %rsp
	.cfi_def_cfa_offset 256
	movq	%rdi, 8(%rsp)
	movq	%rsi, (%rsp)
	movq	%rdx, 80(%rsp)
	movq	%rcx, 88(%rsp)
	movq	%r8, 96(%rsp)
	movq	%r9, 104(%rsp)
	testb	%al, %al
	je	.L19
	movaps	%xmm0, 112(%rsp)
	movaps	%xmm1, 128(%rsp)
	movaps	%xmm2, 144(%rsp)
	movaps	%xmm3, 160(%rsp)
	movaps	%xmm4, 176(%rsp)
	movaps	%xmm5, 192(%rsp)
	movaps	%xmm6, 208(%rsp)
	movaps	%xmm7, 224(%rsp)
.L19:
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	movl	$16, 32(%rsp)
	movl	$48, 36(%rsp)
	leaq	256(%rsp), %rax
	movq	%rax, 40(%rsp)
	leaq	64(%rsp), %rax
	movq	%rax, 48(%rsp)
	movq	8(%rsp), %rax
	movq	user_input(%rip), %rdx
	subq	%rdx, %rax
	movl	%eax, 28(%rsp)
	movq	user_input(%rip), %rdx
	movq	stderr(%rip), %rax
	movl	$.LC0, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	movq	stderr(%rip), %rax
	movl	28(%rsp), %edx
	movl	$.LC1, %ecx
	movl	$.LC2, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$2, %edx
	movl	$1, %esi
	movl	$.LC3, %edi
	call	fwrite
	movq	stderr(%rip), %rax
	leaq	32(%rsp), %rdx
	movq	(%rsp), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	vfprintf
	movq	stderr(%rip), %rax
	movq	%rax, %rsi
	movl	$10, %edi
	call	fputc
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE8:
	.size	error_at, .-error_at
	.globl	consume
	.type	consume, @function
consume:
.LFB9:
	.cfi_startproc
	movl	%edi, %eax
	movb	%al, -4(%rsp)
	movq	token(%rip), %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	jne	.L22
	movq	token(%rip), %rax
	movq	24(%rax), %rax
	movzbl	(%rax), %eax
	cmpb	%al, -4(%rsp)
	je	.L23
.L22:
	movl	$0, %eax
	ret
.L23:
	movq	token(%rip), %rax
	movq	8(%rax), %rax
	movq	%rax, token(%rip)
	movl	$1, %eax
	ret
	.cfi_endproc
.LFE9:
	.size	consume, .-consume
	.section	.rodata
.LC4:
	.string	"'%c'\343\201\247\343\201\257\343\201\202\343\202\212\343\201\276\343\201\233\343\202\223"
	.text
	.globl	expect
	.type	expect, @function
expect:
.LFB10:
	.cfi_startproc
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movl	%edi, %eax
	movb	%al, 12(%rsp)
	movq	token(%rip), %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	jne	.L26
	movq	token(%rip), %rax
	movq	24(%rax), %rax
	movzbl	(%rax), %eax
	cmpb	%al, 12(%rsp)
	je	.L27
.L26:
	movsbl	12(%rsp), %edx
	movq	token(%rip), %rax
	movq	24(%rax), %rax
	movl	$.LC4, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	error_at
.L27:
	movq	token(%rip), %rax
	movq	8(%rax), %rax
	movq	%rax, token(%rip)
	nop
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE10:
	.size	expect, .-expect
	.section	.rodata
.LC5:
	.string	"\346\225\260\343\201\247\343\201\257\343\201\202\343\202\212\343\201\276\343\201\233\343\202\223"
	.text
	.globl	expect_number
	.type	expect_number, @function
expect_number:
.LFB11:
	.cfi_startproc
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movq	token(%rip), %rax
	movl	(%rax), %eax
	cmpl	$1, %eax
	je	.L29
	movq	token(%rip), %rax
	movq	24(%rax), %rax
	movl	$.LC5, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	error_at
.L29:
	movq	token(%rip), %rax
	movl	16(%rax), %eax
	movl	%eax, 12(%rsp)
	movq	token(%rip), %rax
	movq	8(%rax), %rax
	movq	%rax, token(%rip)
	movl	12(%rsp), %eax
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE11:
	.size	expect_number, .-expect_number
	.globl	at_eof
	.type	at_eof, @function
at_eof:
.LFB12:
	.cfi_startproc
	movq	token(%rip), %rax
	movl	(%rax), %eax
	cmpl	$2, %eax
	sete	%al
	ret
	.cfi_endproc
.LFE12:
	.size	at_eof, .-at_eof
	.globl	new_token
	.type	new_token, @function
new_token:
.LFB13:
	.cfi_startproc
	subq	$56, %rsp
	.cfi_def_cfa_offset 64
	movl	%edi, 28(%rsp)
	movq	%rsi, 16(%rsp)
	movq	%rdx, 8(%rsp)
	movl	$32, %esi
	movl	$1, %edi
	call	calloc
	movq	%rax, 40(%rsp)
	movq	40(%rsp), %rax
	movl	28(%rsp), %edx
	movl	%edx, (%rax)
	movq	40(%rsp), %rax
	movq	8(%rsp), %rdx
	movq	%rdx, 24(%rax)
	movq	16(%rsp), %rax
	movq	40(%rsp), %rdx
	movq	%rdx, 8(%rax)
	movq	40(%rsp), %rax
	addq	$56, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE13:
	.size	new_token, .-new_token
	.section	.rodata
	.align 8
.LC6:
	.string	"\343\203\210\343\203\274\343\202\257\343\203\212\343\202\244\343\202\272\343\201\247\343\201\215\343\201\276\343\201\233\343\202\223"
	.text
	.globl	tokenize
	.type	tokenize, @function
tokenize:
.LFB14:
	.cfi_startproc
	subq	$88, %rsp
	.cfi_def_cfa_offset 96
	movq	%rdi, 8(%rsp)
	movq	%fs:40, %rax
	movq	%rax, 72(%rsp)
	xorl	%eax, %eax
	movq	$0, 40(%rsp)
	leaq	32(%rsp), %rax
	movq	%rax, 24(%rsp)
	jmp	.L36
.L41:
	call	__ctype_b_loc
	movq	(%rax), %rdx
	movq	8(%rsp), %rax
	movzbl	(%rax), %eax
	movsbq	%al, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	movzwl	(%rax), %eax
	movzwl	%ax, %eax
	andl	$8192, %eax
	testl	%eax, %eax
	je	.L37
	movq	8(%rsp), %rax
	addq	$1, %rax
	movq	%rax, 8(%rsp)
	jmp	.L36
.L37:
	movq	8(%rsp), %rax
	movzbl	(%rax), %eax
	cmpb	$43, %al
	je	.L38
	movq	8(%rsp), %rax
	movzbl	(%rax), %eax
	cmpb	$45, %al
	jne	.L39
.L38:
	movq	8(%rsp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, 8(%rsp)
	movq	24(%rsp), %rcx
	movq	%rax, %rdx
	movq	%rcx, %rsi
	movl	$0, %edi
	call	new_token
	movq	%rax, 24(%rsp)
	jmp	.L36
.L39:
	call	__ctype_b_loc
	movq	(%rax), %rdx
	movq	8(%rsp), %rax
	movzbl	(%rax), %eax
	movsbq	%al, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	movzwl	(%rax), %eax
	movzwl	%ax, %eax
	andl	$2048, %eax
	testl	%eax, %eax
	je	.L40
	movq	8(%rsp), %rdx
	movq	24(%rsp), %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	new_token
	movq	%rax, 24(%rsp)
	movq	8(%rsp), %rax
	leaq	8(%rsp), %rcx
	movl	$10, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strtol
	movl	%eax, %edx
	movq	24(%rsp), %rax
	movl	%edx, 16(%rax)
	jmp	.L36
.L40:
	movq	token(%rip), %rax
	movq	24(%rax), %rax
	movl	$.LC6, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	error_at
.L36:
	movq	8(%rsp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L41
	movq	8(%rsp), %rdx
	movq	24(%rsp), %rax
	movq	%rax, %rsi
	movl	$2, %edi
	call	new_token
	movq	40(%rsp), %rax
	movq	72(%rsp), %rcx
	xorq	%fs:40, %rcx
	je	.L43
	call	__stack_chk_fail
.L43:
	addq	$88, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE14:
	.size	tokenize, .-tokenize
	.globl	new_node
	.type	new_node, @function
new_node:
.LFB15:
	.cfi_startproc
	subq	$56, %rsp
	.cfi_def_cfa_offset 64
	movl	%edi, 28(%rsp)
	movq	%rsi, 16(%rsp)
	movq	%rdx, 8(%rsp)
	movl	$32, %esi
	movl	$1, %edi
	call	calloc
	movq	%rax, 40(%rsp)
	movq	40(%rsp), %rax
	movl	28(%rsp), %edx
	movl	%edx, (%rax)
	movq	40(%rsp), %rax
	movq	16(%rsp), %rdx
	movq	%rdx, 8(%rax)
	movq	40(%rsp), %rax
	movq	8(%rsp), %rdx
	movq	%rdx, 16(%rax)
	movq	40(%rsp), %rax
	addq	$56, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE15:
	.size	new_node, .-new_node
	.globl	new_node_num
	.type	new_node_num, @function
new_node_num:
.LFB16:
	.cfi_startproc
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	movl	%edi, 12(%rsp)
	movl	$32, %esi
	movl	$1, %edi
	call	calloc
	movq	%rax, 24(%rsp)
	movq	24(%rsp), %rax
	movl	$4, (%rax)
	movq	24(%rsp), %rax
	movl	12(%rsp), %edx
	movl	%edx, 24(%rax)
	movq	24(%rsp), %rax
	addq	$40, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE16:
	.size	new_node_num, .-new_node_num
	.section	.rodata
.LC7:
	.string	"\tpush %d\n"
.LC8:
	.string	"\tpop rdi"
.LC9:
	.string	"\tpop rax"
.LC10:
	.string	"\tadd rax, rdi"
.LC11:
	.string	"\tsub rax, rdi"
.LC12:
	.string	"\timul rax,rdi"
.LC13:
	.string	"\tcqo"
.LC14:
	.string	"\tidiv rdi"
.LC15:
	.string	"\tpush rax"
	.text
	.globl	gen
	.type	gen, @function
gen:
.LFB17:
	.cfi_startproc
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movq	%rdi, 8(%rsp)
	movq	8(%rsp), %rax
	movl	(%rax), %eax
	cmpl	$4, %eax
	jne	.L49
	movq	8(%rsp), %rax
	movl	24(%rax), %eax
	movl	%eax, %esi
	movl	$.LC7, %edi
	movl	$0, %eax
	call	printf
	jmp	.L48
.L49:
	movq	8(%rsp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rdi
	call	gen
	movq	8(%rsp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rdi
	call	gen
	movl	$.LC8, %edi
	call	puts
	movl	$.LC9, %edi
	call	puts
	movq	8(%rsp), %rax
	movl	(%rax), %eax
	cmpl	$1, %eax
	je	.L52
	cmpl	$1, %eax
	jb	.L53
	cmpl	$2, %eax
	je	.L54
	cmpl	$3, %eax
	je	.L55
	jmp	.L51
.L53:
	movl	$.LC10, %edi
	call	puts
	jmp	.L51
.L52:
	movl	$.LC11, %edi
	call	puts
	jmp	.L51
.L54:
	movl	$.LC12, %edi
	call	puts
	jmp	.L51
.L55:
	movl	$.LC13, %edi
	call	puts
	movl	$.LC14, %edi
	call	puts
	nop
.L51:
	movl	$.LC15, %edi
	call	puts
.L48:
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE17:
	.size	gen, .-gen
	.section	.rodata
	.align 8
.LC16:
	.string	"\345\274\225\346\225\260\343\201\256\345\200\213\346\225\260\343\201\214\346\255\243\343\201\227\343\201\217\343\201\202\343\202\212\343\201\276\343\201\233\343\202\223"
.LC17:
	.string	".intel_syntax noprefix"
.LC18:
	.string	".globl main"
.LC19:
	.string	"main:"
.LC20:
	.string	"\tret"
	.text
	.globl	main
	.type	main, @function
main:
.LFB18:
	.cfi_startproc
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	movl	%edi, 12(%rsp)
	movq	%rsi, (%rsp)
	cmpl	$2, 12(%rsp)
	je	.L57
	movq	token(%rip), %rax
	movq	24(%rax), %rax
	movl	$.LC16, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	error_at
	movl	$1, %eax
	jmp	.L58
.L57:
	movq	(%rsp), %rax
	movq	8(%rax), %rax
	movq	%rax, user_input(%rip)
	movq	user_input(%rip), %rax
	movq	%rax, %rdi
	call	tokenize
	movq	%rax, token(%rip)
	movl	$0, %eax
	call	expr
	movq	%rax, 24(%rsp)
	movl	$.LC17, %edi
	call	puts
	movl	$.LC18, %edi
	call	puts
	movl	$.LC19, %edi
	call	puts
	movq	24(%rsp), %rax
	movq	%rax, %rdi
	call	gen
	movl	$.LC9, %edi
	call	puts
	movl	$.LC20, %edi
	call	puts
	movl	$0, %eax
.L58:
	addq	$40, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE18:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
