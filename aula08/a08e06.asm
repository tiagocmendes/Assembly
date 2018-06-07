	.data
string:	.asciiz "\nO conteudo do array e': "
char:	.asciiz	";"
lista:	.space	6
	.text
	.globl	main

main:
	la	$a0, lista	# $a0 = lista
	add	$s0, $a0, $0	# $s0 = $a0 = lista
	
	addi	$t0, $0, 4	# $t0 = 4
	sw	$t0, 0($s0)	# lista[0] = 4
	
	addi	$t0, $0, 3	# $t0 = 3
	sw	$t0, 4($s0)	# lista[1] = 3
	
	addi	$t0, $0, -2
	sw	$t0, 8($s0)	# lista[2] = -2
	
	addi	$t0, $0, 1
	sw	$t0, 12($s0)	# lista[3] = 1
	
	addi	$t0, $0, 27
	sw	$t0, 16($s0)	# lista[4] = 27
	
	addi	$t0, $0, 45
	sw	$t0, 20($s0)	# lista[5] = 45
	
	la	$a0, string
	li	$v0, 4
	syscall
	
	li	$t0, 0		# $t0 = n = 0
	li	$t2, 0		# $t2 = i = 0
	
for:	beq	$t0, 6, done	# if n == 6 -> branch to done
	add	$t1, $t2, $s0	# $t1 = address of lista[i]
	lw	$a0, 0($t1)	# $a0 = lista[i]
	li	$v0, 1		# print_int10( lista[i] )
	syscall
	la	$a0, char	# $a0 = char
	li	$v0, 4		# $v0 = 4 ( print_str() )
	syscall			# print_str( char )
	addi	$t0, $t0, 1	# n++
	addi	$t2, $t2, 4	# i+= 4
	j	for

done:
	li	$v0, 10
	syscall
	
	
	