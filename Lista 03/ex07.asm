#Ex07
.text
	li $8, 0 #Reg que vai armazenar soma
	li $9, 0 #Reg de controle
	li $11, 0 #Reg que vai armazenar numero de valores validos
	
L1:	li $2, 5 #Syscall para ler inteiro
	syscall
	move $10 $2 #Armazena em $10 o valor lido
	add $9, $9, 1 #Incrementa em +1 o reg $9
	
	blt $10, 0 L2 #Verifica se $10 < 0, se sim pule para L2
	
	add $8, $8, $10 #Soma o valor de $8 com o valor lido
	add $11, $11, 1 #Incrementa em +1 o reg $11
	
L2:	ble $9, 9 L1 #Verifica se $9 <= 9, se sim volte L1
	
	div $8, $11 #Divide o valor de $8 por $11
	mflo $8 #Armazena o valor inteiro em $8
	mfhi $9 #Armazena o valor fracionado em $9
	
	#Imprime o resultado
	move $4, $8 #Carrega em $4 o valor de $8
	li $2, 1 #Syscall para imprimir inteiro
	syscall
	li $4, 0x2E #Codigo do .
	li $2, 11 #Syscall para imprimir caractere
	syscall
	move $4, $9 #Carrega em $4 o valor de $9
	li $2, 1 #Syscall para imprimir inteiro
	syscall
	
	#Finaliza programa
	li $2, 10 #Syscall para encerrar execucao
	syscall