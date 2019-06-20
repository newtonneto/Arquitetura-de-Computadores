#Ex08
.text
	li $8, 0 #Reg para o menor numero, inicia em 0
	li $9, 0 #Reg para o maior numero, inicio em 0
	li $10, 0 #Reg de controle, inica em 0
	
	li $2, 5 #Syscall para ler inteiro
	syscall
	move $8, $2 #Carrega o valor lido em $8
	move $9, $2 #Carrega o valor lido em $9
	add $10, $10, 1 #Incrementa em +1 $10
	
L0:	li $2, 5 #Syscall para ler inteiro
	syscall
	move $11, $2 #Armazena em $11 o valor lido
	
	blt $11, $8 L1#Verifica sem $11 < $8, se sim pule para L1
	bgt $11, $9 L2#Verifica sem $11 > $9, se sim pule para L2
	
	add $10, $10, 1 #Incrementa em +1 $10
	
	
	ble $10, 9 L0 #Verifica se $10 <= 10, se sim pule para fim

	j L3 #Se nao passar na condicao acima pula para o L3
	
	#Armazena menor numero	
L1:	move $8, $11 #Carrega em $8 o valor de $11
	add $10, $10, 1 #Incrementa em +1 $10
	j L0
	
	#Armazena maior numero
L2:	move $9, $11 #Carrega em $9 o valor de $11
	add $10, $10, 1 #Incrementa em +1 $10
	j L0

	#Exibe o menor e o maior valor	
L3:	move $4, $8 #Carrega o menor valor em $4
	li $2, 1 #Syscall para imprimir inteiro
	syscall
	li $4, 0xA #Codigo de quebra de linha
	li $2, 11 #Syscall para imprimir caractere
	syscall
	move $4, $9 #Carrega o maior valor em $9
	li $2, 1 #Syscall para imprimir inteiro
	syscall
	
	#Finaliza programa
	li $2, 10 #Syscall para encerrar execucao
	syscall 