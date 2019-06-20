.text
	#Ler valor da hora de trabalho
	li $2, 5 #Syscall para ler inteiros
	syscall
	move $8, $2 #Carrega o valor lido no reg $8
	
	#Ler número de horas trabalhadas
	li $2, 5 #Syscall para ler inteiros
	syscall
	move $9, $2 #Carrega o valor lido no reg $8
	
	#Multiplica o valor da hora pela quantidade de horas trabalhadas
	mul $8, $8, $9 #Multiplica o valor de $8 por $9
	
	#Calcula os 10% adicionais
	li $10, 100 #Armazena o valor 100 em $10 para realizar a divisão
	div $8, $10 #Divide o valor de $8 por $10
	mflo $10 #Armazena o resultado inteiro no reg $10
	mul $10, $10, 10 #Multiplica $10 por 10 para encontrar os 10%
	
	#Soma a remuneração mais o 10% adicionais
	add $8, $8, $10 #Soma o valor de $8 com $10 e armazena o resultado em $8
	
	#Exibe o resultado
	move $4, $8 #Carrega o valor de $8 no reg $4
	li $2, 1 #Syscall para imprimir inteiros
	syscall