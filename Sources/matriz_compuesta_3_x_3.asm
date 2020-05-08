
.text
	add $zero, $zero, $zero
	lui $t0, 0x00001001	# Memory start
	lui $t1, 0x00001001	# Memory start
	addi $t1, $t1, 72
	
	addi $t4, $zero, 9
	sw $t4, 0($t0)
	addi $t5, $zero, 1
	sw $t5, 4($t0)
	addi $t6, $zero, 8
	sw $t6, 8($t0)
	addi $t7, $zero, 2
	sw $t7, 12($t0)
	addi $t4, $zero, 7
	sw $t4, 16($t0)
	addi $t5, $zero, 3
	sw $t5, 20($t0)
	
	addi $t6, $zero, 6
	sw $t6, 24($t0)
	addi $t7, $zero, 4
	sw $t7, 28($t0)
	addi $t4, $zero, 5
	sw $t4, 32($t0)
	addi $t5, $zero, 5
	sw $t5, 36($t0)
	addi $t6, $zero, 4
	sw $t6, 40($t0)
	addi $t7, $zero, 6
	sw $t7, 44($t0)
	
	addi $t4, $zero, 3
	sw $t4, 48($t0)
	addi $t5, $zero, 7
	sw $t5, 52($t0)
	addi $t6, $zero, 2
	sw $t6, 56($t0)
	addi $t7, $zero, 8
	sw $t7, 60($t0)
	addi $t4, $zero, 1
	sw $t4, 64($t0)
	addi $t5, $zero, 9
	sw $t5, 68($t0)
	
	
	lw $t2, 0($t0)
	add $zero, $zero, $zero
	sw $t2, 0($t1)
	lw $t2, 4($t0)
	add $zero, $zero, $zero
	nor $t2, $t2, $zero
	addi $t2, $t2, 1
	sw $t2, 4($t1)
	
	lw $t2, 8($t0)
	add $zero, $zero, $zero
	sw $t2, 24($t1)
	lw $t2, 12($t0)
	add $zero, $zero, $zero
	nor $t2, $t2, $zero
	addi $t2, $t2, 1
	sw $t2, 28($t1)
	
	lw $t2, 16($t0)
	add $zero, $zero, $zero
	sw $t2, 48($t1)
	lw $t2, 20($t0)
	add $zero, $zero, $zero
	nor $t2, $t2, $zero
	addi $t2, $t2, 1
	sw $t2, 52($t1)
	
	lw $t2, 24($t0)
	add $zero, $zero, $zero
	sw $t2, 8($t1)
	lw $t2, 28($t0)
	add $zero, $zero, $zero
	nor $t2, $t2, $zero
	addi $t2, $t2, 1
	sw $t2, 12($t1)
	
	lw $t2, 32($t0)
	add $zero, $zero, $zero
	sw $t2, 32($t1)
	lw $t2, 36($t0)
	add $zero, $zero, $zero
	nor $t2, $t2, $zero
	addi $t2, $t2, 1
	sw $t2, 36($t1)
	
	lw $t2, 40($t0)
	add $zero, $zero, $zero
	sw $t2, 56($t1)
	lw $t2, 44($t0)
	add $zero, $zero, $zero
	nor $t2, $t2, $zero
	addi $t2, $t2, 1
	sw $t2, 60($t1)
	
	lw $t2, 48($t0)
	add $zero, $zero, $zero
	sw $t2, 16($t1)
	lw $t2, 52($t0)
	add $zero, $zero, $zero
	nor $t2, $t2, $zero
	addi $t2, $t2, 1
	sw $t2, 20($t1)
	
	lw $t2, 56($t0)
	add $zero, $zero, $zero
	sw $t2, 40($t1)
	lw $t2, 60($t0)
	add $zero, $zero, $zero
	nor $t2, $t2, $zero
	addi $t2, $t2, 1
	sw $t2, 44($t1)
	
	lw $t2, 64($t0)
	add $zero, $zero, $zero
	sw $t2, 64($t1)
	lw $t2, 68($t0)
	add $zero, $zero, $zero
	nor $t2, $t2, $zero
	addi $t2, $t2, 1
	sw $t2, 68($t1)
end:
