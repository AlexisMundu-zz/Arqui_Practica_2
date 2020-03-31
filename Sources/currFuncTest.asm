#Description: Design a recursive program in assembly language that can solve the Hanoi towers problem.
.data
.text
main:
	addi $s0, $zero, 8	#s0 initialize the number of towers
	ori $s1, $zero, 4097	#add the address 1001
	sll $s1, $s1, 16	#shift to get the first address of memory
	add $s2, $zero, $s1
	ori $s2, $s2, 64	#initialize address for third tower
	add $s3, $zero, $s1
	ori $s3, $s3, 32	#initialize address for second tower
	
	sw $s0, 0($sp)		#store n
	sw $s1, 4($sp)		#store origin
	sw $s2, 8($sp)		#store destination
	sw $s3, 12($sp)		#store auxiliary
	
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $t3, 12($sp)
	
	add $s0, $zero, $s0
	add $s1, $zero, $s1
	add $s2, $zero, $s2
	add $s3, $zero, $s3
	
	
end: