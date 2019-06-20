#Ex20
.data
	tr1: .asciiz "Equilatero"
	tr2: .asciiz "Isosceles"
	tr3: .asciiz "Escaleno"
	unk: .asciiz "Nao eh triangulo"
.text
	#Lado 1
	li $2, 5 #Syscall para ler um inteiro
	syscall
	move $t1, $2 #Armazena em $t1 o valor lido
	
	#Lado 2
	li $2, 5 #Syscall para ler um inteiro
	syscall
	move $t2, $2 #Armazena em $t2 o valor lido
	
	#Lado 3
	li $2, 5 #Syscall para ler um inteiro
	syscall
	move $t3, $2 #Armazena em $t3 o valor lido
	
	#Verifica se é triangulo
	li $t4, 0 #Reg auxiliar para receber a soma dos lado
	
	#Verifica se lado 1 é menor que lado 2 mais lado 3
	add $t4, $t2, $t3 #Soma o lado 2 e lado 3 e armazena em $t4
	sgt $t4, $t1, $t4 #$t4 recebe 1 se $t1 > $t4, do contrario 0
	beq $t4, 1 net #Se $t4 igual a 1 pula para net
	
	#Verifica se lado 2 é menor que lado 1 mais lado 3
	add $t4, $t1, $t3 #Soma o lado 1 e lado 3 e armazena em $t4
	sgt $t4, $t2, $t4 #$t4 recebe 1 se $t2 > $t4, do contrario 0
	beq $t4, 1 net #Se $t4 igual a 1 pula para net
	
	#Verifica se lado 3 é menor que lado 1 mais lado 2
	add $t4, $t1, $t2 #Soma o lado 1 e lado 2 e armazena em $t4
	sgt $t4, $t3, $t4 #$t4 recebe 1 se $t3 > $t4, do contrario 0
	beq $t4, 1 net #Se $t4 igual a 1 pula para net
	
	#Verifica se eh equilatero ou isosceles
	li $t5, 0 #Carrega 0 em $t5
	beq $t1, $t2 ver0
ver1:	beq $t1, $t2 ver2

	#Imprime escaleno
	la $4, tr3 #Carrega em $4 a string tr3
	li $2, 4 #Syscall para imprimir string
	syscall
	j end #Pula para o fim do codigo

	#Verifica o resultado
ver3:	beq $t5, 2 equ #Se $t5 for igual a 2 pule para equ
	beq $t5, 1 iso #Se $t5 for igual a 1 pule para iso
	

	#Imprime não eh triangulo
net:	la $4, unk #Carrega em $4 a string unk
	li $2, 4 #Syscall para imprimir string	
	syscall
	
	#Incrementa reg auxiliar
ver0:	add $t5, $t5, 1 #Soma 1 ao reg $t5
	j ver1 #Volta para ver1
	
	#Incrementa reg auxiliar
ver2:	add $t5, $t5, 1 #Soma 1 ao reg $t5
	j ver3 #Volta para ver3
	
	#Equilatero
equ:	la $4, tr1 #Carrega em $4 a string tr1
	li $2, 4 #Syscall para imprimir string
	syscall
	j end #Pula para o fim do codigo
	
	#Isosceles
iso:	la $4, tr2 #Carrega em $4 a string tr2
	li $2, 4 #Syscall para imprimir string
	syscall
	j end #Pula para o fim do codigo
	
	#Finaliza programa
end:	li $2, 10 #Syscall para finalizar execucao
	syscall