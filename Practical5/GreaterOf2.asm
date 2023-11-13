.data

    ans: .asciiz "The larger number is: "

.text

    main:

        li $t0, 42
        li $t1, 24 

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