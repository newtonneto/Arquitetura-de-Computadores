.data
	.word 0, 0, 0, 0, 0, 0
.text
	lui $20, 0x1001 #Indice do array
	addi $8, $0, 0 #Indice do for
	addi $10, $0, 2 #Divisor
	
for1:	beq $8, 6, for2
	addi $2, $0, 5 #Input
	syscall
	
	div $2, $10 #Divide o valor lido
	mflo $9 #$9 recebe o resto da divisão
	beqz $9, for1 #Verifica se o resto da divisão é 0
	sw $2, 0($20) #Armazena o valor lido no indice atual do array
	addi $8, $8, 1 #Incrementa o indice do for
	addi $20, $20, 4 #Incrementa o indice do array
	j for1
	
for2:	beq $8, 0, end
	addi $20, $20, -4 #Decrementa o indice do array
	lw $9, 0($20) #Armazena em $9 o valor do indice atual do array
	add $4, $0, $9
	addi $2, $0, 1 #Output
	syscall
	addi $4, $0, 0x20
	addi $2, $0, 11 #Imprime um espaço
	addi $8, $8, -1 #Decremeta o indice do for
	syscall
	j for2
	
end:	addi $2, $0, 10 #Encerra execução
	syscall