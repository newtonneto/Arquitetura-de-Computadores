.text
	li $2, 5 #C�digo para ler um inteiro
	syscall
	
	move $8, $2 #Armazena em $8 o valor lido
	
	mul $8, $8, $8 #Multiplica o valor do reg $8 por ele mesmo
	
	move $4, $8 #Carrega o reg $4 com o valor de $8
	li $2, 1 #C�digo para imprimir inteiros
	syscall