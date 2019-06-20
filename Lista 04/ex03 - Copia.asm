.data
	.word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
.text
	lui $24, 0x1001
	lui $25, 0x1001
	add $25, $25, 40
	
	li $8, 10
for1:	beq $8, 0 endfor1
		li $2, 5
		syscall
		move $9, $2
		sw $9, 0($24)
		add $24, $24, 4
		
		mul $9, $9, $9
		sw $9, 0($25)
		add $25, $25, 4
	sub $8, $8, 1
	j for1

endfor1:li $8, 10
	sub $25, $25, 40

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