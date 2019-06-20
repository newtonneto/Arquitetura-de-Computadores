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
	#$17 Recebe o endereço de um jal caso seja necessario fazer o backup
	#$18 Define a dificudade, altera o delay de movimento dos fantasmas
	#$20 Fantasma 1 - Rosa
	#$21 Fantasma 2 - Amarelo
	#$22 Fantasma 3 - Verde
	#$23 Fantasma 4 - Vermelho
	#$26 Cor de teste

inicializacao:
	addi $26, $0, 0xFF0011 #Temporario, apenas para verificar a construção das barreiras
	addi $18, $0, 5 #Dificuldade
	addi $20, $0, 31948 #Posição inicial do ghost1
	addi $21, $0, 31980 #Posição inicial do ghost2
	addi $22, $0, 32016 #Posição inicial do ghost3
	addi $23, $0, 32048 #Posição inicial do ghost4
	#inicializa as barreiras
	lui $8, 0x1001
	jal barreira1
	jal barreira2
	jal barreira3
	jal barreira4
	jal barreira5
	jal barreira6
	jal barreira7
	jal barreira8
	jal barreira9
	jal barreira10
	lui $8, 0x1001
	addi $8, $8, 5548
	jal barreira2
	lui $8, 0x1001
	addi $8, $8, 5440
	jal barreira3
	lui $8, 0x1001
	addi $8, $8, 14764
	jal barreira2
	lui $8, 0x1001
	addi $8, $8, 34672
	jal barreira5
	lui $8, 0x1001
	addi $8, $8, 46900
	jal barreira7
	lui $8, 0x1001
	addi $8, $8, 52924
	jal barreira10	
	jal coins #inicializa as "moedas" do jogo //NÃO IMPLEMENTADO AINDA
	jal cruzamentos #inicializa os pontos de decisão dos fantasmas
	jal pacMan
	#lui $8, 0x1001 #Reseta o indice do array pra inicializar o ghost1
	jal ghost1
	#lui $8, 0x1001 #Reseta o indice do array pra inicializar o ghost1
	jal ghost2
	#lui $8, 0x1001 #Reseta o indice do array pra inicializar o ghost1
	jal ghost3
	#lui $8, 0x1001 #Reseta o indice do array pra inicializar o ghost1
	jal ghost4
	#inicializa direção dos fantasmas
	#addi $14, $0, 2 #Define o movimento inicial do ghost2 como cima

	jal script
main:
	jal moveGhost2
	jal moveGhost1
	jal moveGhost3
	jal moveGhost4
	jal cruzamentos
	j main


#--------------------------------------------------------------------------
#	MOVE FANTASMAS
#--------------------------------------------------------------------------
moveGhost1:
	#Salva o endereço do jal para não bugar com os jals seguintes
	add $17, $0, $31
	#Reseta o array pra verificar o que há armazenado no centro do fantasma
	lui $8, 0x1001
	add $8, $8, $20
	lw $12, 65024($8)
	beq $12, 0xFF00FF, mudaDirecao1 #Se encontrar a cor rosa pula para a "função" que define uma nova direção
	#O numero aleatorio gerado vai vai o programa pular pra direção correspondente
	beq $13, 0, direita1
	beq $13, 1, esquerda1
	beq $13, 2, cima1
	beq $13, 3, baixo1

direita1:
	#Reseta o array pra verificar o que há armazenado 4 pixels a direita do fantasma
	lui $8, 0x1001
	add $8, $8, $20
	lw $12, 20($8)
	beq $12, 0x0000FF, mudaDirecao1 #Se encontrar a cor azul pula para a "função" que define uma nova direção
	lui $8, 0x1001
	jal apagaGhost1
	addi $20, $20, 4 #direita
	jal ghost1
	add $4, $0, $18 #Dificuldade - delay
	addi $2, $0, 32
	syscall
	jr $17
esquerda1:
	#Reseta o array pra verificar o que há armazenado 4 pixels a esquerda do fantasma
	lui $8, 0x1001
	add $8, $8, $20
	lw $12, -20($8)
	beq $12, 0x0000FF, mudaDirecao1 #Se encontrar a cor azul pula para a "função" que define uma nova direção
	lui $8, 0x1001
	jal apagaGhost1
	addi $20, $20, -4 #esquerda
	jal ghost1
	add $4, $0, $18 #Dificuldade - delay
	addi $2, $0, 32
	syscall
	jr $17
