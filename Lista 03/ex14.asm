#Ex14
.text
	#Recebe um numero
	li $2, 5 #Syscall para ler inteiro
	syscall
	move $8, $2 #Armazena em $8 o valor lido
	add $8, $8, 1 #Incrementa +1 em $8 para ajudar no laço
	
L1:	sub $8, $8, 1 #Decrementa -1 de $8
	li $10, 2 #Carrega 2 em $10
	div $8, $10 #Divide $8 por 2
	mfhi $10 #Carrega o resultado fracionado em $10
	
	bgt $10, $0 L1 #Verifica se $10 > 0, se sim volte para L1

	move $4, $8 #Armazena em $4 o valor de $8
	li $2, 1 #Syscall para imprmir inteiro
	syscall
	li $4, 0x20 #Codigo do espaço
	li $2, 11 #Syscall para imprimir caractere
	syscall	
	
	bgt $8, $0 L1 #Se $8 > $0 volte para L1
	
	#Finaliza programa
	li $2, 10 #Syscall para encerrar execucao
	syscall