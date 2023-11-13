.data

	fir: .float 2.5
	sec: .float 10.5
	c: .space 4
	d: .space 8
	e: .space 8
	
	cmsg: .asciiz "C = "
	dmsg: .asciiz "D = "
	emsg: .asciiz "E = "
	
	newline: .asciiz "\n"
	
.text

	main:
		
		lwc1 $f2, fir
		lwc1 $f4, sec
				
		add.s $f12, $f2, $f4
		
		li $v0, 4
		la $a0, cmsg
		syscall
		
		li $v0, 2
		syscall
		
		li $v0, 4
		la $a0, newline
		syscall
		
		mul.s $f12, $f2, $f4
		
		li $v0, 4
		la $a0, dmsg
		syscall
		
		li $v0, 2
		syscall
		
		li $v0, 4
		la $a0, newline
		syscall
		
		div.s $f12, $f2, $f4
		
		li $v0, 4
		la $a0, emsg
		syscall
		
		li $v0, 2
		syscall
		
		li $v0, 10
		syscall