cima1:	
	#Reseta o array pra verificar o que há armazenado 5 pixels acima do fantasma
	lui $8, 0x1001
	add $8, $8, $20
	lw $12, -2560($8)
	beq $12, 0x0000FF, mudaDirecao1 #Se encontrar a cor azul pula para a "função" que define uma nova direção
	lui $8, 0x1001
	jal apagaGhost1
	addi $20, $20, -512 #cima
	jal ghost1
	add $4, $0, $18 #Dificuldade - delay
	addi $2, $0, 32
	syscall
	jr $17
baixo1:
	#Reseta o array pra verificar o que há armazenado 5 pixels abaixo do fantasma
	lui $8, 0x1001
	add $8, $8, $20
	lw $12, 2560($8)
	beq $12, 0x0000FF, mudaDirecao1 #Se encontrar a cor azul pula para a "função" que define uma nova direção
	lui $8, 0x1001
	jal apagaGhost1
	addi $20, $20, 512 #baixo
	jal ghost1
	add $4, $0, $18 #Dificuldade - delay
	addi $2, $0, 32
	syscall
	jr $17

mudaDirecao1:
	addi $5, $0, 4  #Define a quantidade de número possíveis, 0..3 = 4 possibilidades.
    	addi $2, $0, 42  #Syscall para gerar um numero aleatorio, o mesmo vai ser armazenado em $4.
    	syscall
	add $13, $0, $4 #O numero aleatorio vai ser carregado em $14, reg responsavel por armazenar a direção do fantasma
	#O numero aleatorio gerado vai vai o programa pular pra direção correspondente
	beq $13, 0, direita1
	beq $13, 1, esquerda1
	beq $13, 2, cima1
	beq $13, 3, baixo1

moveGhost2:
	#Salva o endereço do jal para não bugar com os jals seguintes
	add $17, $0, $31
	#Reseta o array pra verificar o que há armazenado no centro do fantasma
	lui $8, 0x1001
	add $8, $8, $21
	lw $12, 65024($8)
	beq $12, 0xFF00FF, mudaDirecao2 #Se encontrar a cor rosa pula para a "função" que define uma nova direção
	#O numero aleatorio gerado vai vai o programa pular pra direção correspondente
	beq $14, 0, direita2
	beq $14, 1, esquerda2
	beq $14, 2, cima2
	beq $14, 3, baixo2

direita2:
	#Reseta o array pra verificar o que há armazenado 4 pixels a direita do fantasma
	lui $8, 0x1001
	add $8, $8, $21
	lw $12, 20($8)
	beq $12, 0x0000FF, mudaDirecao2 #Se encontrar a cor azul pula para a "função" que define uma nova direção
	lui $8, 0x1001
	jal apagaGhost2
	addi $21, $21, 4 #direita
	jal ghost2
	add $4, $0, $18 #Dificuldade - delay
	addi $2, $0, 32
	syscall
	jr $17
esquerda2:
	#Reseta o array pra verificar o que há armazenado 4 pixels a esquerda do fantasma
	lui $8, 0x1001
	add $8, $8, $21
	lw $12, -20($8)
	beq $12, 0x0000FF, mudaDirecao2 #Se encontrar a cor azul pula para a "função" que define uma nova direção
	lui $8, 0x1001
	jal apagaGhost2
	addi $21, $21, -4 #esquerda
	jal ghost2
	add $4, $0, $18 #Dificuldade - delay
	addi $2, $0, 32
	syscall
	jr $17
cima2:	
	#Reseta o array pra verificar o que há armazenado 5 pixels acima do fantasma
	lui $8, 0x1001
	add $8, $8, $21
	lw $12, -2560($8)
	beq $12, 0x0000FF, mudaDirecao2 #Se encontrar a cor azul pula para a "função" que define uma nova direção
	lui $8, 0x1001
	jal apagaGhost2
	addi $21, $21, -512 #cima
	jal ghost2
	add $4, $0, $18 #Dificuldade - delay
	addi $2, $0, 32
	syscall
	jr $17
baixo2:
	#Reseta o array pra verificar o que há armazenado 5 pixels abaixo do fantasma
	lui $8, 0x1001
	add $8, $8, $21
	lw $12, 2560($8)
	beq $12, 0x0000FF, mudaDirecao2 #Se encontrar a cor azul pula para a "função" que define uma nova direção
	lui $8, 0x1001
	jal apagaGhost2
	addi $21, $21, 512 #baixo
	jal ghost2
	add $4, $0, $18 #Dificuldade - delay
	addi $2, $0, 32
	syscall
	jr $17

