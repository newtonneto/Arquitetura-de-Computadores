#Ex29
.data
	str1: .asciiz "Some: "
	str2: .asciiz " + "
	str3: .asciiz " = "
	str4: .asciiz " | Resposta do aluno: "
	str5: .asciiz " ACERTOU"
	str6: .asciiz " ERROU"
	str7: .asciiz "Acertou "
	str8: .asciiz " vezes"
.text
	#Incrementa reg de controle
L0:	add $13, $13, 1 #Incrementa 1 do reg $13
	beq $13, 6 L2 #Pule para L2 se for a sexta execucao

	#Gera primeiro numero aleatorio
	li $5, 100 #Define em $5 o valor maximo do numero aleatorio
	li $2, 42 #Syscall para gerar numero aleatorio
	syscall
	move $8, $4 #Armazena em $8 o numero gerado
	
	#Gera segundo numero aleatorio
	li $5, 100 #Define em $5 o valor maximo do numero aleatorio
	li $2, 42 #Syscall para gerar numero aleatorio
	syscall
	move $9, $4 #Armazena em $9 o numero gerado
	
	#Imprime calculo
	la $4, str1 #Carrega em $4 a string str1
	li $2, 4 #Syscall para imprimir string
	syscall
	move $4, $8 #Carrega em $4 o primeiro numero
	li $2, 1 #Syscall para imprimir inteiro
	syscall
	la $4, str2 #Carrega em $4 a string str2
	li $2, 4 #Syscall para imprimir string
	syscall
	move $4, $9 #Carrega em $4 o segundo numero
	li $2, 1 #Syscall para imprimir inteiro
	syscall
	li $4, 0xA #Codigo para quebra de linha
	li $2, 11 #Syscall para imprimir caractere
	syscall
	
	#Receba resposta
	li $2, 5 #Syscall para ler inteiro
	syscall
	move $10, $2 #Carrega em $10 o valor lido
	
	#Soma os 2 numero aleatorios
	add $11, $8, $9 #Soma $8 com $9 e armazena o resultado em $11
	
	#Imprime resultado
	move $4, $8 #Carrega em $4 o primeiro numero
	li $2, 1 #Syscall para imprimir inteiro
	syscall
	la $4, str2 #Carrega em $4 a string str2
	li $2, 4 #Syscall para imprimir string
	syscall
	move $4, $9 #Carrega em $4 o segundo numero
	li $2, 1 #Syscall para imprimir inteiro
	syscall
	la $4, str3 #Carrega em $4 a string str3
	li $2, 4 #Syscall para imprimir string
	syscall
	move $4, $11 #Carrega em $4 a soma
	li $2, 1 #Syscall para imprimir inteiro
	syscall
	la $4, str4 #Carrega em $4 a string str4
	li $2, 4 #Syscall para imprimir string
	syscall
	move $4, $10 #Carrega em $4 a resposta do aluno
	li $2, 1 #Syscall para imprimir inteiro
	syscall
	
	#Compara a soma com a entrada do aluno
	beq $10, $11 L1
	
	#Imprime errou
	la $4, str6 #Carrega em $4 a string str5
	li $2, 4 #Syscall para imprimir string
	syscall
	li $4, 0xA #Codigo para quebra de linha
	li $2, 11 #Syscall para imprimir caractere
	syscall
	j L0 #Volta para o inicio
	
	#Imprime acertou
L1:	la $4, str5 #Carrega em $4 a string str5
	li $2, 4 #Syscall para imprimir string
	syscall
	li $4, 0xA #Codigo para quebra de linha
	li $2, 11 #Syscall para imprimir caractere
	syscall
	
	#Icrementa registrador de respostas certas
	add $12, $12, 1 #Incrementa +1 ao reg $12
	j L0 #Volta para o inicio

	#Imprime quantidade de acertos
L2:	la $4, str7 #Carrega em $4 a string str7
	li $2, 4 #Syscall para imprimir string
	syscall
	move $4, $12 #Carrega em $4 a quantidade de acertos
	li $2, 1 #Syscall para imprimir inteiro
	syscall
	la $4, str8 #Carrega em $4 a string str8
	li $2, 4 #Syscall para imprimir string
	syscall

	#Finaliza programa	
end:	li $2, 10 #Syscall para encerrar execucao
	syscall