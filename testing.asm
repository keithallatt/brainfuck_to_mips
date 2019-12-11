.data

# 64 entries
# this interpreter will use words, but values stored will still be within 0-255
# if more entries are wanted, just change the 64's to any int (within reason)
mem_cells:	.word 0:64
mem_size:	.word 64

.text

start:
	# pointer location
	li $t0, 0
	#main program location.
#-----------------------------------------

# sample loop start, call this bracket pair loop_i0

	jal memory_dec # +
	

#loop_i0_start:	# [
#	mul $t2,$t0,4	
#	lw $t1,mem_cells($t2) # t1 has the information stored at the memory address pointed at
#	beqz $t1, loop_i0_end # if 0 jump to end
#	
#	jal memory_dec # -
#	
#loop_i0_end:	# [
#	mul $t2,$t0,4	
#	lw $t1,mem_cells($t2) # t1 has the information stored at the memory address pointed at
#	bnez $t1, loop_i0_start # if 0 jump to end

	
#-----------------------------------------
	# end program before accidentally starting function declarations.
	li $v0, 10 
	syscall
	
# some basic functions that we can define without 'assembling' piece by piece, like +  and -, < and >
pointer_inc:	# >
	addi $t0,$t0,1
	lw $t1,mem_size # t0 is always used, t1 is temp, so we can use this for mem size
	div $t0,$t1 #HI contains t0 % mem_size
	mfhi $t0
	jr $ra # return
	
pointer_dec:	# <
	addi $t0,$t0,-1
	lw $t1,mem_size # t0 is always used, t1 is temp, so we can use this for mem size
	add $t0,$t0,$t1
	div $t0,$t1 #HI contains t0 % mem_size
	mfhi $t0
	jr $ra # return
	
memory_inc:	# +
	mul $t2,$t0,4	
	lw $t1,mem_cells($t2) # t1 has the information
	addi $t1,$t1,1 # increment
	andi $t1,$t1,255 # and 000000ff to mask low order bits
	sw $t1,mem_cells($t2)
	jr $ra

memory_dec:	# -
	mul $t2,$t0,4	
	lw $t1,mem_cells($t2)# t1 has the information
	addi $t1,$t1,-1 # increment by (-1 mod 256)
	andi $t1,$t1,255 # and 000000ff to mask low order bits
	sw $t1,mem_cells($t2)
	jr $ra

output_char:	# .
	li  $v0, 11           # service 11 is print_char
    	mul $t2,$t0,4	
	lw $a0,mem_cells($t2) # a0 has the information
    	syscall

	jr $ra
	
input_char:	# ,
	li  $v0, 12           # service 12 is read_char
	syscall
	mul $t2,$t0,4	
	sw $v0,mem_cells($t2)
	
	jr $ra