mudaDirecao2:
	addi $5, $0, 4  #Define a quantidade de número possíveis, 0..3 = 4 possibilidades.
    	addi $2, $0, 42  #Syscall para gerar um numero aleatorio, o mesmo vai ser armazenado em $4.
    	syscall
	add $14, $0, $4 #O numero aleatorio vai ser carregado em $14, reg responsavel por armazenar a direção do fantasma
	#O numero aleatorio gerado vai vai o programa pular pra direção correspondente
	beq $14, 0, direita2
	beq $14, 1, esquerda2
	beq $14, 2, cima2
	beq $14, 3, baixo2

moveGhost3:
	#Salva o endereço do jal para não bugar com os jals seguintes
	add $17, $0, $31
	#Reseta o array pra verificar o que há armazenado no centro do fantasma
	lui $8, 0x1001
	add $8, $8, $22
	lw $12, 65024($8)
	beq $12, 0xFF00FF, mudaDirecao3 #Se encontrar a cor rosa pula para a "função" que define uma nova direção
	#O numero aleatorio gerado vai vai o programa pular pra direção correspondente
	beq $15, 0, direita3
	beq $15, 1, esquerda3
	beq $15, 2, cima3
	beq $15, 3, baixo3

direita3:
	#Reseta o array pra verificar o que há armazenado 4 pixels a direita do fantasma
	lui $8, 0x1001
	add $8, $8, $22
	lw $12, 20($8)
	beq $12, 0x0000FF, mudaDirecao3 #Se encontrar a cor azul pula para a "função" que define uma nova direção
	lui $8, 0x1001
	jal apagaGhost3
	addi $22, $22, 4 #direita
	jal ghost3
	add $4, $0, $18 #Dificuldade - delay
	addi $2, $0, 32
	syscall
	jr $17
esquerda3:
	#Reseta o array pra verificar o que há armazenado 4 pixels a esquerda do fantasma
	lui $8, 0x1001
	add $8, $8, $22
	lw $12, -20($8)
	beq $12, 0x0000FF, mudaDirecao3 #Se encontrar a cor azul pula para a "função" que define uma nova direção
	lui $8, 0x1001
	jal apagaGhost3
	addi $22, $22, -4 #esquerda
	jal ghost3
	add $4, $0, $18 #Dificuldade - delay
	addi $2, $0, 32
	syscall
	jr $17
cima3:	
	#Reseta o array pra verificar o que há armazenado 5 pixels acima do fantasma
	lui $8, 0x1001
	add $8, $8, $22
	lw $12, -2560($8)
	beq $12, 0x0000FF, mudaDirecao3 #Se encontrar a cor azul pula para a "função" que define uma nova direção
	lui $8, 0x1001
	jal apagaGhost3
	addi $22, $22, -512 #cima
	jal ghost3
	add $4, $0, $18 #Dificuldade - delay
	addi $2, $0, 32
	syscall
	jr $17
baixo3:
	#Reseta o array pra verificar o que há armazenado 5 pixels abaixo do fantasma
	lui $8, 0x1001
	add $8, $8, $22
	lw $12, 2560($8)
	beq $12, 0x0000FF, mudaDirecao3 #Se encontrar a cor azul pula para a "função" que define uma nova direção
	lui $8, 0x1001
	jal apagaGhost3
	addi $22, $22, 512 #baixo
	jal ghost3
	add $4, $0, $18 #Dificuldade - delay
	addi $2, $0, 32
	syscall
	jr $17

mudaDirecao3:
	addi $5, $0, 4  #Define a quantidade de número possíveis, 0..3 = 4 possibilidades.
    	addi $2, $0, 42  #Syscall para gerar um numero aleatorio, o mesmo vai ser armazenado em $4.
    	syscall
	add $15, $0, $4 #O numero aleatorio vai ser carregado em $14, reg responsavel por armazenar a direção do fantasma
	#O numero aleatorio gerado vai vai o programa pular pra direção correspondente
	beq $15, 0, direita3
	beq $15, 1, esquerda3
	beq $15, 2, cima3
	beq $15, 3, baixo3
	
