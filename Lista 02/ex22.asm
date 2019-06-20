#Ex22
.data
	str1: .asciiz "Pode se aposentar"
	str2: .asciiz "Nao pode se aposentar"
.text
	#Recebe idade
	li $2, 5 #Syscall para ler inteiro
	syscall
	move $t1, $2 #Carrega o valor lido em $t1
	
	#Recebe tempo de servico
	li $2, 5 #Syscall para ler inteiro
	syscall
	move $t2, $2 #Carrega o valor lido em $t2
	
	#Verifica se tem pelo menos 65 anos
	sgt $t3, $t1, 64 #Se $t1 for maior que 64 $t3 recebe 1, do contrario 0
	beq $t3, 1 L1 #Se $t3 for 1 pule para L1
	
	#Verifica se trabalhou pelo menos 30 anos
	sgt $t3, $t2, 29 #Se $t1 for maior que 29 $t3 recebe 1, do contrario 0
	beq $t3, 1 L1 #Se $t3 for 1 pule para L1
	
	#Verifica se tem pelo menos 60 anos
	li $t4, 0 #Carrega o reg $4 com 0
	sgt $t3, $t1, 59 #Se $t1 for maior que 59 $t3 recebe 1, do contrario 0
	beq $t3, 1 L2 #Se $t3 for 1 pule para L2

	#Verifica se trabalhou pelo menos 25 anos	
L0:	sgt $t3, $t2, 24 #Se $t1 for maior que 24 $t3 recebe 1, do contrario 0
	beq $t3, 1 L3 #Se $t3 for 1 pule para L3
	
	#Nao pode se aposentar
L4:	la $4, str2 #Carrega em $4 a string str2
	li $2, 4 #Syscall para imprimir strings
	syscall
	j end #Pula para o final do codigo
	
	#Pode se aposentar
L1:	la $4, str1 #Carrega em $4 a string str1
	li $2, 4 #Syscall para imprimir strings
	syscall
	j end #Pula para o final do codigo

	#Entra aqui caso tenha mais de 59 e menos de 65	
L2:	add $t4, $t4, 1 #Adiciona 1 ao valor de $t4
	j L0 #Volta para L0
	
	#Entra aqui caso tenho mais de 24 de trabalho e menos que 30
L3:	add $t4, $t4, 1	#Adiciona 1 ao valor de $t4
	li $t5, 2 #Carrega 2 em $t5 para auxiliar na operacao abaixo
	slt $t4, $t4, $t5 #Verifica se $t4 eh menor que 2, se sim $t4 = 1, do contrario $t4 = 0
	beq $t4, 1 L4 #Se $t4 for 1 volte para L4
	la $4, str1 #Carrega em $4 a string str1
	li $2, 4 #Syscall para imprimir strings
	syscall
	
	#Finaliza programa
end:	li $2, 10 #Syscall para encerrar execucao
	syscall