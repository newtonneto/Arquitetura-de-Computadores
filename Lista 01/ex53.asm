.text
	#Recebe o comprimento
	li $2, 5 #Syscall para ler inteiros
	syscall
	move $8, $2 #Armazena o valor lido em $8
	
	#Recebe a largura
	li $2, 5 #Syscall para ler inteiros
	syscall
	move $9, $2 #Armazena o valor lido em $9
	
	#Recebe o preço do metro de tela
	li $2, 5 #Syscall para ler inteiros
	syscall
	move $10, $2 #Armazena o valor lido em $9
	
	mul $8, $8, 2 #Multiplica o comprimento por 2 e armazena o resultado em $8
	mul $9, $9, 2 #Multiplica o comprimento por 2 e armazena o resultado em $9
	add $8, $8, $9 #Soma os valores de $8 e $9 e armazena o resultado em $8
	mul $10, $8, $10 #Multiplica o perimetro pelo valor de metro de tela
	
	move $4, $10 #Carrega o valor de $10 no reg $4
	li $2, 1 #Syscall para imprimir inteiros
	syscall