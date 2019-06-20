#Ex02
.data
	str1: .asciiz	"calcule raiz"
	str2: .asciiz	"numero invalido"
.text
	li $2, 5 #Syscall para receber um inteiro
	syscall
	move $8, $2 #Carrega o valor recebido no reg $8
	
	slt $9, $8, $0 #Se o valor de $8 for menor que 0 então $9 vai receber 1, do contrario 0
	
	beq $9, $0 igual0 #Verifica se o valor de $9 é igual a 0, se for pula para "igual0", do contrario continua
	
	la $4, str2 #Carrega em $4 a string $str2 caso a afirmação acima for falsa
	li $2, 4 #Syscall para imprimir string
	syscall
	j fim #Pula para o fim do programa
	
igual0:	la $4, str1 #Carrega em $4 a string $str2 caso a afirmação "beq" for verdadeira
	li $2, 4 #Syscall para imprimir string
	syscall
	
fim:	li $2, 10 #Syscall para finalizar programa
	syscall