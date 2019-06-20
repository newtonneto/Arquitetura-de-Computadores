.data
	.word 1, 0, 5, -2, -5, 7
.text
	lui $25, 0x1001
	lw $8, 0($25)
	addi $25, $25, 4
	lw $9, 0($25)
	addi $25, $25, 4
	add $8, $8, $9
	addi $25, $25, 12
	lw $9, 0($25)
	add $8, $8, $9
	
	move $4, $8
	li $2, 1
	syscall
	
	li $4, 10
	li $2, 11
	syscall
	
	li $9, 100
	add $25, $25, -4
	sw $9, 0($25)
	
	li $9, 6
	sub $25, $25, 16
for:	beq $9, 0 fim
	lw $10, 0($25)
	addi $25, $25, 4
	move $4, $10
	li $2, 1
	syscall
	li $4, 10
	li $2, 11
	syscall
	sub $9, $9, 1
	j for
	
fim:	li $2, 10
	syscall