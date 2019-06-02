.text
	#Legenda de registradores importantes
	#$8 Array de pixels
	#$9 Armazena uma determinada cor necessaria para determinados momentos
	#$10 Array de posicoes iniciais dos personagens
	#$11 Indice utilizado pelos diversos fors
	#$12 Recebe endereço para comparar com cor das barreiras
	#$13 Recebe direção ghost1: 0 - direita 1 - esquerda 2 - cima 3 - baixo
	#$14 Recebe direção ghost2: 0 - direita 1 - esquerda 2 - cima 3 - baixo
	#$15 Recebe direção ghost3: 0 - direita 1 - esquerda 2 - cima 3 - baixo
	#$16 Recebe direção ghost4: 0 - direita 1 - esquerda 2 - cima 3 - baixo
	#$20 Fantasma 1 - Rosa
	#$21 Fantasma 2 - Amarelo
	#$22 Fantasma 3 - Verde
	#$23 Fantasma 4 - Vermelho
	#$26 Cor de teste

inicializacao:
	addi $26, $0, 0xFF0011 #Temporario, apenas para verificar a construção das barreiras
	addi $20, $0, 0 #Posição inicial do ghost1
	addi $21, $0, 31980 #Posição inicial do ghost2
	addi $22, $0, 0 #Posição inicial do ghost3
	addi $23, $0, 0 #Posição inicial do ghost4
	lui $8, 0x1001
	jal barreiras #inicializa as barreiras
	jal coins #inicializa as "moedas" do jogo //NÃO IMPLEMENTADO AINDA
	lui $8, 0x1001 #Reseta o indice do array pra inicializar o ghost1
	jal ghost1
	lui $8, 0x1001 #Reseta o indice do array pra inicializar o ghost1
	jal ghost2
	lui $8, 0x1001 #Reseta o indice do array pra inicializar o ghost1
	jal ghost3
	lui $8, 0x1001 #Reseta o indice do array pra inicializar o ghost1
	jal ghost4
	#inicializa direção dos fantasmas
	addi $14, $0, 2 #Define o movimento inicial do ghost2 como cima

main:	

moveGhost2:
	#O numero aleatorio gerado vai vai o programa pular pra direção correspondente
	beq $14, 0, direita
	beq $14, 1, esquerda
	beq $14, 2, cima
	beq $14, 3, baixo

direita:
	#Reseta o array pra verificar o que há armazenado 4 pixels a direita do fantasma
	lui $8, 0x1001
	add $8, $8, $21
	lw $12, 16($8)
	beq $12, 0x0000FF, mudaDirecao #Se encontrar a cor azul pula para a "função" que define uma nova direção
	lui $8, 0x1001
	jal apagaGhost2
	addi $21, $21, 4 #direita
	jal ghost2
	addi $4, $0, 50
	addi $2, $0, 32
	syscall
	j main
esquerda:
	#Reseta o array pra verificar o que há armazenado 4 pixels a esquerda do fantasma
	lui $8, 0x1001
	add $8, $8, $21
	lw $12, -16($8)
	beq $12, 0x0000FF, mudaDirecao #Se encontrar a cor azul pula para a "função" que define uma nova direção
	lui $8, 0x1001
	jal apagaGhost2
	addi $21, $21, -4 #esquerda
	jal ghost2
	addi $4, $0, 50
	addi $2, $0, 32
	syscall
	j main
cima:	
	#Reseta o array pra verificar o que há armazenado 5 pixels acima do fantasma
	lui $8, 0x1001
	add $8, $8, $21
	lw $12, -2560($8)
	beq $12, 0x0000FF, mudaDirecao #Se encontrar a cor azul pula para a "função" que define uma nova direção
	lui $8, 0x1001
	jal apagaGhost2
	addi $21, $21, -512 #cima
	jal ghost2
	addi $4, $0, 50
	addi $2, $0, 32
	syscall
	j main
baixo:
	#Reseta o array pra verificar o que há armazenado 5 pixels abaixo do fantasma
	lui $8, 0x1001
	add $8, $8, $21
	lw $12, 2560($8)
	beq $12, 0x0000FF, mudaDirecao #Se encontrar a cor azul pula para a "função" que define uma nova direção
	lui $8, 0x1001
	jal apagaGhost2
	addi $21, $21, 512 #baixo
	jal ghost2
	addi $4, $0, 50
	addi $2, $0, 32
	syscall
	j main

