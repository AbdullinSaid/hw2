	.file	"str.c"
	.intel_syntax noprefix
	.text
	.globl	str
	.bss
	.align 32
	.type	str, @object
	.size	str, 2000000
str:
	.zero	2000000
	.section	.rodata
.LC0:
	.string	"%d"
.LC1:
	.string	"Incorrect input string size"
.LC2:
	.string	"start index %d"
	.text
	.globl	main
	.type	main, @function
main:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 48
	mov	DWORD PTR -36[rbp], edi
	mov	QWORD PTR -48[rbp], rsi
	mov	DWORD PTR -4[rbp], 0
	lea	rax, -24[rbp]
	mov	rsi, rax
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR -24[rbp]
	cmp	eax, 1
	jg	.L2
	mov	eax, DWORD PTR -24[rbp]
	mov	esi, eax
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
	jmp	.L13
.L2:
	mov	rax, QWORD PTR stdin[rip]
	mov	rdi, rax
	call	fgetc@PLT
	mov	BYTE PTR -17[rbp], al
	mov	eax, DWORD PTR -4[rbp]
	lea	edx, 1[rax]
	mov	DWORD PTR -4[rbp], edx
	cdqe
	lea	rcx, str[rip]
	movzx	edx, BYTE PTR -17[rbp]
	mov	BYTE PTR [rax+rcx], dl
	cmp	BYTE PTR -17[rbp], -1
	je	.L4
	cmp	DWORD PTR -4[rbp], 1999999
	jle	.L2
.L4:
	cmp	BYTE PTR -17[rbp], -1
	je	.L5
	cmp	DWORD PTR -4[rbp], 1999999
	jle	.L5
	lea	rax, .LC1[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	eax, 0
	jmp	.L13
.L5:
	mov	DWORD PTR -8[rbp], 1
	mov	DWORD PTR -12[rbp], 1
	jmp	.L6
.L12:
	mov	eax, DWORD PTR -12[rbp]
	cdqe
	lea	rdx, str[rip]
	movzx	edx, BYTE PTR [rax+rdx]
	mov	eax, DWORD PTR -12[rbp]
	sub	eax, 1
	cdqe
	lea	rcx, str[rip]
	movzx	eax, BYTE PTR [rax+rcx]
	cmp	dl, al
	jge	.L7
	add	DWORD PTR -8[rbp], 1
	jmp	.L8
.L7:
	mov	DWORD PTR -8[rbp], 1
.L8:
	mov	eax, DWORD PTR -24[rbp]
	cmp	DWORD PTR -8[rbp], eax
	jne	.L9
	mov	eax, DWORD PTR -12[rbp]
	sub	eax, DWORD PTR -8[rbp]
	add	eax, 1
	mov	esi, eax
	lea	rax, .LC2[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, DWORD PTR -12[rbp]
	sub	eax, DWORD PTR -8[rbp]
	add	eax, 1
	mov	DWORD PTR -16[rbp], eax
	jmp	.L10
.L11:
	mov	eax, DWORD PTR -16[rbp]
	cdqe
	lea	rdx, str[rip]
	movzx	eax, BYTE PTR [rax+rdx]
	movsx	eax, al
	mov	edi, eax
	call	putchar@PLT
	add	DWORD PTR -16[rbp], 1
.L10:
	mov	edx, DWORD PTR -12[rbp]
	mov	eax, DWORD PTR -8[rbp]
	add	eax, edx
	cmp	DWORD PTR -16[rbp], eax
	jl	.L11
	mov	eax, 0
	jmp	.L13
.L9:
	add	DWORD PTR -12[rbp], 1
.L6:
	mov	eax, DWORD PTR -12[rbp]
	cmp	eax, DWORD PTR -4[rbp]
	jl	.L12
	mov	eax, 0
.L13:
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
