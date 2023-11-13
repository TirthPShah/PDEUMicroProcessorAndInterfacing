.data

    input1:    .asciiz "Enter the first number: "
    input2:    .asciiz "Enter the second number: "
    ans:     .asciiz "The larger number is: "

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

        bgt $t0, $t1, first_large
        b second_large

    first_large:
		
		li $v0, 4
		la $a0, ans
		syscall
		
        li $v0, 1
        move $a0, $t0
        syscall
        
        li $v0, 10
        syscall

    second_large:
		
		li $v0, 4
		la $a0, ans
		syscall
		
        li $v0, 1
        move $a0, $t1
        syscall
        
        li $v0, 10
        syscall