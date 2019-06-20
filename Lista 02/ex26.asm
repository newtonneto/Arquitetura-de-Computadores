#Ex26
.data
	str1: .asciiz "Venda o carro!"
	str2: .asciiz "Economico!"
	str3: .asciiz "Super economico!"
.text
	#Distancia em Km
	li $2, 5 #Syscall para ler um inteiro
	syscall
	move $8, $2 #Armazena em $8 o valor lido
	
	#Quantidade litros de gasolina
	li $2, 5 #Syscall para ler um inteiro
	syscall
	move $9, $2 #Armazena em $8 o valor lido
	
	#Divide distancia por gasolina
	div $8, $9 #Divide o valor de $8 por $9
	mflo $8 #Salva em $8 o valor inteiro
	
	#Verifica venda o carro
	li $9, 8 #Carrega 8 em $9 para auxiliar na operacao abaixo
	slt $9, $8, $9 #Se o valor de $8 for menor que 8 $9 = 1, do contrario $9 = 0
	beq $9, 1 L1 #Se $9 = 1 então pule para L1

	#Verifica economico pt1
	li $9, 7 #Carrega 7 em $9 para auxiliar na operacao abaixo
	sgt $9, $8, $9 #Se o valor de $8 for maior que 7 $9 = 1, do contrario $9 = 0
	beq $9, 1 L2 #Se $9 = 1 então pule para L2
	
	#Verifica economico p2
L0:	li $9, 15 #Carrega 15 em $9 para auxiliar na operacao abaixo
	slt $9, $8, $9 #Se o valor de $8 for menor que 15 $9 = 1, do contrario $9 = 0
	beq $9, 1 L3 #Se $9 = 1 então pule para L3
	
	#Verifica super economico
L4:	li $9, 12 #Carrega 12 em $9 para auxiliar na operacao abaixo
	sgt $9, $8, $9 #Se o valor de $8 for maior que 12 $9 = 1, do contrario $9 = 0
	beq $9, 1 L5 #Se $9 = 1 então pule para L5
	j end #Pula para o final do codigo casso não passe pelas condicoes acima

	#Venda o carro	
L1:	la $4, str1 #Carrega em $4 a string str1
	li $2, 4 #Syscall para imprimir string
	syscall
	j end #Pula para o fim do programa
	
	#Economico pt1
L2:	li $10, 1 #Incrementa reg $10 em +1
	j L0 #Volte para L0
	
	#Economico pt2
L3:	add $10, $10, 1 #Soma +1 ao valor de $10 e salva o resultado em $10
	beq $10, 1 L4 #Se $10 = 1 volte para L4
	la $4, str2 #Carrega em $4 a string str2
	li $2, 4 #Syscall para imprimir string
	syscall
	li $4, 0xA #Codigo para quebra de linha
	li $2, 11 #Syscall para imprimir caractere
	syscall
	j L4 #Volte para L4
	
	#Super economico	
L5:	la $4, str3 #Carrega em $4 a string str1
	li $2, 4 #Syscall para imprimir string
	syscall
	
	#Finaliza programa
end:	li $2, 10 #Encerra execucao
	syscall