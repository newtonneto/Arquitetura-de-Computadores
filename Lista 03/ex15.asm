#Ex15
.text
	#Recebe um numero
	li $2, 5 #Syscall para ler inteiro
	syscall
	move $8, $2 #Armazena em $8 o valor lido
	
	li $9, 0 #Numero a ser incrementado
	
L1:	add $9, $9, 1 #Incrementa em +1 o valor de $9

	li $10, 2 #Carrega 2 em $10
	div $9, $10 #Divide $9 por 2
	mfhi $10 #Carrega o resultado fracionado em $10
	
	beq $10, $0 L2 #Verifica se $10 = 0, se sim volte para L1

	move $4, $9 #Armazena em $4 o valor de $9
	li $2, 1 #Syscall para imprmir inteiro
	syscall
	li $4, 0x20 #Codigo do espaço
	li $2, 11 #Syscall para imprimir caractere
	syscall
	
L2:	blt $9, $8 L1 #Se $9 < $8 volte para L1
	
	#Finaliza programa
	li $2, 10 #Syscall para encerrar execucao
	syscall