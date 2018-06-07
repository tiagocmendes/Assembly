.data
lista:	.space	24
prompt:	.asciiz	"\nInsira 6 numeros: \n"
char:	.asciiz ";"
result:	.asciiz	"\nConteudo do array: "
	.text
	.globl	main
	
main:
	la	$a0, lista	# $a0 = lista
	add	$s0, $a0, $0	# $s0 = $a0 = lista
	
	la	$a0, prompt
	li	$v0, 4
	syscall
	
	li	$t0, 0		# $t0 = n
	li	$t1, 0		# $t1 = i
	
for:	beq	$t0, 6, done	# if n == 6 -> branch to done
	
	li	$v0, 5	
	syscall			
	move	$t2, $v0	# $t2 = read_int()
	
	
	add	$t3, $t1, $s0	# $t3 = address of lista[i]
	sw	$t2, 0($t3)	# lista[i] = $t2
	
	addi	$t0, $t0, 1	# $t0 += 1
	addi	$t1, $t1, 4	# $t1 += 4
	j	for
	
done:	
	addi	$t0, $0, 0	# $t0 = n
	addi	$t1, $0, 0	# $t1 = i
	addi	$t2, $0, 1	# $t2 = houveTroca = true
	addi	$t7, $0, 0	# $t7 = aux
	addi	$t4, $0, 4	# $t4 = $t1 + 4
	
while:	beq	$t2, 0, endWhile	
	addi	$t2, $0, 0			# houveTroca = false
for2:	beq	$t0, 5, apoio	# if n == 5 -> branch while
	add	$t3, $t1, $s0	# $t3 = address of lista[i]
	add	$t6, $t4, $s0	# $t6 = address of lista[i+1]
	lw	$s1, 0($t3)	# $t5 = lista[i]
	lw	$s2, 0($t6)	# $t6 = lista[i+1]
	addi	$t0, $t0, 1
	addi	$t1, $t1, 4
	addi	$t4, $t4, 4
if:	ble	$s1, $s2, for2	# if lista[i] <= lista[i+1]
	add	$t7, $s1, $0
	add	$s1, $s2, $0
	sw	$s1, 0($t3)
	add	$s2, $t7, $0
	sw	$s2, 4($t3)
	addi	$t2, $0, 1
	j	for2
	
apoio:
	j	while

endWhile:
	
	# imprimir
	li	$t0, 0		# $t0 = n = 0
	li	$t2, 0		# $t2 = i = 0
	
for3:	beq	$t0, 6, done3	# if n == 6 -> branch to done
	add	$t1, $t2, $s0	# $t1 = address of lista[i]
	lw	$a0, 0($t1)	# $a0 = lista[i]
	li	$v0, 1		# print_int10( lista[i] )
	syscall
	la	$a0, char	# $a0 = char
	li	$v0, 4		# $v0 = 4 ( print_str() )
	syscall			# print_str( char )
	addi	$t0, $t0, 1	# n++
	addi	$t2, $t2, 4	# i+= 4
	j	for3

done3:
	li	$v0, 10
	syscall
	
	
	