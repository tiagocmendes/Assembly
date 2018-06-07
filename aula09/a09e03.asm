	.data
p1:	.asciiz	"\nInsira a frase 1: "
p2:	.asciiz	"\nInsira a frase 2: "
r1:	.asciiz	"\nO numero de caracteres da frase 1 e': "
l:	.asciiz ""
r2:	.asciiz "\nString copiada: "
str1:	.space	20
str2:	.space	20
str3:	.space	40
	.text
	.globl	main
	
main:
	la	$a0, p1
	li	$v0, 4
	syscall
	
	la	$a0, str1
	la	$a1, 20
	li	$v0, 8
	syscall
	
	add	$s0, $a0, $0	# $s0 = $a0
	
	la	$a0, p2
	li	$v0, 4
	syscall
	
	la	$a0, str2
	la	$a1, 20
	li	$v0, 8
	syscall
	
	add	$s1, $a0, $0	# $s1 = $a0
	
	add	$a0, $s0, $0
	jal	strlen
	
	add	$s3, $v0, $0
	
	la	$a0, r1
	li	$v0, 4
	syscall
	
	add	$a0, $s3, $0
	li	$v0, 1
	syscall
	
	add	$a0, $s1, $0
	jal	strcopy
	add	$s3, $v0, $0
	
	la	$a0, r2
	li	$v0, 4
	syscall
	
	add	$a0, $s3, $0
	li	$v0, 4
	syscall
	
	li	$v0, 10
	syscall

	
	
strlen:	
	li	$t0, 0		# $t0 = n
	li	$t1, 0		# $t1 = i
	
	
while:	add	$t2, $t1, $a0
	addi	$t1, $t1, 1
	lb	$t3, 0($t2)
	beq	$t3, '\n', done
	addi	$t0, $t0, 1
	j	while
	
done:	
	addi	$v0, $t0, 0
	jr	$ra
	
	
strcopy:
	li	$t0, 0		# $t0 = i = 0
	la	$s3, str3
	
while2:	
	add	$t1, $t0, $a0
	add	$t2, $t0, $s3
	lb	$t3, 0($t1)
	beq	$t3, '\n', done2
	sb	$t3, 0($t2)
	addi	$t0, $t0, 1
	j	while2
	
done2:
	add	$v0, $s3, $0
	jr	$ra

	