moveGhost4:
	#Salva o endereço do jal para não bugar com os jals seguintes
	add $17, $0, $31
	#Reseta o array pra verificar o que há armazenado no centro do fantasma
	lui $8, 0x1001
	add $8, $8, $23
	lw $12, 65024($8)
	beq $12, 0xFF00FF, mudaDirecao4 #Se encontrar a cor rosa pula para a "função" que define uma nova direção
	#O numero aleatorio gerado vai vai o programa pular pra direção correspondente
	beq $16, 0, direita4
	beq $16, 1, esquerda4
	beq $16, 2, cima4
	beq $16, 3, baixo4

direita4:
	#Reseta o array pra verificar o que há armazenado 4 pixels a direita do fantasma
	lui $8, 0x1001
	add $8, $8, $23
	lw $12, 20($8)
	beq $12, 0x0000FF, mudaDirecao4 #Se encontrar a cor azul pula para a "função" que define uma nova direção
	lui $8, 0x1001
	jal apagaGhost4
	addi $23, $23, 4 #direita
	jal ghost4
	add $4, $0, $18 #Dificuldade - delay
	addi $2, $0, 32
	syscall
	jr $17
esquerda4:
	#Reseta o array pra verificar o que há armazenado 4 pixels a esquerda do fantasma
	lui $8, 0x1001
	add $8, $8, $23
	lw $12, -20($8)
	beq $12, 0x0000FF, mudaDirecao4 #Se encontrar a cor azul pula para a "função" que define uma nova direção
	lui $8, 0x1001
	jal apagaGhost4
	addi $23, $23, -4 #esquerda
	jal ghost4
	add $4, $0, $18 #Dificuldade - delay
	addi $2, $0, 32
	syscall
	jr $17
cima4:	
	#Reseta o array pra verificar o que há armazenado 5 pixels acima do fantasma
	lui $8, 0x1001
	add $8, $8, $23
	lw $12, -2560($8)
	beq $12, 0x0000FF, mudaDirecao4 #Se encontrar a cor azul pula para a "função" que define uma nova direção
	lui $8, 0x1001
	jal apagaGhost4
	addi $23, $23, -512 #cima
	jal ghost4
	add $4, $0, $18 #Dificuldade - delay
	addi $2, $0, 32
	syscall
	jr $17
baixo4:
	#Reseta o array pra verificar o que há armazenado 5 pixels abaixo do fantasma
	lui $8, 0x1001
	add $8, $8, $23
	lw $12, 2560($8)
	beq $12, 0x0000FF, mudaDirecao4 #Se encontrar a cor azul pula para a "função" que define uma nova direção
	lui $8, 0x1001
	jal apagaGhost4
	addi $23, $23, 512 #baixo
	jal ghost4
	add $4, $0, $18 #Dificuldade - delay
	addi $2, $0, 32
	syscall
	jr $17

mudaDirecao4:
	addi $5, $0, 4  #Define a quantidade de número possíveis, 0..3 = 4 possibilidades.
    	addi $2, $0, 42  #Syscall para gerar um numero aleatorio, o mesmo vai ser armazenado em $4.
    	syscall
	add $16, $0, $4 #O numero aleatorio vai ser carregado em $16, reg responsavel por armazenar a direção do fantasma
	#O numero aleatorio gerado vai vai o programa pular pra direção correspondente
	beq $16, 0, direita4
	beq $16, 1, esquerda4
	beq $16, 2, cima4
	beq $16, 3, baixo4
	
#Apenas para fim de testes
sai:	
	addi $2, $0, 10
	syscall

#--------------------------------------------------------------------------
#	INICIO SCRIPTADO
#--------------------------------------------------------------------------
script:
	#Ordem de movimento: ghost2 > ghost1 > ghost3 > ghost4
	addi $13, $0, 1 #Define o movimento inicial do ghost2 como esquerda
	addi $14, $0, 0 #Define o movimento inicial do ghost2 como direita
	addi $15, $0, 1 #Define o movimento inicial do ghost2 como esquerda
	addi $16, $0, 0 #Define o movimento inicial do ghost2 como direita
	#Define os primeiros movimentos para remover os fantamas da jaula
	
	addi $11, $0, 0
move1:	beq $11, 6, saiMove1
	jal apagaGhost2
	add $21, $21, -512
	jal ghost2
	add $4, $0, $18
	addi $2, $0, 32
	syscall
	addi $11, $11, 1
	j move1
	
saiMove1:
	addi $11, $0, 0
