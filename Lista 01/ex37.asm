.text
	li $2, 5 #Código para ler inteiro
	syscall
	move $8, $2 #Carrega o reg $8 com o valor lido
	
	li $9, 100 #Armazena 100 no reg $9
	div $8, $9 #Divide o valor de $8 por 100
	mflo $10 #Armazena o resultado inteiro da divisão em $10
	
	mul $10, $10, 12 #Multiplica $10 por 12 e armazena o resultado em $10
	sub $8, $8, $10 #Subtrai o valor armazenado em $10 de $8
	
	move $4, $8 #Carrega o reg $4 com o valor de $8
	li $2, 1 #Código para imprimir inteiros
	syscall