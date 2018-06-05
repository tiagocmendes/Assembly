	.data
prompt1:.asciiz	"\nIntroduza dois numeros: "
num1:	.asciiz	"\nNumero 1: "
num2:	.asciiz	"\nNumero 2: "
result:	.asciiz	"\nA soma dos numeros e': "
	.text
	.globl	main
#####################################################
main:	
	la	$a0, prompt1
	li	$v0, 4
	syscall
	
	la	$a0, num1
	li	$v0, 4
	syscall
	
	li	$v0, 5
	syscall
	move	$t1, $v0
	
	la	$a0, num2
	li	$v0, 4
	syscall
	
	li	$v0, 5
	syscall
	move	$t2, $v0
	
	add	$t3, $t2, $t1
	
	la	$a0, result
	li	$v0, 4
	syscall
	
	add	$a0, $t3, $0
	li	$v0, 1
	syscall
	
	
	