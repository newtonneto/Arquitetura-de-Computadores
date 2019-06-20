#Ex24
.data
	str1: .asciiz "1- MG 7%"
	str2: .asciiz "2- SP 12%"
	str3: .asciiz "3- RJ 15%"
	str4: .asciiz "4- MS 8%"
	erro: .asciiz "Erro - estado invalido"
.text
	#Imprime menu
	la $4, str1 #Carrega no reg $4 a string str1
	li $2, 4 #Syscall para imprimir string
	syscall
	li $4, 0xA #Codigo de quebra de linha
	li $2, 11 #Syscall para imprimir caractere
	syscall
	
	la $4, str2 #Carrega no reg $4 a string str2
	li $2, 4 #Syscall para imprimir string
	syscall
	li $4, 0xA #Codigo de quebra de linha
	li $2, 11 #Syscall para imprimir caractere
	syscall
	
	la $4, str3 #Carrega no reg $4 a string str3
	li $2, 4 #Syscall para imprimir string
	syscall
	li $4, 0xA #Codigo de quebra de linha
	li $2, 11 #Syscall para imprimir caractere
	syscall
	
	la $4, str4 #Carrega no reg $4 a string str4
	li $2, 4 #Syscall para imprimir string
	syscall
	li $4, 0xA #Codigo de quebra de linha
	li $2, 11 #Syscall para imprimir caractere
	syscall
	
	#Recebe uma opcao
	li $2, 5 #Syscall para ler inteiro
	syscall
	move $t1, $2 #Carrega em $t1 o valor lido
	
	#Recebe valor do produto
	li $2, 5 #Syscall para ler inteiro
	syscall
	move $t2, $2 #Carrega em $t2 o valor lido
	
	#Verifica opcao 1
	beq $t1, 1 MG
	
	#Verifica opcao 2
	beq $t1, 2 SP
	
	#Verifica opcao 3
	beq $t1, 3 RJ
	
	#Verifica opcao 4
	beq $t1, 4 MS
	
	#Opcao invalida
	la $4, erro #Carrega em $4 a string erro
	li $2, 4 #Syscall para imprimir string
	syscall
	j end #Pula para o fim do codigo
	
	#Calcula imposto MG
MG:	li $t3, 100 #Carrega o reg $t2 com 100 para auxiliar na divisao
	div $t2, $t3 #Divide $t2 por 100
	mflo $t3 #Salva o resultado inteiro em $t3
	mul $t3, $t3, 7 #Multiplica o resultado da divisao pelo valor do imposto
	add $t2, $t2, $t3 #Salva em $t2 o valor final do produto
	
	#Imprime valor final MG
	move $4, $t2 #Carrega em $4 o valor final
	li $2, 1 #Syscall para imprimir inteiro
	syscall
	j end #Pula para final do programa

	#Calcula imposto SP
SP:	li $t3, 100 #Carrega o reg $t2 com 100 para auxiliar na divisao
	div $t2, $t3 #Divide $t2 por 100
	mflo $t3 #Salva o resultado inteiro em $t3
	mul $t3, $t3, 12 #Multiplica o resultado da divisao pelo valor do imposto
	add $t2, $t2, $t3 #Salva em $t2 o valor final do produto
	
	#Imprime valor final SP
	move $4, $t2 #Carrega em $4 o valor final
	li $2, 1 #Syscall para imprimir inteiro
	syscall
	j end #Pula para final do programa
	
	#Calcula imposto RJ
RJ:	li $t3, 100 #Carrega o reg $t2 com 100 para auxiliar na divisao
	div $t2, $t3 #Divide $t2 por 100
	mflo $t3 #Salva o resultado inteiro em $t3
	mul $t3, $t3, 15 #Multiplica o resultado da divisao pelo valor do imposto
	add $t2, $t2, $t3 #Salva em $t2 o valor final do produto
	
	#Imprime valor final RJ
	move $4, $t2 #Carrega em $4 o valor final
	li $2, 1 #Syscall para imprimir inteiro
	syscall
	j end #Pula para final do programa
	
	#Calcula imposto MS
MS:	li $t3, 100 #Carrega o reg $t2 com 100 para auxiliar na divisao
	div $t2, $t3 #Divide $t2 por 100
	mflo $t3 #Salva o resultado inteiro em $t3
	mul $t3, $t3, 8 #Multiplica o resultado da divisao pelo valor do imposto
	add $t2, $t2, $t3 #Salva em $t2 o valor final do produto
	
	#Imprime valor final MS
	move $4, $t2 #Carrega em $4 o valor final
	li $2, 1 #Syscall para imprimir inteiro
	syscall
		
	#Finaliza programa
end:	li $2, 10 #Syscall para encerrar execucao
	syscall