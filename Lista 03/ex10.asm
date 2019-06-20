#Ex10
.text
	li $8, 1 #Armazenar valor a ser dividido
	li $9, 0 #Reg de controle
	li $11, 0 #Armazena a soma
	
L1:	add $8, $8, 1 #Incrementa +1 em $8
	li $10, 2 #Carrega 2 em $10 para realizar as divisoes
	div $8, $10 #Divide o valor de $8 por 2
	mfhi $10 #Armazena o resultado fracionado em $10
	
	bgt $10, $0 L1 #Verifica se $10 > 0, se sim volte para L1
	
	add $9, $9, 1 #Incrementa +1 em $9
	add $11, $11, $8 #Soma o valor de $11 com $8
	
	blt $9, 50 L1 #Verifica sem $9 < 6, se sim volte para L1
	
	move $4, $11 #Carrega em $4 o valor final de $11
	li $2, 1 #Syscall para imprimir inteiro
	syscall
	
	#Finaliza programa
	li $2, 10 #Syscall para encerrar execucao
	syscall