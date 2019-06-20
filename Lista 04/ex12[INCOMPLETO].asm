.data
	.word 0, 0, 0, 0, 0
	str1: .asciiz "Menor: "
	str2: .asciiz "Maior: "
	str3: .asciiz "Media: "
.text
	lui $20, 0x1001 #Indice do array
	addi $21, $21, 20
	addi $8, $0, 0 #Indice do for
	addi $9, $0, 0 #Menor
	addi $10, $0, 0 #Maior
	addi $11, $0, 0 #Media
	addi $12, $0, 5 #Divisor
	
for1:	beq $8, 5, quit
	addi $2, $0, 5 #Input
	syscall
	sw $2, 0($20) #Armazena o valor lido na posição atual do array
	addi $20, $20, 4 #Incrementa o indice do array
	addi $8, $8, 1 #Incrementa o indice do for
	j for1
	
quit:	lui $20, 0x1001 #Reseta o indice do array
	addi $8, $0, 0 #Reseta o indice do for
	lw $9, 0($20) #Armazena o primeiro elemento do array na variavel Menor
	lw $10, 0($20) #Armazena o primeiro elemento do array na variavel Maior
	
for2:	beq $8, 5, end
	lw $13, 0($20) #Armazena em $13 o valor da posição atual do array
	add $11, $11, $13 #Soma a variavel de Media com o valor armazenado em $13
	slt $14, $13, $9 #if $13 < $9 than $14 = 1 else $14 = 0
	beq $14, 1, menor
mid1:	slt $14, $10, $13 #if $10 < $13 than $14 = 1 else $14 = 0
	beq $14, 1, maior	
mid2:	addi $20, $20, 4 #Incrementa o indice do array
	addi $8, $8, 1 #Incrementa o indice do for
	j for2

menor:	add $9, $0, $13
	j mid1
	
maior:	add $10, $0, $13
	j mid2
	
end:	la $4, str1
	addi $2, $0, 4 #Syscall para imprimir string
	syscall
	add $4, $0, $9
	addi $2, $0, 1 #Imprime a variavel Menor
	syscall
	
	addi $4, $0, 0x0a #Imprime quebra de linha
	addi $2, $0, 11
	syscall
	
	la $4, str2
	addi $2, $0, 4 #Syscall para imprimir string
	syscall
	add $4, $0, $10
	addi $2, $0, 1 #Imprime a variavel Maior
	syscall
	
	addi $4, $0, 0x0a #Imprime quebra de linha
	addi $2, $0, 11
	syscall
	
	div $11, $12
	mfhi $17 #Armazena a parte inteira da divisão em $11
	mfhi $18 #Armazena a parte fracionada da divisão em $12
	
	la $4, str3
	addi $2, $0, 4 #Syscall para imprimir string
	syscall
	add $4, $0, $17
	addi $2, $0, 1 #Imprime a variavel Media (Inteiro)
	syscall
	addi $4, $0, 0x2c #Imprime virgula
	addi $2, $0, 11
	syscall
	add $4, $0, $18
	addi $2, $0, 1 #Imprime a variavel Media (Fração)
	syscall