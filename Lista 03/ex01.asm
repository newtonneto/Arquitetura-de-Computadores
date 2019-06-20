#Ex01
.text
	li $8, 3 #Carrega o valor 3 em $8
	li $9, 1 #Reg de controle
	
L1:	beq $9, 6 fim #Verifica se o reg $9 já incrementou 5 vezes, se sim pula para fim
	
	li $10, 3 #Carrega $3 em $10 para auxiliar nas divisoes
	div $8, $10 #Divide o valor atual de $8 por 3
	mfhi $11 #Armazena o resultado a direita da virgula em $11
	beq $11, 0 L2 #Verifica se a divisao gerou um numero fracionado, se sim pule para L2
	add $8, $8, 1 #Incrementa +1 em $8
	j L1 #Volte para L1
	
	#Imprime o multiplo de 3
L2:	move $4, $8 #Carrega o valor de $8 em $4
	li $2, 1 #Codigo para imprimir inteiro
	syscall
	li $4, 0xA #Codigo para quebra de linha
	li $2, 11 #Syscall para imprimir caractere
	syscall
	add $8, $8, 1 #Incrementa +1 em $8
	add $9, $9, 1 #Incrementa +1 em $9
	j L1 #Volte para L1

	#Encerra o programa	
fim:	li $2, 10 #Syscall para encerrar execucao
	syscall