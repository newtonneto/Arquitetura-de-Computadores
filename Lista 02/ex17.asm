#Ex17
.text
	#Base maior
	li $2, 5 #Syscall para ler inteiro
	syscall
	move $t1, $2 #Carrega o valor lido em $t1
	
	#Base menor
	li $2, 5 #Syscall para ler inteiro
	syscall
	move $t2, $2 #Carrega o valor lido em $t2
	
	#Altura
	li $2, 5 #Syscall para ler inteiro
	syscall
	move $t3, $2 #Carrega o valor lido em $t3
	
	#Calcula area
	add $t1, $t1, $t2 #Soma $t1 com $t2 e armazena o resultado em $t1
	mul $t1, $t1, $t3 #Multiplica $t1 por $t3 e armazena o resultado em $t1
	li $t3, 2 #Carrega 2 em $t3 para auxiliar na divisao
	div $t1, $t3 #Divide $t1 por $t3
	mflo $t1 #Armazena o resultado inteiro em $t1
	
	#Imprime o resultado
	move $4, $t1 #Carrega o valor de $t1 em $4
	li $2, 1 #Syscall para imprimir inteiro
	syscall
	
	li $2, 10 #Syscall para encerrar execucao
	syscall