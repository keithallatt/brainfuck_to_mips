# Compiled "input string into memory/input_string_into_memory.txt"
# containing:
#
#	>+[++++++++++>,----------]<[<]>[-]>[.>]

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
	jal memory_inc	#+

loop_0_start:	#[
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	beqz $t1, loop_0_end

	li $a0,10	# repeat 10 times
	jal memory_inc	#+
	li $a0,1	# repeat 1 times
	jal pointer_inc	#>
	jal input_char	#,
	li $a0,10	# repeat 10 times
	jal memory_dec	#-

loop_0_end:	#]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	bnez $t1, loop_0_start

	li $a0,1	# repeat 1 times
	jal pointer_dec	#<

loop_1_start:	#[
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	beqz $t1, loop_1_end

	jal pointer_dec	#<

loop_1_end:	#]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	bnez $t1, loop_1_start

	jal pointer_inc	#>

loop_2_start:	#[
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	beqz $t1, loop_2_end

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

	jal output_char	#.
	li $a0,1	# repeat 1 times
	jal pointer_inc	#>

loop_3_end:	#]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	bnez $t1, loop_3_start


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


