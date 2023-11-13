.data 

	tea_unit_msg: .asciiz "Enter units of tea sold: "
	panipuri_unit_msg: .asciiz "Enter units of panipuri sold: "
	burger_unit_msg: .asciiz "Enter units of burger sold: "
	
	tea_unit: .word 8
	tea_cost_price: .word 10
	tea_sell_price: .word 12
	
	burger_unit: .space 8
	burger_cost_price: .word 50
	burger_sell_price: .word 75
	
 	panipuri_unit: .word 8
	panipuri_cost_price: .word 30
	panipuri_sell_price: .word 42
	
	net_prof_msg: .asciiz "Net Profit: "
	
	goal: .word 1670
	
	true_msg: .asciiz "Net Profit is equal to goal of 1670."
	false_msg: .asciiz "Net Profit is not equal to goal of 1670."
	
	newline: .asciiz "\n"

.text

	main:
	
	li $v0, 4
	la $a0, tea_unit_msg
	syscall
	
	li $v0, 5
	syscall
	
	move $t0, $v0
	sw $t0, tea_unit
	
	li $v0, 4
	la $a0, burger_unit_msg
	syscall
	
	li $v0, 5
	syscall
	
	move $t1, $v0
	sw $t1, burger_unit
	
	li $v0, 4
	la $a0, panipuri_unit_msg
	syscall
	
	li $v0, 5
	syscall
	
	move $t2, $v0
	sw $t2, panipuri_unit
	
	lw $t3, tea_cost_price
	
	mul $t3, $t3, $t0
	
	lw $t4, tea_sell_price
	
	mul $t4, $t4, $t0
	
	sub $t6, $t4, $t3
	
	add $t5, $t5, $t6
	
	lw $t3, burger_cost_price
	
	mul $t3, $t3, $t1
	
	lw $t4, burger_sell_price
	
	mul $t4, $t4, $t1
	
	sub $t6, $t4, $t3
	
	add $t5, $t5, $t6
	
	lw $t3, panipuri_cost_price
	
	mul $t3, $t3, $t2
	
	lw $t4, panipuri_sell_price
	
	mul $t4, $t4, $t2
	
	sub $t6, $t4, $t3
	
	add $t5, $t5, $t6
	
	li $v0, 4
	la $a0, net_prof_msg
	syscall
	
	li $v0, 1
	move $a0, $t5
	syscall
	
compare:
	
	la $a1, goal
	lw $t7, ($a1)
	
	li $v0, 4
	la $a0, newline
	syscall
	
	beq $t7, $t5, printtrue
	
printfalase:
	
	li $v0, 4
	la $a0, false_msg
	syscall
	
	j exit 

printtrue:

	li $v0, 4
	la $a0, true_msg
	syscall
	
	j exit
	
exit:

	li $v0, 10
	syscall