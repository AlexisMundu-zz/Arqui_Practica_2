#Description: Design a recursive program in assembly language that can solve the Hanoi towers problem.
.data
.text
main:
	addi $s0, $zero, 3	#s0 initialize the number of towers
	
	sw $s0, 0($sp)		#store n
	
	lw $t0, 0($sp)
	
	add $s0, $zero, $s0
	
	j otraRama
ultima:	
	addi $s0, $zero, 5000 #	No aparecerá
	j end
otraRama:
	addi $s0, $zero, 50
	addi $s1, $zero, 50
	beq $s0, $s1, ultima
end:
