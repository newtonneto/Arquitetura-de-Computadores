#Ex19
.data
	div3: .asciiz "Divisivel por 3"
	div5: .asciiz "Divisivel por 5"
	divA: .asciiz "Não divisivel por 3 e 5"
.text
	#Recebe o numero
	li $2, 5 #Syscall para ler inteiro
	syscall
	move $t1, $2 #Carrega em $t1 o valor lido
	
	#Divide por 3
	li $t2, 3 #Carrega o divisor 3 em $t2
	div $t1, $t2 #Divide $t1 por 3
	mfhi $t2 #Armazena em $t2 o resultado da divisão (direita da virgula)
	
	#Verifica se o resultado de $t2 é maior que 0
	sgt $t4, $t2, $0 #Se $t2 for maior que 0 $t4 recebe 1, do contrario 0
	
	#Verifica resultado da condicao anterior
	beq $t4, 0 L1
	
	#Divide por 5
L0:	li $t2, 5 #Carrega o divisor 3 em $t2
	div $t1, $t2 #Divide $t1 por 5
	mfhi $t2 #Armazena em $t2 o resultado da divisão (direita da virgula)
	
	#Verifica se o resultado de $t2 é maior que 0
	sgt $t4, $t2, $0 #Se $t2 for maior que 0 $t4 recebe 1, do contrario 0
	
	#Verifica resultado da condicao anterior
	beq $t4, 0 L2
	beq $t5, 1 end
	
	#Imprime nao divisivel por 3 e por 5
	la $4, divA #Carrega em $4 a tring divA
	li $2, 4 #Syscall para imprimir string
	syscall
	j end
	
	#Imprime divisivel por 3
L1:	la $4, div3 #Carrega em $4 a tring div3
	li $2, 4 #Syscall para imprimir string
	syscall
	
	#Quebra de linha
	li $4, 0xA #Codigo de quebra de linha
	li $2, 11 #Syscall para imprimir caractere
	syscall
	li $t5, 1 #Variavel auxiliar para ultima verificacao
	j L0

	#Imprime divisivel por 5	
L2:	la $4, div5 #Carrega em $4 a tring div5
	li $2, 4 #Syscall para imprimir string
	syscall

	#Finaliza o programa
end:	li $2, 10 #Syscall para encerrar execucao
	syscall