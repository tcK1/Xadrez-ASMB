.globl main
main:
	li $a0, -1	# contador de linha
	li $a1, 0	# contador de coluna
	li $a2, 0	# contador de pontos
	
	la $a3, $board		# aponta para o inicio da lista de linhas (array 2d, matriz)
	subi $a3, $a3, 4	# tira 4 para ser adicionado a cada passagem de laco
	
loopline:
	addi $a0, $a0, 1	# incrementa o contador (coloca ele como 0 na primeira passagem)
	bgt $a0, 7, end		# passa para o final caso tenha terminado todas iteracoes
	li $a1, 0		# reseta o contador de colunas
	addi $a3, $a3, 4	# incrementa o valor do endereco para passar para a proxima palavra
	ld $t1, ($a3)		# aponta para o inicio da linha
	
loopcolumn:
	bgt  $a1, 7, loopline	# sai do laco caso tenha acabado todas as colunas
		
	ld $s0, ($t1)		# pega o endereco do valor do elemento
	ld $t3, ($s0)		# pega o valor do endereco em si
	
	la $t5, $peao		# aponta para onde a string de peao esta
	ld $t6, ($t5)
	beq $t3, $t6, peao
	la $t5, $cavalo		# aponta para onde a string de cavalo esta
	ld $t6, ($t5)
	beq $t3, $t6, cavalo
	la $t5, $bispo		# aponta para onde a string de bispo esta
	ld $t6, ($t5)
	beq $t3, $t6, bispo
	la $t5, $torre		# aponta para onde a string de torre esta
	ld $t6, ($t5)
	beq $t3, $t6, torre
	la $t5, $rainha		# aponta para onde a string de rainha esta
	ld $t6, ($t5)
	beq $t3, $t6, rainha
	la $t5, $rei		# aponta para onde a string de rei esta
	ld $t6, ($t5)
	beq $t3, $t6, rei
	la $t5, $branco		# aponta para onde a string de branco esta
	ld $t6, ($t5)
	bne $t3, $t6, error	# se nao for nem branco nao deveria rodar
	j nextcolumn
	
peao:	
	bne $t4, $t7, error # verifica se a segunda parte e igual
	addi $a2, $a2, 1
	j nextcolumn
cavalo:	
	bne $t4, $t7, error # verifica se a segunda parte e igual
	addi $a2, $a2, 3
	j nextcolumn
bispo:	
	bne $t4, $t7, error # verifica se a segunda parte e igual
	addi $a2, $a2, 3
	j nextcolumn
torre:	
	bne $t4, $t7, error # verifica se a segunda parte e igual
	addi $a2, $a2, 5
	j nextcolumn
rainha:	
	bne $t4, $t7, error # verifica se a segunda parte e igual
	addi $a2, $a2, 10
	j nextcolumn
rei:	
	bne $t4, $t7, error # verifica se a segunda parte e igual
	addi $a2, $a2, 50
	j nextcolumn

nextcolumn:
	addi $t1, $t1, 4 # passa para o proximo valor
	addi $a1, $a1, 1 # acrescenta um no contador
	j loopcolumn
end:	
        la $a0, ($a2)
        li $v0, 1	# imprime
        syscall
        li $v0, 10	# termina
        syscall
.text
error:
	la $a0, $erro
	li $v0, 4	# imprime
        syscall
        li $v0, 10	# termina
        syscall
.data
$line1: 
	.word $torre,  $cavalo, $bispo,  $rei,    $rainha, $bispo,  $cavalo, $torre
$line2: 
	.word $peao,   $peao,   $peao,   $peao,   $peao,   $peao,   $peao,   $peao
$line3: 
	.word $branco, $branco, $branco, $branco, $branco, $branco, $branco, $branco
$line4: 
	.word $branco, $branco, $branco, $branco, $branco, $branco, $branco, $branco
$line5: 
	.word $branco, $branco, $branco, $branco, $branco, $branco, $branco, $branco
$line6: 
	.word $branco, $branco, $branco, $branco, $branco, $branco, $branco, $branco
$line7: 
	.word $peao,   $peao,   $peao,   $peao,   $peao,   $peao,   $peao,   $peao
$line8: 
	.word $torre,  $cavalo, $bispo,  $rainha, $rei,    $bispo,  $cavalo, $torre
$board: 
	.word $line1, $line2, $line3, $line4, $line5, $line6, $line7, $line8 # lista de enderecos (forma a matriz 2d)
$erro: 
	.asciiz "\nerror!\n"
$peao: 
	.align 3
	.ascii "peão"
$cavalo: 
	.align 3
	.ascii "cavalo"
$bispo: 
	.align 3
	.ascii "bispo"
$torre: 
	.align 3
	.ascii "torre"
$rainha: 
	.align 3
	.ascii "rainha"
$rei: 
	.align 3
	.ascii "rei"
$branco: 
	.align 3
	.ascii ""