move2:	beq $11, 6, saiMove2
	jal apagaGhost1
	add $20, $20, 4
	jal ghost1
	add $4, $0, $18
	addi $2, $0, 32
	syscall
	
	jal apagaGhost2
	add $21, $21, -512
	jal ghost2
	add $4, $0, $18
	addi $2, $0, 32
	syscall
	addi $11, $11, 1
	j move2

saiMove2:
	addi $11, $0, 0
move3:	beq $11, 2, saiMove3
	jal apagaGhost1
	add $20, $20, 4
	jal ghost1
	add $4, $0, $18
	addi $2, $0, 32
	syscall
	
	jal moveGhost2
	addi $11, $11, 1
	j move3
	
saiMove3:
	addi $11, $0, 0
move4:	beq $11, 4, saiMove4
	jal apagaGhost1
	add $20, $20, -512
	jal ghost1
	add $4, $0, $18
	addi $2, $0, 32
	syscall
	
	jal moveGhost2
	addi $11, $11, 1
	j move4
	
saiMove4:
	addi $11, $0, 0
move5:	beq $11, 5, saiMove5
	jal apagaGhost1
	add $20, $20, -512
	jal ghost1
	add $4, $0, $18
	addi $2, $0, 32
	syscall
	
	jal apagaGhost3
	add $22, $22, -4
	jal ghost3
	add $4, $0, $18
	addi $2, $0, 32
	syscall
	
	jal moveGhost2
	addi $11, $11, 1
	j move5
	
saiMove5:
	addi $11, $0, 0
move6:	beq $11, 3, saiMove6
	jal apagaGhost1
	add $20, $20, -512
	jal ghost1
	add $4, $0, $18
	addi $2, $0, 32
	syscall
	
	jal apagaGhost3
	add $22, $22, -4
	jal ghost3
	add $4, $0, $18
	addi $2, $0, 32
	syscall

	jal apagaGhost4
	add $23, $23, -4
	jal ghost4
	add $4, $0, $18
	addi $2, $0, 32
	syscall
	
	jal moveGhost2
	addi $11, $11, 1
	j move6
	
saiMove6:	
	jal moveGhost1
	
	jal apagaGhost3
	add $22, $22, -4
	jal ghost3
	add $4, $0, $18
	addi $2, $0, 32
	syscall

	jal apagaGhost4
	add $23, $23, -4
	jal ghost4
	add $4, $0, $18
	addi $2, $0, 32
	syscall

	addi $11, $0, 0
move7:	beq $11, 12, saiMove7	
	jal moveGhost2
	jal moveGhost1
	
	jal apagaGhost3
	add $22, $22, -512
	jal ghost3
	add $4, $0, $18
	addi $2, $0, 32
	syscall

	jal apagaGhost4
	add $23, $23, -4
	jal ghost4
	add $4, $0, $18
	addi $2, $0, 32
	syscall
	addi $11, $11, 1
	j move7

saiMove7:
	jal moveGhost2
	jal moveGhost1
	jal moveGhost3

	jal apagaGhost4
	add $23, $23, -4
	jal ghost4
	add $4, $0, $18
	addi $2, $0, 32
	syscall

	addi $11, $0, 0
move8:	beq $11, 12, saiMove8
	jal moveGhost2
	jal moveGhost1
	jal moveGhost3

	jal apagaGhost4
	add $23, $23, -512
	jal ghost4
	add $4, $0, $18
	addi $2, $0, 32
	syscall
	addi $11, $11, 1
	j move8
	
saiMove8:
	#Fechar jaula dos fantasmas
	lui $8, 0x1001
	addi $8, $8, 28384
	addi $9, $0, 0x0000FF #Azul
	addi $11, $0, 0
closeCage:
	beq $11, 7, saiCloseCage
	sw $9, 0($8)
	addi $8, $8, 4
	addi $11, $11, 1
	j closeCage
	
saiCloseCage:	
	j main

#--------------------------------------------------------------------------
#	INICIALIZAÇÃO DAS BARREIRAS DO CENARIO
#--------------------------------------------------------------------------
barreira1:
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

saiB28:	lui $8, 0x1001
	addi $8, $8, 5164
	jr $31
	
barreira2:
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
	jr $31

barreira3:
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
	jr $31
	
barreira4:
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

saiB42:	addi $8, $8, -508
	addi $11, $0, 0

b43:	beq $11, 11, saiB43
	sw $9, 0($8)
	addi $8, $8, 4
	addi $11, $11, 1
	j b43

