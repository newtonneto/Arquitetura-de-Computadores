.text
main:
	#Legenda de registradores importantes
	#$8 Array de pixels
	#$9 Armazena uma determinada cor necessaria para determinados momentos
	#$10 Array de posicoes iniciais dos personagens
	#$11 Indice utilizado pelos diversos fors

	jal pacMan #Inicializa o Pac Man da Deep Web
	jal barreiras #Inicializa as barreiras
	jal jaula #Inicializa a jaula dos fantasmas
	jal coins #Inicializa as moedas espalhadas pelo mapa
	addi $9, $0, 0xFF0000 #Vermelho
	jal ghosts #Inicializa o fantasma vermelho
	addi $8, $8, 24
	addi $9, $0, 0x0099FF #Azul claro
	jal ghosts #Iniciliza o fantasma azul claro
	addi $8, $8, 1512
	addi $9, $0, 0xF4A9D3 #Rosa
	jal ghosts #Iniciliza o fantasma rosa
	addi $8, $8, 24
	addi $9, $0, 0xF97609 #Laranja
	jal ghosts #Iniciliza o fantasma laranja

saiT:

	addi $2, $0, 10
	syscall

#--------------------------------------------------------------------------
#	INICIALIZAÇÃO DO PAC MAN DA DEEP WEB
#--------------------------------------------------------------------------
pacMan:
	lui $8, 0x1001 #Inicia o array
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
	jr $31

#--------------------------------------------------------------------------
#	INICIALIZAÇÃO DAS BARREIRAS DO CENARIO
#--------------------------------------------------------------------------
barreiras:
	addi $9, $0, 0x0000FF #Azul
	addi $11, $0, 0
	lui $8, 0x1001 #Reseta o indice do array
	addi $8, $8, 1300 #Inicio da barreira 1
b1:	beq $11, 24, saiB1
	sw $9, 0($8)
	addi $11, $11, 1
	addi $8, $8, 4
	j b1

saiB1:	addi $11, $0, 0
	lui $8, 0x1001 #Reseta o indice do array
	addi $8, $8, 1416 #Inicio da barreira 2
b2:	beq $11, 24, saiB2
	sw $9, 0($8)
	addi $11, $11, 1
	addi $8, $8, 4
	j b2

saiB2:	addi $11, $0, 0
	lui $8, 0x1001 #Reseta o indice do array
	addi $8, $8, 1556 #Inicio da barreira 3
b3:	beq $11, 23, saiB3
	sw $9, 0($8)
	addi $11, $11, 1
	addi $8, $8, 256
	j b3
	
saiB3:	addi $11, $0, 0
	lui $8, 0x1001 #Reseta o indice do array
	addi $8, $8, 1764 #Inicio da barreira 4
b4:	beq $11, 23, saiB4
	sw $9, 0($8)
	addi $11, $11, 1
	addi $8, $8, 256
	j b4
	
saiB4:	addi $11, $0, 0
	lui $8, 0x1001 #Reseta o indice do array
	addi $8, $8, 8724 #Inicio da barreira 5
b5:	beq $11, 23, saiB5
	sw $9, 0($8)
	addi $11, $11, 1
	addi $8, $8, 256
	j b5
	
saiB5:	addi $11, $0, 0
	lui $8, 0x1001 #Reseta o indice do array
	addi $8, $8, 8932 #Inicio da barreira 6
b6:	beq $11, 23, saiB6
	sw $9, 0($8)
	addi $11, $11, 1
	addi $8, $8, 256
	j b6
	
saiB6:	addi $11, $0, 0
	lui $8, 0x1001 #Reseta o indice do array
	addi $8, $8, 14612 #Inicio da barreira 7
b7:	beq $11, 24, saiB7
	sw $9, 0($8)
	addi $11, $11, 1
	addi $8, $8, 4
	j b7

saiB7:	addi $11, $0, 0
	lui $8, 0x1001 #Reseta o indice do array
	addi $8, $8, 14728 #Inicio da barreira 8
b8:	beq $11, 24, saiB8
	sw $9, 0($8)
	addi $11, $11, 1
	addi $8, $8, 4
	j b8
	
saiB8:	addi $11, $0, 0
	lui $8, 0x1001 #Reseta o indice do array
	addi $8, $8, 2860 #Inicio da barreira 9
b9:	beq $11, 18, saiB9
	sw $9, 0($8)
	addi $11, $11, 1
	addi $8, $8, 4
	j b9
	
