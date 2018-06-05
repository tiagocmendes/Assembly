	.data
prompt:	.asciiz	"\nIntroduza um numero: "
result:	.asciiz	"\nO fatorial do numero inserido e': "
checker:.asciiz	"\nO numero introduzido e' negativo."
	.text
	.globl	main
	
main:	# $t0 = n;	$t1 = f;	$t2 = i	

	la	$a0, prompt
	li	$v0, 4
	syscall
	
	li	$v0, 5
	syscall
	move	$t0, $v0
	
	li	$t1, 1
	add	$t2, $t0, $0

check:	blt	$t0, $0, exit
	
for:	beq	$t2, 0, done
	
	mul	$t3, $t2, $t1
	mflo	$t1
	subi	$t2, $t2, 1
	j	for
	
done:
	la	$a0, result
	li	$v0, 4
	syscall
	
	add	$a0, $t1, $0
	li	$v0, 1
	syscall
	
	li	$v0, 10
	syscall

exit:
	la	$a0, checker
	li	$v0, 4
	syscall
	
	li	$v0, 10
	syscall
	