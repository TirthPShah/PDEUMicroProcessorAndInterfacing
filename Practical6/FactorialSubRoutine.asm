.data
	input: .asciiz "Enter the number: "
	result: .asciiz "The factorial of the given number is: "
	
.text

	main:
	
		li $v0, 4
		la $a0, input
		syscall
		
		li $v0, 5
		syscall
		
		move $t0, $v0
		
		jal factorial
		
		li $v0, 10
		syscall
		
	factorial:
	
		li $t3, 1
		li $t1, 1
	
		calcfact:
		
			loop: 
			
				bgt $t3, $t0, printfact
				
				mul $t1, $t1, $t3 
				
				addi $t3, $t3, 1
				
				b loop
			
			printfact:
			
				li $v0, 4
				la $a0, result
				syscall
				
				li $v0, 1
				move $a0, $t1
				syscall
				
				jr $ra
