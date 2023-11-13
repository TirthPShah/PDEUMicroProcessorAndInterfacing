.data

	input_msg: .asciiz "Enter the number of terms of Fibonacci series you want to print: "
	result: .asciiz "Fibonacci Series: "
	space: .asciiz " "
	
.text

	main:
	
		li $v0, 4
		la $a0, input_msg
		syscall
		
		li $v0, 5
		syscall
		
		move $t0, $v0
		
		jal printfibo
		
		li $v0, 10
		syscall
		
	printfibo:
		
		li $v0, 4
		la $a0, result
		syscall
		
		li $t1, 0
		
		li $v0, 1
		move $a0, $t1
		syscall
		
		beq $t0, 1, termination
		
		li $v0, 4
		la $a0, space
		syscall
		
		li $t2, 1
		
		li $v0, 1
		move $a0, $t2
		syscall
		
		beq $t0, 2, termination
		
		li $v0, 4
		la $a0, space
		syscall
		
		li $t3, 3
		
		loop:
			
			bgt $t3, $t0, termination
			
			add $t4, $t1, $t2
			
			li $v0, 1
			move $a0, $t4
			syscall
			
			li $v0, 4
			la $a0, space
			syscall
			
			move $t1, $t2
			move $t2, $t4
			
			addi $t3, $t3, 1
			
			b loop
		
	termination:

		jr $ra