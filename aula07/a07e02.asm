	.data
prompt:	.asciiz	"\nIntroduza um numero: "
char:	.asciiz	"-"
	.text
	.globl	main
	
main:	la	$a0, prompt
	li	$v0, 4
	syscall
	
	li	$v0, 5
	syscall
	move	$t1, $v0
	
	li	$t2, 0
	
	for:	beq	$t1, $t2, done
	
		la	$a0, char
		li	$v0, 4
		syscall
	
		addi	$t2, $t2, 1
		
		j 	for
		
	done:
		li	$v0, 10
		syscall
	
	
	
	