.text
	li $v0, 5 # $v0 recebe codigo para syscall de leitura de inteiros
	syscall #Executa syscall
	move $t0, $v0 #move o valor lido para o reg $t0
	li $t1, 1000 #atribui a $t1 o valor 1000
	
	mult $t0, $t1 #Multiplica os valores de $t0 e $t1
	#mfhi $t1
	mflo $t2 #Move o valor da multiplicação armazenado em lo para $t2
	
	move $a0, $t2 #Armazena em $a0 o valor da multiplicação
	li $v0, 1 # $v0 recebe o código de impressão de inteiros
	syscall  #Executa a syscall