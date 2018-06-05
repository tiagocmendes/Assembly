	.data
prompt:	.asciiz "\nIntroduza um numero: "
strpar:	.asciiz "\nO numero e' par! "
strimp:	.asciiz "\nO numero e' impar! "
	.text
	.globl	main
main:	
	la	$a0, prompt
	li	$v0, 4
	syscall
	
	li	$v0, 5
	syscall
	move	$t1, $v0
	
	andi	$t1, $t1, 1
	
	beq	$t1, $0, par
	
	la	$a0, strimp
	li	$v0, 4
	syscall
	j	exit
	
	par:
	la	$a0, strpar
	li	$v0, 4
	syscall
	j	exit
	
	
	exit:
	li	$v0, 10
	syscall