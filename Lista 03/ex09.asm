#Ex09
.text
	li $8, 0 #Reg para armazenar incrementos
	li $11, 0 #Reg de controle
	
	#Recebe a qunatidade de numeros impares
	li $2, 5 #Syscall para ler inteiro
	syscall
	move $9, $2 #Armazena em $9 o valor lido
	
L1:	add $8, $8, 1 #Incrementa +1 em $8
	li $10, 2 #Armazena divisor 2
	div $8, $10
	mfhi $10 #Armazena resultado fracionado da divisao
	
	beq $10, $0 L1 #Verifica se $10 = 0, se sim pule para L1
	
	#Imprime num impar
	move $4, $8 #Carrega em $4 o valor de $8
	li $2, 1 #Syscall para imprmir inteiro
	syscall
	li $4, 0x20 #Codigo do espaco
	li $2, 11 #Syscall para imprimir caracter
	syscall
	
	add $11, $11, 1 #Incrementa em +1 o reg de controle
	
	blt $11, $9 L1 #Se $11 < $9 volte para L1
	
	#Finaliza programa
	li $2, 10 #Syscall para finalizar execucao
	syscall