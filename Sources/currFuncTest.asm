#Description: Design a recursive program in assembly language that can solve the Hanoi towers problem.
.data
.text
main:
	jal otro
last:	addi $t0, $zero, 5000
	add $s1, $zero, $ra
	j end
otro:
	add $s1, $zero, $ra
	jal last
end:
