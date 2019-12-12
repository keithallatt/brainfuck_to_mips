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

	jal pointer_inc	#>
	jal memory_inc	#+

loop_0_start:	#[
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	beqz $t1, loop_0_end
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
	jal pointer_inc	#>
	jal input_char	#,
	jal memory_dec	#-
	jal memory_dec	#-
	jal memory_dec	#-
	jal memory_dec	#-
	jal memory_dec	#-
	jal memory_dec	#-
	jal memory_dec	#-
	jal memory_dec	#-
	jal memory_dec	#-
	jal memory_dec	#-

loop_0_end:	#]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	bnez $t1, loop_0_start
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
	jal pointer_inc	#>

loop_3_end:	#]
	mul $t2,$t0,4
	lw $t1,mem_cells($t2)
	bnez $t1, loop_3_start

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
