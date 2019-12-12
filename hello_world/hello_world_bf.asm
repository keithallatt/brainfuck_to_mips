# Compiled "hello_world/hello_world_bf.txt"
# containing:
#
#	++++++++[>++++[>++>+++>+++>+<<<<-]>+>+>->>+[<]<-]>>.>---.+++++++..+++.>>.<-.<.+++.------.--------.>>+.>++.

.data

# 128 entries
mem_cells:	.word 0:128
mem_size:	.word 128

.text

start:
	# pointer location
	li $t0, 0
	#main program location.

	li $a0,8	# repeat 8 times
	jal memory_inc	#+

loop_0_start:	#[
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	beqz $t1, loop_0_end

	li $a0,1	# repeat 1 times
	jal pointer_inc	#>
	li $a0,4	# repeat 4 times
	jal memory_inc	#+

loop_1_start:	#[
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	beqz $t1, loop_1_end

	li $a0,1	# repeat 1 times
	jal pointer_inc	#>
	li $a0,2	# repeat 2 times
	jal memory_inc	#+
	li $a0,1	# repeat 1 times
	jal pointer_inc	#>
	li $a0,3	# repeat 3 times
	jal memory_inc	#+
	li $a0,1	# repeat 1 times
	jal pointer_inc	#>
	li $a0,3	# repeat 3 times
	jal memory_inc	#+
	li $a0,1	# repeat 1 times
	jal pointer_inc	#>
	jal memory_inc	#+
	li $a0,4	# repeat 4 times
	jal pointer_dec	#<
	li $a0,1	# repeat 1 times
	jal memory_dec	#-

loop_1_end:	#]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	bnez $t1, loop_1_start

	jal pointer_inc	#>
	jal memory_inc	#+
	jal pointer_inc	#>
	jal memory_inc	#+
	jal pointer_inc	#>
	jal memory_dec	#-
	li $a0,2	# repeat 2 times
	jal pointer_inc	#>
	li $a0,1	# repeat 1 times
	jal memory_inc	#+

loop_2_start:	#[
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	beqz $t1, loop_2_end

	jal pointer_dec	#<

loop_2_end:	#]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	bnez $t1, loop_2_start

	jal pointer_dec	#<
	jal memory_dec	#-

loop_0_end:	#]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	bnez $t1, loop_0_start

	li $a0,2	# repeat 2 times
	jal pointer_inc	#>
	jal output_char	#.
	li $a0,1	# repeat 1 times
	jal pointer_inc	#>
	li $a0,3	# repeat 3 times
	jal memory_dec	#-
	jal output_char	#.
	li $a0,7	# repeat 7 times
	jal memory_inc	#+
	jal output_char	#.
	jal output_char	#.
	li $a0,3	# repeat 3 times
	jal memory_inc	#+
	jal output_char	#.
	li $a0,2	# repeat 2 times
	jal pointer_inc	#>
	jal output_char	#.
	li $a0,1	# repeat 1 times
	jal pointer_dec	#<
	jal memory_dec	#-
	jal output_char	#.
	li $a0,1	# repeat 1 times
	jal pointer_dec	#<
	jal output_char	#.
	li $a0,3	# repeat 3 times
	jal memory_inc	#+
	jal output_char	#.
	li $a0,6	# repeat 6 times
	jal memory_dec	#-
	jal output_char	#.
	li $a0,8	# repeat 8 times
	jal memory_dec	#-
	jal output_char	#.
	li $a0,2	# repeat 2 times
	jal pointer_inc	#>
	li $a0,1	# repeat 1 times
	jal memory_inc	#+
	jal output_char	#.
	li $a0,1	# repeat 1 times
	jal pointer_inc	#>
	li $a0,2	# repeat 2 times
	jal memory_inc	#+
	jal output_char	#.

	li $v0, 10
	syscall

pointer_inc:	# >
	# num_reps in a0
	add $t0,$t0,$a0
	lw $t1,mem_size
	div $t0,$t1
	mfhi $t0
	jr $ra # return

pointer_dec:	# <
	sub $t0,$t0,$a0
	lw $t1,mem_size
	add $t0,$t0,$t1
	div $t0,$t1
	mfhi $t0
	jr $ra # return

memory_inc:	# +
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	add $t1,$t1,$a0
	andi $t1,$t1,255
	sw $t1,mem_cells($t2)
	jr $ra

memory_dec:	# -
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	sub $t1,$t1,$a0
	andi $t1,$t1,255
	sw $t1,mem_cells($t2)
	jr $ra

output_char:	# .
	li  $v0, 11
	mul $t2,$t0,4
	lw $a0,mem_cells($t2)
	syscall
	jr $ra

input_char:	# ,
	li  $v0, 12
	syscall
	mul $t2,$t0,4
	sw $v0,mem_cells($t2)
	jr $ra