mudaDirecao:
	addi $5, $0, 4  #Define a quantidade de número possíveis, 0..3 = 4 possibilidades.
    	addi $2, $0, 42  #Syscall para gerar um numero aleatorio, o mesmo vai ser armazenado em $4.
    	syscall
	add $14, $0, $4 #O numero aleatorio vai ser carregado em $14, reg responsavel por armazenar a direção do fantasma
	j moveGhost2 

#Apenas para fim de testes
sai:	
	addi $2, $0, 10
	syscall

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
	
saiB29:	addi $8, $8, 512
	addi $11, $0, 0

b30:	beq $11, 7, saiB30
	sw $9, 0($8)
	addi $8, $8, 512
	addi $11, $11, 1
	j b30
	
saiB30:	addi $8, $8, -4
	addi $11, $0, 0

b31:	beq $11, 10, saiB31
	sw $9, 0($8)
	addi $8, $8, -4
	addi $11, $11, 1
	j b31
	
saiB31:	addi $8, $8, -512
	addi $11, $0, 0

b32:	beq $11, 7, saiB32
	sw $9, 0($8)
	addi $8, $8, -512
	addi $11, $11, 1
	j b32

saiB32:	addi $8, $8, 88
	addi $11, $0, 0

b33:	beq $11, 16, saiB33
	sw $9, 0($8)
	addi $8, $8, 4
	addi $11, $11, 1
	j b33

saiB33:	addi $8, $8, 512
	addi $11, $0, 0

b34:	beq $11, 7, saiB34
	sw $9, 0($8)
	addi $8, $8, 512
	addi $11, $11, 1
	j b34

saiB34:	addi $8, $8, -4
	addi $11, $0, 0

b35:	beq $11, 16, saiB35
	sw $9, 0($8)
	addi $8, $8, -4
	addi $11, $11, 1
	j b35

saiB35:	addi $8, $8, -512
	addi $11, $0, 0

b36:	beq $11, 7, saiB36
	sw $9, 0($8)
	addi $8, $8, -512
	addi $11, $11, 1
	j b36

saiB36:	addi $8, $8, 9136
	addi $11, $0, 0

b37:	beq $11, 10, saiB37
	sw $9, 0($8)
	addi $8, $8, 4
	addi $11, $11, 1
	j b37

saiB37:	addi $8, $8, 512
	addi $11, $0, 0

b38:	beq $11, 7, saiB38
	sw $9, 0($8)
	addi $8, $8, 512
	addi $11, $11, 1
	j b38

saiB38:	addi $8, $8, -4
	addi $11, $0, 0

b39:	beq $11, 10, saiB39
	sw $9, 0($8)
	addi $8, $8, -4
	addi $11, $11, 1
	j b39

saiB39:	addi $8, $8, -512
	addi $11, $0, 0

b40:	beq $11, 7, saiB40
	sw $9, 0($8)
	addi $8, $8, -512
	addi $11, $11, 1
	j b40

saiB40:	addi $8, $8, 88
	addi $11, $0, 0

b41:	beq $11, 4, saiB41
	sw $9, 0($8)
	addi $8, $8, 4
	addi $11, $11, 1
	j b41

saiB41:	addi $8, $8, 512
	addi $11, $0, 0

b42:	beq $11, 15, saiB42
	sw $9, 0($8)
	addi $8, $8, 512
	addi $11, $11, 1
	j b42

saiB42:	addi $11, $0, 0

b43:	beq $11, 11, saiB43
	sw $9, 0($8)
	addi $8, $8, 4
	addi $11, $11, 1
	j b43

saiB43:	sw $9, 512($8)
	addi $8, $8, 1020
	addi $11, $0, 0

b44:	beq $11, 11, saiB44
	sw $9, 0($8)
	addi $8, $8, -4
	addi $11, $11, 1
	j b44

saiB44:	addi $8, $8, 4
	addi $11, $0, 0

b45:	beq $11, 11, saiB45
	sw $9, 0($8)
	addi $8, $8, 512
	addi $11, $11, 1
	j b45

saiB45:	addi $8, $8, -4
	addi $11, $0, 0

b46:	beq $11, 4, saiB46
	sw $9, 0($8)
	addi $8, $8, -4
	addi $11, $11, 1
	j b46

saiB46:	addi $8, $8, -512
	addi $11, $0, 0

b47:	beq $11, 28, saiB47
	sw $9, 0($8)
	addi $8, $8, -512
	addi $11, $11, 1
	j b47

saiB47:	addi $8, $8, 19972
	addi $11, $0, 0

