#Ex17
.text
	li $2, 5 #Syscall para ler inteiro
	syscall
	move $8, $2 #Carrega em $8 o valor lido
	
	li $9, 0 #Inicializa $9 em 0
	li $10, 0 #Inicializa $10 em 0
L1:	add $9, $9, 1 #Incrementa +1 em $9
	add $10, $10, $9 #Soma $10 com $9
	
	blt $9, $8 L1 #Se $9 <= $8 pule para L1
	
	move $4, $10 #Carrega em $4 o valor de $10
	li $2, 1 #Syscall para imprimir inteiro
	syscall
	
	#Finaliza programa
	li $2, 10 #Syscall para encerrar execucao
	syscall