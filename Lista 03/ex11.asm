#Ex11
.text
	#Recebe um numero
	li $2, 5 #Syscall para ler inteiro
	syscall
	move $8, $2 #Armazena em $8 o valor lido
	
	li $9, 0 #Numero a ser incrementado
	
L1:	move $4, $9 #Armazena em $4 o valor de $9
	li $2, 1 #Syscall para imprmir inteiro
	syscall
	li $4, 0x20 #Codigo do espaço
	li $2, 11 #Syscall para imprimir caractere
	syscall
	
	add $9, $9, 1 #Incrementa em +1 o valor de $9
	
	ble $9, $8 L1 #Se $9 <= $8 volte para L1
	
	#Finaliza programa
	li $2, 10 #Syscall para encerrar execucao
	syscall