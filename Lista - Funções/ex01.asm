.text
	addi $2, $0, 5 #Input
	syscall
	add $8, $0, $2
	jal dobra #Pula pra função dobra

	add $4, $0, $8 #Imprime o valor dobrado
	add $2, $0, 1
	syscall
	addi $2, $0, 10 #Encerra
	syscall

dobra:	mul $8, $8, 2 #Multiplica o valor de $8 por 2
	jr $31 #Volta para a linha seguinte após o ultimo jal