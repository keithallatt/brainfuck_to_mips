.data

# 128 entries
mem_cells:	.word 0:128
mem_size:	.word 128

.text

start:
	# pointer location
	li $t0, 0
	#main program location.

	jal pointer_inc	#>
	jal input_char	#,
	jal pointer_inc	#>
	jal input_char	#,
	jal pointer_dec	#<
	jal pointer_dec	#<
	jal memory_inc	#+
	jal memory_inc	#+
	jal memory_inc	#+
	jal memory_inc	#+
	jal memory_inc	#+
	jal memory_inc	#+

loop_0_start:	#[]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	beqz $t1, loop_0_end
	jal pointer_inc	#>
	jal memory_dec	#-
	jal memory_dec	#-
	jal memory_dec	#-
	jal memory_dec	#-
	jal memory_dec	#-
	jal memory_dec	#-
	jal memory_dec	#-
	jal memory_dec	#-
	jal pointer_inc	#>
	jal memory_dec	#-
	jal memory_dec	#-
	jal memory_dec	#-
	jal memory_dec	#-
	jal memory_dec	#-
	jal memory_dec	#-
	jal memory_dec	#-
	jal memory_dec	#-
	jal pointer_dec	#<
	jal pointer_dec	#<
	jal memory_dec	#-

loop_0_end:	#]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	bnez $t1, loop_0_start
	jal pointer_inc	#>

loop_1_start:	#[]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	beqz $t1, loop_1_end
	jal pointer_inc	#>

loop_2_start:	#[]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	beqz $t1, loop_2_end
	jal pointer_inc	#>
	jal memory_inc	#+
	jal pointer_inc	#>
	jal memory_inc	#+
	jal pointer_dec	#<
	jal pointer_dec	#<
	jal memory_dec	#-

loop_2_end:	#]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	bnez $t1, loop_2_start
	jal pointer_inc	#>
	jal pointer_inc	#>

loop_3_start:	#[]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	beqz $t1, loop_3_end
	jal pointer_dec	#<
	jal pointer_dec	#<
	jal memory_inc	#+
	jal pointer_inc	#>
	jal pointer_inc	#>
	jal memory_dec	#-

loop_3_end:	#]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	bnez $t1, loop_3_start
	jal pointer_dec	#<
	jal pointer_dec	#<
	jal pointer_dec	#<
	jal memory_dec	#-

loop_1_end:	#]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	bnez $t1, loop_1_start
	jal pointer_inc	#>

loop_4_start:	#[]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	beqz $t1, loop_4_end
	jal memory_dec	#-

loop_4_end:	#]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	bnez $t1, loop_4_start
	jal pointer_inc	#>

loop_5_start:	#[]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	beqz $t1, loop_5_end
	jal pointer_dec	#<
	jal pointer_dec	#<
	jal pointer_dec	#<
	jal memory_inc	#+
	jal pointer_inc	#>
	jal pointer_inc	#>
	jal pointer_inc	#>
	jal memory_dec	#-

loop_5_end:	#]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	bnez $t1, loop_5_start
	jal pointer_dec	#<
	jal pointer_dec	#<
	jal pointer_dec	#<

loop_6_start:	#[]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	beqz $t1, loop_6_end
	jal pointer_inc	#>
	jal pointer_inc	#>
	jal memory_inc	#+
	jal pointer_inc	#>
	jal memory_inc	#+
	jal pointer_dec	#<
	jal pointer_dec	#<
	jal pointer_dec	#<
	jal memory_dec	#-

loop_6_end:	#]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	bnez $t1, loop_6_start
	jal pointer_inc	#>
	jal pointer_inc	#>
	jal pointer_inc	#>

loop_7_start:	#[]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	beqz $t1, loop_7_end
	jal pointer_dec	#<
	jal pointer_dec	#<
	jal pointer_dec	#<
	jal memory_inc	#+
	jal pointer_inc	#>
	jal pointer_inc	#>
	jal pointer_inc	#>
	jal memory_dec	#-

loop_7_end:	#]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	bnez $t1, loop_7_start
	jal pointer_dec	#<
	jal pointer_dec	#<
	jal memory_inc	#+
	jal pointer_inc	#>

loop_8_start:	#[]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	beqz $t1, loop_8_end
	jal pointer_dec	#<
	jal memory_dec	#-
	jal pointer_inc	#>

loop_9_start:	#[]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	beqz $t1, loop_9_end
	jal pointer_inc	#>
	jal memory_inc	#+
	jal memory_inc	#+
	jal memory_inc	#+
	jal memory_inc	#+
	jal memory_inc	#+
	jal memory_inc	#+
	jal memory_inc	#+
	jal memory_inc	#+
	jal memory_inc	#+
	jal memory_inc	#+
	jal pointer_dec	#<

loop_10_start:	#[]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	beqz $t1, loop_10_end
	jal memory_dec	#-
	jal pointer_inc	#>
	jal memory_dec	#-

