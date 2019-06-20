.text
	#Valor do produto
	li $2, 5 #Syscall para ler inteiros
	syscall
	move $8, $2 #Armazena o valor lido no reg $8
	
	#Valor com desconto de 10%
	li $9, 100 #Armazena o valor 100 em $9 para auxiliar nos calculos
	div $8, $9 #Divide o valor de $8 por $9
	mflo $10 #Armazena o resultado em $10
	mul $10, $10, 10 #Multiplica o valor de $10 por 10
	sub $10, $8, $10 #Subtrai $10 do valor de $8 e armazena o resultado em $10
	
	#Comissão do vendedor venda a vista
	div $10, $9 #Divide o valor de $10 por $9
	mflo  $11 #Armazena o resultado em $11
	mul $11, $11, 5 #Multiplica o valor de $11 por 5
	
	#Imprime o valor do desconto de 10%
	move $4, $10 #Carrega em $4 o valor de $10
	li $2, 1 #Syscall para imprimir inteiros
	syscall
	
	#Valor das parcelas
	li $9, 3 #Armazena o valor 3 em $9 para auxiliar nos calculos
	div $8, $9 #Divide o valor de $8 por $9
	mflo $10 #Armazena o resultado da divisão em $10
	
	#Quebra de linha
	li $4, 0xA #Carrega no reg $4 o código para quebra de linha
        li $2, 11 #Cógido para impressão de string
        syscall
	
	#Imprime o valor das parcelas
	move $4, $10 #Carrega em $4 o valor de $10
	li $2, 1 #Syscall para imprimir inteiros
	syscall
	
	#Quebra de linha
	li $4, 0xA #Carrega no reg $4 o código para quebra de linha
        li $2, 11 #Cógido para impressão de string
        syscall
	
	#Imprime o valor da comissão do vendedor venda a vista
	move $4, $11 #Carrega em $4 o valor de $11
	li $2, 1 #Syscall para imprimir inteiros
	syscall
	
	#Comissão do vendedor venda parcelada
	li $9, 100 #Armazena o valor 100 em $9 para auxiliar nos calculos
	div $8, $9 #Divide o valor de $8 por $9
	mflo $9 #Armazena o resultado em $9
	mul $9, $9, 5 #Multiplica o valor de $9 por 5
	
	#Quebra de linha
	li $4, 0xA #Carrega no reg $4 o código para quebra de linha
        li $2, 11 #Cógido para impressão de string
        syscall
	
	#Imprime a comissão do vendedor venda parcelada
	move $4, $9 #Carrega em $4 o valor de $9
	li $2, 1 #Syscall para imprimir inteiros
	syscall