saiB43:	sw $9, 512($8)
	addi $8, $8, 1020
	addi $11, $0, 0

b44:	beq $11, 12, saiB44
	sw $9, 0($8)
	addi $8, $8, -4
	addi $11, $11, 1
	j b44

saiB44:	addi $8, $8, 516
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
	jr $31

barreira5:
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
	jr $31

barreira6:
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
	jr $31	

barreira7:
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
	jr $31

barreira8:
	addi $11, $0, 0

b64:	beq $11, 34, saiB64
	sw $9, 0($8)
	addi $8, $8, 4
	addi $11, $11, 1
	j b64

saiB64:	addi $8, $8, 512
	addi $11, $0, 0

b65:	beq $11, 4, saiB65
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

b67:	beq $11, 11, saiB67
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

b69:	beq $11, 12, saiB69
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

b71:	beq $11, 4, saiB71
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

saiB76:	jr $31

barreira9:
	lui $8, 0x1001
	addi $8, $8, 14704
	addi $11, $0, 0

b77:	beq $11, 4, saiB77
	sw $9, 0($8)
	addi $8, $8, 4
	addi $11, $11, 1
	j b77

saiB77:	addi $8, $8, 512
	addi $11, $0, 0

b78:	beq $11, 28, saiB78
	sw $9, 0($8)
	addi $8, $8, 512
	addi $11, $11, 1
	j b78

saiB78:	addi $8, $8, -4
	addi $11, $0, 0

b79:	beq $11, 4, saiB79
	sw $9, 0($8)
	addi $8, $8, -4
	addi $11, $11, 1
	j b79

saiB79:	addi $8, $8, -512
	addi $11, $0, 0

b80:	beq $11, 12, saiB80
	sw $9, 0($8)
	addi $8, $8, -512
	addi $11, $11, 1
	j b80

saiB80:	addi $8, $8, 508
	addi $11, $0, 0

b81:	beq $11, 11, saiB81
	sw $9, 0($8)
	addi $8, $8, -4
	addi $11, $11, 1
	j b81

saiB81:	sw $9, -512($8)
	addi $8, $8, -1020
	addi $11, $0, 0

b82:	beq $11, 12, saiB82
	sw $9, 0($8)
	addi $8, $8, 4
	addi $11, $11, 1
	j b82

saiB82:	addi $8, $8, -516
	addi $11, $0, 0

b83:	beq $11, 14, saiB83
	sw $9, 0($8)
	addi $8, $8, -512
	addi $11, $11, 1
	j b83

saiB83: addi $8, $8, 32320
	addi $11, $0, 0

b84:	beq $11, 10, saiB84
	sw $9, 0($8)
	addi $8, $8, 4
	addi $11, $11, 1
	j b84

saiB84:	sw $9, 512($8)
	addi $8, $8, 1020
	addi $11, $0, 0

b85:	beq $11, 9, saiB85
	sw $9, 0($8)
	addi $8, $8, -4
	addi $11, $11, 1
	j b85

saiB85:	addi $8, $8, 516
	addi $11, $0, 0

b86:	beq $11, 11, saiB86
	sw $9, 0($8)
	addi $8, $8, 512
	addi $11, $11, 1
	j b86

saiB86:	sw $9, -4($8)
	addi $8, $8, -520
	addi $11, $0, 0

b87:	beq $11, 13, saiB87
	sw $9, 0($8)
	addi $8, $8, -512
	addi $11, $11, 1
	j b87

saiB87:	addi $8, $8, 12172
	addi $11, $0, 0

b88:	beq $11, 15, saiB88
	sw $9, 0($8)
	addi $8, $8, 4
	addi $11, $11, 1
	j b88

saiB88:	addi $8, $8, -516
	addi $11, $0, 0

b89:	beq $11, 11, saiB89
	sw $9, 0($8)
	addi $8, $8, -512
	addi $11, $11, 1
	j b89

saiB89:	addi $8, $8, 4
	addi $11, $0, 0

b90:	beq $11, 4, saiB90
	sw $9, 0($8)
	addi $8, $8, 4
	addi $11, $11, 1
	j b90

saiB90:	addi $8, $8, 512
	addi $11, $0, 0

b91:	beq $11, 12, saiB91
	sw $9, 0($8)
	addi $8, $8, 512
	addi $11, $11, 1
	j b91

saiB91:	addi $8, $8, -508
	addi $11, $0, 0

