#Ex27
.data
	str1: .asciiz "Infantil A"
	str2: .asciiz "Infantil B"
	str3: .asciiz "Juvenil A"
	str4: .asciiz "Juvenil B"
	str5: .asciiz "Senior"
.text
	#Recebe idade
	li $2, 5 #Syscall para ler inteiro
	syscall
	move $8, $2 #Carrega em $8 o valor lido
	
	#Verifica se idade menor que 5
	li $9, 5 #Carrega em $4 o valor 5
	slt $9, $8, $9 #Se $8 < 5 entao $9 = 1, do contrario 0
	beq $9, 1 end #Verifica se $9 = 1, se sim pule para end
	
	#Vefirica se idade menor que 8
	li $9, 8 #Carrega em $4 o valor 8
	slt $9, $8, $9 #Se $8 < 8 entao $9 = 1, do contrario 0
	beq $9, 1 L1 #Verifica se $9 = 1, se sim pule para L1

	#Vefirica se idade menor que 11
	li $9, 11 #Carrega em $4 o valor 11
	slt $9, $8, $9 #Se $8 < 11 entao $9 = 1, do contrario 0
	beq $9, 1 L2 #Verifica se $9 = 1, se sim pule para L2
	
	#Vefirica se idade menor que 14
	li $9, 14 #Carrega em $4 o valor 14
	slt $9, $8, $9 #Se $8 < 14 entao $9 = 1, do contrario 0
	beq $9, 1 L3 #Verifica se $9 = 1, se sim pule para L3
	
	#Vefirica se idade menor que 18
	li $9, 18 #Carrega em $4 o valor 18
	slt $9, $8, $9 #Se $8 < 18 entao $9 = 1, do contrario 0
	beq $9, 1 L4 #Verifica se $9 = 1, se sim pule para L4
	
	#Senior
	la $4, str5 #Carrega em $4 a stirng str5
	li $2, 4 #Syscall para imprimir string
	syscall
	j end #Pula para fim do programa
		
	#Infantil A
L1:	la $4, str1 #Carrega em $4 a stirng str1
	li $2, 4 #Syscall para imprimir string
	syscall
	j end #Pula para fim do programa

	#Infantil B
L2:	la $4, str2 #Carrega em $4 a stirng str2
	li $2, 4 #Syscall para imprimir string
	syscall
	j end #Pula para fim do programa
	
	#Juvenil A
L3:	la $4, str3 #Carrega em $4 a stirng str3
	li $2, 4 #Syscall para imprimir string
	syscall
	j end #Pula para fim do programa
	
	#Juvenil B
L4:	la $4, str4 #Carrega em $4 a stirng str4
	li $2, 4 #Syscall para imprimir string
	syscall
		
	#Finaliza programa
end:	li $2, 10 #Syscall para encerrar execucao
	syscall