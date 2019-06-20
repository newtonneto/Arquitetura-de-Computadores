.text
main:	addi $2, $0, 5
	syscall
	add $8, $0, $2
	
	addi $2, $0, 5
	syscall
	add $9, $0, $2
	addi $9, $9, 1
	
	add $10, $0, $0
	addi $11, $0, 2
	
laco:	beq $8, $9, fim
	div $8, $11
	mfhi $12
	beq $12, $0, inc
	addi $8, $8, 1
	j laco
	
inc:	add $10, $10, $8
	addi $8, $8, 1
	j laco

fim:	add $4, $0, $10
	addi $2, $0, 1
	syscall
	addi $2, $0, 10
	syscall