b48:	beq $11, 4, saiB48
	sw $9, 0($8)
	addi $8, $8, 4
	addi $11, $11, 1
	j b48

saiB48:	addi $8, $8, 512
	addi $11, $0, 0

b49:	beq $11, 13, saiB49
	sw $9, 0($8)
	addi $8, $8, 512
	addi $11, $11, 1
	j b49

saiB49:	addi $8, $8, -4
	addi $11, $0, 0

b50:	beq $11, 4, saiB50
	sw $9, 0($8)
	addi $8, $8, -4
	addi $11, $11, 1
	j b50

saiB50:	addi $8, $8, -512
	addi $11, $0, 0

b51:	beq $11, 13, saiB51
	sw $9, 0($8)
	addi $8, $8, -512
	addi $11, $11, 1
	j b51

saiB51:	addi $8, $8, 12208
	addi $11, $0, 0

b52:	beq $11, 10, saiB52
	sw $9, 0($8)
	addi $8, $8, 4
	addi $11, $11, 1
	j b52

saiB52:	addi $8, $8, 512
	addi $11, $0, 0

b53:	beq $11, 13, saiB53
	sw $9, 0($8)
	addi $8, $8, 512
	addi $11, $11, 1
	j b53

saiB53:	sw $9, -4($8)
	addi $8, $8, -520
	addi $11, $0, 0

b54:	beq $11, 12, saiB54
	sw $9, 0($8)
	addi $8, $8, -512
	addi $11, $11, 1
	j b54

saiB54:	addi $8, $8, 508
	addi $11, $0, 0

b55:	beq $11, 8, saiB55
	sw $9, 0($8)
	addi $8, $8, -4
	addi $11, $11, 1
	j b55

saiB55:	sw $9, -512($8)
	addi $8, $8, 11268
	addi $11, $0, 0

b56:	beq $11, 21, saiB56
	sw $9, 0($8)
	addi $8, $8, 4
	addi $11, $11, 1
	j b56

saiB56:	addi $8, $8, -516
	addi $11, $0, 0

b57:	beq $11, 11, saiB57
	sw $9, 0($8)
	addi $8, $8, -512
	addi $11, $11, 1
	j b57

saiB57:	addi $8, $8, 4
	addi $11, $0, 0

b58:	beq $11, 4, saiB58
	sw $9, 0($8)
	addi $8, $8, 4
	addi $11, $11, 1
	j b58

saiB58:	addi $8, $8, 512
	addi $11, $0, 0

b59:	beq $11, 12, saiB59
	sw $9, 0($8)
	addi $8, $8, 512
	addi $11, $11, 1
	j b59

saiB59:	addi $8, $8, -508
	addi $11, $0, 0

b60:	beq $11, 14, saiB60
	sw $9, 0($8)
	addi $8, $8, 4
	addi $11, $11, 1
	j b60

saiB60:	sw $9, 512($8)
	addi $8, $8, 1020
	addi $11, $0, 0

b61:	beq $11, 40, saiB61
	sw $9, 0($8)
	addi $8, $8, -4
	addi $11, $11, 1
	j b61

saiB61:	sw $9, -512($8)
	addi $8, $8, -13224
	addi $11, $0, 0

b62:	beq $11, 19, saiB62
	sw $9, 0($8)
	addi $8, $8, 4
	addi $11, $11, 1
	j b62

saiB62:	sw $9, 512($8)
	addi $8, $8, 1020
	addi $11, $0, 0

b63:	beq $11, 19, saiB63
	sw $9, 0($8)
	addi $8, $8, -4
	addi $11, $11, 1
	j b63

saiB63:	sw $9, -512($8)
	addi $8, $8, -33216
	addi $11, $0, 0

b64:	beq $11, 34, saiB64
	sw $9, 0($8)
	addi $8, $8, 4
	addi $11, $11, 1
	j b64

saiB64:	addi $8, $8, 512
	addi $11, $0, 0

b65:	beq $11, 5, saiB65
	sw $9, 0($8)
	addi $8, $8, 512
	addi $11, $11, 1
	j b65

saiB65:	addi $8, $8, -4
	addi $11, $0, 0

b66:	beq $11, 12, saiB66
	sw $9, 0($8)
	addi $8, $8, -4
	addi $11, $11, 1
	j b66

saiB66:	addi $8, $8, 516
	addi $11, $0, 0

b67:	beq $11, 10, saiB67
	sw $9, 0($8)
	addi $8, $8, 512
	addi $11, $11, 1
	j b67

saiB67:	addi $8, $8, -4
	addi $11, $0, 0

b68:	beq $11, 10, saiB68
	sw $9, 0($8)
	addi $8, $8, -4
	addi $11, $11, 1
	j b68

saiB68:	addi $8, $8, -512
	addi $11, $0, 0

b69:	beq $11, 11, saiB69
	sw $9, 0($8)
	addi $8, $8, -512
	addi $11, $11, 1
	j b69

saiB69:	addi $8, $8, 508
	addi $11, $0, 0

b70:	beq $11, 11, saiB70
	sw $9, 0($8)
	addi $8, $8, -4
	addi $11, $11, 1
	j b70

saiB70:	addi $8, $8, -512
	addi $11, $0, 0

b71:	beq $11, 5, saiB71
	sw $9, 0($8)
	addi $8, $8, -512
	addi $11, $11, 1
	j b71

saiB71:	addi $8, $8, 13828
	addi $11, $0, 0

b72:	beq $11, 9, saiB72
	sw $9, 0($8)
	addi $8, $8, 4
	addi $11, $11, 1
	j b72

saiB72:	addi $8, $8, 28
	addi $11, $0, 0

b73:	beq $11, 18, saiB73
	sw $9, 0($8)
	addi $8, $8, 4
	addi $11, $11, 1
	j b73

saiB73:	addi $8, $8, 512
	addi $11, $0, 0

b74:	beq $11, 13, saiB74
	sw $9, 0($8)
	addi $8, $8, 512
	addi $11, $11, 1
	j b74

saiB74:	addi $8, $8, -4
	addi $11, $0, 0

b75:	beq $11, 34, saiB75
	sw $9, 0($8)
	addi $8, $8, -4
	addi $11, $11, 1
	j b75

saiB75:	addi $8, $8, -512
	addi $11, $0, 0

b76:	beq $11, 13, saiB76
	sw $9, 0($8)
	addi $8, $8, -512
	addi $11, $11, 1
	j b76

saiB76:	

	jr $31

#--------------------------------------------------------------------------
#	INICIALIZAÇÃO DAS COINS DO CENARIO
#--------------------------------------------------------------------------
coins:
	lui $8, 0x1001
	addi $8, $8, 2604
	
	jr $31

#--------------------------------------------------------------------------
#	INICIALIZAÇÃO DOS FANTASMAS
#--------------------------------------------------------------------------
ghost1:
	lui $8, 0x1001
	addi $8, $8, $20
	addi $9, $0, 0xFD00FF #Rosa
	
	#Desenha o fantasma com base no valor do seu centro
	sw $9, -2052($8)
	sw $9, -2048($8)
	sw $9, -2044($8)
	sw $9, -1544($8)
	sw $9, -1540($8)
	sw $9, -1536($8)
	sw $9, -1532($8)
	sw $9, -1528($8)
	sw $9, -1036($8)
	sw $9, -1032($8)
	sw $9, -1028($8)
	sw $9, -1024($8)
	sw $9, -1020($8)
	sw $9, -1016($8)
	sw $9, -1012($8)
	sw $9, -524($8)
	#sw $9, -520($8) Eyes
	#sw $9, -516($8) Eyes
	sw $9, -512($8)
	#sw $9, -508($8) Eyes
	#sw $9, -504($8) Eyes
	sw $9, -500($8)
	sw $9, -12($8)
	#sw $9, -8($8) Eyes
	#sw $9, -4($8) Eyes
	sw $9, 0($8)
	#sw $9, 4($8) Eyes
	#sw $9, 8($8) Eyes
	sw $9, 12($8)
	sw $9, 500($8)
	sw $9, 504($8)
	sw $9, 508($8)
	sw $9, 512($8)
	sw $9, 516($8)
	sw $9, 520($8)
	sw $9, 524($8)
	sw $9, 1012($8)
	sw $9, 1016($8)
	sw $9, 1020($8)
	sw $9, 1024($8)
	sw $9, 1028($8)
	sw $9, 1032($8)
	sw $9, 1036($8)
	sw $9, 1524($8)
	sw $9, 1528($8)
	sw $9, 1532($8)
	sw $9, 1536($8)
	sw $9, 1540($8)
	sw $9, 1544($8)
	sw $9, 1548($8)
	sw $9, 2036($8)
	#sw $9, 2040($8)
	sw $9, 2044($8)
	#sw $9, 2048($8)
	sw $9, 2052($8)
	#sw $9, 2056($8)
	sw $9, 2060($8)

	jr $31
ghost2:
	lui $8, 0x1001
	add $8, $8, $21
	addi $9, $0, 0xFDFF00 #Amarelo
	
	#Desenha o fantasma com base no valor do seu centro
	sw $9, -2052($8)
	sw $9, -2048($8)
	sw $9, -2044($8)
	sw $9, -1544($8)
	sw $9, -1540($8)
	sw $9, -1536($8)
	sw $9, -1532($8)
	sw $9, -1528($8)
	sw $9, -1036($8)
	sw $9, -1032($8)
	sw $9, -1028($8)
	sw $9, -1024($8)
	sw $9, -1020($8)
	sw $9, -1016($8)
	sw $9, -1012($8)
	sw $9, -524($8)
	#sw $9, -520($8) Eyes
	#sw $9, -516($8) Eyes
	sw $9, -512($8)
	#sw $9, -508($8) Eyes
	#sw $9, -504($8) Eyes
	sw $9, -500($8)
	sw $9, -12($8)
	#sw $9, -8($8) Eyes
	#sw $9, -4($8) Eyes
	sw $9, 0($8)
	#sw $9, 4($8) Eyes
	#sw $9, 8($8) Eyes
	sw $9, 12($8)
	sw $9, 500($8)
	sw $9, 504($8)
	sw $9, 508($8)
	sw $9, 512($8)
	sw $9, 516($8)
	sw $9, 520($8)
	sw $9, 524($8)
	sw $9, 1012($8)
	sw $9, 1016($8)
	sw $9, 1020($8)
	sw $9, 1024($8)
	sw $9, 1028($8)
	sw $9, 1032($8)
	sw $9, 1036($8)
	sw $9, 1524($8)
	sw $9, 1528($8)
	sw $9, 1532($8)
	sw $9, 1536($8)
	sw $9, 1540($8)
	sw $9, 1544($8)
	sw $9, 1548($8)
	sw $9, 2036($8)
	#sw $9, 2040($8)
	sw $9, 2044($8)
	#sw $9, 2048($8)
	sw $9, 2052($8)
	#sw $9, 2056($8)
	sw $9, 2060($8)

	jr $31
ghost3:
	lui $8, 0x1001
	addi $8, $8, $22
	addi $9, $0, 0x00FF2B #Verde
	
	#Desenha o fantasma com base no valor do seu centro
	sw $9, -2052($8)
	sw $9, -2048($8)
	sw $9, -2044($8)
	sw $9, -1544($8)
	sw $9, -1540($8)
	sw $9, -1536($8)
	sw $9, -1532($8)
	sw $9, -1528($8)
	sw $9, -1036($8)
	sw $9, -1032($8)
	sw $9, -1028($8)
	sw $9, -1024($8)
	sw $9, -1020($8)
	sw $9, -1016($8)
	sw $9, -1012($8)
	sw $9, -524($8)
	#sw $9, -520($8) Eyes
	#sw $9, -516($8) Eyes
	sw $9, -512($8)
	#sw $9, -508($8) Eyes
	#sw $9, -504($8) Eyes
	sw $9, -500($8)
	sw $9, -12($8)
	#sw $9, -8($8) Eyes
	#sw $9, -4($8) Eyes
	sw $9, 0($8)
	#sw $9, 4($8) Eyes
	#sw $9, 8($8) Eyes
	sw $9, 12($8)
	sw $9, 500($8)
	sw $9, 504($8)
	sw $9, 508($8)
	sw $9, 512($8)
	sw $9, 516($8)
	sw $9, 520($8)
	sw $9, 524($8)
	sw $9, 1012($8)
	sw $9, 1016($8)
	sw $9, 1020($8)
	sw $9, 1024($8)
	sw $9, 1028($8)
	sw $9, 1032($8)
	sw $9, 1036($8)
	sw $9, 1524($8)
	sw $9, 1528($8)
	sw $9, 1532($8)
	sw $9, 1536($8)
	sw $9, 1540($8)
	sw $9, 1544($8)
	sw $9, 1548($8)
	sw $9, 2036($8)
	#sw $9, 2040($8)
	sw $9, 2044($8)
	#sw $9, 2048($8)
	sw $9, 2052($8)
	#sw $9, 2056($8)
	sw $9, 2060($8)

	jr $31