b92:	beq $11, 20, saiB92
	sw $9, 0($8)
	addi $8, $8, 4
	addi $11, $11, 1
	j b92

saiB92:	sw $9, 512($8)
	addi $8, $8, 1020
	addi $11, $0, 0

b93:	beq $11, 40, saiB93
	sw $9, 0($8)
	addi $8, $8, -4
	addi $11, $11, 1
	j b93

saiB93:	sw $9, -512($8)
	addi $8, $8, -19572
	jr $31

barreira10:
	addi $11, $0, 0

b94:	beq $11, 34, saiB94
	sw $9, 0($8)
	addi $8, $8, 4
	addi $11, $11, 1
	j b94

saiB94:	sw $9, 512($8)
	addi $8, $8, 1020
	addi $11, $0, 0

b95:	beq $11, 15, saiB95
	sw $9, 0($8)
	addi $8, $8, -4
	addi $11, $11, 1
	j b95

saiB95:	addi $8, $8, 516
	addi $11, $0, 0

b96:	beq $11, 11, saiB96
	sw $9, 0($8)
	addi $8, $8, 512
	addi $11, $11, 1
	j b96

saiB96:	addi $8, $8, -4
	addi $11, $0, 0

b97:	beq $11, 4, saiB97
	sw $9, 0($8)
	addi $8, $8, -4
	addi $11, $11, 1
	j b97

saiB97:	addi $8, $8, -512
	addi $11, $0, 0

b98:	beq $11, 12, saiB98
	sw $9, 0($8)
	addi $8, $8, -512
	addi $11, $11, 1
	j b98

saiB98:	addi $8, $8, 508
	addi $11, $0, 0

b99:	beq $11, 14, saiB99
	sw $9, 0($8)
	addi $8, $8, -4
	addi $11, $11, 1
	j b99

saiB99:	sw $9, -512($8)

#TEMPORARIO BARREIRAS EXTRAS
	lui $8, 0x1001
	addi $8, $8, 29696
	addi $11, $0, 0
bt01:	beq $11, 9, saiBt01
	sw $9, 0($8)
	addi $8, $8, 512
	addi $11, $11, 1
	j bt01

saiBt01:lui $8, 0x1001
	addi $8, $8, 30204
	addi $11, $0, 0
bt02:	beq $11, 9, saiBt02
	sw $9, 0($8)
	addi $8, $8, 512
	addi $11, $11, 1
	j bt02
saiBt02:################APAGAR / TEMPORARIO
	jr $31

#--------------------------------------------------------------------------
#	INICIALIZAÇÃO DAS COINS DO CENARIO
#--------------------------------------------------------------------------

#COMO FAZER:
#1° construir as moedas no cenario primario
#2° qnd pronto, adicionar 65536 ao $8 assim que for feito o lui, dessa forma as moedas serão construidas no espelho
#3° construir as moedas no cenario primeiro a partir do espelho
#4° sempre que o pac man comer uma moeda a referencia no espelho deve ser apagada
#5° antes das moedas serem reconstruidas, o codigo deve primeiro verificar o espelho

coins:
	addi $9, $0, 0xFFFFFF #Branco
	lui $8, 0x1001
	addi $8, $8, 2604
	addi $11, $0, 0

c01:	beq $11, 15, saiC01
	sw $9, 0($8)
	addi $8, $8, 12
	addi $11, $11, 1
	j c01

saiC01:	addi $8, $8, 72
	addi $11, $0, 0

c02:	beq $11, 17, saiC02
	sw $9, 0($8)
	addi $8, $8, 12
	addi $11, $11, 1
	j c02

saiC02:










	jr $31
	
