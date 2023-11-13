.data
    
    input_name: .asciiz "Enter your name: "
    input_enroll_id: .asciiz "Enter your Enrollment ID: "
    
    name: .space  50  
    enroll_id: .space  12
    
    output_name: .asciiz "Entered name is: "
    output_enroll_id: .asciiz "Entered enrollment ID is: "
    
    enter: .asciiz "\n"

.text

    main:
    
        li $v0, 4
        la $a0, input_name
        syscall

        li $v0, 8 
        la $a0, name
        li $a1, 50
        syscall

        li $v0, 4
        la $a0, input_enroll_id
        syscall

        li $v0, 8
        la $a0, enroll_id
        li $a1, 12
        syscall
        
        li $v0, 4
        la $a0, enter
        syscall

        li $v0, 4
        la $a0, output_name
        syscall

        li $v0, 4
        la $a0, name
        syscall

        li $v0, 4
        la $a0, enter
        syscall

        li $v0, 4
        la $a0, output_enroll_id
        syscall

        li $v0, 4
        la $a0, enroll_id
        syscall

        li $v0, 10
        syscall