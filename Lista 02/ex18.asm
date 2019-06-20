#Ex18
.data
	op1: .asciiz "1. Adicao"
	op2: .asciiz "2. Subtracao"
	op3: .asciiz "3. Multiplicacao"
	op4: .asciiz "4. Divisao"
	unk: .asciiz "Opcao invalida"
.text
	#Exibe menu
	la $4, op1 #Carrega em $4 a string op1
	li $2, 4 #Syscall para imprimir string
	syscall
	li $4, 0xA #Carrega em $4 o codigo de quebra de linha
	li $2, 11 #Syscall para imprimir caractere
	syscall
	la $4, op2 #Carrega em $4 a string op2
	li $2, 4 #Syscall para imprimir string
	syscall
	li $4, 0xA #Carrega em $4 o codigo de quebra de linha
	li $2, 11 #Syscall para imprimir caractere
	syscall
	la $4, op3 #Carrega em $4 a string op3
	li $2, 4 #Syscall para imprimir string
	syscall
	li $4, 0xA #Carrega em $4 o codigo de quebra de linha
	li $2, 11 #Syscall para imprimir caractere
	syscall
	la $4, op4 #Carrega em $4 a string op4
	li $2, 4 #Syscall para imprimir string
	syscall
	li $4, 0xA #Carrega em $4 o codigo de quebra de linha
	li $2, 11 #Syscall para imprimir caractere
	syscall

	#Recebe a opcao
	li $2, 5 #Syscall para ler inteiro
	syscall
	move $t1, $2 #Carrega o valor lido em $t1
	
	#Recebe o numero 1
	li $2, 5 #Syscall para ler inteiro
	syscall
	move $t2, $2 #Carrega o valor lido em $t2
	
	#Recebe o numero 2
	li $2, 5 #Syscall para ler inteiro
	syscall
	move $t3, $2 #Carrega o valor lido em $t3
	
	#Verifica adicao
	beq $t1, 1 L1
	#Verifica subtracao
	beq $t1, 2 L2
	#Verifica multiplicacao
	beq $t1, 3 L3
	#Verifica divisao
	beq $t1, 4 L4
	
	#Imprime opcao invalida caso todas as condicoes acima sejam falsas
	la $4, unk #Carrega em $4 a string unk
	li $2, 4 #Syscall para imprimir string
	syscall
	j end #Pula para o final do codigo
	
	#Adicao
L1:	add $t2, $t2, $t3 #Soma $t2 com $t3 e armazena o resultado em $t2
	
	#Imprime resultado
	move $4, $t2 #Carrega o resultado da soma em $4
	li $2, 1 #Syscall para imprimir inteiro
	syscall
	j end #Pula para o final do codigo
	
	#Subtracao
L2:	sub $t2, $t2, $t3 #Subtrai $t3 de $t2 e armazena o resultado em $t2

	#Imprime resultado
	move $4, $t2 #Carrega o resultado da subtracao em $4
	li $2, 1 #Syscall para imprimir inteiro
	syscall
	j end #Pula para o final do codigo
	
	#Multiplicacao
L3:	mul $t2, $t2, $t3 #Multiplica $t2 por $t3

	#Imprime resultado
	move $4, $t2 #Carrega o resultado da subtracao em $4
	li $2, 1 #Syscall para imprimir inteiro
	syscall
	j end #Pula para o final do codigo
	
	#Divisao
L4:	div $t2, $t3 #Divide $t2 por $t3
	mflo $t2 #Armazena o resultado inteiro em $t2
	
	#Imprime resultado
	move $4, $t2 #Carrega o resultado da subtracao em $4
	li $2, 1 #Syscall para imprimir inteiro
	syscall
	
	#Finaliza o programa
end:	li $2, 10 #Syscall para encerrar execucao
	syscall