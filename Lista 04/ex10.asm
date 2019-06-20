.data
	.word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	str1: .asciiz "Media: "
.text
	lui $20, 0x1001 #Indice do array
	addi $8, $0, 0 #Indice do for
	addi $9, $0, 0 #Media
	addi $11, $0, 15 #Divisor
	
for1:	beq $8, 15, for2
	addi $2, $0, 5 #Input
	syscall
	sw $2, 0($20) #Armazena o valor lido na posição atual do array
	addi $20, $20, 4 #Incrementa o indice do array
	addi $8, $8, 1 #Incrementa o indice do for
	j for1
	
for2:	beq $8, 0, end
	addi $20, $20, -4 #Decrementa o indice do array
	lw $10, 0($20) #Armazena o valor do indice atual do array em $10
	add $9, $9, $10 #Soma a media com o valor recebido do array
	addi $8, $8, -1 #Decrementa o indice do for
	j for2
	
end:	div $9, $11
	mflo $12 #Armazena a parte inteira da divisão em $12
	mfhi $13 #Armazena a parte fracionada da divisão em $13
	
	la $4, str1
	addi $2, $0, 4 #Syscall para imprimir string
	syscall
	
	add $4, $0, $12
	addi $2, $0, 1 #Output da parte inteira
	syscall
	addi $4, $0, 0x2c
	addi $2, $0, 11
	syscall
	add $4, $0, $13
	addi $2, $0, 1 #Output da parte fracionada
	syscall
	
	addi $2, $0, 10 #Encerra execução
	syscall