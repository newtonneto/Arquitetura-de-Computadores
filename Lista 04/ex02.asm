.data
	.space 24
.text
	lui $25, 0x1001
	
	li $8, 6
for1:	beq $8, 0 saifor1
		li $2, 5
		syscall
		move $9, $2
		sw $9, 0($25)
		add $25, $25, 4
	sub $8, $8, 1
	j for1
	
saifor1:li $8, 6
	sub $25, $25, 24
	
for2:	beq $8, 0 fim
		lw $9, 0($25)
		add $25, $25, 4
		move $4, $9
		li $2, 1
		syscall
		li $4, 32
		li $2, 11
		syscall
	sub $8, $8, 1
	j for2
	
fim:	li $2, 10
	syscall