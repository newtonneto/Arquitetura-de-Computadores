.data
	.word 1, 5, 10, 15, 20, 3, 6, 9, 11, 12, 4, 5, 7, 10, 14, 18
.text
	lui $25, 0x1001
	li $8, 16
	li $9, 4
for1:	beq $8, $0 end1
	sub $8, $8, 1
		lw $10, 0($25)	
		add $25, $25, 4
		move $4, $10
		li $2, 1
		syscall
		li $4, 32
		li $2, 11
		syscall
		sub $9, $9, 1
		beq $9, $0 con1
	j for1
	
end1:	lui $25, 0x1001
	li $8, 16
for2:	beq $8, $0 end2
	sub $8, $8, 1
		lw $10, 0($25)
		add $25, $25, 4
		bgt $10, 10 con2
	j for2
	
end2:	li $2, 10
	syscall

con1:	li $9, 4
	li $4, 10
	li $2, 11
	syscall
	j for1
	
con2:	move $4, $10
	li $2, 1
	syscall
	li $4, 32
	li $2, 11
	syscall
	j for2