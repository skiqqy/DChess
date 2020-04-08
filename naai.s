	.file	"naai.c"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	$69
	pushq	$1
	pushq	$69
	pushq	$1
	pushq	$69
	pushq	$1
	pushq	$69
	pushq	$1
	movl	$69, %r9d
	movl	$1, %r8d
	movl	$69, %ecx
	movl	$1, %edx
	movl	$69, %esi
	movl	$1, %edi
	movl	$0, %eax
	call	test
	addq	$64, %rsp
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.globl	test
	.type	test, @function
test:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	%edx, -12(%rbp)
	movl	%ecx, -16(%rbp)
	movl	%r8d, -20(%rbp)
	movl	%r9d, -24(%rbp)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	test, .-test
	.ident	"GCC: (GNU) 9.3.1 20200317 (Red Hat 9.3.1-1)"
	.section	.note.GNU-stack,"",@progbits
