#Ex02
.text
	li $8, 1 #Carrega 1 em $8
	
L1:	move $4, $8 #Carrega o valor de $8 em $4
	li $2, 1 #Syscall para imprimir inteiros
	syscall
	li $4, 0xA #Codigo para quebra de linha
	li $2, 11 #Syscall para imprimir caractere
	syscall
	add $8, $8, 1 #Incrementa +1 ao valor de $8
	blt $8, 101 L1 #Verifica se $8 < 101, se sim pule para L1
	
	#Finaliza o programa
fim:	li $2, 10 #Syscall para encerrar execucao
	syscall