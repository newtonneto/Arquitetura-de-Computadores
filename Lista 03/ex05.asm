#Ex05
.text
	li $8, 0 #Reg de controle, comeca em 0
	li $10, 0 #Reg para armazena somas, comeca em 0
	
L1:	li $2, 5 #Syscall para ler inteiro
	syscall
	move $9, $2 #Carrega em $9 o valor lido
	
	add $10, $10, $9 #Soma o valor de $10 com o valor recebido ($9)
	add $8, $8, 1 #Incrementa +1 ao valor de $8
	blt $8, 10 L1 #Se $8 < 10 pule para L1
	
	#Imprime resultado
	move $4, $10 #Carrega o valor de $10 em $4
	li $2, 1 #Syscall para imprimir inteiro
	syscall
	
	#Finaliza programa
	li $2, 10 #Syscall para encerrar execucao
	syscall