.data
	input: .word 1,2,30,4,5
	length: .word 16  # espaços para o array acima
		
.text
	lw $a1, length($0) #length -> j
	lw $a0, input($0)  #current element
	beq $a1, $t0, end1
	
	addi $t0, $0, 4 # current -> i
	lw $t1, input($t0) #next element
	
	jal sort 
	end1:
	li $v0, 10
	syscall
	


	
	
	sort:
		addi $t7, $0, 1 # 0011 000 111 000001
		slt $t6, $a1, $t0 # 0000 010 011 000 0010
		
		beq $t6, $t7, end # 0100 111 000 111111
		
		slt $t2, $a0, $t1
		addi $t3, $0, 1
		beq $t2, $t3, gte
		beq $a1, $t0, end
		
		addi $t0, $t0, 4
		lw $t1, input($t0)
		
		j sort
		
		
		
		gte:
			addi $a0, $t1, 0 # swap
			addi $t0, $t0, 4 # i = i+1
			lw $t1, input($t0) #next
			j sort
		
	

	
	end:
		li $v0, 1
		syscall
		jr $ra
	
	
	
	#comparar a0 com t1, e ir andando
	
	
	
	
	
	
	

	
