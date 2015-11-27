@ add.s - simple addition code

@ instructions that start with a dot are instructions for the assembler.
.section    .data   	@ a section for data (unused)
.section    .text   	@ a section for text (unused)
.globl      _start  	@ sets the global label "_start"

_start:             	@ code starts here.
mov %r1, $7         	@ puts the value 7 in r1
mov %r0, $8		@ puts the value 8 in r0
add %r0, %r0, %r1	@ add r0 to r1 and store result in r0

mov %r7, $1         	@ this is how to set an exit syscall
svc $0              	@ the interrupt to wake the kernel.

