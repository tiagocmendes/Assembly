	.data
prompt:	.asciiz	"\nIntroduza uma string: "
result:	.asciiz	"\nO numero de caracteres numericos e': "
str:	.space	40
	.text
	.globl	main

main:
	la	$a0, prompt
	li	$v0, 4
	syscall
	
	la	$a0, str
	la	$a1, 40
	li	$v0, 8
	syscall
	
	li	$t0, 0		# $t0 = n = 0
	li	$t1, 0		# $t1 = i = 0
	
for:	add	$t2, $t1, $a0	# $t2 = address of str[i]
	lb	$t3, 0($t2)	# $t3 = str[i]
	addi	$t1, $t1, 1
	beq	$t3, '\0', done
	blt	$t3, '0', for
	bgt	$t3, '9', for
	addi	$t0, $t0, 1
	j	for
	
	
done:
	la	$a0, result
	li	$v0, 4
	syscall
	
	add	$a0, $t0, $0
	li	$v0, 1
	syscall