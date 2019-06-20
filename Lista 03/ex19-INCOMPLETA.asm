.text
	addi $2, $0, 5
	syscall
	add $8, $0, $2
	
	addi $9, $0, 10
	
loop:	beq $8, $0 fim
	div $8, $9
	mfhi $10
	mflo $8
	
	add