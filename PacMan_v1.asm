.text
main:
	lui $8, 0x1001
	addi $9, $0, 0x323030 #Cor de fundo
	addi $10, $0, 4096 #Quantidade de pixels
	addi $11, $0, 0 #indice

#Inicializa a cor de fundo do jogo
fundo:
	beq $11, $10, saiFundo
	sw $9, 0($8)
	addi $11, $11, 1
	addi $8, $8, 4
	j fundo

saiFundo:
	addi $11, $0, 0 #Reseta o indice
	lui $8, 0x1001 #Reseta o indice do array

pacMan:
	addi $9, $0, 0xFBFF00 #Amarelo
	sw $9, 4($8)
	sw $9, 8($8)
	sw $9, 12($8)
	sw $9, 256($8)
	sw $9, 260($8)
	sw $9, 264($8)
	addi $9, $0, 0x000000 #Preto
	sw $9, 268($8)
	addi $9, $0, 0xFBFF00 #Amarelo
	sw $9, 272($8)
	sw $9, 512($8)
	sw $9, 516($8)
	sw $9, 520($8)
	sw $9, 524($8)
	sw $9, 528($8)
	sw $9, 768($8)
	sw $9, 772($8)
	addi $9, $0, 0x000000 #Preto
	sw $9, 776($8)
	sw $9, 780($8)
	addi $9, $0, 0xFBFF00 #Amarelo
	sw $9, 784($8)
	sw $9, 1028($8)
	sw $9, 1032($8)
	sw $9, 1036($8)

barreiras:
	