.data
	.word 0, 0, 0, 0, 0, 0, 0, 0
str:	.asciiz "Indice invalido"
.text
	lui $25, 0x1001
	li $8, 8
for1:	beq $8, 0 endfor1
		li $2, 5
		syscall
		move $9, $2
		sw $9, 0($25)
		add $25, $25, 4
	sub $8, $8, 1
	j for1
endfor1:nop

	li $11, 1

if1:	li $2, 5
	syscall
	move $9, $2
	move $10, $9
	mul $9, $9, 4
	bgt $9, 28 msg
	
	lui $25, 0x1001
	
if2:	beq $10, $0 print
	add $25, $25, 4
	#mul $10, $10, 4
	sub $10, $10, 1
	j if2
	
msg:	la $4, str
	li $2, 4
	syscall
	li $4, 10
	li $2, 11
	syscall
	j if1
	
print:	lw $9, 0($25)
	move $4, $9
	li $2, 1
	syscall
	li $4, 10
	li $2, 11
	syscall
	sub $11, $11, 1
	beq $11, 0 if1

fim:	li $2, 10
	syscall