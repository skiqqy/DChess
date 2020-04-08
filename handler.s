	.file	"handler.c"
	.text
	.section	.rodata
.LC0:
	.string	"Hello"
	.text
	.globl	oof
	.type	oof, @function
oof:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	$.LC0, %edi
	call	puts
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	oof, .-oof
	.ident	"GCC: (GNU) 9.3.1 20200317 (Red Hat 9.3.1-1)"
	.section	.note.GNU-stack,"",@progbits
