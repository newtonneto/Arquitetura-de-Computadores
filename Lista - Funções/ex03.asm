.text
	addi $2, $0, 5 #Input
	syscall
	add $8, $0, $2 #Armazena o valor lido em $8
	jal ver

	addi $2, $0, 10
	syscall

ver:	beq $8, $0, imp0
	slt $9, $8, $0 #if ($8 < 0) than $9 = 1, else $9 = 0
	beq $9, 1, impm1 #Pula pra imp-1 se a condi��o acima for verdadeira

imp1:	addi $4, $0, 1 #Imprime 1, n�mero positivo
	addi $2, $0, 1
	syscall
	jr $31

imp0:	add $4, $0, $0 #Imprime 0, n�mero igual a 0
	addi $2, $0, 1
	syscall
	jr $31

impm1:	addi $4, $0, -1 #Imprime -1, n�mero negativo
	addi $2, $0, 1
	syscall
	jr $31