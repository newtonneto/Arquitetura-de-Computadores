.text
	li $2, 5 #Carrega no registrador $2 o codigo para leitura de inteiros
	syscall
	
	move $8, $2 #Carrega no registrador $8 o valor lido
	
	li $2, 5 #Carrega no registrador $2 o codigo para leitura de inteiros
	syscall
	
	move $9, $2 #Carrega no registrador $9 o valor lido
	
	li $2, 5  #Carrega no registrador $2 o codigo para leitura de inteiros
	syscall
	
	move $10, $2 #Carrega no registrador $10 o valor lido
	
	mul $11, $8, $8 #Multiplica o valor de $8 por ele mesmo e armazena o resultado em $11
	mul $12, $9, $9 #Multiplica o valor de $9 por ele mesmo e armazena o resultado em $12
	mul $13, $10, $10 #Multiplica o valor de $10 por ele mesmo e armazena o resultado em $13
	
	add $11, $11, $12 #Soma os valores de $11 e $12 e armazena o resultado em $11
	add $11, $11, $13 #Soma os valores de $11 e $13 e armazena o resultado em $11
	
	move $4, $11 #Move o resultado das somas para o registrador $4
	li $2, 1 #Carrega no reg $2 o codigo da syscall para imprimir inteiros
	syscall