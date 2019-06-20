#Ex12
.text
	#Recebe um numero
	li $2, 5 #Syscall para ler inteiro
	syscall
	move $8, $2 #Armazena em $8 o valor lido
	
L1:	move $4, $8 #Armazena em $4 o valor de $8
	li $2, 1 #Syscall para imprmir inteiro
	syscall
	li $4, 0x20 #Codigo do espaço
	li $2, 11 #Syscall para imprimir caractere
	syscall
	
	sub $8, $8, 1 #Decrementa em -1 o valor de $8
	
	bge $8, $0 L1 #Se $8 => 0 volte para L1
	
	#Finaliza programa
	li $2, 10 #Syscall para encerrar execucao
	syscall