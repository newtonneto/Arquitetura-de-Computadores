#Ex16
.data
	jan: .asciiz "Janeiro"
	fev: .asciiz "Fevereiro"
	mar: .asciiz "Marco"
	abr: .asciiz "Abril"
	mai: .asciiz "Maio"
	jun: .asciiz "Junho"
	jul: .asciiz "Julho"
	ago: .asciiz "Agosto"
	set: .asciiz "Setembro"
	out: .asciiz "Outubro"
	nov: .asciiz "Novembro"
	dez: .asciiz "Dezembro"
	unk: .asciiz "Opcao invalida"
.text
	#Recebe o numero referente ao mes
	li $2, 5 #Syscall para ler inteiro
	syscall
	move $8, $2 #Carrega em $8 o valor lido
	
	#Verifica se eh janeiro
	beq $8, 1 L1
	#Verifica se eh fevereiro
	beq $8, 2 L2
	#Verifica se eh marco
	beq $8, 3 L3
	#Verifica se eh abril
	beq $8, 4 L4
	#Verifica se eh maio
	beq $8, 5 L5
	#Verifica se eh junho
	beq $8, 6 L6
	#Verifica se eh julho
	beq $8, 7 L7
	#Verifica se eh agosto
	beq $8, 8 L8
	#Verifica se eh setembro
	beq $8, 9 L9
	#Verifica se eh outubro
	beq $8, 10 L10
	#Verifica se eh novembro
	beq $8, 11 L11
	#Verifica se eh dezembro
	beq $8, 12 L12
	
	#Imprime opcao invalida
	la $4, unk #Carrega a string unk em $4
	li $2, 4 #Syscall para imprimir strings
	syscall
	j end #Pula para o fim do codigo
	
	#Imprime janeiro
L1:	la $4, jan #Carrega em $4 a string janeiro
	li $2, 4 #Syscall para imprimir strings
	syscall
	j end #Pula para o fim do codigo
	
	#Imprime fevereiro
L2:	la $4, fev #Carrega em $4 a string fevereiro
	li $2, 4 #Syscall para imprimir strings
	syscall
	j end #Pula para o fim do codigo
	
	#Imprime marco
L3:	la $4, mar #Carrega em $4 a string marco
	li $2, 4 #Syscall para imprimir strings
	syscall
	j end #Pula para o fim do codigo
	
	#Imprime abril
L4:	la $4, abr #Carrega em $4 a string abril
	li $2, 4 #Syscall para imprimir strings
	syscall
	j end #Pula para o fim do codigo
	
	#Imprime maio
L5:	la $4, mai #Carrega em $4 a string maio
	li $2, 4 #Syscall para imprimir strings
	syscall
	j end #Pula para o fim do codigo
	
	#Imprime junho
L6:	la $4, jun #Carrega em $4 a string junho
	li $2, 4 #Syscall para imprimir strings
	syscall
	j end #Pula para o fim do codigo
	
	#Imprime julho
L7:	la $4, jul #Carrega em $4 a string julho
	li $2, 4 #Syscall para imprimir strings
	syscall
	j end #Pula para o fim do codigo
	
	#Imprime agosto
L8:	la $4, ago #Carrega em $4 a string agosto
	li $2, 4 #Syscall para imprimir strings
	syscall
	j end #Pula para o fim do codigo
	
	#Imprime setembro
L9:	la $4, set #Carrega em $4 a string setembro
	li $2, 4 #Syscall para imprimir strings
	syscall
	j end #Pula para o fim do codigo
	
	#Imprime outubro
L10:	la $4, out #Carrega em $4 a string outubro
	li $2, 4 #Syscall para imprimir strings
	syscall
	j end #Pula para o fim do codigo
	
	#Imprime novembro
L11:	la $4, nov #Carrega em $4 a string novembro
	li $2, 4 #Syscall para imprimir strings
	syscall
	j end #Pula para o fim do codigo
	
	#Imprime dezembro
L12:	la $4, dez #Carrega em $4 a string dezembro
	li $2, 4 #Syscall para imprimir strings
	syscall
	j end #Pula para o fim do codigo
	
	#Finaliza execucao	
end:	li $2, 10 #Syscall para finalizar execucao
	syscall