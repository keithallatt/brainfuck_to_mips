"""
	compile_bf_to_asm.py

	Compile BrainFuck source code to structure preserving assembly.

	Usage:
		python ./compile_bf_to_asm.py path/to/source/file.txt

	Outputs a file with the same name but with .asm extension containing structure preserving assembly code compiled from source BrainFuck code.
"""

import sys
import os

if len(sys.argv) != 2 and len(sys.argv) != 3:
	print("Only supply one bf source file, optional memory size as word (4 byte int)")
	exit(1)

source_filename = sys.argv[1]

memory_size = 128
if len(sys.argv) == 3:
	memory_size = int(sys.argv[2])

pre, ext = os.path.splitext(source_filename)

x = pre + ".asm"

# creates new file with new extension
output_file = open(x, 'w')

source_data = open(source_filename, 'r').read()

# create top comment, with info about the source file, for readability
initial_comment = f"# Compiled \"{source_filename}\"\n# containing:\n#\n"

for line in source_data.split("\n"):
	initial_comment += "#\t"+line+"\n"
initial_comment += "\n"

output_file.write(initial_comment)

# create header
header = f""".data

# {memory_size} entries
mem_cells:	.word 0:{memory_size}
mem_size:	.word {memory_size}

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

# holds the last a0 value, if output char, set to -1 to force reload
repeat_a0_set = 0

while len(source_data) > 0:
	character = source_data[0]
	source_data = source_data[1:]

	repeated = 1
	if character in "+-<>": # repeatable characters
		while source_data[0] == character:
			repeated += 1
			source_data = source_data[1:]


	if character in "+-,.[]<>":
		# only do work if the character is valid
		if character == "+":
			# mem increment
			if repeat_a0_set != repeated:
				output_file.write(f"\tli $a0,{repeated}\t# repeat {repeated} times\n")
				repeat_a0_set = repeated

			output_file.write("\tjal memory_inc\t#+\n")
		elif character == "-":
			# mem decrement
			if repeat_a0_set != repeated:
				output_file.write(f"\tli $a0,{repeated}\t# repeat {repeated} times\n")
				repeat_a0_set = repeated

			output_file.write("\tjal memory_dec\t#-\n")
		elif character == ">":
			# pointer increment
			if repeat_a0_set != repeated:
				output_file.write(f"\tli $a0,{repeated}\t# repeat {repeated} times\n")
				repeat_a0_set = repeated

			output_file.write("\tjal pointer_inc\t#>\n")
		elif character == "<":
			# pointer decrement
			if repeat_a0_set != repeated:
				output_file.write(f"\tli $a0,{repeated}\t# repeat {repeated} times\n")
				repeat_a0_set = repeated

			output_file.write("\tjal pointer_dec\t#<\n")
		elif character == "[":
			label_index = f"loop_{new_label_index}_"
			new_label_index += 1

			# put end label at beginning of array
			loop_labels = [label_index] + loop_labels

			output_file.write("\n"+label_index+"start:\t#[\n")
			output_file.write("\tmul $t2,$t0,4\n")
			output_file.write("\tlw $t1,mem_cells($t2)\n")
			output_file.write("\tbeqz $t1, "+label_index+"end\n\n")

		elif character == "]":
			# pop last index loop off
			label_index = loop_labels[0]
			loop_labels = loop_labels[1:]

			output_file.write("\n"+label_index+"end:\t#]\n")
			output_file.write("\tmul $t2,$t0,4\n")
			output_file.write("\tlw $t1,mem_cells($t2)\n")
			output_file.write("\tbnez $t1, "+label_index+"start\n\n")

		elif character == ",":
			repeat_a0_set = -1 # force reload of a0, not sure if input changes a0
			output_file.write("\tjal input_char\t#,\n")
		elif character == ".":
			repeat_a0_set = -1 # force reload of a0
			output_file.write("\tjal output_char\t#.\n")

		last_char = character



# create footer at end

footer = """
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

"""
output_file.write(footer)

output_file.close()