saiB9:	addi $11, $0, 0
	lui $8, 0x1001 #Reseta o indice do array
	addi $8, $8, 2952 #Inicio da barreira 10
b10:	beq $11, 18, saiB10
	sw $9, 0($8)
	addi $11, $11, 1
	addi $8, $8, 4
	j b10
	
saiB10:	addi $11, $0, 0
	lui $8, 0x1001 #Reseta o indice do array
	addi $8, $8, 3116 #Inicio da barreira 11
b11:	beq $11, 17, saiB11
	sw $9, 0($8)
	addi $11, $11, 1
	addi $8, $8, 256
	j b11
	
saiB11:	addi $11, $0, 0
	lui $8, 0x1001 #Reseta o indice do array
	addi $8, $8, 3276 #Inicio da barreira 12
b12:	beq $11, 17, saiB12
	sw $9, 0($8)
	addi $11, $11, 1
	addi $8, $8, 256
	j b12
	
saiB12:	addi $11, $0, 0
	lui $8, 0x1001 #Reseta o indice do array
	addi $8, $8, 8748 #Inicio da barreira 13
b13:	beq $11, 17, saiB13
	sw $9, 0($8)
	addi $11, $11, 1
	addi $8, $8, 256
	j b13
	
saiB13:	addi $11, $0, 0
	lui $8, 0x1001 #Reseta o indice do array
	addi $8, $8, 8908 #Inicio da barreira 14
b14:	beq $11, 17, saiB14
	sw $9, 0($8)
	addi $11, $11, 1
	addi $8, $8, 256
	j b14
	
saiB14:	addi $11, $0, 0
	lui $8, 0x1001 #Reseta o indice do array
	addi $8, $8, 13100 #Inicio da barreira 15
b15:	beq $11, 18, saiB15
	sw $9, 0($8)
	addi $11, $11, 1
	addi $8, $8, 4
	j b15

saiB15:	addi $11, $0, 0
	lui $8, 0x1001 #Reseta o indice do array
	addi $8, $8, 13192 #Inicio da barreira 16
b16:	beq $11, 18, saiB16
	sw $9, 0($8)
	addi $11, $11, 1
	addi $8, $8, 4
	j b16
	
saiB16:	addi $11, $0, 0
	lui $8, 0x1001 #Reseta o indice do array
	addi $8, $8, 4420 #Inicio da barreira 17
b17:	beq $11, 12, saiB17
	sw $9, 0($8)
	addi $11, $11, 1
	addi $8, $8, 4
	j b17

saiB17:	addi $11, $0, 0
	lui $8, 0x1001 #Reseta o indice do array
	addi $8, $8, 4488 #Inicio da barreira 18
b18:	beq $11, 12, saiB18
	sw $9, 0($8)
	addi $11, $11, 1
	addi $8, $8, 4
	j b18

saiB18:	addi $11, $0, 0
	lui $8, 0x1001 #Reseta o indice do array
	addi $8, $8, 4676 #Inicio da barreira 19
b19:	beq $11, 11, saiB19
	sw $9, 0($8)
	addi $11, $11, 1
	addi $8, $8, 256
	j b19

saiB19:	addi $11, $0, 0
	lui $8, 0x1001 #Reseta o indice do array
	addi $8, $8, 4788 #Inicio da barreira 20
b20:	beq $11, 11, saiB20
	sw $9, 0($8)
	addi $11, $11, 1
	addi $8, $8, 256
	j b20

saiB20:	addi $11, $0, 0
	lui $8, 0x1001 #Reseta o indice do array
	addi $8, $8, 5196 #Inicio da barreira 21
b21:	beq $11, 9, saiB21
	sw $9, 0($8)
	addi $11, $11, 1
	addi $8, $8, 256
	j b21

saiB21:	addi $11, $0, 0
	lui $8, 0x1001 #Reseta o indice do array
	addi $8, $8, 5292 #Inicio da barreira 22
b22:	beq $11, 9, saiB22
	sw $9, 0($8)
	addi $11, $11, 1
	addi $8, $8, 256
	j b22

saiB22:	addi $11, $0, 0
	lui $8, 0x1001 #Reseta o indice do array
	addi $8, $8, 4940 #Inicio da barreira 23
b23:	beq $11, 10, saiB23
	sw $9, 0($8)
	addi $11, $11, 1
	addi $8, $8, 4
	j b23

saiB23:	addi $11, $0, 0
	lui $8, 0x1001 #Reseta o indice do array
	addi $8, $8, 5000 #Inicio da barreira 24
b24:	beq $11, 10, saiB24
	sw $9, 0($8)
	addi $11, $11, 1
	addi $8, $8, 4
	j b24

saiB24:	addi $11, $0, 0
	lui $8, 0x1001 #Reseta o indice do array
	addi $8, $8, 8772 #Inicio da barreira 25
b25:	beq $11, 11, saiB25
	sw $9, 0($8)
	addi $11, $11, 1
	addi $8, $8, 256
	j b25

saiB25:	addi $11, $0, 0
	lui $8, 0x1001 #Reseta o indice do array
	addi $8, $8, 8884 #Inicio da barreira 26
b26:	beq $11, 11, saiB26
	sw $9, 0($8)
	addi $11, $11, 1
	addi $8, $8, 256
	j b26

saiB26:	addi $11, $0, 0
	lui $8, 0x1001 #Reseta o indice do array
	addi $8, $8, 11588 #Inicio da barreira 27
b27:	beq $11, 12, saiB27
	sw $9, 0($8)
	addi $11, $11, 1
	addi $8, $8, 4
	j b27

saiB27:	addi $11, $0, 0
	lui $8, 0x1001 #Reseta o indice do array
	addi $8, $8, 11656 #Inicio da barreira 28
b28:	beq $11, 12, saiB28
	sw $9, 0($8)
	addi $11, $11, 1
	addi $8, $8, 4
	j b28

saiB28:	addi $11, $0, 0
	lui $8, 0x1001 #Reseta o indice do array
	addi $8, $8, 8780 #Inicio da barreira 29
b29:	beq $11, 9, saiB29
	sw $9, 0($8)
	addi $11, $11, 1
	addi $8, $8, 256
	j b29

saiB29:	addi $11, $0, 0
	lui $8, 0x1001 #Reseta o indice do array
	addi $8, $8, 8876 #Inicio da barreira 30
b30:	beq $11, 9, saiB30
	sw $9, 0($8)
	addi $11, $11, 1
	addi $8, $8, 256
	j b30

saiB30:	addi $11, $0, 0
	lui $8, 0x1001 #Reseta o indice do array
	addi $8, $8, 11084 #Inicio da barreira 31
b31:	beq $11, 10, saiB31
	sw $9, 0($8)
	addi $11, $11, 1
	addi $8, $8, 4
	j b31

saiB31:	addi $11, $0, 0
	lui $8, 0x1001 #Reseta o indice do array
	addi $8, $8, 11144 #Inicio da barreira 32
b32:	beq $11, 10, saiB32
	sw $9, 0($8)
	addi $11, $11, 1
	addi $8, $8, 4
	j b32

saiB32:	lui $8, 0x1001 #Reseta o indice do array para pintar os 8 pixels restantes
	sw $9, 4720($8)
	sw $9, 4744($8)
	sw $9, 7240($8)
	sw $9, 7344($8)
	sw $9, 8776($8)
	sw $9, 8880($8)
	sw $9, 11376($8)
	sw $9, 11400($8)

	addi $11, $0, 0
	addi $8, $8, 16128
b33:	beq $11, 29, saiB33
	sw $9, 0($8)
	addi $11, $11, 1
	addi $8, $8, 4
	j b33

saiB33:	addi $11, $0, 0
	lui $8, 0x1001 #Reseta o indice do array
	addi $8, $8, 16264 #Inicio da barreira 34
b34:	beq $11, 30, saiB34
	sw $9, 0($8)
	addi $11, $11, 1
	addi $8, $8, 4
	j b34

saiB34:	addi $11, $0, 0
	lui $8, 0x1001 #Reseta o indice do array
	addi $8, $8, 8956 #Inicio da barreira 35
b35:	beq $11, 29, saiB35
	sw $9, 0($8)
	addi $11, $11, 1
	addi $8, $8, 256
	j b35

saiB35:	addi $11, $0, 0
	lui $8, 0x1001 #Reseta o indice do array
	addi $8, $8, 252 #Inicio da barreira 36
b36:	beq $11, 29, saiB36
	sw $9, 0($8)
	addi $11, $11, 1
	addi $8, $8, 256
	j b36

saiB36:	jr $31

#--------------------------------------------------------------------------
#	INICIALIZAÇÃO DA JAULA DOS FANTASMAS
#--------------------------------------------------------------------------
jaula:
	addi $9, $0, 0x001361 #Azul escuro
	addi $11, $0, 0
	lui $8, 0x1001 #Reseta o indice do array
	addi $8, $8, 6500 #Inicio da jaula 1
j1:	beq $11, 4, saiJ1
	sw $9, 0($8)
	addi $11, $11, 1
	addi $8, $8, 4
	j j1

saiJ1:	addi $11, $0, 0
	lui $8, 0x1001 #Reseta o indice do array
	addi $8, $8, 6536 #Inicio da jaula 2
j2:	beq $11, 4, saiJ2
	sw $9, 0($8)
	addi $11, $11, 1
	addi $8, $8, 4
	j j2

saiJ2:	addi $11, $0, 0
	lui $8, 0x1001 #Reseta o indice do array
	addi $8, $8, 6756 #Inicio da jaula 3
j3:	beq $11, 11, saiJ3
	sw $9, 0($8)
	addi $11, $11, 1
	addi $8, $8, 256
	j j3

saiJ3:	addi $11, $0, 0
	lui $8, 0x1001 #Reseta o indice do array
	addi $8, $8, 6804 #Inicio da jaula 4
j4:	beq $11, 11, saiJ4
	sw $9, 0($8)
	addi $11, $11, 1
	addi $8, $8, 256
	j j4

saiJ4:	addi $11, $0, 0
	lui $8, 0x1001 #Reseta o indice do array
	addi $8, $8, 9572 #Inicio da jaula 5
j5:	beq $11, 13, saiJ5
	sw $9, 0($8)
	addi $11, $11, 1
	addi $8, $8, 4
	j j5

saiJ5:	jr $31

#--------------------------------------------------------------------------
#	INICIALIZAÇÃO DAS COINS DO CENARIO
#--------------------------------------------------------------------------
coins:
	addi $9, $0, 0xFFFFFF #Branco
	addi $11, $0, 0
	lui $8, 0x1001 #Reseta o indice do array
	addi $8, $8, 532 #Inicio da coins 1
c1:	beq $11, 28, saiC1
	sw $9, 0($8)
	addi $11, $11, 1
	addi $8, $8, 8
	j c1

saiC1:	addi $11, $0, 0
	lui $8, 0x1001 #Reseta o indice do array
	addi $8, $8, 1008 #Inicio da coins 2
c2:	beq $11, 29, saiC2
	sw $9, 0($8)
	addi $11, $11, 1
	addi $8, $8, 512
	j c2

saiC2:	addi $11, $0, 0
	lui $8, 0x1001 #Reseta o indice do array
	addi $8, $8, 15372 #Inicio da coins 3
c3:	beq $11, 29, saiC3
	sw $9, 0($8)
	addi $11, $11, 1
	addi $8, $8, 8
	j c3

saiC3:	addi $11, $0, 0
	lui $8, 0x1001 #Reseta o indice do array
	addi $8, $8, 1288 #Inicio da coins 4
c4:	beq $11, 28, saiC4
	sw $9, 0($8)
	addi $11, $11, 1
	addi $8, $8, 512
	j c4

saiC4:	addi $11, $0, 0
	lui $8, 0x1001 #Reseta o indice do array
	addi $8, $8, 2084 #Inicio da coins 5
c5:	beq $11, 23, saiC5
	sw $9, 0($8)
	addi $11, $11, 1
	addi $8, $8, 8
	j c5

saiC5:	addi $11, $0, 0
	lui $8, 0x1001 #Reseta o indice do array
	addi $8, $8, 2520 #Inicio da coins 6
c6:	beq $11, 23, saiC6
	sw $9, 0($8)
	addi $11, $11, 1
	addi $8, $8, 512
	j c6

saiC6:	addi $11, $0, 0
	lui $8, 0x1001 #Reseta o indice do array
	addi $8, $8, 13860 #Inicio da coins 7
c7:	beq $11, 23, saiC7
	sw $9, 0($8)
	addi $11, $11, 1
	addi $8, $8, 8
	j c7

saiC7:	addi $11, $0, 0
	lui $8, 0x1001 #Reseta o indice do array
	addi $8, $8, 2336 #Inicio da coins 8
c8:	beq $11, 23, saiC8
	sw $9, 0($8)
	addi $11, $11, 1
	addi $8, $8, 512
	j c8

saiC8:	addi $11, $0, 0
	lui $8, 0x1001 #Reseta o indice do array
	addi $8, $8, 3644 #Inicio da coins 9
c9:	beq $11, 17, saiC9
	sw $9, 0($8)
	addi $11, $11, 1
	addi $8, $8, 8
	j c9

saiC9:	addi $11, $0, 0
	lui $8, 0x1001 #Reseta o indice do array
	addi $8, $8, 4032 #Inicio da coins 10
c10:	beq $11, 17, saiC10
	sw $9, 0($8)
	addi $11, $11, 1
	addi $8, $8, 512
	j c10

saiC10:	addi $11, $0, 0
	lui $8, 0x1001 #Reseta o indice do array
	addi $8, $8, 12348 #Inicio da coins 11
c11:	beq $11, 17, saiC11
	sw $9, 0($8)
	addi $11, $11, 1
	addi $8, $8, 8
	j c11

saiC11:	addi $11, $0, 0
	lui $8, 0x1001 #Reseta o indice do array
	addi $8, $8, 3896 #Inicio da coins 12
c12:	beq $11, 17, saiC12
	sw $9, 0($8)
	addi $11, $11, 1
	addi $8, $8, 512
	j c12

saiC12:	addi $11, $0, 0
	lui $8, 0x1001 #Reseta o indice do array
	addi $8, $8, 5724 #Inicio da coins 13
c13:	beq $11, 9, saiC13
	sw $9, 0($8)
	addi $11, $11, 1
	addi $8, $8, 8
	j c13

saiC13:	addi $11, $0, 0
	lui $8, 0x1001 #Reseta o indice do array
	addi $8, $8, 6048 #Inicio da coins 14
c14:	beq $11, 9, saiC14
	sw $9, 0($8)
	addi $11, $11, 1
	addi $8, $8, 512
	j c14

saiC14:	addi $11, $0, 0
	lui $8, 0x1001 #Reseta o indice do array
	addi $8, $8, 10332 #Inicio da coins 15
c15:	beq $11, 9, saiC15
	sw $9, 0($8)
	addi $11, $11, 1
	addi $8, $8, 8
	j c15

saiC15:	addi $11, $0, 0
	lui $8, 0x1001 #Reseta o indice do array
	addi $8, $8, 5976 #Inicio da coins 16
c16:	beq $11, 9, saiC16
	sw $9, 0($8)
	addi $11, $11, 1
	addi $8, $8, 512
	j c16

saiC16:	lui $8, 0x1001 #Reseta o indice do array para criar as 28 coins restantes
	sw $9, 1148($8)
	sw $9, 1660($8)
	sw $9, 2684($8)
	sw $9, 3196($8)
	sw $9, 4220($8)
	sw $9, 4732($8)
	sw $9, 5244($8)
	sw $9, 8168($8)
	sw $9, 8160($8)
	sw $9, 8144($8)
	sw $9, 8136($8)
	sw $9, 8120($8)
	sw $9, 8112($8)
	sw $9, 8104($8)
	sw $9, 14972($8)
	sw $9, 14460($8)
	sw $9, 13436($8)
	sw $9, 12924($8)
	sw $9, 11900($8)
	sw $9, 11388($8)
	sw $9, 10876($8)
	sw $9, 7952($8)
	sw $9, 7960($8)
	sw $9, 7976($8)
	sw $9, 7984($8)
	sw $9, 8000($8)
	sw $9, 8008($8)
	sw $9, 8016($8)
	jr $31

#--------------------------------------------------------------------------
#	INICIALIZAÇÃO DOS FANTASMAS
#--------------------------------------------------------------------------
ghosts:
	sw $9, 6764($8)
	sw $9, 6768($8)
	sw $9, 6772($8)
	sw $9, 7016($8)
	sw $9, 7024($8)
	sw $9, 7032($8)
	sw $9, 7272($8)
	sw $9, 7276($8)
	sw $9, 7280($8)
	sw $9, 7284($8)
	sw $9, 7288($8)
	sw $9, 7528($8)
	sw $9, 7532($8)
	sw $9, 7536($8)
	sw $9, 7540($8)
	sw $9, 7544($8)
	sw $9, 7784($8)
	sw $9, 7788($8)
	sw $9, 7792($8)
	sw $9, 7796($8)
	sw $9, 7800($8)
	jr $31

#vou ter que fazer um segundo array com todas as posições do boneco, depois um for pra incrementar ou decrementar essas posições, e depois outro for pra passar os novos valores pro array ontem o pac man ta e.e
#e vai ter que ter um registrador pra armazenar um ponto de referencia de onde ele ta, pra qnd eu for mexer outras coisas
