#Ex07
.data
	.word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 #Inicializa o vetor
.text
	lui $20, 0x1001 #Indice do vetor
	addi $9, $0, 0 #Indice dos fors
	addi $10, $0, 0 #Armazena o maior elemento
	addi $11, $0, 0 #Armazena a posição do maior elemento

for1:	beq $9, 10 for2 #Verifica se o indice já chegou em 10, se sim pule para for2
	addi $2, $0, 5 #Syscall para ler inteiro
	syscall
	
	sw $2, 0($20) #Armazena no vetor o valor lido
	addi $20, $20, 4 #Incrementa o indice do vetor
	addi $9, $9, 1 #Incrementa o indice do for
	j for1 #Volta para o inicio do for
	
for2:	beq $9, 0 for3 #Verifica se o indice já chegou em 0, se sim pule para for3
	addi $20, $20, -4 #Subtrai em 4 o valor do indice do vetor, começa subtraindo pois no for anterior a um incremeto a mais antes do final do laço
	lw $8, 0($20) #Armazena o valor do indice atual do vetor em #8
	addi $9, $9, -1 #Subtrai em -1 o valor do indice do for
	bgt $8, $10 if #Verifica se $8 é maior que $10, se for pule para if
	j for2 #Volta para o inicio do for
	
if:	add $10, $0, $8 #Armazena em $10 o valor de $8 (Maior elemento atualmente)
	add $11, $0, $9 #Armazena em $11 o valor de $9 (Posição do maior elemento atualmente)
	j for2 #Volta para o inicio do for
		
for3:	beq $9, 10 end #Verifica se o indice já chegou em 10, se sim pule para end
	lw $8, 0($20) #Armazena o valor do indice atual do vetor em #8
	addi $20, $20, 4 #Incrementa o indice do vetor
	
	add $4, $0, $8
	add $2, $0, 1 #Syscall para imprimir o indice atual do vetor
	syscall
	
	addi $4, $0, 0x20 #Codigo de espaço
	addi $2, $0, 11 #Syscall para imprimir caractere
	syscall
	
	add $9, $9, 1 #Incrementa o indice do for
	j for3

end:	addi $4, $0, 0xA #Codigo de quebra de linha
	addi $2, $0, 11 #Syscall para imprimir caractere
	syscall

	add $4, $0, $10 #Imprime o maior número
	add $2, $0, 1
	syscall
	
	addi $4, $0, 0xA #Codigo de quebra de linha
	addi $2, $0, 11 #Syscall para imprimir caractere
	syscall
	
	add $4, $0, $11 #Imprime a posição do maior número
	add $2, $0, 1
	syscall
	
	addi $2, $0, 10 #Finaliza o programa
	syscall	
