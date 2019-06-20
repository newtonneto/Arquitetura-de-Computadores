#Ex23
.data
	str1: .asciiz "Eh bissexto"
	str2: .asciiz "Nao eh bissexto"
.text
	#Recebe o ano
	li $2, 5 #Syscall para ler um inteiro
	syscall
	move $t1, $2 #$t1 recebe o valor lido
	
	#Divide por 400
	li $t2, 400 #Carrega $t2 com 400 para realizar a divisao
	div $t1, $t2 #Divide $t1 por 400
	mfhi $t2 #Salva em $t2 o resultado a direita da virgula
	
	#Verifica se a divisao por 400 resultou em um inteiro
	beq $t2, $0 L1 #Se $t2 for igual a 0 pule para L1
	
	#Divide por 4
	li $t2, 4 #Carrega $t2 com 4 para realizar a divisao
	div $t1, $t2 #Divide $t1 por 4
	mfhi $t2 #Salva em $t2 o resultado a direita da virgula
	
	#Verifica se a divisao por 4 resultou em um inteiro
	beq $t2, $0 L2 #Se $t2 for igual a 0 pule para L2
	beq $t2, 1 L4 #Se $t2 for igual a 1 pule para L4
	
	#Divide por 100
L0:	li $t2, 100 #Carrega $t2 com 100 para realizar a divisao
	div $t1, $t2 #Divide $t1 por 4
	mfhi $t2 #Salva em $t2 o resultado a direita da virgula
	
	#Verifica se a divisao por 100 resultou em um inteiro
	sgt $t2, $t2, 0 #Se $t2 > 0 $t1 recebe 1, do contrario 0
	beq $t2, 1 L3 #Se $t2 for igual a 1 pule para L3
	
	#Nao eh bissexto
L4:	la $4, str2 #Carrega em $4 a string str2
	li $2, 4 #Syscall para imprimir strings
	syscall
	j end #Pula para final do programa	
	
	#Eh bissexto
L1:	la $4, str1 #Carrega em $4 a string str1
	li $2, 4 #Syscall para imprimir strings
	syscall
	j end #Pula para final do programa

	#Incrementa $t3 caso ano seja divisivel por 4	
L2:	add $t3, $t3, 1 #Carrega 1 em $t3
	j L0 #Volta para L0
	
	#Incrementa $t3 caso ano nao seja divisivel por 100
L3:	add $t3, $t3, 1 #Carrega 1 em $t3
	beq $t3, 1 L4 #Se $t3 for igual a 1 volte para L4
	la $4, str1 #Carrega em $4 a string str1
	li $2, 4 #Syscall para imprimir strings
	syscall
	
end:	li $2, 10 #Syscall para encerrar execucao
	syscall