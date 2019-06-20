#Ex06
.text
	li $8, 0 #Reg para armazenar soma, inicia em 0
	li $9, 0 #Reg de controle, inicia em 0
	
	
L1:	li $2, 5 #Syscall para ler inteiro
	syscall
	move $10, $2 #Carrega em $10 o valor lido
	
	add $8, $8, $10 #Soma o valor de $8 com o valor lido
	add $9, $9, 1 #Incrementa em +1 o valor de $9
	
	ble $9, 9 L1 #Verifica se $9 >= 9, se for volte para L1
	
	div $8, $9 #Divide o valor de $8 por 10
	mflo $8 #Salva o valor inteiro em $8
	mfhi $9 #Salva o valor fracionado em $9
	
	move $4, $8 #Carrega o valor de $8 em $4
	li $2, 1 #Syscall para imprimir inteiro
	syscall
	li $4, 0x2E #Codigo do .
	li $2, 11 #Syscall para imprimir caractere
	syscall
	move $4, $9 #Carrega o valor de $9 em $4
	li $2, 1 #Syscall para imprimir inteiro
	syscall
	
	#Finalizar programa
	li $2, 10 #Syscall para encerrar execucao
	syscall