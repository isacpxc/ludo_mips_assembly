.text

	li $t0, 0xFFFFFF
	
	li $t1, 0
	 
	line_d: # d = draw
		beq $t1, 4096, e_line
		sw $t0, 0x10008000($t1)
	
		addi $t1, $t1, 4
	
		j line_d
	e_line:
	
	li $t2, 4128 # limit color 
	
	column_d:
	
		beq $t1, $t2, c_add
		sw $t0, 0x10008000($t1)
		addi $t1, $t1, 4
		
		j column_d
		
		c_add:
			addi $t2, $t2, 512
			add $t1, $t2, -32
			j column_d
	
	e_column:
	
	######################### end offline
	
	li $t0, 0xFF0000
	
	li $t1, 0
	 
	lol: # d = draw
		beq $t1, 4096, e_lol
		sw $t0, 0x10008000($t1)
	
		addi $t1, $t1, 4
	
		j lol
	e_lol:
	
	# we have 512 px (2*2) | start = 4132 | next stape make squares
	

	

	
