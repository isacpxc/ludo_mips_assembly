.text

	li $t0, 0xFFFFFF
	
	li $t1, 0
	
	#sw $t0, 0($gp)
	 
	#line_d: # d = draw
	#	beq $t1, 4096, e_line
	#	sw $t0, 0x10008000($t1)
	#
	#	addi $t1, $t1, 4
	#
	#	j line_d
	#e_line:
	
	#li $t2, 4128 # limit color 
	
	#column_d:
	#	beq $t1, 9248, e_column 
	#	beq $t1, $t2, c_add 
	#	sw $t0, 0x10008000($t1)
	#	addi $t1, $t1, 4
	#	
	#	j column_d
	#	
	#	c_add:
	#		addi $t2, $t2, 512
	#		add $t1, $t2, -32
	#		j column_d
	#
	#e_column:
	
	######################### end offline
	
	###
	li $t2, 65536 #last px + 4
	
	d_board:
		sw $t0, 0x10008000($t1)
		addi $t1, $t1, 4
		beq $t1, $t2, e_d_board
		j d_board
	e_d_board:
	
	###
	
	
	 
	d_rects: # d = draw | #508px per line, +512 to px in the next line and same colum
	
		li $s1, 4128
		add $t1, $zero, $s1 
	
		li $t0, 0xFF0000
		li $s2, 4320 #rect width 48 positions (last offset = 192)
		add $t2, $zero, $s2 
	
		red_rect:
			sw $t0, 0x10008000($s1)
			beq $s1, 28896, e_red_rect
			beq $s1,$s2, add_rect_red
			addi $s1, $s1,4
			j red_rect
		
			add_rect_red:
				addi $s2, $s2, 512
				addi $s1, $s2, -192
				j red_rect
				
		e_red_rect:
		
			addi $s1, $t1, 36864
			addi $s2, $s1, 192
			li $t0, 0x0000FF
			
			blue_rect:
				sw $t0, 0x10008000($s1)
				#sw $t0, 0x10008000($s2)
				beq $s1, 65248, e_blue_rect # 61120 = (512*8*6 - 512) + 37056
				beq $s1,$s2, add_rect_blue
				addi $s1, $s1,4
				j blue_rect
		
				add_rect_blue:
					addi $s2, $s2, 512
					addi $s1, $s2, -192
					j blue_rect
				
			e_blue_rect:
			
			
			addi $s1, $t1, 37152
			addi $s2, $s1, 188
			li $t0, 0xFFFF00
			
			yellow_rect:
				sw $t0, 0x10008000($s1)
				#sw $t0, 0x10008000($s2)
				beq $s1, 65532, e_yellow_rect 
				beq $s1,$s2, add_rect_yellow
				addi $s1, $s1, 4
				j yellow_rect
		
				add_rect_yellow:
					addi $s2, $s2, 512
					addi $s1, $s2, -192
					j yellow_rect
				
			e_yellow_rect:
			
			addi $s1, $t1, 288
			addi $s2, $s1, 188
			li $t0, 0x008000
			
			green_rect:
				sw $t0, 0x10008000($s1)
				#sw $t0, 0x10008000($s2)
				beq $s1, 29180, e_green_rect 
				beq $s1,$s2, add_rect_green
				addi $s1, $s1,4
				j green_rect
		
				add_rect_green:
					addi $s2, $s2, 512
					addi $s1, $s2, -188
					j green_rect
				
			e_green_rect:
			
			li $s1, 28896
			addi $s2, $s1, 96
			li $t0, 0x000000
			
			
			center:
				sw $t0, 0x10008000($s1)
				#sw $t0, 0x10008000($s2)
				beq $s1, 41280, e_center 
				beq $s1,$s2, add_center
				addi $s1, $s1,4
				j center
		
				add_center:
					addi $s2, $s2, 512
					addi $s1, $s2, -96
					j center
			e_center:
				
		
	e_d_rects:
	
	li $t0, 0x000000
	# first = 29216
	sw $t0, 32288($gp)
	
	
	# we have 512 px (2*2) | start = 4132 | next stape make squares
	# each block requires 32 positions per y (wait)

	
