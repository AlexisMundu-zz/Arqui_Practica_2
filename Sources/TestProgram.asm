	.text
	# Initializations
	addi $t0,$zero,2
	addi $t1,$zero,3
	addi $t2,$zero,7
	addi $t3,$zero,1
	addi $s7, $s7, 0
	 
	# Moving values
	add $s0,$t0,$zero
	add $s1,$t1,$zero
	add $s0,$t2,$zero
	add $s4,$t3,$zero
	
	# Basic operations
	add $t3,$t0,$t1
	or  $t4,$t1,$t2
	and $t4,$t1,$t2
	addi $t5,$t4,1
	
	#Sub test
	sub $t3, $t3, $t0 	#5 - 2 = 3
	
	#Andi test
	andi $t5, $t3, 1	#3 & 1 = 1
	andi $t5, $t3, 7	#3 & 7 = 3
	andi $t5, $t3, 7	#3 & 7 = 3
	andi $t5, $t3, 7	#3 & 7 = 3
	andi $t5, $t3, 7	#3 & 7 = 3
	
	#beq
	addi $s0, $zero, 50
	addi $s1, $zero, 50
	beq $s0, $s1, anotherBranch
	addi $t0, $zero, 200	#It´s not going to show 200 because it will be ignored
anotherBranch:
	addi $t0, $zero, 64
	beq $t1, $zero, end

	#bne test
	addi $s0, $zero, 500
	addi $s1, $zero, 500
	bne $s0, $s1, bneBranch
	addi $t0, $zero, 200	#It´s going to show 200 
bneBranch:
	addi $t0, $zero, 516
	bne $t1, $zero, end
			
	# 2's complement of register $t0
	nor $at,$t0,$t0
	addi $t0,$at,1
	
	# Move register $t0 to $t6
	add $t6,$zero,$t0
	
	# Swap registers $t1 and $t2
	addi $t0,$zero,5
	addi  $t8,$zero, 10
	
	end:
	
