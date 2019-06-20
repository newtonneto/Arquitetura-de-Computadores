.text
	li $2, 12 #Syscall para ler char
	syscall
	move $8, $2 #Carrega em $8 o char lido
	
	add $8, $8, 32 #Adiciona 32 decimal ao código ASCII do char lido
	
	move $4, $8 #Carrega no reg $4 o char modificado
	li $2, 11 #Syscall para imprimir string
	syscall