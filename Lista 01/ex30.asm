.text
	li $2, 5 #Código para ler inteiro
	syscall
	
	move $8, $2 #Armazena em $8 o valor lido
	
	li $2, 5 #Código para ler inteiro
	syscall
	
	move $9, $2 #Armazena em $9 o valor lido
	
	div $8, $9 #Divide o valor de $8 por $9
	mflo $8 #Atribui o resultado ao reg $8
	
	move $4, $8 #Carrega em $4 o valor armazenado em $8
	li $2, 1 #Código para imprimir inteiro
	syscall