.data
	str1: .asciiz "Números iguais"
.text
	addi $2, $0, 5 #Input
	syscall
	add $8, $0, $2 #Armazena o valor lido em $8
	
	addi $2, $0, 5 #Input
	syscall
	add $9, $0, $2 #Armazena o valor lido em $9
	jal igual
	
	addi $2, $0, 10 #Encerra execução
	syscall
	
igual:	bne $8, $9 nequal
	la $4, str1
	addi $2, $0, 4 #Imprime "Números Iguais"
	syscall
	jr $31
	
nequal:	slt $10, $8, $9 #if ($8 < $9) than $10 = 1, else $10 = 0
	beq $10, 1, maior #Se $8 for menor que $9 pule para função que imprime $9
	add $4, $0, $8
	addi $2, $0, 1 #Imprime $8
	syscall
	jr $31

maior:	add $4, $0, $9
	addi $2, $0, 1 #Imprime $9
	syscall
	jr $31 