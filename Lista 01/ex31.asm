.text
	li $2, 5 #Código para ler um inteiro
	syscall
	
	move $8, $2 #Armazena em $8 o valor lido
	
	add $9, $8, 1 #Soma $8 + 1 e armazena o resultado em $9
	sub $10, $8, 1 #Subtrai 1 de $8 e armazena o resultado em $10
	
	move $4, $10 #Armazena em $4 o valor de $10
	li $2, 1 #Código para imprimir inteiro
	syscall
	
	move $4, $9 #Armazena em $4 o valor de $9
	li $2, 1 #Código para imprimir inteiro
	syscall