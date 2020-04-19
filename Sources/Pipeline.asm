.text

	addi $t0, $zero, 5
	add $zero, $zero, $zero
	add $zero, $zero, $zero
	add $zero, $zero, $zero
	add $t1, $t0, $zero
	beq $t0, $t1, branchEQ
	j end
branchEQ:
	addi $t0, $zero, 5000
	bne $t0, $t1, branchNE
	j end
branchNE: addi $t0, $zero, 1000
end: