#Ex09
.data
	str1: .asciiz "Emprestimo nao concedido"
	str2: .asciiz "Emprestimo concedido"
.text
	#Recebe o salario
	li $2, 5 #Syscall para receber inteiros
	syscall
	move $8, $2 #Carrega em $8 o valor recebido
	
	#Recebe a prestacao do emprestido
	li $2, 5 #Syscall para receber inteiros
	syscall
	move $9, $2 #Carrega em $9 o valor recebido
	
	#Calcula os 20% do salario
	li $10, 100 #Carrega 100 em $10 para auxiliar na divisao
	div $8, $10 #Divide o valor de $8 por 100
	mflo $8 #Armazena em $10 o resultado da divisão (esquerda da virgula)
	
	#Multiplica 1% do salario por 20
	mul $8, $8, 20 #Multiplica o valor de $8 por 20 e armazena em $8
	
	#Compara 20% salario com valor da prestacao
	sgt  $10, $8, $9 #Se os 20% do salario for maior que o valor da prestacao $10 vai ser 1, do contrario 0
	
	#Verifica o valor de $10
	beq $10, 1 L1 #Se o valor de $10 for 1 pule para L1, do contrario prossiga

	#Emprestimo nao concedido
	la $4, str1 #Carrega em $4 a string str1
	li $2, 4 #Syscall para imprimir string
	syscall
	j fim #Pula para o final do programa

	#Emprestimo concedido	
L1:	la $4, str2 #Carrega em $4 a string str2
	li $2, 4 #Syscall para imprimir string
	syscall
	
fim:	li $2, 10 #Syscall para finalizar execucao
	syscall