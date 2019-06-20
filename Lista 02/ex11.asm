#Ex11
.data
	str: .asciiz "Numero invalido"
.text
	#Recebe o numero
	li $2, 5 #Syscall para receber inteiro
	syscall
	move $8, $2 #Carrega em $8 o valor recebido
	
	#Verifica se o numero eh menor que 0
	slt $10, $8, $0 #Se o valor de $8 for menor que 0 $10 recebe 1, do contrario 0
	
	#Verifica se $10 recebeu 1
	beq $10, 1 L1	
	
	#Carrega reg $11 e $12
	li $11, 0 #$11 vai receber os valores a direita da virgula
	li $12, 0 #$12 vai receber a soma dos valores de $11
	
	#Executa varias divisões por 10 para somar os valores a direita da virgula	
	li $10, 10 #Carrega 10 em $10 para realizar as divisoes
L2:	div $8, $10 #Divide o valor de $8 por 10
	mfhi $11 #Salva em $11 o valor a direita da virgula
	mflo $8 #Salva em $8 o valor a esquerda da virgula
	add $12, $12, $11 #$12 vai receber a soma de $11 com ele mesmo
	
	#Verifica se o numero a esquerda da virgula ainda é maior que 0
	sgt $9, $8, $0 #Se $8 for maior que 0 $9 recebe 1, do contrario 0
	
	#Verifica se $9 é igual a 1
	beq $9, 1 L2 #Se $9 for igual a 1 volte para L2, do contrario prossiga 
	
	#Imrpime a soma dos algarismos do numero
	move $4, $12 #Carrega o resultado no reg $4
	li $2, 1 #Syscall para imprimir inteiros
	syscall
	j fim #Pula para o final do codigo
	
	#Imprime Numero invalido
L1:	la $4, str #Carrega em $4 a string str
	li $2, 4 #Syscall para imprimir strings
	syscall
	
fim:	li $2, 10 #Syscall para finalizar execucao
	syscall