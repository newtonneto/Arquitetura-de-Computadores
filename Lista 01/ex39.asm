.text
	li $8, 780000 #Carrega o reg $8 com o valor de 780000
	li $9, 100 #Carrega $9 com o valor 100, usado para calcular porcentagem
	
	div $8, $9 #Divide o valor de $8 por $9
	mflo $10 #Armazena em $10 o resultado inteiro da divisão
	
	#Primeiro ganhar
	mul $11, $10, 46 #Multiplica o valor de $10 por 46 e armazena o resultado em $11
	move $4, $11 #Carrega o valor de $11 em $4
	li $2, 1 #Código para imprimir inteiros
	syscall
	
	sub $8, $8, $11 #Subtrai do total armazenado em $8 o valor de $11
	
	li $4, 0xA #Carrega no reg $4 o código para quebra de linha
	li $2, 11 #Cógido para impressão de string
	syscall
	
	#Segundo ganhador
	mul $11, $10, 32 #Multiplica o valor de $10 por 32 e armazena o resultado em $11
	move $4, $11 #Carrega o valor de $11 em $4
	li $2, 1 #Código para imprimir inteiros
	syscall
	
	sub $8, $8, $11 #Subtrai o valor de $11 do que ainda está armazena em $8
	
	li $4, 0xA #Carrega no reg $4 o código para quebra de linha
        li $2, 11 #Cógido para impressão de string
        syscall
	
	#Terceiro ganhador
	move $4, $8 #Carrega o valor de $8 em $4
	li $2, 1 #Código para imprimir inteiros
	syscall