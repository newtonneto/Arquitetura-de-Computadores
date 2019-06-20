.text
	li $2, 5 #Codigo para ler inteiro
	syscall
	
	move $8, $2 #Atribui o valor recebido ao reg $8
	
	li $2, 5 #Codigo para ler inteiro
	syscall
	
	move $9, $2 #Atribui o valor recebido ao reg $9
	
	li $2, 5 #Codigo para ler inteiro
	syscall
	
	move $10, $2 #Atribui o valor recebido ao reg $10
	
	li $2, 5 #Codigo para ler inteiro
	syscall
	
	move $11, $2 #Atribui o valor recebido ao reg $11
	
	add $8, $8, $9 #Atribui o valor da soma dos regs $8 e $9 ao reg $8
	add $8, $8, $10 #Atribui o valor da soma dos regs $8 e $10 ao reg $8
	add $8, $8, $11 #Atribui o valor da soma dos regs $8 e $11 ao reg $8
	
	li $12, 4 #Carrega o valor 4 no registrador $12 para fazer a divisão
	
	div $8, $12 #Divide o valor de $8 por 4
	mflo $8 #Atribui o resultado inteiro da divisão ao reg $8
	
	move $4, $8 #Carrega o valor de $8 no reg $4
	li $2, 1 #Código para imprimir o valor armazenado em $4
	syscall