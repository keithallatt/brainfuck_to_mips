# brainfuck_to_mips
Compiler for the BrainFuck esoteric language into MIPS assembly.

Each command in BrainFuck is linked to a specific set of commands in assembly. Using function calls declared after the halt instruction, the majority of the code resembles `jal memory_inc`, where most commands have a label. The exception is loops, since we require branching and jumping to various parts of code, and not just calling an external function. Therefore the compiler labels each one as `[` commands appear in order. By traversing lexically, the compiler maps each `]` by using a stack storing all unclosed `[` commands.

This implementation uses word memory addresses, so memory cells can be modified to accept word values instead of byte values, but this implementation caps the value at 0-255. Currently, the limit on memory cells is 128 cells, but this can be changed with a few tweaks to the final assembly code.
