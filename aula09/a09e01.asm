	.data
prompt:	.asciiz	"\nIntroduza um numero: "
result1:.asciiz	"\nO fatorial do numero "
result2:.asciiz	" e': "
	.text
	.globl	main
	
main:
	la	$a0, prompt
	li	$v0, 4
	syscall
	
	li	$v0, 5
	syscall
	move	$t0, $v0
	
	la	$a0, result1
	li	$v0, 4
	syscall
	
	addi	$a0, $t0, 0
	li	$v0, 1
	syscall
	
	la	$a0, result2
	li	$v0, 4
	syscall
	
	addi	$a0, $t0, 0
	
	jal	factorial
	
	addi	$s0, $v0, 0
	
	addi	$a0, $s0, 0
	li	$v0, 1
	syscall
	
	
	li	$v0, 10
	syscall
	
	
factorial:
	addi	$t0, $0, 1	# $t0 = res = 1
	addi	$t1, $a0, 0	# $t1 = num
	
for:	beq	$t1, 0, end
	mul	$t3, $t1, $t0
	mflo	$t0
	subi	$t1, $t1, 1
	j	for

end:
	addi	$v0, $t0, 0
	jr	$ra