ghost4:
	lui $8, 0x1001
	addi $8, $8, $23
	addi $9, $0, 0xFF0000 #Vermelho
	
	#Desenha o fantasma com base no valor do seu centro
	sw $9, -2052($8)
	sw $9, -2048($8)
	sw $9, -2044($8)
	sw $9, -1544($8)
	sw $9, -1540($8)
	sw $9, -1536($8)
	sw $9, -1532($8)
	sw $9, -1528($8)
	sw $9, -1036($8)
	sw $9, -1032($8)
	sw $9, -1028($8)
	sw $9, -1024($8)
	sw $9, -1020($8)
	sw $9, -1016($8)
	sw $9, -1012($8)
	sw $9, -524($8)
	#sw $9, -520($8) Eyes
	#sw $9, -516($8) Eyes
	sw $9, -512($8)
	#sw $9, -508($8) Eyes
	#sw $9, -504($8) Eyes
	sw $9, -500($8)
	sw $9, -12($8)
	#sw $9, -8($8) Eyes
	#sw $9, -4($8) Eyes
	sw $9, 0($8)
	#sw $9, 4($8) Eyes
	#sw $9, 8($8) Eyes
	sw $9, 12($8)
	sw $9, 500($8)
	sw $9, 504($8)
	sw $9, 508($8)
	sw $9, 512($8)
	sw $9, 516($8)
	sw $9, 520($8)
	sw $9, 524($8)
	sw $9, 1012($8)
	sw $9, 1016($8)
	sw $9, 1020($8)
	sw $9, 1024($8)
	sw $9, 1028($8)
	sw $9, 1032($8)
	sw $9, 1036($8)
	sw $9, 1524($8)
	sw $9, 1528($8)
	sw $9, 1532($8)
	sw $9, 1536($8)
	sw $9, 1540($8)
	sw $9, 1544($8)
	sw $9, 1548($8)
	sw $9, 2036($8)
	#sw $9, 2040($8)
	sw $9, 2044($8)
	#sw $9, 2048($8)
	sw $9, 2052($8)
	#sw $9, 2056($8)
	sw $9, 2060($8)

	jr $31

#--------------------------------------------------------------------------
#	APAGA FANTASMAS
#--------------------------------------------------------------------------
apagaGhost2:
	lui $8, 0x1001
	add $8, $8, $21 #Recebe a posição anterior do fantasma
	addi $9, $0, 0x000000 #Azul
	
	#DApaga o fantasma com base no valor do seu centro
	sw $9, -2052($8)
	sw $9, -2048($8)
	sw $9, -2044($8)
	sw $9, -1544($8)
	sw $9, -1540($8)
	sw $9, -1536($8)
	sw $9, -1532($8)
	sw $9, -1528($8)
	sw $9, -1036($8)
	sw $9, -1032($8)
	sw $9, -1028($8)
	sw $9, -1024($8)
	sw $9, -1020($8)
	sw $9, -1016($8)
	sw $9, -1012($8)
	sw $9, -524($8)
	#sw $9, -520($8) Eyes
	#sw $9, -516($8) Eyes
	sw $9, -512($8)
	#sw $9, -508($8) Eyes
	#sw $9, -504($8) Eyes
	sw $9, -500($8)
	sw $9, -12($8)
	#sw $9, -8($8) Eyes
	#sw $9, -4($8) Eyes
	sw $9, 0($8)
	#sw $9, 4($8) Eyes
	#sw $9, 8($8) Eyes
	sw $9, 12($8)
	sw $9, 500($8)
	sw $9, 504($8)
	sw $9, 508($8)
	sw $9, 512($8)
	sw $9, 516($8)
	sw $9, 520($8)
	sw $9, 524($8)
	sw $9, 1012($8)
	sw $9, 1016($8)
	sw $9, 1020($8)
	sw $9, 1024($8)
	sw $9, 1028($8)
	sw $9, 1032($8)
	sw $9, 1036($8)
	sw $9, 1524($8)
	sw $9, 1528($8)
	sw $9, 1532($8)
	sw $9, 1536($8)
	sw $9, 1540($8)
	sw $9, 1544($8)
	sw $9, 1548($8)
	sw $9, 2036($8)
	#sw $9, 2040($8)
	sw $9, 2044($8)
	#sw $9, 2048($8)
	sw $9, 2052($8)
	#sw $9, 2056($8)
	sw $9, 2060($8)

	jr $31

#--------------------------------------------------------------------------
#	CRUZAMENTOS
#--------------------------------------------------------------------------
cruzamentos:
	lui $8, 0x1001