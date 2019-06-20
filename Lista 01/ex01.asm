.text
	addi $2, $0, 5 #Syscall para ler um número
	syscall #Executa a syscall
	add $9, $0, $2 #Atribui o valor da syscall anterior ao registador $9
	add $4, $0, $9 #Atribui ao registrador $4 o valor contido no registrador $9
	addi $2, $0, 1 #Usa a syscall de código 1 para imprimir o valor em $4
	syscall #Executa a syscall