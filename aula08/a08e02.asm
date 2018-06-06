	.data
minus:	.asciiz	"texto em minusculas"
maius:	.space	20
	.text
	.globl	main
	
main:
	la	$a0, minus	# $a0 = minus
	add	$s0, $a0, $0	# $s0 = $a0 = minus
	
	la	$a0, maius	# $a0 = maius
	add	$s1, $a0, $0	# $s1 = maius
	
	li	$s2, 0		# $s2 = i = 0
	
while:	
	add	$t0, $s2, $s0	# $t0 = address of minus[i]
	add	$t1, $s2, $s1	# $t1 = address of maius[i]
	
	lb	$t2, 0($t0)	# $t2 = minus[i]
	beq	$t2, '\0', done
	addi	$t2, $t2, -32	# $t2 = minus[i] - 32 ( vai ficar maiuscula )
	
	sb	$t2, 0($t1)	# maius[i] = $t2
	
	lb	$a0, 0($t1)
	li	$v0, 11
	syscall
	
	addi	$s2, $s2, 1
	j	while
	
done:
	li 	$v0, 10
	syscall
	
	
