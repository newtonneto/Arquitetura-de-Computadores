.text
main:	addi $2, $0, 5
	syscall
	add $8, $0, $2
	addi $9, $0, 0
	addi $10, $0, 10
laco:	beq $8, $0, sai
	div $8, $10
	mfhi $11
	add $9, $9, $11
	mflo $8
	j laco
sai:	add $4, $0, $9
	addi $2, $0, 1
	syscall
	addi $2, $0, 10
	syscall