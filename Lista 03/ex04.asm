#Ex04
.text
	li $8, 0 #Carrega o valor 0 em $8
	
L1:	move $4, $8 #Carrega o valor de $8 em $4
	li $2, 1 #Syscall para imprimir inteiro
	syscall
	li $4, 0xA #Codigo de quebra de linha
	li $2, 11 #Syscall para imprimir caractere
	syscall
	
	add $8, $8, 1000 #Incrementa +1000 ao valor de $8
	ble $8, 100000 L1 #Verifica se $8 <= 100k, se sim volta para L1
	
	#Finaliza programa
	li $2, 10 #Syscall para encerrar execucao
	syscall