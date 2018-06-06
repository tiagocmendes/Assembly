	.data
minus:	.asciiz	"texto em minusculas"
maius:	.space	20
	.text
	.globl	main

main:	la	$a0, minus
	add	$s1, $a0, $0
	la	$a0, maius
	add	$s2, $a0, $0
	
	li	$s0, 0
	add	$t0, $s0, $s1
	add	$t2, $s0, $s2
	lb	$t1, 0($t0)
	addi	$t1, $t1, -32
	sb	$t1, 0($t2)
	lb	$a0, 0($t2)
	li	$v0, 11
	syscall