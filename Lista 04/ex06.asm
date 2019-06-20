.data
	.word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
srt1:	.asciiz "Maior: "
srt2:	.asciiz "Menor: "
.text
	lui $25, 0x1001
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
	lw $10, 0($25)
	lw $11, 0($25)
	add $25, $25, 4
	
	li $8, 9
for2:	beq $8, 0 endfor2
		lw $9, 0($25)
		bgt $9, $10 if1
		blt $9, $11 if2
midfor2:	sub $8, $8, 1
	add $25, $25, 4
	j for2
	
endfor2:la $4, srt1
	li $2, 4
	syscall
	move $4, $10
	li $2, 1
	syscall
	li $4, 10
	li $2, 11
	syscall
	la $4, srt2
	li $2, 4
	syscall
	move $4, $11
	li $2, 1
	syscall
	li $4, 10
	li $2, 11
	syscall
	li $2, 10
	syscall
		
if1:	move $10, $9
	j midfor2
	
if2:	move $11, $9
	j midfor2