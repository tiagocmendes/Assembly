	.data
lista:	.space 24
	.text
	.globl main

main:
	li $t0,0 #i=0
	la $t1,lista #endereco da lista
preencher:
	bge $t0,24,preenchido # se for >=6 salta
	
	li $v0,5 #buscar valores e meter em $v0
	syscall
	
	add $t2,$t1,$t0 # endereco da lista+i
	sw $v0,0($t2) #guardar o que vem do syscall para o array
	addi $t0,$t0,4
	j preencher		

preenchido:
	la $t1,lista #endereco da lista

#Inicio do teste da ordem
do:
	li $t0,0 #i=0	
	li $s0,0 # houvetroca 0=false 1=true
	
for:
	bge $t0,5,while # se i>=5 salta para o while ( testar se ainda houveram trocas a acontecer)
if:
	sll $t7,$t0,2	# incrementar 4 porque estamos a trabalhar com int , primeira vez 4*0 nao altera nada
	
	add $t2,$t1,$t7 #usando o endereco inicial da lista + i(offset) para encontra a posicao do array---Ligacao 1
	addi $t3,$t7,4 #i++
	add $t4,$t1,$t3 #lista[i++] o mesmo mais o offset e i+4(seria +1 se estivessemos a trabalhar com chars) ---Ligacao 2
	
	lw $a1,0($t2) #passar o valor que esta na posicao calculada em cima e guardar em a1 ---Ligacao 1
	lw $a2,0($t4) # passar o valor que esta na posicao calculada em cima e guardar em a1 --- Ligacao 2
	ble $a1,$a2,endif # se os valor Ligacao1 for superior a Ligacao 2 continuamos o codigo para os save words
	sw $a1,0($t4) # sabendo que o valor de a1 foi superior que o a2 trocamos de posicoes
	sw $a2,0($t2) # mesmo efeito que a alinea anterior
	li $s0,1 # como houve uma troca passamos o valor de houvetroca para 1(true)
endif:
	addi $t0,$t0,1 #incrementar ao i +1 , vamos avancar 1 "casa" que depois multiplicaremos por 4 
	j for 
while:
	beq $s0,1,do # quando o ciclo for terminar salta para aqui onde fazemos a verificacao se no processo todo houve alguma troca
					#voltamos a correr porque na proxima sequencia pode haver novamente uma troca
					#repetimos o processo ate nao serem executadas troacs
					#questao importante aqui nao se aplica a regra de fazermos o contrario
					# fazemos branch se a condicao true se verificar, tal como exemplificado em C
	
reset:
	li $t0,0 #i=0
	la $t1,lista #endereco da lista
ler:
	bge $t0,24,final # se for >=6 salta	
	add $t2,$t1,$t0 #adicionar valor de lista+i
	lw $a0,0($t2) 
	li $v0,1
	syscall
	addi $t0,$t0,4
	j ler	
	
final:
	li $v0,10
	syscall
	
