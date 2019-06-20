#Ex14
.data
	rep: .asciiz "Reprovado"
	rec: .asciiz "Recuperacao"
	apr: .asciiz "Aprovado"
.text
	#Nota1 - Trabalho de laboratorio
	li $2, 5 #Syscall para ler inteiro
	syscall
	move $t1, $2 #Carrega o valor lido no reg $t1
	mul $t1, $t1, 2 #Multiplica $t1 por seu peso 2
	
	#Nota2 - Avaliacao semestral
	li $2, 5 #Syscall para ler inteiro
	syscall
	move $t2, $2 #Carrega o valor lido no reg $t2
	mul $t2, $t2, 3 #Multiplica $t2 por seu peso 3
	
	#Nota3 - Exame final
	li $2, 5 #Syscall para ler inteiro
	syscall
	move $t3, $2 #Carrega o valor lido no reg $t3
	mul $t3, $t3, 5 #Multiplica $t3 por seu peso 5
	
	#Soma as notas
	add $t1, $t1, $t2 #Soma $t1 com $t2 e armazena o resultado em $t1
	add $t1, $t1, $t3 #Soma $t1 com $t3 e armazena o resultado em $t1
	
	#Divide pela soma dos pesos
	li $t2, 10 #Carrega a soma dos pesos em $t2
	div $t1, $t2 #Divide a soma das notas multiplicadas pela soma dos pesos
	mflo $t1 #Armazena o resultado inteiro em $t1
	
	#Condicional reprovado
	li $t3, 30 #Carrega 30 em $t3
	slt $t3, $t1, $t3 #Compara $t1 e $t3, se $t1 for menor $t3 recebe 1, do contrario 0
	beq $t3, 1 L1 #Se $t3 for igual a 1 pule para L1
	
	#Condicional recuperacao
	li $t3, 50 #Carrega 50 em $t3
	slt $t3, $t1, $t3 #Compara $t1 e $t3, se $t1 for menor $t3 recebe 1, do contrario 0
	beq $t3, 1 L2 #Se $t3 for igual a 1 pule para L2
	
	#Imprime aprovado
	move $4, $t1 #Carrega a media em $4
	li $2, 1 #Syscall para imprimir inteiro
	syscall
	
	#Quebra de linha
	li $4, 0xA #Codigo para quebra de linha
	li $2, 11 #Syscall para imprimir caractere
	syscall
	
	la $4, apr #Carrega a string aprovado em $4
	li $2, 4 #Syscall para imprimir string
	syscall
	j end #Pula para o fim do codigo
	
	#Imprime reprovado
L1:	move $4, $t1 #Carrega a media em $4
	li $2, 1 #Syscall para imprimir inteiro
	syscall
	
	#Quebra de linha
	li $4, 0xA #Codigo para quebra de linha
	li $2, 11 #Syscall para imprimir caractere
	syscall
	
	la $4, rep #Carrega a string reprovado em $4
	li $2, 4 #Syscall para imprimir string
	syscall
	j end #Pula para o fim do codigo
	
	#Imprime recuperacao
L2:	move $4, $t1 #Carrega a media em $4
	li $2, 1 #Syscall para imprimir inteiro
	syscall
	
	#Quebra de linha
	li $4, 0xA #Codigo para quebra de linha
	li $2, 11 #Syscall para imprimir caractere
	syscall
	
	la $4, rec #Carrega a string recuperacao em $4
	li $2, 4 #Syscall para imprimir string
	syscall

	#Finaliza execucao
end:	li $2, 10 #Syscall para encerrar execucao
	syscall