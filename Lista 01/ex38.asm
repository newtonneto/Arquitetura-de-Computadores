.text
	li $2, 5 #Código para ler inteiros
	syscall
	move $8, $2 #Carrega $8 com o valor lido
	
	li $9, 100 #$9 recebe o valor 100
	div $8, $9 #Divide o valor de $8 por $9
	mflo $10 #Armazena em $10 o valor inteiro da divisão
	
	mul $10, $10, 25 #Multiplica o valor de $10 por 25
	add $8, $8, $10 #Soma o valor de de $8 com $10
	
	move $4, $8 #Carrega o reg $4 com o valor armazena em $8
	li $2, 1 #Código para imprimir inteiros
	syscall