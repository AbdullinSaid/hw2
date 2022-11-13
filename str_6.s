	.file	"str_6.c"
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
	.string	"start index %d "
	.text
	.globl	search_sequence                            # функция search_sequence
	.type	search_sequence, @function                 # объявление что search_sequence это функция
search_sequence:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	DWORD PTR -20[rbp], edi
	mov	DWORD PTR -24[rbp], esi
	mov	DWORD PTR -4[rbp], 1
	mov	DWORD PTR -8[rbp], 1
	jmp	.L2
.L9:
	mov	eax, DWORD PTR -8[rbp]
	cdqe
	lea	rdx, str[rip]
	movzx	edx, BYTE PTR [rax+rdx]
	mov	eax, DWORD PTR -8[rbp]
	sub	eax, 1
	cdqe
	lea	rcx, str[rip]
	movzx	eax, BYTE PTR [rax+rcx]
	cmp	dl, al
	jge	.L3
	add	DWORD PTR -4[rbp], 1
	jmp	.L4
.L3:
	mov	DWORD PTR -4[rbp], 1
.L4:
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR -24[rbp]
	jne	.L5
	mov	eax, DWORD PTR -8[rbp]
	sub	eax, DWORD PTR -4[rbp]
	add	eax, 1
	mov	esi, eax
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, DWORD PTR -8[rbp]
	sub	eax, DWORD PTR -4[rbp]
	add	eax, 1
	mov	DWORD PTR -12[rbp], eax
	jmp	.L6
.L7:
	mov	eax, DWORD PTR -12[rbp]
	cdqe
	lea	rdx, str[rip]
	movzx	eax, BYTE PTR [rax+rdx]
	movsx	eax, al
	mov	edi, eax
	call	putchar@PLT
	add	DWORD PTR -12[rbp], 1
.L6:
	mov	edx, DWORD PTR -8[rbp]
	mov	eax, DWORD PTR -4[rbp]
	add	eax, edx
	cmp	DWORD PTR -12[rbp], eax
	jl	.L7
	jmp	.L1
.L5:
	add	DWORD PTR -8[rbp], 1
.L2:
	mov	eax, DWORD PTR -8[rbp]
	cmp	eax, DWORD PTR -20[rbp]
	jl	.L9
.L1:
	leave
	ret
	.size	search_sequence, .-search_sequence
	.section	.rodata
.LC1:
	.string	"%d"
.LC2:
	.string	"Incorrect input n"
.LC3:
	.string	"Incorrect input string size"
	.text
	.globl	main
	.type	main, @function
main:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	DWORD PTR -20[rbp], edi
	mov	QWORD PTR -32[rbp], rsi
	mov	DWORD PTR -4[rbp], 0
	lea	rax, -12[rbp]
	mov	rsi, rax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR -12[rbp]
	cmp	eax, 1
	jg	.L11
	lea	rax, .LC2[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	eax, 0
	jmp	.L15
.L11:
	mov	rax, QWORD PTR stdin[rip]
	mov	rdi, rax
	call	fgetc@PLT
	mov	BYTE PTR -5[rbp], al
	mov	eax, DWORD PTR -4[rbp]
	lea	edx, 1[rax]
	mov	DWORD PTR -4[rbp], edx
	cdqe
	lea	rcx, str[rip]
	movzx	edx, BYTE PTR -5[rbp]
	mov	BYTE PTR [rax+rcx], dl
	cmp	BYTE PTR -5[rbp], 10
	je	.L13
	cmp	DWORD PTR -4[rbp], 1999999
	jle	.L11
.L13:
	cmp	BYTE PTR -5[rbp], -1
	je	.L14
	cmp	DWORD PTR -4[rbp], 1999999
	jle	.L14
	lea	rax, .LC3[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	eax, 0
	jmp	.L15
.L14:
	mov	edx, DWORD PTR -12[rbp]
	mov	eax, DWORD PTR -4[rbp]
	mov	esi, edx
	mov	edi, eax
	call	search_sequence                       # вызов search_sequence
	mov	eax, 0
.L15:
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
