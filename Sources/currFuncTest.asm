#Description: Design a recursive program in assembly language that can solve the Hanoi towers problem.
.data
.text
main:
	addi $t0, $zero, 5000
	addi $t0, $zero, 4000
	addi $t0, $zero, 3000
	jal otro
	addi $t0, $zero, 5000
	jal penultimo
last:	addi $t0, $zero, 7000
	jr $ra
penultimo:	addi $t0, $zero, 9000
	jal last
	j end
otro:
	add $s1, $zero, $ra
	jr $ra
end:
