# Compiled "mult_2_nums_1digit/mult_2_nums.txt"
# containing:
#
#	>,
#	
#	print newline
#	>[-] +++++ +++++ . [-]<
#	
#	>,
#	
#	<<         | Get input
#	+++ +++        | 
#	[              | 
#	  > ---- ----  | 
#	  > ---- ----  | 
#	  << -         | 
#	]              | Subtract 48 from both #2 and #3
#	               | to get the raw value instead of ASCII
#	               | 
#	>              | Move index back to #2
#	               | 
#	[              | 
#	  >            | 
#	  [            | 
#	    >+>+<<-    | Duplicate #3 to #4 and #5
#	  ]            | 
#	  >>           | 
#	  [            | 
#	    <<+>>-     | Move #3 to #3
#	  ]            | 
#	  <<<-         | Remove one from #2 and start again
#	]              | 
#	>[-]           | Remove all from #3
#	               | 
#	> [<<<+>>>-]   | Move #4 to #1
#	<<<            | Move pointer to #1
#	
#	print newline
#	>[-] +++++ +++++ . [-]<
#	
#	
#	Print value at 0
#	
#	[>>+>+<<<-]>>>[<<<+>>>-]<<+>[<->[>++++++++++<[->-[>+>>]>[+[-<+>]>+>>]<<<<<]>[-]
#	  ++++++++[<++++++>-]>[<<+>>-]>[<<+>>-]<<]>]<[->>++++++++[<++++++>-]]<[.[-]<]<

.data

# 128 entries
mem_cells:	.word 0:128
mem_size:	.word 128

.text

start:
	# pointer location
	li $t0, 0
	#main program location.

	li $a0,1	# repeat 1 times
	jal pointer_inc	#>
	jal input_char	#,
	li $a0,1	# repeat 1 times
	jal pointer_inc	#>

loop_0_start:	#[
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	beqz $t1, loop_0_end

	jal memory_dec	#-

loop_0_end:	#]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	bnez $t1, loop_0_start

	li $a0,5	# repeat 5 times
	jal memory_inc	#+
	jal memory_inc	#+
	jal output_char	#.

loop_1_start:	#[
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	beqz $t1, loop_1_end

	li $a0,1	# repeat 1 times
	jal memory_dec	#-

loop_1_end:	#]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	bnez $t1, loop_1_start

	jal pointer_dec	#<
	jal pointer_inc	#>
	jal input_char	#,
	li $a0,2	# repeat 2 times
	jal pointer_dec	#<
	li $a0,3	# repeat 3 times
	jal memory_inc	#+
	jal memory_inc	#+

loop_2_start:	#[
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	beqz $t1, loop_2_end

	li $a0,1	# repeat 1 times
	jal pointer_inc	#>
	li $a0,4	# repeat 4 times
	jal memory_dec	#-
	jal memory_dec	#-
	li $a0,1	# repeat 1 times
	jal pointer_inc	#>
	li $a0,4	# repeat 4 times
	jal memory_dec	#-
	jal memory_dec	#-
	li $a0,2	# repeat 2 times
	jal pointer_dec	#<
	li $a0,1	# repeat 1 times
	jal memory_dec	#-

loop_2_end:	#]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	bnez $t1, loop_2_start

	jal pointer_inc	#>

loop_3_start:	#[
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	beqz $t1, loop_3_end

	jal pointer_inc	#>

loop_4_start:	#[
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	beqz $t1, loop_4_end

	jal pointer_inc	#>
	jal memory_inc	#+
	jal pointer_inc	#>
	jal memory_inc	#+
	li $a0,2	# repeat 2 times
	jal pointer_dec	#<
	li $a0,1	# repeat 1 times
	jal memory_dec	#-

loop_4_end:	#]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	bnez $t1, loop_4_start

	li $a0,2	# repeat 2 times
	jal pointer_inc	#>

loop_5_start:	#[
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	beqz $t1, loop_5_end

	jal pointer_dec	#<
	li $a0,1	# repeat 1 times
	jal memory_inc	#+
	li $a0,2	# repeat 2 times
	jal pointer_inc	#>
	li $a0,1	# repeat 1 times
	jal memory_dec	#-

loop_5_end:	#]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	bnez $t1, loop_5_start

	li $a0,3	# repeat 3 times
	jal pointer_dec	#<
	li $a0,1	# repeat 1 times
	jal memory_dec	#-

loop_3_end:	#]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	bnez $t1, loop_3_start

	jal pointer_inc	#>

loop_6_start:	#[
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	beqz $t1, loop_6_end

	jal memory_dec	#-

loop_6_end:	#]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	bnez $t1, loop_6_start

	jal pointer_inc	#>

loop_7_start:	#[
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	beqz $t1, loop_7_end

	li $a0,3	# repeat 3 times
	jal pointer_dec	#<
	li $a0,1	# repeat 1 times
	jal memory_inc	#+
	li $a0,3	# repeat 3 times
	jal pointer_inc	#>
	li $a0,1	# repeat 1 times
	jal memory_dec	#-

loop_7_end:	#]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	bnez $t1, loop_7_start

	li $a0,3	# repeat 3 times
	jal pointer_dec	#<
	li $a0,1	# repeat 1 times
	jal pointer_inc	#>

loop_8_start:	#[
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	beqz $t1, loop_8_end

	jal memory_dec	#-

loop_8_end:	#]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	bnez $t1, loop_8_start

	li $a0,5	# repeat 5 times
	jal memory_inc	#+
	jal memory_inc	#+
	jal output_char	#.

loop_9_start:	#[
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	beqz $t1, loop_9_end

	li $a0,1	# repeat 1 times
	jal memory_dec	#-

loop_9_end:	#]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	bnez $t1, loop_9_start

	jal pointer_dec	#<

loop_10_start:	#[
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	beqz $t1, loop_10_end

	li $a0,2	# repeat 2 times
	jal pointer_inc	#>
	li $a0,1	# repeat 1 times
	jal memory_inc	#+
	jal pointer_inc	#>
	jal memory_inc	#+
	li $a0,3	# repeat 3 times
	jal pointer_dec	#<
	li $a0,1	# repeat 1 times
	jal memory_dec	#-

loop_10_end:	#]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	bnez $t1, loop_10_start

	li $a0,3	# repeat 3 times
	jal pointer_inc	#>

loop_11_start:	#[
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	beqz $t1, loop_11_end

	jal pointer_dec	#<
	li $a0,1	# repeat 1 times
	jal memory_inc	#+
	li $a0,3	# repeat 3 times
	jal pointer_inc	#>
	li $a0,1	# repeat 1 times
	jal memory_dec	#-

loop_11_end:	#]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	bnez $t1, loop_11_start

	li $a0,2	# repeat 2 times
	jal pointer_dec	#<
	li $a0,1	# repeat 1 times
	jal memory_inc	#+
	jal pointer_inc	#>

loop_12_start:	#[
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	beqz $t1, loop_12_end

	jal pointer_dec	#<
	jal memory_dec	#-
	jal pointer_inc	#>

loop_13_start:	#[
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	beqz $t1, loop_13_end

	jal pointer_inc	#>
	li $a0,10	# repeat 10 times
	jal memory_inc	#+
	li $a0,1	# repeat 1 times
	jal pointer_dec	#<

loop_14_start:	#[
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	beqz $t1, loop_14_end

	jal memory_dec	#-
	jal pointer_inc	#>
	jal memory_dec	#-

loop_15_start:	#[
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	beqz $t1, loop_15_end

	jal pointer_inc	#>
	jal memory_inc	#+
	li $a0,2	# repeat 2 times
	jal pointer_inc	#>

loop_15_end:	#]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	bnez $t1, loop_15_start

	li $a0,1	# repeat 1 times
	jal pointer_inc	#>

loop_16_start:	#[
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	beqz $t1, loop_16_end

	jal memory_inc	#+

loop_17_start:	#[
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	beqz $t1, loop_17_end

	jal memory_dec	#-
	jal pointer_dec	#<
	jal memory_inc	#+
	jal pointer_inc	#>

loop_17_end:	#]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	bnez $t1, loop_17_start

	jal pointer_inc	#>
	jal memory_inc	#+
	li $a0,2	# repeat 2 times
	jal pointer_inc	#>

loop_16_end:	#]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	bnez $t1, loop_16_start

	li $a0,5	# repeat 5 times
	jal pointer_dec	#<

loop_14_end:	#]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	bnez $t1, loop_14_start

	li $a0,1	# repeat 1 times
	jal pointer_inc	#>

loop_18_start:	#[
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	beqz $t1, loop_18_end

	jal memory_dec	#-

loop_18_end:	#]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	bnez $t1, loop_18_start

	li $a0,8	# repeat 8 times
	jal memory_inc	#+

loop_19_start:	#[
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	beqz $t1, loop_19_end

	li $a0,1	# repeat 1 times
	jal pointer_dec	#<
	li $a0,6	# repeat 6 times
	jal memory_inc	#+
	li $a0,1	# repeat 1 times
	jal pointer_inc	#>
	jal memory_dec	#-

loop_19_end:	#]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	bnez $t1, loop_19_start

	jal pointer_inc	#>

loop_20_start:	#[
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	beqz $t1, loop_20_end

	li $a0,2	# repeat 2 times
	jal pointer_dec	#<
	li $a0,1	# repeat 1 times
	jal memory_inc	#+
	li $a0,2	# repeat 2 times
	jal pointer_inc	#>
	li $a0,1	# repeat 1 times
	jal memory_dec	#-

loop_20_end:	#]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	bnez $t1, loop_20_start

	jal pointer_inc	#>

loop_21_start:	#[
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	beqz $t1, loop_21_end

	li $a0,2	# repeat 2 times
	jal pointer_dec	#<
	li $a0,1	# repeat 1 times
	jal memory_inc	#+
	li $a0,2	# repeat 2 times
	jal pointer_inc	#>
	li $a0,1	# repeat 1 times
	jal memory_dec	#-

loop_21_end:	#]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	bnez $t1, loop_21_start

	li $a0,2	# repeat 2 times
	jal pointer_dec	#<

loop_13_end:	#]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	bnez $t1, loop_13_start

	li $a0,1	# repeat 1 times
	jal pointer_inc	#>

loop_12_end:	#]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	bnez $t1, loop_12_start

	jal pointer_dec	#<

loop_22_start:	#[
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	beqz $t1, loop_22_end

	jal memory_dec	#-
	li $a0,2	# repeat 2 times
	jal pointer_inc	#>
	li $a0,8	# repeat 8 times
	jal memory_inc	#+

loop_23_start:	#[
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	beqz $t1, loop_23_end

	li $a0,1	# repeat 1 times
	jal pointer_dec	#<
	li $a0,6	# repeat 6 times
	jal memory_inc	#+
	li $a0,1	# repeat 1 times
	jal pointer_inc	#>
	jal memory_dec	#-

loop_23_end:	#]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	bnez $t1, loop_23_start


loop_22_end:	#]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	bnez $t1, loop_22_start

	jal pointer_dec	#<

loop_24_start:	#[
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	beqz $t1, loop_24_end

	jal output_char	#.

loop_25_start:	#[
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	beqz $t1, loop_25_end

	li $a0,1	# repeat 1 times
	jal memory_dec	#-

loop_25_end:	#]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	bnez $t1, loop_25_start

	jal pointer_dec	#<

loop_24_end:	#]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	bnez $t1, loop_24_start

	jal pointer_dec	#<

	jal print_memory

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

print_memory:
	li      $v0, 0
	la      $t1, mem_cells

pm_loop:
	lw      $t2, 0($t1)
	addi    $t1, $t1, 4

	andi $t7, $t8, 15
	bnez $t7, no_new

	li $a0, 10
	li $v0, 11
	syscall

no_new:
	li      $v0, 1
	move    $a0, $t2
	syscall

	addi $t8, $t8, 1
	lw $t9, mem_size
	bge     $t8, $t9, pm_exit

	li $a0, 44
	li $v0, 11
	syscall
	li $a0, 9
	syscall

	j pm_loop

 pm_exit:
	li $v0, 11
	li $a0, 10
	syscall
 	jr $ra


