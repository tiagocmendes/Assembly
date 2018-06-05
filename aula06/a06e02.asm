	.data
prompt1:.asciiz	"\nShift left logical: "
prompt2:.asciiz	"\nShift rigth logical: "
prompt3:.asciiz	"\nShift right arithmetic: "
	.text
	.globl main
###################################################
main:
	li	$t0, 0x12345678
	
	sll	$t1, $t0, 4
	srl	$t2, $t0, 4
	sra	$t3, $t0, 4
	
	la	$a0, prompt1
	li	$v0, 4
	syscall
	
	add	$a0, $t1, $0
	li	$v0, 34
	syscall
	
	la	$a0, prompt2
	li	$v0, 4
	syscall
	
	add	$a0, $t2, $0
	li	$v0, 34
	syscall
	
	la	$a0, prompt3
	li	$v0, 4
	syscall
	
	add	$a0, $t3, $0
	li	$v0, 34
	syscall
	