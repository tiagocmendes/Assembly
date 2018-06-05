	.data
andl:	.asciiz	"\nAND: "
orl:	.asciiz	"\nOR: "
norl:	.asciiz	"\nNOR: "
xorl:	.asciiz	"\nXOR: "
not1:	.asciiz "\nNOT 1: "
not2:	.asciiz	"\nNOT 2: "
	.text
	.globl main
###########################################################################
main:	
	addi	$t0, $0, 0x12345678
	addi	$t1, $0, 0x0000000F
	
	and	$t2, $t0, $t1
	or	$t3, $t0, $t1
	nor	$t4, $t0, $t1
	xor	$t5, $t0, $t1
	nor	$t6, $t0, $0
	nor 	$t7, $t1, $0
	
	la	$a0, andl
	li	$v0, 4
	syscall
	
	add	$a0, $t2, $0
	li	$v0, 34
	syscall
	
	la	$a0, orl
	li	$v0, 4
	syscall
	
	add	$a0, $t3, $0
	li	$v0, 34
	syscall
	
	la	$a0, norl
	li	$v0, 4
	syscall
	
	add	$a0, $t4, $0
	li	$v0, 34
	syscall
	
	la	$a0, xorl
	li	$v0, 4
	syscall
	
	add	$a0, $t5, $0
	li	$v0, 34
	syscall
	
	la	$a0, not1
	li	$v0, 4
	syscall
	
	add	$a0, $t6, $0
	li	$v0, 34
	syscall
	
	la	$a0, not2
	li	$v0, 4
	syscall
	
	add	$a0, $t7, $0
	li	$v0, 34
	syscall