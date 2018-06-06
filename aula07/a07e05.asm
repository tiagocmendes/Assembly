	.data
prompt:	.asciiz	"\nIntroduza um numero: "
result:	.asciiz	"\nO numero em hexadecimal e': "
	.text
	.globl	main

main:
	la	$a0, prompt
	li	$v0, 4
	syscall
	
	li	$v0, 5
	syscall
	move	$t0, $v0
	
	la	$a0, result
	li	$v0, 4
	syscall
	
	addi	$t1, $0, 0
	
for:	beq	$t1, 8, done
	andi	$t2, $t0, 0xF0000000
	srl	$t2, $t2, 28
	add	$a0, $t2, $0
	li	$v0, 34
	syscall
	sll	$t0, $t0, 4
	addi	$t1, $t1, 1
	j	for


done:
	li	$v0, 10
	syscall