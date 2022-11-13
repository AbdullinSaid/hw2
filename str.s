	.file	"str.c"                            # откуда исходный код    
	.intel_syntax noprefix                     # intel синтаксис
	.text                                      # начало секции
	.globl	str 	                           # массив str элементов char 
	.bss
	.align 32
	.type	str, @object
	.size	str, 2000000                       # задается размер массива
str:
	.zero	2000000                            # заполняется нулями
	.section	.rodata                    # секция rodata
.LC0:                                              # метка .LC0
	.string	"%d"                               # строка, которая используется для ввода N
.LC1:                                              # метка .LC1
	.string	"Incorrect input string size"      # строка, которая используется для вывода сообщения об ошибке во входных данных
.LC2:                                              # метка .LC2
	.string	"start index %d"                   # строка, которая используется для вывода индекса начала найденного ответа
	.text                                      # секция кода
	.globl	main                               # объявление main
	.type	main, @function                    # указание, что main - функция
main:                                              # метка main
	endbr64                                    # завершение 64 битной ветви
	push	rbp                                # сохранение rbp на стеке
	mov	rbp, rsp                           # присваивание регистру rbp значение из rsp
	sub	rsp, 48                            # сдвиг регистра на 48
	mov	DWORD PTR -36[rbp], edi            # аргумент argc кладется в edi
	mov	QWORD PTR -48[rbp], rsi            # аргумент argc кладется в rsi
	mov	DWORD PTR -4[rbp], 0               # size = 0
	lea	rax, -24[rbp]                      # n
	mov	rsi, rax                           # rax присваивается rsi
	lea	rax, .LC0[rip]                     # далее идет считывание n из входных данных
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR -24[rbp]
	cmp	eax, 1                             # сравнение n с 1(т.к. в оригинале сравнивается n < 2)
	jg	.L2                                # если больше, то переход к L2
	mov	eax, DWORD PTR -24[rbp]
	mov	esi, eax
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT                         # вывод сообщения про неправильный вывод
	mov	eax, 0
	jmp	.L13                               # переход к L13(т.е. return 0)
.L2:                                               # метка .L2
	mov	rax, QWORD PTR stdin[rip]          # присваивание rax ссылки на поток stdin
	mov	rdi, rax                           # присваивание rdi rax
	call	fgetc@PLT                          # макрос получения символа из входного потока
	mov	BYTE PTR -17[rbp], al              # присваивание str[size] считанный c(al его аналог тут) 
	mov	eax, DWORD PTR -4[rbp]             # присваивание eax size
	lea	edx, 1[rax]                        # присваивание регистру edx значение по ссылке rax + 1
	mov	DWORD PTR -4[rbp], edx             # size++
	cdqe                                       # расширение 32 битного значения в eax до 64 битного в rax
	lea	rcx, str[rip]                      # присваивание регистру rcx значение &str[rip], т.е. адреса начала массива str
	movzx	edx, BYTE PTR -17[rbp]             # присваивание регистру edx size
	mov	BYTE PTR [rax+rcx], dl             # присваивание по ссылке *(rax + rcx) значения регистра dl
	cmp	BYTE PTR -17[rbp], -1              # проверка, что не конец файла
	je	.L4                                # переход к L4
	cmp	DWORD PTR -4[rbp], 1999999         # проверка, что не вышли за максимальный размер массива str
	jle	.L2                                # повтор итерации цикла
.L4:                                               # метка .L4
	cmp	BYTE PTR -17[rbp], -1              # сравнение с и -1
	je	.L5                                # при != переход в метку L5
	cmp	DWORD PTR -4[rbp], 1999999         # сравнение size < 200000
	jle	.L5                                # при < переход в метку L5
	lea	rax, .LC1[rip]                     
	mov	rdi, rax
	call	puts@PLT                           # вывод сообщения об ошибке
	mov	eax, 0
	jmp	.L13
.L5:                                               # метка .L5
	mov	DWORD PTR -8[rbp], 1               # counter = 1 
	mov	DWORD PTR -12[rbp], 1              # i = 1
	jmp	.L6                                # переход в метку L6
.L12:                                              # метка .L12
	mov	eax, DWORD PTR -12[rbp]            # присваивание регистру eax i
	cdqe                                       # расширение 32 битного значения в eax до 64 битного в rax
	lea	rdx, str[rip]                      # присваивание регистру rcx значение &str[rip], т.е. адреса начала массива str
	movzx	edx, BYTE PTR [rax+rdx]            # присваивание edx значения из *(rax + rcx)
	mov	eax, DWORD PTR -12[rbp]            # присваивание eax значения i
	sub	eax, 1                             # i - 1
	cdqe
	lea	rcx, str[rip]                      
	movzx	eax, BYTE PTR [rax+rcx]            # присваивание edx значения из *(rax + rcx)
	cmp	dl, al                             # сравнение str[i] < str[i - 1] 
	jge	.L7                                # переход метку L7 при str[i] >= str[i - 1]
	add	DWORD PTR -8[rbp], 1               # counter++
	jmp	.L8                                # переход в метку L8
.L7:                                               # метка .L7
	mov	DWORD PTR -8[rbp], 1               # counter = 1
.L8:                                               # метка .L8
	mov	eax, DWORD PTR -24[rbp]            # присваивание регистру eax значение n
	cmp	DWORD PTR -8[rbp], eax             # сравнение counter == n
	jne	.L9                                # переход в метку L9 при !=
	mov	eax, DWORD PTR -12[rbp]            # далее происходит вывод start index
	sub	eax, DWORD PTR -8[rbp]             # и самой найденной последовательности
	add	eax, 1
	mov	esi, eax
	lea	rax, .LC2[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT                        # макрос для вывода
	mov	eax, DWORD PTR -12[rbp]
	sub	eax, DWORD PTR -8[rbp]            # i - counter
	add	eax, 1                            # (i - counter) + 1
	mov	DWORD PTR -16[rbp], eax
	jmp	.L10                              # переход в метку L10       
.L11:                                             # метка .L11
	mov	eax, DWORD PTR -16[rbp]
	cdqe
	lea	rdx, str[rip]
	movzx	eax, BYTE PTR [rax+rdx]
	movsx	eax, al
	mov	edi, eax
	call	putchar@PLT                       # макрос для вывода одного символа
	add	DWORD PTR -16[rbp], 1             # j++
.L10:                                             # метка .L10
	mov	edx, DWORD PTR -12[rbp]
	mov	eax, DWORD PTR -8[rbp]
	add	eax, edx                         
	cmp	DWORD PTR -16[rbp], eax
	jl	.L11
	mov	eax, 0
	jmp	.L13
.L9:                                              # метка .L9
	add	DWORD PTR -12[rbp], 1             # i++
.L6:                                              # метка .L6
	mov	eax, DWORD PTR -12[rbp]           # присваивание eax DWORD PTR -12[rbp](i)
	cmp	eax, DWORD PTR -4[rbp]            # сравнение i < size
	jl	.L12                              # переход в метку L12 при i < size
	mov	eax, 0
.L13:                                             # метка .L13
	leave                                     # return 0
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"          # метаинформация
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
