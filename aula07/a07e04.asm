	.data
prompt:	.asciiz	"\nIntroduza um numero: "
result:	.asciiz "\nA soma dos numeros positivos e' "
	.text
	.globl	main
	
main:	
	li	$t0, 0		# $t0 = soma
	li	$t1, 0		# $t1 = i
	
for:	beq	$t1, 5, done

	la	$a0, prompt
	li	$v0, 4
	syscall
	
	li	$v0, 5
	syscall
	move	$t2, $v0
	
	addi	$t1, $t1, 1
	ble	$t2, 0, for
	add	$t0, $t0, $t2
	j	for


done:	la	$a0, result
	li	$v0, 4
	syscall
	
	add	$a0, $t0, $0
	li	$v0, 1
	syscall
	
