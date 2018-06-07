	.data
lista:	.space	24
prompt:	.asciiz	"\nInsira 6 numeros: \n"
char:	.asciiz ";"
result:	.asciiz	"\nConteudo do array: "
	.text
	.globl	main
	
main:
	la	$a0, lista
	add	$s0, $a0, $0
	
	la	$a0, prompt
	li	$v0, 4
	syscall
	
	li	$t0, 0		# $t0 = n
	li	$t1, 0		# t1 = i
	
for:	beq	$t0, 6, done
	
	li	$v0, 5
	syscall
	move	$t2, $v0	# $t2 = read_int()
	
	
	add	$t3, $t1, $s0
	sw	$t2, 0($t3)
	
	addi	$t0, $t0, 1
	addi	$t1, $t1, 4
	j	for
	
done:
	la	$a0, result
	li	$v0, 4
	syscall
	
	# imprimir
	li	$t0, 0		# $t0 = n = 0
	li	$t2, 0		# $t2 = i = 0
	
for2:	beq	$t0, 6, done2	# if n == 6 -> branch to done
	add	$t1, $t2, $s0	# $t1 = address of lista[i]
	lw	$a0, 0($t1)	# $a0 = lista[i]
	li	$v0, 1		# print_int10( lista[i] )
	syscall
	la	$a0, char	# $a0 = char
	li	$v0, 4		# $v0 = 4 ( print_str() )
	syscall			# print_str( char )
	addi	$t0, $t0, 1	# n++
	addi	$t2, $t2, 4	# i+= 4
	j	for2

done2:
	li	$v0, 10
	syscall
	
