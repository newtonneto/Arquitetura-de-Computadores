.data
	str1: .asciiz "Operação inválida"
.text
	addi $2, $0, 5 #Input int
	syscall
	add $8, $0, $2 #Nota1

	addi $2, $0, 5 #Input int
	syscall
	add $9, $0, $2 #Nota2
	
	addi $2, $0, 5 #Input int
	syscall
	add $10, $0, $2 #Nota3
	
	addi $2, $0, 12 #Input char
	syscall
	add $11, $0, $2 #Operação
	
	beq $11, 0x41, opA #if ($11.equals('A')) than opA
	beq $11, 0x50, opP #if ($11.equals('P')) than opP
	
	addi $4, $0, 0x0a #Quebra de linha
	add $2, $0, 11
	syscall
	la $4, str1 #Imprime "Operação inválida"
	addi $2, $0, 4
	syscall

end:	addi $2, $0, 10
	syscall
	
opA:	add $8, $8, $9 #Soma $8 com $9
	add $8, $8, $10 #Soma $8 com $10
	addi $10, $0, 3 #Usa o $10 para armazenar o divisor
	div $8, $10
	mflo $8 #Armazena a parte inteira em $8
	mfhi $9 #Armazena a parte fracionada em $9
	j imp

opP:	mul $8, $8, 5 #Multiplica $8 por 5
	mul $9, $9, 3 #Multiplica $9 por 3
	mul $10, $10, 2 #Multiplica $10 por 2
	add $8, $8, $9 #Soma $8 com $9
	add $8, $8, $10 #Soma $8 com $10
	addi $10, $0, 10 #Usa o $10 para armazenar o divisor
	div $8, $10
	mflo $8 #Armazena a parte inteira em $8
	mfhi $9 #Armazena a parte fracionada em $9
	j imp
	
imp:	addi $4, $0, 0x0a #Quebra de linha
	addi $2, $0, 11
	syscall
	add $4, $0, $8 #Imprime a parte inteira
	addi $2, $0, 1
	syscall
	addi $4, $0, 0x2c #Imprime virgula
	addi $2, $0, 11
	syscall
	add $4, $0, $9 #Imprime a parte fracionada
	addi $2, $0, 1
	syscall
	j end