.data

	input1: .asciiz "Enter the first number: "
	input2: .asciiz "Enter the second number: "
	ans: .asciiz "Multiples: "
	space: .asciiz " "
	
.text

	main:
		
		li $v0, 4
		la $a0, input1
		syscall
		
		li $v0, 5
		syscall
		move $t0, $v0
		
		li $v0, 4
		la $a0, input2
		syscall
		
		li $v0, 5
		syscall
		move $t1, $v0
		
		li $v0, 4
		la $a0, ans
		syscall
		
		li $v0, 4
		la $a0, space
		syscall
		
		li $t2, 1
		syscall
		
	loop:
	
		bgt $t2, $t1, end
	
		mul $t3, $t0, $t2
		
		li $v0, 1
		move $a0, $t3
		syscall
		
		li $v0, 4
		la $a0, space
		syscall
		
		addi $t2, $t2, 1
		
		b loop
		
	end:
	
		li $v0, 10
		syscall