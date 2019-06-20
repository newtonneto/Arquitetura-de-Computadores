.text
	li $2, 5 #Carrega o código de leitura de inteiros no registrador $2
	syscall #Executa a syscall
	
	move $8, $2 #Atribui o valor lido ao reg $8
	li $9, 10000 #Atribui o valor 10000 ao reg $9
	
	mult $8, $9 #Multiplica os valores dos regs $8 e $9
	mflo $10 #Armazena em $10 o valor da multiplicação
	
	move $4, $10 #Carrega $4 com o valor armazenado em $10
	li $2, 1 #Carrega $2 com o código para imprimir inteiros
	syscall #Executa a syscall