#Description: Design a recursive program in assembly language that can solve the Hanoi towers problem.
.data
.text
main:
	addi $s0, $zero, 8	#s0 initialize the number of towers
	ori $s1, $zero, 4097	#add the address 1001
	sll $s1, $s1, 16	#shift to get the first address of memory
	add $t0, $zero, $s0	#initialize temp counter i = n
	add $t1, $zero, $zero	#intialize temp to break cycle
	add $t2, $zero, $s1	#pointer to first tower
loop_fill_stack:
	beq $t0, $t1, end_loop_fill_stack
	sw $t0, 0($t2)
	addi $t2, $t2, 4
	addi $t0, $t0, -1
	j loop_fill_stack
end_loop_fill_stack:
	addi $s0, $zero, 5000
	add $t0, $zero, $s0
end: