#Ex01
.text
	li $2, 5 #Syscall para ler inteiro
	syscall
	move $8, $2 #Carrega o valor lido em $8
	
	li $2, 5 #Syscall para ler inteiro
	syscall
	move $9, $2 #Carrega o valor lido em $9
	
	slt $10, $8, $9 #Se o valor de $8 for menor que o de $9 o reg $10 vai receber 1, do contrario recebe 0
	
	beq $10, $0, igual0 #Verifica se o valor de reg $10 é igual a 0, caso seja pula para "igual0", do contrario continua
	
	move $4, $9 #Carrega $4 com o valor de $9 caso a condição acima for falsa
	li $2, 1 #Syscall para imprimir inteiro
	syscall
	j fim #Pula para final
	
igual0:	move $4, $8 #Carrega $4 com o valor de $8 caso a condição de "beq" for verdadeira
	li $2, 1 #Syscall para imprimir inteiro
	syscall
	
fim:	li $2, 10 #Syscall para finalizar programa
	syscall