#--------------------------------------------------------------------------
#	INICIALIZAÇÃO DO PAC-MAN
#--------------------------------------------------------------------------	
pacMan:
	lui $8, 0x1001
	addi $8, $8, 2580
	addi $9, $0, 0xFFFF00 #Amarelo
	
	#Desenho o Pac-Man com base no valor do seu centro
	sw $9, -2056($8)
	sw $9, -2052($8)
	sw $9, -2048($8)
	sw $9, -2044($8)
	sw $9, -2040($8)
	sw $9, -1548($8)
	sw $9, -1544($8)
	sw $9, -1540($8)
	sw $9, -1536($8)
	sw $9, -1532($8)
	sw $9, -1528($8)
	sw $9, -1524($8)
	sw $9, -1040($8)
	sw $9, -1036($8)
	sw $9, -1032($8)
	sw $9, -1028($8)
	sw $9, -1024($8)
	sw $9, -1020($8)
	sw $9, -1016($8)
	sw $9, -1012($8)
	sw $9, -1008($8)
	sw $9, -528($8)
	sw $9, -524($8)
	sw $9, -520($8)
	sw $9, -516($8)
	sw $9, -512($8)
	sw $9, -508($8)
	sw $9, -504($8)
	sw $9, -16($8)
	sw $9, -12($8)
	sw $9, -8($8)
	sw $9, -4($8)
	sw $9, 0($8)
	sw $9, 496($8)
	sw $9, 500($8)
	sw $9, 504($8)
	sw $9, 508($8)
	sw $9, 512($8)
	sw $9, 516($8)
	sw $9, 520($8)
	sw $9, 1008($8)
	sw $9, 1012($8)
	sw $9, 1016($8)
	sw $9, 1020($8)
	sw $9, 1024($8)
	sw $9, 1028($8)
	sw $9, 1032($8)
	sw $9, 1036($8)
	sw $9, 1040($8)
	sw $9, 1524($8)
	sw $9, 1528($8)
	sw $9, 1532($8)
	sw $9, 1536($8)
	sw $9, 1540($8)
	sw $9, 1544($8)
	sw $9, 1548($8)
	sw $9, 2040($8)
	sw $9, 2044($8)
	sw $9, 2048($8)
	sw $9, 2052($8)
	sw $9, 2056($8)
	
	jr $31

#--------------------------------------------------------------------------
#	INICIALIZAÇÃO DOS FANTASMAS
#--------------------------------------------------------------------------
ghost1:
	lui $8, 0x1001
	add $8, $8, $20
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
	add $8, $8, $22
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
	add $8, $8, $23
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
apagaGhost1:
	lui $8, 0x1001
	add $8, $8, $20 #Recebe a posição anterior do fantasma
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

apagaGhost3:
	lui $8, 0x1001
	add $8, $8, $22 #Recebe a posição anterior do fantasma
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
	
apagaGhost4:
	lui $8, 0x1001
	add $8, $8, $23 #Recebe a posição anterior do fantasma
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
	addi $8, $8, 65024
	addi $9, $0, 0xFF00FF

	sw $9, 2580($8)
	sw $9, 2664($8)
	sw $9, 2772($8)
	sw $9, 2856($8)
	sw $9, 2964($8)
	sw $9, 3048($8)
	sw $9, 11796($8)
	sw $9, 11880($8)
	sw $9, 11940($8)
	sw $9, 11988($8)
	sw $9, 12072($8)
	sw $9, 12120($8)
	sw $9, 12180($8)
	sw $9, 12264($8)
	sw $9, 21012($8)
	sw $9, 21096($8)
	sw $9, 19620($8)
	sw $9, 19668($8)
	sw $9, 19752($8)
	sw $9, 19800($8)
	sw $9, 21396($8)
	sw $9, 21480($8)
	sw $9, 25764($8)
	sw $9, 25812($8)
	sw $9, 25896($8)
	sw $9, 25944($8)
	sw $9, 31848($8)
	sw $9, 31908($8)
	sw $9, 32088($8)
	sw $9, 32148($8)
	sw $9, 38052($8)
	sw $9, 38232($8)
	sw $9, 44052($8)
	sw $9, 44136($8)
	sw $9, 44196($8)
	sw $9, 44256($8)
	sw $9, 44316($8)
	sw $9, 44376($8)
	sw $9, 44436($8)
	sw $9, 44520($8)
	sw $9, 50196($8)
	sw $9, 50232($8)
	sw $9, 50280($8)
	sw $9, 50340($8)
	sw $9, 50400($8)
	sw $9, 50460($8)
	sw $9, 50520($8)
	sw $9, 50580($8)
	sw $9, 50628($8)
	sw $9, 50664($8)
	sw $9, 56340($8)
	sw $9, 56376($8)
	sw $9, 56424($8)
	sw $9, 56484($8)
	sw $9, 56544($8)
	sw $9, 56604($8)
	sw $9, 56664($8)
	sw $9, 56724($8)
	sw $9, 56772($8)
	sw $9, 56808($8)
	sw $9, 62484($8)
	sw $9, 62688($8)
	sw $9, 62748($8)
	sw $9, 62952($8)
	jr $31
