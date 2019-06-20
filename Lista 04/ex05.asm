.data
	.word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
srt:	.asciiz "Quantidade de pares: "
.text
	li $11, 0
	li $12, 0
	lui $24, 0x1001
	lui $25, 0x1001
	add $24, $24, 40
	li $8, 10
for1:	beq $8, 0 endfor1
		li $2, 5
		syscall
		move $9, $2
		sw $9, 0($25)
		add $25, $25, 4
	sub $8, $8, 1
	j for1
	
endfor1:lui $25, 0x1001
	li $8, 10
for2:	li $10, 2
	beq $8, 0 endfor2
	sub $8, $8, 1
		lw $9, 0($25)
		add $25, $25, 4
		beq $9, 0 for2
		div $9, $10
		mfhi $10
		beq $10, 0 if1
	j for2
	
endfor2:la $4, srt
	li $2, 4
	syscall
	move $4, $11
	li $2, 1
	syscall
	li $4, 10
	li $2, 11
	syscall
	
	lui $24, 0x1001
	add $24, $24, 40
	li $8, 0
for3:	beq $8, $12 fim
		lw $9, 0($24)
		move $4, $9
		li $2, 1
		syscall
		li $4, 32
		li $2, 11
		syscall
		add $24, $24, 4
	add $8, $8, 4
	j for3

if1:	sw $9, 0($24)
	add $11, $11, 1
	add $12, $12, 4
	add $24, $24, 4
	j for2
	
fim:	li $2, 10
	syscall