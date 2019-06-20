#Ex08
.data
	.word 0, 0, 0, 0, 0, 0
.text
	lui $20, 0x1001
	addi $8, $0, 0 #Indice do for
	
for1:	beq $8, 6 for2 #Pula para for2 quando o valor de $8 for 6
	addi $2, $0, 5 #Syscall para ler um inteiro
	syscall
	
	sw $2, 0($20) #Armazena o valor lido no vetor
	addi $20, $20, 4 #Incrementa em 4 o valor do indice do vetor
	addi $8, $8, 1 #Incrementa o indice do for
	j for1 #Volta para o inicio do for
	
for2:	beq $8, 0 end #Pula para end quando o valor de $8 for 0
	addi $20, $20, -4 #Decrementa em -4 o valor do indice do vetor
	lw $9, 0($20) #Armazena em $9 o valor atual do vetor
	
	add $4, $0, $9
	addi $2, $0, 1 #Imprime o elemento atual do vetor
	syscall
	
	addi $4, $0, 0x20
	addi $2, $0, 11 #Imprime um espaço
	syscall
	add $8, $8, -1 #Decrementa o indice do for
	j for2 #Volta para o inicio do for

end:	addi $2, $0, 10
	syscall
