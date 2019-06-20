.data
	.word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	str1: .asciiz "Quantidade de negativos: "
	str2: .asciiz "Soma dos pares: "
.text
	lui $20, 0x1001 #Indice do array
	addi $8, $0, 0 #Indice do for
	addi $9, $0, 0 #Quantidade de negativos
	addi $10, $0, 0 #Soma dos pares
	
for1:	beq $8, 10, for2
	addi $2, $0, 5 #Input
	syscall
	sw $2, 0($20) #Armazena o valor lido na posição atual do array
	addi $20, $20, 4 #Incrementa o indice do array
	addi $8, $8, 1 #Incrementa o indice do for
	j for1
	
for2:	beq $8, 0, end
	addi $20, $20, -4 #Decrementa o indice do array
	lw $11, 0($20) #Armazena em $11 o valor da posição atual do array
	bgtz $11, soma #Se o valor de $11 for maior ou igual a 0, pule para soma
	bltz $11, qntneg #Se o valor de $11 for menor que 0, pule para qntneg
mid:	addi $8, $8, -1 #Decrementa o indice do for
	j for2

soma:	add $10, $10, $11 #Soma o valor de $10 com o valor da posição atual do array
	j mid
	
qntneg:	addi $9, $9, 1 #Incrementa a quantidade de negativos
	j mid
	
end:	la $4, str1
	addi $2, $0, 4
	syscall
	add $4, $0, $9 #Output da quantidade de negativos
	addi $2, $0, 1
	syscall
	
	addi $4, $0, 0xA
	addi $2, $0, 11 #Quebra de linha
	syscall
	
	la $4, str2
	addi $2, $0, 4
	syscall
	add $4, $0, $10
	addi $2, $0, 1 #Output para soma dos positivos
	syscall
	
	addi $2, $0, 10 #Encerra execução
	syscall