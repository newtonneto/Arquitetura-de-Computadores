#Ex06
.data
	str1: .asciiz "maior numero: "
	str2: .asciiz "Diferenca entre os dois: "
.text
	#Le o primeiro numero
	li $2, 5 #Syscall para ler inteiro
	syscall
	move $8, $2 #Carrega o reg $8 com o valor lido
	
	#Le o segundo numero
	li $2, 5 #Syscall para ler inteiro
	syscall
	move $9, $2 #Carrega o reg $8 com o valor lido
	
	#Verifica se $8 é menor que $9
	slt $10, $8, $9 #Se $8 for menor que $9, $10 recebe 1, do contrario 0
	
	#Verifica se $10 igual a 0
	beq $10, $0 L1 #Se $10 for 0 pular para L1, do contrario prossiga
	
	#Exibe $9
	la $4, str1 #Carrega $4 com a string str1
	li $2, 4 #Syscall para exibir string 
	syscall
	
	move $4, $9 #Carrega $4 com o valor de $9
	li $2, 1 #Syscall para imprimir inteiros
	syscall
	
	li $4, 0xA #Codigo de quebra de linha
	li $2, 11 #Syscall para imprimir caractere
	syscall
	
	la $4, str2 #Carrega $4 com a string str2
	li $2, 4 #Syscall para exibir string 
	syscall
	
	#Realiza a subtracao
	sub $9, $9, $8 #Subtrai $9 de $8 e armazena em $8
	
	move $4, $9 #Carrega $4 com o valor de $9
	li $2, 1 #Syscall para imprimir inteiros
	syscall
	j fim #Pula para o fim do programa
	
	#Exibe $8
L1:	la $4, str1 #Carrega $4 com a string str1
	li $2, 4 #Syscall para exibir string 
	syscall
	
	move $4, $8 #Carrega $4 com o valor de $8
	li $2, 1 #Syscall para imprimir inteiros
	syscall
	
	li $4, 0xA #Codigo de quebra de linha
	li $2, 11 #Syscall para imprimir caractere
	syscall
	
	la $4, str2 #Carrega $4 com a string str2
	li $2, 4 #Syscall para exibir string 
	syscall
	
	#Realiza a subtracao
	sub $8, $8, $9 #Subtrai $8 de $9 e armazena em $8
	
	move $4, $8 #Carrega $4 com o valor de $8
	li $2, 1 #Syscall para imprimir inteiros
	syscall
	
	#Finaliza o programa
fim: 	li $2, 10 #Syscall para finalizar a execucao
	syscall