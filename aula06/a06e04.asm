	.data
result:	.asciiz "\nResult: "
	.text
	.globl main
main:
	li	$t1, 0x12345678
	
	andi	$t2, $t1, 0xF0000000
	srl	$t2, $t2, 28
	
	la	$a0, result
	li	$v0, 4
	syscall
	
	add	$a0, $t2, $0
	li	$v0, 34
	syscall
	
	andi	$t2, $t1, 0x0F000000
	srl	$t2, $t2, 24
	
	la	$a0, result
	li	$v0, 4
	syscall
	
	add	$a0, $t2, $0
	li	$v0, 34
	syscall
	
	andi	$t2, $t1, 0x00F00000
	srl	$t2, $t2, 20
	
	la	$a0, result
	li	$v0, 4
	syscall
	
	add	$a0, $t2, $0
	li	$v0, 34
	syscall
	
	andi	$t2, $t1, 0x000F0000
	srl	$t2, $t2, 16
	
	la	$a0, result
	li	$v0, 4
	syscall
	
	add	$a0, $t2, $0
	li	$v0, 34
	syscall
	
	andi	$t2, $t1, 0x0000F000
	srl	$t2, $t2, 12
	
	la	$a0, result
	li	$v0, 4
	syscall
	
	add	$a0, $t2, $0
	li	$v0, 34
	syscall
	
	andi	$t2, $t1, 0x00000F00
	srl	$t2, $t2, 8
	
	la	$a0, result
	li	$v0, 4
	syscall
	
	add	$a0, $t2, $0
	li	$v0, 34
	syscall
	
	andi	$t2, $t1, 0x000000F0
	srl	$t2, $t2, 4
	
	la	$a0, result
	li	$v0, 4
	syscall
	
	add	$a0, $t2, $0
	li	$v0, 34
	syscall
	
	andi	$t2, $t1, 0x0000000F
	srl	$t2, $t2, 0
	
	la	$a0, result
	li	$v0, 4
	syscall
	
	add	$a0, $t2, $0
	li	$v0, 34
	syscall