loop_11_start:	#[]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	beqz $t1, loop_11_end
	jal pointer_inc	#>
	jal memory_inc	#+
	jal pointer_inc	#>
	jal pointer_inc	#>

loop_11_end:	#]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	bnez $t1, loop_11_start
	jal pointer_inc	#>

loop_12_start:	#[]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	beqz $t1, loop_12_end
	jal memory_inc	#+

loop_13_start:	#[]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	beqz $t1, loop_13_end
	jal memory_dec	#-
	jal pointer_dec	#<
	jal memory_inc	#+
	jal pointer_inc	#>

loop_13_end:	#]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	bnez $t1, loop_13_start
	jal pointer_inc	#>
	jal memory_inc	#+
	jal pointer_inc	#>
	jal pointer_inc	#>

loop_12_end:	#]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	bnez $t1, loop_12_start
	jal pointer_dec	#<
	jal pointer_dec	#<
	jal pointer_dec	#<
	jal pointer_dec	#<
	jal pointer_dec	#<

loop_10_end:	#]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	bnez $t1, loop_10_start
	jal pointer_inc	#>

loop_14_start:	#[]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	beqz $t1, loop_14_end
	jal memory_dec	#-

loop_14_end:	#]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	bnez $t1, loop_14_start
	jal memory_inc	#+
	jal memory_inc	#+
	jal memory_inc	#+
	jal memory_inc	#+
	jal memory_inc	#+
	jal memory_inc	#+
	jal memory_inc	#+
	jal memory_inc	#+

loop_15_start:	#[]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	beqz $t1, loop_15_end
	jal pointer_dec	#<
	jal memory_inc	#+
	jal memory_inc	#+
	jal memory_inc	#+
	jal memory_inc	#+
	jal memory_inc	#+
	jal memory_inc	#+
	jal pointer_inc	#>
	jal memory_dec	#-

loop_15_end:	#]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	bnez $t1, loop_15_start
	jal pointer_inc	#>

loop_16_start:	#[]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	beqz $t1, loop_16_end
	jal pointer_dec	#<
	jal pointer_dec	#<
	jal memory_inc	#+
	jal pointer_inc	#>
	jal pointer_inc	#>
	jal memory_dec	#-

loop_16_end:	#]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	bnez $t1, loop_16_start
	jal pointer_inc	#>

loop_17_start:	#[]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	beqz $t1, loop_17_end
	jal pointer_dec	#<
	jal pointer_dec	#<
	jal memory_inc	#+
	jal pointer_inc	#>
	jal pointer_inc	#>
	jal memory_dec	#-

loop_17_end:	#]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	bnez $t1, loop_17_start
	jal pointer_dec	#<
	jal pointer_dec	#<

loop_9_end:	#]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	bnez $t1, loop_9_start
	jal pointer_inc	#>

loop_8_end:	#]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	bnez $t1, loop_8_start
	jal pointer_dec	#<

loop_18_start:	#[]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	beqz $t1, loop_18_end
	jal memory_dec	#-
	jal pointer_inc	#>
	jal pointer_inc	#>
	jal memory_inc	#+
	jal memory_inc	#+
	jal memory_inc	#+
	jal memory_inc	#+
	jal memory_inc	#+
	jal memory_inc	#+
	jal memory_inc	#+
	jal memory_inc	#+

loop_19_start:	#[]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	beqz $t1, loop_19_end
	jal pointer_dec	#<
	jal memory_inc	#+
	jal memory_inc	#+
	jal memory_inc	#+
	jal memory_inc	#+
	jal memory_inc	#+
	jal memory_inc	#+
	jal pointer_inc	#>
	jal memory_dec	#-

loop_19_end:	#]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	bnez $t1, loop_19_start

loop_18_end:	#]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	bnez $t1, loop_18_start
	jal pointer_dec	#<

loop_20_start:	#[]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	beqz $t1, loop_20_end
	jal output_char	#.

loop_21_start:	#[]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	beqz $t1, loop_21_end
	jal memory_dec	#-

loop_21_end:	#]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	bnez $t1, loop_21_start
	jal pointer_dec	#<

loop_20_end:	#]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	bnez $t1, loop_20_start
	jal pointer_dec	#<

	li $v0, 10
	syscall

pointer_inc:	# >
	addi $t0,$t0,1
	lw $t1,mem_size
	div $t0,$t1
	mfhi $t0
	jr $ra # return

pointer_dec:	# <
	addi $t0,$t0,-1
	lw $t1,mem_size
	add $t0,$t0,$t1
	div $t0,$t1
	mfhi $t0
	jr $ra # return

memory_inc:	# +
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	addi $t1,$t1,1
	andi $t1,$t1,255
	sw $t1,mem_cells($t2)
	jr $ra

memory_dec:	# -
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	addi $t1,$t1,-1
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

