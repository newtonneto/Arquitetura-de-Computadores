.text
	li $2, 5 #Código para ler inteiros
	syscall
	
	move $8, $2 #Armazena em $8 o valor contido em $2
	
	li $11, 3 #Carrega o reg $11 com o multiplicador
	mul $9, $8, $11 #Multiplica o valor armazenado em $8 por 3
	li $11, 1 #Carrega o reg $11 com o número usado na soma a seguir
	add $9, $9, $11 #Adiciona 1 ao valor armazenado em $9
	
	li $11, 2 #Carrega o reg $11 com o multiplicador
	mul $10, $8, $11 #Multiplica o valor armazenado em $8 por 2
	li $11, 1 #Carrega o reg $11 com o número usado na subtração a seguir
	sub $10, $10, $11 #Subtrai 1 de $10
	
	add $8, $9, $10 #Soma os valores de $9 e $10
	
	move $4, $8 #Carrega o valor de $8 em $4
	li $2, 1 #Código para imprimir inteiros
	syscall