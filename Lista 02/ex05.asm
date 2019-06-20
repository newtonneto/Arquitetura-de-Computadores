#Ex05
.data
	#Declara as strings
	str1: .asciiz "eh par"
	str2: .asciiz "eh impar"
.text
	#Recebe o numero
	li $2, 5 #Syscall para ler um inteiro
	syscall
	move $8, $2 #Carrega o reg $8 com o valor lido
	
	#Divide o numero por 2
	li $9, 2 #Armazena 2 em $9 para auxiliar na divisão
	div $8, $9 #Divide o valor do reg $8 por 2
	mfhi $9 #Armazena o resto da divisão em $9
	
	#Compara o resto da divisao
	beq $9, $0 L1 #Se o resto da divisao for 0 pule para o L1, do contrario prossiga
	
	#Impar - beq eh falso
	la $4, str2 #Carrega no reg $4 a string 2
	li $2, 4 #Syscall para imprimir string
	syscall
	j fim #Pula para o final do programa
	
	#Par - beq eh verdadeiro
L1:	la $4, str1 #Carrega no reg $4 a string 1
	li $2, 4 #Syscall para imprimir string
	syscall
	
	#Finaliza o programa
fim: 	li $2, 10 #Syscall para encerrar programa
	syscall