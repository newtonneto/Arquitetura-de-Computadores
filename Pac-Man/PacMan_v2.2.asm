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

saiB13:	lui $8, 0x1001
	addi $8, $8, 65528
	addi $11, $0, 0

b14:	beq $11, 127, saiB14
	sw $9, 0($8)
	addi $8, $8, -4
	addi $11, $11, 1
	j b14

saiB14:	lui $8, 0x1001
	addi $8, $8, 64512
	addi $11, $0, 0

b15:	beq $11, 22, saiB15
	sw $9, 0($8)
	addi $8, $8, -512
	addi $11, $11, 1
	j b15

saiB15: lui $8, 0x1001
	addi $8, $8, 53764
	addi $11, $0, 0

b16:	beq $11, 8, saiB16
	sw $9, 0($8)
	addi $8, $8, 4
	addi $11, $11, 1
	j b16

saiB16: lui $8, 0x1001
	sw $9, 53284($8)
	addi $8, $8, 52768
	addi $11, $0, 0

b17:	beq $11, 9, saiB17
	sw $9, 0($8)
	addi $8, $8, -4
	addi $11, $11, 1
	j b17

saiB17:	lui $8, 0x1001
	addi $8, $8, 52224
	addi $11, $0, 0

b18:	beq $11, 22, saiB18
	sw $9, 0($8)
	addi $8, $8, -512
	addi $11, $11, 1
	j b18
	
saiB18:	lui $8, 0x1001
	addi $8, $8, 41476
	addi $11, $0, 0

b19:	beq $11, 20, saiB19
	sw $9, 0($8)
	addi $8, $8, 4
	addi $11, $11, 1
	j b19
	
saiB19:	lui $8, 0x1001
	addi $8, $8, 41044
	addi $11, $0, 0

b20:	beq $11, 13, saiB20
	sw $9, 0($8)
	addi $8, $8, -512
	addi $11, $11, 1
	j b20
	
saiB20:	lui $8, 0x1001
	addi $8, $8, 34384
	addi $11, $0, 0

b21:	beq $11, 21, saiB21
	sw $9, 0($8)
	addi $8, $8, -4
	addi $11, $11, 1
	j b21
	
saiB21:	lui $8, 0x1001
	addi $8, $8, 29184
	addi $11, $0, 0

b22:	beq $11, 21, saiB22
	sw $9, 0($8)
	addi $8, $8, 4
	addi $11, $11, 1
	j b22
	
saiB22:	lui $8, 0x1001
	addi $8, $8, 28756
	addi $11, $0, 0

b23:	beq $11, 10, saiB23
	sw $9, 0($8)
	addi $8, $8, -512
	addi $11, $11, 1
	j b23
	
saiB23:	lui $8, 0x1001
	addi $8, $8, 23632
	addi $11, $0, 0

b24:	beq $11, 21, saiB24
	sw $9, 0($8)
	addi $8, $8, -4
	addi $11, $11, 1
	j b24
	
saiB24:	lui $8, 0x1001
	addi $8, $8, 23040
	addi $11, $0, 0

b25:	beq $11, 45, saiB25
	sw $9, 0($8)
	addi $8, $8, -512
	addi $11, $11, 1
	j b25
	
saiB25:	lui $8, 0x1001
	addi $8, $8, 744
	addi $11, $0, 0

b26:	beq $11, 17, saiB26
	sw $9, 0($8)
	addi $8, $8, 512
	addi $11, $11, 1
	j b26
	
saiB26:	lui $8, 0x1001
	addi $8, $8, 9452
	addi $11, $0, 0

b27:	beq $11, 10, saiB27
	sw $9, 0($8)
	addi $8, $8, 4
	addi $11, $11, 1
	j b27
	
saiB27:	lui $8, 0x1001
	addi $8, $8, 8980
	addi $11, $0, 0

b28:	beq $11, 17, saiB28
	sw $9, 0($8)
	addi $8, $8, -512
	addi $11, $11, 1
	j b28

#LADO ESQUERDO
saiB28:	lui $8, 0x1001
	addi $8, $8, 5164
	addi $11, $0, 0

b29:	beq $11, 10, saiB29
	sw $9, 0($8)
	addi $8, $8, 4
	addi $11, $11, 1
	j b29
	
saiB29:	lui $8, 0x1001
	addi $8, $8, 5716
	addi $11, $0, 0

b30:	beq $11, 7, saiB30
	sw $9, 0($8)
	addi $8, $8, 512
	addi $11, $11, 1
	j b30
	
saiB30:	lui $8, 0x1001
	addi $8, $8, 9296
	addi $11, $0, 0

b31:	beq $11, 10, saiB31
	sw $9, 0($8)
	addi $8, $8, -4
	addi $11, $11, 1
	j b31
	
saiB31:	lui $8, 0x1001
	addi $8, $8, 8744
	addi $11, $0, 0

b32:	beq $11, 7, saiB32
	sw $9, 0($8)
	addi $8, $8, -512
	addi $11, $11, 1
	j b32

saiB32:	lui $8, 0x1001
	addi $8, $8, 5248
	addi $11, $0, 0

b33:	beq $11, 16, saiB33
	sw $9, 0($8)
	addi $8, $8, 4
	addi $11, $11, 1
	j b33

saiB33:	lui $8, 0x1001
	addi $8, $8, 5824
	addi $11, $0, 0

b34:	beq $11, 7, saiB34
	sw $9, 0($8)
	addi $8, $8, 512
	addi $11, $11, 1
	j b34

saiB34:	lui $8, 0x1001
	addi $8, $8, 9404
	addi $11, $0, 0

b35:	beq $11, 16, saiB35
	sw $9, 0($8)
	addi $8, $8, -4
	addi $11, $11, 1
	j b35

saiB35:	lui $8, 0x1001
	addi $8, $8, 8828
	addi $11, $0, 0

b36:	beq $11, 7, saiB36
	sw $9, 0($8)
	addi $8, $8, -512
	addi $11, $11, 1
	j b36

saiB36:	lui $8, 0x1001
	addi $8, $8, 14380
	addi $11, $0, 0

b37:	beq $11, 10, saiB37
	sw $9, 0($8)
	addi $8, $8, 4
	addi $11, $11, 1
	j b37

saiB37:	lui $8, 0x1001
	addi $8, $8, 14932
	addi $11, $0, 0

b38:	beq $11, 7, saiB38
	sw $9, 0($8)
	addi $8, $8, 512
	addi $11, $11, 1
	j b38

saiB38:	lui $8, 0x1001
	addi $8, $8, 18512
	addi $11, $0, 0

b39:	beq $11, 10, saiB39
	sw $9, 0($8)
	addi $8, $8, -4
	addi $11, $11, 1
	j b39

saiB39:	lui $8, 0x1001
	addi $8, $8, 17960
	addi $11, $0, 0

b40:	beq $11, 7, saiB40
	sw $9, 0($8)
	addi $8, $8, -512
	addi $11, $11, 1
	j b40

saiB40:	