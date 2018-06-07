	.data
prompt:	.asciiz	"Insira uma string: "
str:	.space	40
result:	.asciiz "\nA string introduzida tem comprimento: "
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
	
	jal	strlen
	
	addi	$t0, $v0, 0
	
	la	$a0, result
	li	$v0, 4
	syscall
	
	addi	$a0, $t0, 0
	li	$v0, 1
	syscall
	
	li	$v0, 10
	syscall
	
strlen:	
	li	$t0, 0		# $t0 = n
	li	$t1, 0		# $t1 = i
	
	addi	$s0, $a0, 0
	
while:	add	$t2, $t1, $s0
	addi	$t1, $t1, 1
	lb	$t3, 0($t2)
	beq	$t3, '\n', done
	addi	$t0, $t0, 1
	j	while
	
done:	
	addi	$v0, $t0, 0
	jr	$ra