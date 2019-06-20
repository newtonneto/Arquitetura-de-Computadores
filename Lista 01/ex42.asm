.text
	#Recebe o salário base
	li $2, 5 #Syscall para ler inteiros
	syscall
	move $8, $2 #Carrega o valor lido no reg $8

	#Calcula a gratificação de 5%
	li $9, 100 #Insere 100 no reg $9 para realizar a divisão
	div $8, $9 #Divide o valor de $8 por $9
	mflo $9 #Armazena o resultado da divisão no reg $9
	mul $10, $9, 5 #Multiplica por 5 o valor armazenado em $9 e guarda o resultado em $10
	
	#Calcula o imposto de 7%
	mul $9, $9, 7 #Multiplica por 7 o valor armazenado em $9 e guarda o resultado em $9
	
	#Adiciona a gratificação de 5%
	add $8, $8, $10 #Adiciona $10 ao valor de $8
	
	#Subtrai o imposto de 7%
	sub $8, $8, $9 #Reduz em $9 o valor armazenado em $8
	
	#Imprime o resultado
	move $4, $8 #Carrega em reg $4 o valor de $8
	li $2, 1 #Código para imprimir inteiros
	syscall