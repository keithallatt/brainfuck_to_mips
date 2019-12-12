"""
	compile_bf_to_asm.py

	Compile BrainFuck source code to structure preserving assembly.

	Usage:
		python ./compile_bf_to_asm.py path/to/source/file.txt

	Outputs a file with the same name but with .asm extension containing structure preserving assembly code compiled from source BrainFuck code.
"""

import sys
import os

if len(sys.argv) != 2:
	print("Only supply one bf source file")
	exit(1)

source_data = sys.argv[1]

pre, ext = os.path.splitext(source_data)

x = pre + ".asm"

# creates new file with new extension
output_file = open(x, 'w')

source_data = open(source_data, 'r').read()

# create header
header = """.data

# 128 entries
mem_cells:	.word 0:128
mem_size:	.word 128

.text

start:
	# pointer location
	li $t0, 0
	#main program location.

"""

output_file.write(header)

# add the 'meat'
loop_labels = []
new_label_index = 0

for character in source_data:
	if character in "+-,.[]<>":
		# only do work if the character is valid
		if character == "+":
			# mem increment
			output_file.write("\tjal memory_inc\t#+\n")
		elif character == "-":
			# mem decrement
			output_file.write("\tjal memory_dec\t#-\n")
		elif character == ">":
			# pointer increment
			output_file.write("\tjal pointer_inc\t#>\n")
		elif character == "<":
			# pointer decrement
			output_file.write("\tjal pointer_dec\t#<\n")
		elif character == "[":
			label_index = f"loop_{new_label_index}_"
			new_label_index += 1

			# put end label at beginning of array
			loop_labels = [label_index] + loop_labels

			output_file.write("\n"+label_index+"start:\t#[]\n")
			output_file.write("\tmul $t2,$t0,4\n")
			output_file.write("\tlw $t1,mem_cells($t2)\n")
			output_file.write("\tbeqz $t1, "+label_index+"end\n")

		elif character == "]":
			# pop last index loop off
			label_index = loop_labels[0]
			loop_labels = loop_labels[1:]

			output_file.write("\n"+label_index+"end:\t#]\n")
			output_file.write("\tmul $t2,$t0,4\n")
			output_file.write("\tlw $t1,mem_cells($t2)\n")
			output_file.write("\tbnez $t1, "+label_index+"start\n")

		elif character == ",":
			output_file.write("\tjal input_char\t#,\n")
		elif character == ".":
			output_file.write("\tjal output_char\t#.\n")



# create footer at end

footer = """
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

"""
output_file.write(footer)

output_file.close()
