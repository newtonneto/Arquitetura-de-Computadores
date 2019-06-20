#Ex13
.data
	str1: .asciiz "Aprovado"
	str2: .asciiz "Reprovado"
.text
	#Recebe nota 1
	li $2, 5 #Syscall para ler inteiro
	syscall
	move $t1, $2 #Carrega o valor lido em $t1
	
	#Recebe nota 2
	li $2, 5 #Syscall para ler inteiro
	syscall
	move $t2, $2 #Carrega o valor lido em $t2
	
	#Recebe nota 3
	li $2, 5 #Syscall para ler inteiro
	syscall
	move $t3, $2 #Carrega o valor lido em $t3
	
	#Define o valor dos pesos
	li $t4, 1 #Define o valor do peso 1
	li $t5, 2 #Define o valor do peso 2
	
	#Multiplica nota 1 pelo peso 1
	mul $t1, $t1, $t4 #O resultado é armazenado em $t1
	
	#Multiplica nota 2 pelo peso 1
	mul $t2, $t2, $t4 #O resultado é armazenado em $t2
	
	#Multiplica nota 1 pelo peso 2
	mul $t3, $t3, $t5 #O resultado é armazenado em $t2
	
	#Soma o resultados das multiplicacoes e pesos
	add $t1, $t1, $t2 #Soma $t1 com $t2 e armazena o resultado em $t1
	add $t1, $t1, $t3 #Soma $t1 com $t3 e armazena o resultado em $t1
	add $t4, $t4, $t5 #Soma $t4 com $t5 e armazena o resultado em $t4
	add $t4, $t4, 1 #Soma mais 1 adicional ao valor do peso, armazena o resultado em $t4
	
	#Calcula a media
	div $t1, $t4 #Divide o valor de $t1 por $t4
	mflo $t1 #Armazena o resultado da divisao em $t1
	
	#Imprime o resultado
	move $4, $t1 #Carrega em $4 o valor de $t1
	li $2, 1 #Syscall para imprimir inteiros
	syscall
	
	#Quebra de linha
	li $4, 0xA #Codigo de quebra de linha
	li $2, 11 #Syscall para imprimir caractere
	syscall
	
	#Imprime aprovado/reprovado
	li $t4, 60 #Carrega 60 em $t4 para comparar com a media
	slt $t5, $t1, $t4 #Verifica se a media eh menor que 60 
	beq $t5, 1 L1 #Se $t5 for igual a 1 pule para L1
	
	#Imprime Aprovado
	la $4, str1 #Carrega o valor da string str1 em $4
	li $2, 4 #Syscall para imprimir strings
	syscall
	j fim #Pula para o fim do programa

L1:	la $4, str2 #Carrega o valor da string str2 em $4
	li $2, 4 #Syscall para imprimir strings
	syscall 	
	
	#Finaliza programa
fim:	li $2, 10 #Syscall para finalizar execucao
	syscall