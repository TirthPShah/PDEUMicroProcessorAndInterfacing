.data

	newline: .asciiz "\n"
	
.text

	main:
	
		li $t0, 1
		
		loop:
		
			bgt $t0, 3, termination
			
			li $v0, 1
			move $a0, $t0
			syscall
			
			li $v0, 4
			la $a0, newline
			syscall
			
			addi $t0, $t0, 1
			
			b loop
			
		termination:
		
			li $v0, 10
			syscall