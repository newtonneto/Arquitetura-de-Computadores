#Ex03
.data
	str: .asciiz "FIM!"
.text
	li $8, 10 #Carrega 10 em $8
	
L1:	move $4, $8 #Carrega o valor de $8 em $4
	li $2, 1 #Syscall para imprimir inteiro
	syscall
	li $4, 0xA #Codigo de quebra de linha
	li $2, 11 #Syscall para imprimir caractere
	syscall
	
	sub $8, $8, 1 #Subtrai -1 do valor de $8
	bge $8, 0 L1 #Verifica se $8 >= 0, se for volte para L1
	
	#Imprime FIM!
	la $4, str #Carrega a string str em $4
	li $2, 4 #Syscall para imprimir string
	syscall
	
	#Finaliza programa
fim:	li $2, 10 #Syscall para encerrar execucao
	syscall