.text
	addi $2, $0, 5 #Codigo syscall para ler um numero
	syscall #Executa syscall
	add $8, $0, $2 #Atribui o valor lido ao reg $8
	addi $2, $0, 5 #Codigo syscall para ler um numero
	syscall #Executa syscall
	add $9, $0, $2 #Atribui o valor lido ao reg $9
	addi $2, $0, 5 #Codigo syscall para ler um numero
	syscall #Executa syscall
	add $10, $0, $2 #Atribui o valor lido ao reg $10
	
	add $11, $8, $9 #Soma os valores dos regs $8 e $9 e insere o resultado em $11
	add $8, $10, $11 #Soma os valores dos regs $11 e $10 e insere o resultado em $8
	add $4, $0, $8 #Atribui em $4 o valor de $8 (resultado da soma)
	addi $2, $0, 1 #Insere em $2 o codigo de syscall para impressao de inteiros armazenados em $4
	syscall