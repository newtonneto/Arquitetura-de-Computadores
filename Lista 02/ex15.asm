#Ex15
.data
	dom: .asciiz "Domingo"
	seg: .asciiz "Segunda"
	ter: .asciiz "Terca"
	qua: .asciiz "Quarta"
	qui: .asciiz "Quinta"
	sex: .asciiz "Sexta"
	sab: .asciiz "Sabado"
	unk: .asciiz "Opcao invalida"
.text
	#Recebe um numero correspondente ao dia da semana
	li $2, 5 #Syscall para ler inteiro
	syscall
	move $8, $2 #Carrega em $8 o valor lido
	
	#Verifica se eh domingo
	beq $8, 1 L1
	#Verifica se eh segunda
	beq $8, 2 L2
	#Verifica se eh terca
	beq $8, 3 L3
	#Verifica se eh quarta
	beq $8, 4 L4
	#Verifica se eh quinta
	beq $8, 5 L5
	#Verifica se eh sexta
	beq $8, 6 L6
	#Verifica se eh sabado
	beq $8, 7 L7
	
	#Imprime opcao invalida
	la $4, unk #Carrega a string unk em $4
	li $2, 4 #Syscall para imprimir string
	syscall
	j end #Pula para o fim do programa
	
	#Imprime Domingo	
L1:	la $4, dom #Carrega a string domingo
	li $2, 4 #Syscall para imprimir string
	syscall
	j end #Pula para o fim do programa
	
	#Imprime segunda
L2:	la $4, seg #Carrega a string segunda
	li $2, 4 #Syscall para imprimir string
	syscall
	j end #Pula para o fim do programa
	
	#Imprime terca	
L3:	la $4, ter #Carrega a string terca
	li $2, 4 #Syscall para imprimir string
	syscall
	j end #Pula para o fim do programa
	
	#Imprime quarta	
L4:	la $4, qua #Carrega a string quarta
	li $2, 4 #Syscall para imprimir string
	syscall
	j end #Pula para o fim do programa
	
	#Imprime quinta	
L5:	la $4, qui #Carrega a string quinta
	li $2, 4 #Syscall para imprimir string
	syscall
	j end #Pula para o fim do programa
	
	#Imprime sexta	
L6:	la $4, sex #Carrega a string sexta
	li $2, 4 #Syscall para imprimir string
	syscall
	j end #Pula para o fim do programa
	
	#Imprime sabado	
L7:	la $4, sab #Carrega a string sabado
	li $2, 4 #Syscall para imprimir string
	syscall

end:	li $2, 10 #Syscall para finalizar programa
	syscall