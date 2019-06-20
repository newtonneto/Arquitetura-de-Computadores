.text
	#Aposta amigo 1
	li $2, 5 #Syscall para ler inteiro
	syscall
	move $8, $2 #Armazena o valor lido em $8
	
	#Aposta amigo 2
	li $2, 5 #Syscall para ler inteiro
	syscall
	move $9, $2 #Armazena o valor lido em $9
	
	#Aposta amigo 3
	li $2, 5 #Syscall para ler inteiro
	syscall
	move $10, $2 #Armazena o valor lido em $10
	
	#Soma o total
	add $11, $8, $9 #Soma $8 com $9 e armazena o resultado em $11
	add $11, $11, $10 #Soma $11 com $10 e armazena o resultado em $11
	
	#Porcetagem amigo 1
	mul $8, $8, 100 #Multiplica por 100 o valor de $8
	div $8, $11 #Divide $8 pelo total
	mflo $8 #Armazena o resultado em $8
	
	#Porcetagem amigo 2
	mul $9, $9, 100 #Multiplica por 100 o valor de $9
	div $9, $11 #Divide $9 pelo total
	mflo $9 #Armazena o resultado em $9
	
	#Porcetagem amigo 3
	mul $10, $10, 100 #Multiplica por 100 o valor de $9
	div $10, $11 #Divide $9 pelo total
	mflo $10 #Armazena o resultado em $9
	
	#Imprime porcentagem amigo 1
	move $4, $8 #Carrega o valor de $8 no reg $4
	li $2, 1 #Syscall para imprimir inteiros
	syscall
	li $4, 0x25 #Carrega no reg $4 o código para o simbolo % na tabela ASCII
	li $2, 11 #Syscall para imprimir string
	syscall
	li $4, 0xA #Carrega no reg $4 o código de quebra de linha
	li $2, 11 #Syscall para imprimir string
	syscall
	
	#Imprime porcentagem amigo 2
	move $4, $9 #Carrega o valor de $9 no reg $4
	li $2, 1 #Syscall para imprimir inteiros
	syscall
	li $4, 0x25 #Carrega no reg $4 o código para o simbolo % na tabela ASCII
	li $2, 11 #Syscall para imprimir string
	syscall
	li $4, 0xA #Carrega no reg $4 o código de quebra de linha
	li $2, 11 #Syscall para imprimir string
	syscall
	
	#Imprime porcentagem amigo 3
	move $4, $10 #Carrega o valor de $10 no reg $4
	li $2, 1 #Syscall para imprimir inteiros
	syscall
	li $4, 0x25 #Carrega no reg $4 o código para o simbolo % na tabela ASCII
	li $2, 11 #Syscall para imprimir string
	syscall
	li $4, 0xA #Carrega no reg $4 o código de quebra de linha
	li $2, 11 #Syscall para imprimir string
	syscall