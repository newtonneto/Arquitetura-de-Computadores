.data
	str1: .asciiz "Maior número: "
	str2: .asciiz "Quantidade de vezes que foi lido: "
.text
	#Quantidade de elementos a ser lido
	addi $2, $0, 5 #Syscall para ler inteiro
	syscall
	add $8, $0, $2 #Recebe o valor lido
	
	#Armazena maior número
	add $10, $0, $0 #Inicia zerado
	
loop:	beq $8, $0 C3
	addi $2, $0, 5 #Syscall para ler inteiro
	syscall
	add $9, $0, $2 #Recebe o valor a ser verificado
	bgt $9, $10 C1
	beq $9, $10 C2
C0:	sub $8, $8, 1
	j loop

	#Armazena maior valor	
C1:	add $10, $0, $9 #Armazena o maior valor lido
	addi $11, $0, 1 #Reseta a variavel de contagem
	j C0
	
	#Incrementa variavel que conta quantas vezes o maior numero foi lido
C2:	addi $11, $11, 1 #Incrementa a variavel de contagem caso o numero maior repita
	j C0

	#Imprime resultados
C3:	la $4, str1 #Carrega str1 em $4
	addi $2, $0, 4 #Syscall para imprimir string
	syscall
	add $4, $0, $10 #Carrega o maior valor em $4
	addi $2, $0, 1 #Syscall para imprimir inteiro
	syscall
	la $4, 0xA #Codigo de quebra de linha
	addi $2, $0, 11 #Syscall para imprimir caractere
	syscall
	la $4, str2 #Carrega str2 em $4
	addi $2, $0, 4 #Syscall para imprimir string
	syscall
	add $4, $0, $11 #Carrega em $4 a quantidade de vezes que o maior numero foi lido
	add $2, $0, 1 #Syscall para imprimir inteiro
	syscall

fim:	addi $2, $0, 10 #Syscall para finalizar execucao
	syscall