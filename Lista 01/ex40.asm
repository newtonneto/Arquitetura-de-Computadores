.text
	li $2, 5 #Código para ler inteiro
	syscall
	move $8, $2 #Carrega o valor lido no reg $8
	li $9, 100 #Armazena 100 em $9 para fazer a divisão
	
	mul $8, $8, 30 #Multiplica o valor armazena em $8 por 30
	div $8, $9 #Divide o valor de $8 por $9
	mflo $9 #Armazena o resultado inteiro no reg $9
	mul $9, $9, 8 #Multiplica por 8 resultado inteiro da divisão
	sub $8, $8, $9 #Subtrai o valor armazena em $8 por $9
	
	move $4, $8 #Carrega no reg $4 o valor de $8
	li $2, 1 #Código para imprimir inteiros
	syscall