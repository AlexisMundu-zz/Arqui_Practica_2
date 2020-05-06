.data
	.word 	9, 1,	8, 2, 	7, 3,
		6, 4, 	5, 5, 	4, 6,
		3, 7, 	2, 8, 	1, 9,

.text
	lui $t0, 0x00001001	# Memory start
	addi $s0, $zero, 3	# M = ROWS
	addi $s1, $zero, 3	# N = COLS
	
	# t1 will be starting point for the tranposed matrix
	addi $t2, $zero, 8
	mul $t1, $s0, $t2	# M * (word * 2)
	mul $t1, $t1, $s1	# N * M * (word * 2)
	add $t1, $t0, $t1
	
	add $t2, $zero, $s0	# i
loop:
	addi $t2, $t2, -1
	add $t3, $zero, $s1	# j
innerLoop:	# We go through every column
	addi $t3, $t3, -1
	add $t5, $zero, 8
	mul $t5, $t5, $t3
	add $t5, $t5, $t0
	
	addi $t6, $zero, 8
	mul $t6, $s1, $t6	# N * (word * 2)
	mul $t6, $t6, $t3
	add $t6, $t6, $t1
	
	lw $t4, 0($t5)		# real part
	sw $t4, 0($t6)		
	lw $t4, 4($t5)		# imaginary part
	mul $t4, $t4, -1	
	sw $t4, 4($t6)
	
	bne $t3, $zero, innerLoop
	# end_innerLoop
	# We move to the next row
	addi $t4, $zero, 8
	mul $t4, $s1, $t4	# N * (word * 2)
	add $t0, $t0, $t4	
	
	addi $t4, $zero, 8
	add $t1, $t1, $t4
	bne $t2, $zero, loop
	