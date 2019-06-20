#Ex21
.data
	str1: .asciiz "Escolha a opcao"
	opc1: .asciiz "1- Soma de 2 numeros"
	opc2: .asciiz "2- Diferenca entre 2 numeros (maior pelo menor)"
	opc3: .asciiz "3- Produto entre 2 numeros"
	opc4: .asciiz "4- Divisao entre 2 numeros (o denominados nao pode ser zero)"
	str2: .asciiz "Opcao "
	unk: .asciiz "Opcao invalida"
.text
	#Imprime menu
	la $4, str1 #Carrega no reg $4 a string str1
	li $2, 4 #Syscall para imprimir string
	syscall
	li $4, 0xA #Carrega em $4 o codigo de quebra de linha
	li $2, 11 #Syscall para imprimir caractere
	syscall
	
	la $4, opc1 #Carrega no reg $4 a string opc1
	li $2, 4 #Syscall para imprimir string
	syscall
	li $4, 0xA #Carrega em $4 o codigo de quebra de linha
	li $2, 11 #Syscall para imprimir caractere
	syscall
	
	la $4, opc2 #Carrega no reg $4 a string opc2
	li $2, 4 #Syscall para imprimir string
	syscall
	li $4, 0xA #Carrega em $4 o codigo de quebra de linha
	li $2, 11 #Syscall para imprimir caractere
	syscall
	
	la $4, opc3 #Carrega no reg $4 a string opc3
	li $2, 4 #Syscall para imprimir string
	syscall
	li $4, 0xA #Carrega em $4 o codigo de quebra de linha
	li $2, 11 #Syscall para imprimir caractere
	syscall
	
	la $4, opc4 #Carrega no reg $4 a string opc4
	li $2, 4 #Syscall para imprimir string
	syscall
	li $4, 0xA #Carrega em $4 o codigo de quebra de linha
	li $2, 11 #Syscall para imprimir caractere
	syscall
	
	la $4, str2 #Carrega no reg $4 a string str2
	li $2, 4 #Syscall para imprimir string
	syscall
	
	#Recebe a opcao
	li $2, 5 #Syscall para ler inteiro
	syscall
	move $t1, $2 #Carrega o valor lido em $t1
	
	#Verifica se o numero eh valido
	li $t2, 4 #Carrega 4 em $t2
	sgt $t2, $t1, $t2 #Verifica se o valor recebido eh maior que 4, se for $t2 recebe 1, do contrario 0
	beq $t2, 1 opi #Se $t2 for igual a 1 pule para opi
	li $t2, 1 #Carrega 1 em $t2
	slt $t2, $t1, $t2 #Verifica se o valor recebido eh menor que 1, se for $t2 recebe 1, do contrario 0
	beq $t2, 1 opi #Se $t2 for igual a 1 pule para opi
	
	#Recebe o numero 1
	li $2, 5 #Syscall para ler inteiro
	syscall
	move $t3, $2 #Carrega o valor lido em $t3
	
	#Recebe o numero 2
	li $2, 5 #Syscall para ler inteiro
	syscall
	move $t4, $2 #Carrega o valor lido em $t4
	
	#Verifica se a opcao eh 1
	beq $t1, 1 op1 #Se $t1 for igual a 1 pule para op1
	
	#Verifica se a opcao eh 2
	beq $t1, 2 op2 #Se $t1 for igual a 1 pule para op2
	
	#Verifica se a opcao eh 3
	beq $t1, 3 op3 #Se $t1 for igual a 1 pule para op3
	
	#Verifica se a opcao eh 4
	beq $t1, 4 op4 #Se $t1 for igual a 1 pule para op4
	
	#Imprime opcao invalida
opi:	la $4, unk #Carrega no reg $4 a string unk
	li $2, 4 #Syscall para imprimir string
	syscall
	j end #Pula para o final do programa
	
	#Soma
op1:	add $t3, $t3, $t4 #Soma $t3 com $t4 e armazena o resultado em $t3
	move $4, $t3 #Carrega o resultado da soma em $4
	li $2, 1 #Syscall para imprimir inteiro
	syscall
	j end #Pula para o final do programa
	
	#Subtracao
op2:	sub $t3, $t3, $t4 #Subtrai $t4 de $t3 e armazena o resultado em $t3
	move $4, $t3 #Carrega o resultado da subtracao em $4
	li $2, 1 #Syscall para imprimir inteiro
	syscall
	j end #Pula para o final do programa
	
	#Multiplicacao
op3:	mul $t3, $t3, $t4 #Multiplica $t3 por $t4 e armazena o resultado em $t3
	move $4, $t3 #Carrega o resultado da multiplicacao em $4
	li $2, 1 #Syscall para imprimir inteiro
	syscall
	j end #Pula para o final do programa
	
op4:	div $t3, $t4 #Divide $t3 por $t4
	mflo $t3 #Armazena o resultado inteiro em $t3
	move $4, $t3 #Carrega o resultado da divisao em $4
	li $2, 1 #Syscall para imprimir inteiro
	syscall
	
	#Finaliza o programa
end:	li $2, 10 #Syscall para finalizar execucao
	syscall