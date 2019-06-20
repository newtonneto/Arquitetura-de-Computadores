#Ex07
.data
	str1: .asciiz "Maior numero: "
	str2: .asciiz "Numeros iguais"
.text
	#Le o numero 1
	li $2, 5 #Syscall para receber um inteiro
	syscall
	move $8, $2 #Carrega em $8 o valor recebido
	
	#Le o numero 2
	li $2, 5 #Syscall para receber um inteiro
	syscall
	move $9, $2 #Carrega em $9 o valor recebido
	
	#Verifica se $8 e $9 sao iguais
	beq $8, $9 L1
	
	#Verifica quem eh maior caso nao sejam iguais
	slt $10, $8, $9 #Armazena 1 em $10 caso $8 seja menor que $9, do contrario 0
	
	#Verifica se $10 eh igual a 0
	beq $10, $0 L2
	
	#Imprime $9
	la $4, str1 #Carrega em $4 a string str1
	li $2, 4 #Syscall para imprimir string
	syscall
	
	move $4, $9 #Carrega em $4 o valor de $9
	li $2, 1 #Syscall para imprimir inteiros
	syscall
	j fim #Pula para o final do codigo
	
L2:	#Imprime $8
	la $4, str1 #Carrega em $4 a string str1
	li $2, 4 #Syscall para imprimir string
	syscall
	
	move $4, $8 #Carrega em $4 o valor de $8
	li $2, 1 #Syscall para imprimir inteiros
	syscall
	j fim #Pula para o final do codigo
	
L1:	la $4, str2 #Carrega em $4 a string str2
	li $2, 4 #Syscall para imprimir string
	syscall
	
fim:	li $2, 10 #Syscall para finalizar programa
	syscall