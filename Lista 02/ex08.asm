#Ex08
.data
	str: .asciiz "Valor invalido"
.text
	#Recebe nota 1
	li $2, 5 #Syscall para receber inteiro
	syscall
	move $8, $2 #Carrega em $8 o valor recebido
	
	#Recebe nota 2
	li $2, 5 #Syscall para receber inteiro
	syscall
	move $9, $2 #Carrega em $9 o valor recebido
	
	#Verifica se a nota 1 eh menor que zero
	slt $10, $8, $0 #Se $8 for menor que 0 $10 recebe 1, do contrario 0
	
	#Verifica se $10 recebeu 1
	beq $10, 1 L1 #Se $10 for 1 pule para L1
	
	#Verifica se a nota 2 eh menor que zero
	slt $10, $9, $0 #Se $9 for menor que 0 $10 recebe 1, do contrario 0
	
	#Verifica se $10 recebeu 1
	beq $10, 1 L1 #Se $10 for 1 pule para L1
	
	#Verifica se nota 1 eh maior que 10
	sgt $10, $8, 10 #Se $8 for maior que 10 $10 recebe 1, do contrario 0
	
	#Verifica se $10 recebeu 1
	beq $10, 1 L1 #Se $10 for 1 pule para L1
	
	#Verifica se nota 2 eh maior que 10
	sgt $10, $9, 10 #Se $9 for maior que 10 $10 recebe 1, do contrario 0
	
	#Verifica se $10 recebeu 1
	beq $10, 1 L1 #Se $10 for 1 pule para L1
	
	#Caso todas as condições acima tenham falhado a media sera calculada
	add $8, $8, $9 #Soma $8 com $9 e atribui o resultado a $8
	
	li $10, 2 #Carrega 2 em $10 para auxiliar na divisão
	div $8, $10 #Divide $8 por 2
	mflo $8 #Armazena o resultado da divisao em $8
	
	#Exibe media
	move $4, $8 #Carrega em $8 o valor de $8
	li $2, 1 #Syscall para imprimir inteiros
	syscall
	j fim #Pula para o fim do programa
	
L1:	la $4, str #Carrega em $4 a string str
	li $2, 4 #Syscall para imprimir strings
	syscall
	
fim:	li $2, 10 #Syscall para finalizar programa
	syscall