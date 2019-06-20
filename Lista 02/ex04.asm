#Ex04
.data
	str: .asciiz "raiz quadrada"
.text
	li $2, 5 #Syscall para ler inteiros
	syscall
	move $8, $2 #Carrega o valor lido no reg $8
	
	slt $9, $8, $0 #Verifica se $8 é menor que 0, se for $9 recebe 1, do contrario 0
	
	beq $9, $0 igual0 #Se $9 for igual a 0 o código vai pular para "igual0", do contrario continua
	
	j sair #Finaliza o programa se a condicao acima for falsa
	
igual0:	mul $8, $8, $8 #Multiplica o valor do reg $8 por $8 e armazena em $8
	move $4, $8 #Carrega o valor de $8 em $4
	li $2, 1 #Syscall para imprimir inteiros
	syscall
	
	li $4, 0xA #Carrega $4 com o código de quebra de linha
	li $2, 11 #Syscall para imprimir caractere
	syscall
	
	la $4, str #Carrega a string str em $4
	li $2, 4 #Syscall para imprimir strings
	syscall
	
sair:	li $2, 10 #Syscall para encerrar execucao
	syscall