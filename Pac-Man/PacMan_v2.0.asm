.text
main:
	#Legenda de registradores importantes
	#$8 Array de pixels
	#$9 Armazena uma determinada cor necessaria para determinados momentos
	#$10 Array de posicoes iniciais dos personagens
	#$11 Indice utilizado pelos diversos fors

	lui $8, 0x1001
	jal barreiras #inicializa as barreiras

#--------------------------------------------------------------------------
#	INICIALIZAÇÃO DAS BARREIRAS DO CENARIO
#--------------------------------------------------------------------------
barreiras:
	addi $9, $0, 0x0000FF #Azul
	addi $11, $0, 0

b1:	beq $11, 59, saiB1
	sw $9, 0($8)
	addi $8, $8, 4
	addi $11, $11, 1
	j b1

saiB1:	lui $8, 0x1001
	addi $8, $8, 276
	addi $11, $0, 0

b2:	beq $11, 59, saiB2
	sw $9, 0($8)
	addi $8, $8, 4
	addi $11, $11, 1
	j b2

saiB2:	lui $8, 0x1001
	addi $8, $8, 1020
	addi $11, $0, 0

b3:	beq $11, 46, saiB3
	sw $9, 0($8)
	addi $8, $8, 512
	addi $11, $11, 1
	j b3

saiB3:	lui $8, 0x1001
	addi $8, $8, 24056
	addi $11, $0, 0

b4:	beq $11, 20, saiB4
	sw $9, 0($8)
	addi $8, $8, -4
	addi $11, $11, 1
	j b4

saiB4:	lui $8, 0x1001
	addi $8, $8, 24488
	addi $11, $0, 0

b5:	beq $11, 10, saiB5
	sw $9, 0($8)
	addi $8, $8, 512
	addi $11, $11, 1
	j b5

saiB5:	lui $8, 0x1001
	addi $8, $8, 29612
	addi $11, $0, 0

b6:	beq $11, 21, saiB6
	sw $9, 0($8)
	addi $8, $8, 4
	addi $11, $11, 1
	j b6

saiB6:	lui $8, 0x1001
	addi $8, $8, 34812
	addi $11, $0, 0

b7:	beq $11, 21, saiB7
	sw $9, 0($8)
	addi $8, $8, -4
	addi $11, $11, 1
	j b7

saiB7:	lui $8, 0x1001
	addi $8, $8, 35240
	addi $11, $0, 0

b8:	beq $11, 13, saiB8
	sw $9, 0($8)
	addi $8, $8, 512
	addi $11, $11, 1
	j b8

saiB8:	lui $8, 0x1001
	addi $8, $8, 41900
	addi $11, $0, 0

b9:	beq $11, 21, saiB9
	sw $9, 0($8)
	addi $8, $8, 4
	addi $11, $11, 1
	j b9

saiB9:	lui $8, 0x1001
	addi $8, $8, 42492
	addi $11, $0, 0

b10:	beq $11, 22, saiB10
	sw $9, 0($8)
	addi $8, $8, 512
	addi $11, $11, 1
	j b10

saiB10:	lui $8, 0x1001
	addi $8, $8, 53240
	addi $11, $0, 0

b11:	beq $11, 8, saiB11
	sw $9, 0($8)
	addi $8, $8, -4
	addi $11, $11, 1
	j b11

saiB11:	lui $8, 0x1001
	sw $9, 53720($8)
	addi $8, $8, 54236
	addi $11, $0, 0

b12:	beq $11, 9, saiB12
	sw $9, 0($8)
	addi $8, $8, 4
	addi $11, $11, 1
	j b12

saiB12:	lui $8, 0x1001
	addi $8, $8, 54780
	addi $11, $0, 0

b13:	beq $11, 22, saiB13
	sw $9, 0($8)
	addi $8, $8, 512
	addi $11, $11, 1
	j b13

saiB13:	
	