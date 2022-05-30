.data
	a: .asciiz "Enter your Temperature: "
	cold: .asciiz "cold weather clothes(Wear appropriate outdoor clothing, learn safety precautions to follow when outdoors!)"
	warm: .asciiz "warm weather clothes(Lovely weather, spend more time outdoor!)"
	hot: .asciiz "hot weather clothes(Stay in an air-conditioned indoor location as much as you can, and get hydrated!)"
.text
	main:
		addi $t1, $zero, 40
		addi $t2, $zero, 80
		li $v0, 4
		la $a0, a
		syscall
		#get temp value
		li $v0, 5
		syscall
		#store temp value in T0
		move $t0, $v0
		#initials branches
		bgt $t0, $t2, GreaterThan
		bgt $t1, $t0, LessThan
		#print the value
		li $v0, 4
		la $a0, warm
		syscall
		
		li $v0, 10
		syscall
		#end of main
	
	GreaterThan:
		li $v0, 4
		la $a0, hot
		syscall
		li $v0, 10
		syscall
		
	LessThan:
		li $v0, 4
		la $a0, cold
		syscall
		li $v0, 10
		syscall