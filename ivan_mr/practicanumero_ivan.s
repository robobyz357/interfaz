@ number.s
@ test program to print a number.
.section	.data
num:                        @ create a variable
	.long 12345 
.globl	_start
_start:
	ldr r3, =num	    @ load r3 with address of num
	ldr r4, [r3]	    @ load r4 with the number
	mov r5, $0 	    @ set counter to 0
loop:
	cmp r4, $9          @ if r4 <= 9 ...
	ble print           @ print digit
	sub r4, r4, $10     @ subtract 10 from r4
	add r5, r5, $1      @ add one to counter
	bal loop            @ back to top of loop
print:	
	add r0, r4, $0x30   @ load r0 with r4 + 48 (ascii code)
	bl PrintChar        @ call PrintChar function
	cmp r5, $0          @ if the counter is zero ...
        beq exit            @ we are done
        mov r4, r5          @ load r4 with counter
	mov r5, $0          @ set counter to zero
	bal loop            @ back to top of loop
exit:
	mov 	r0, $0xA	@ print a newline
	bl	PrintChar
	mov	r0, $0		@ exit
	mov	r7, $1
	svc	$0

PrintChar:
	stmfd	sp!, {r0-r5, r7, lr}	@ push registers onto stack
	mov	r1, sp			@ stack pointer holds char value
	mov	r0, $1			@ stdout
	mov	r2, r0			@ one char
	mov	r7, $4			@ write syscall
	swi	$0                      @ wake kernel
	ldmfd	sp!, {r0-r5, r7, pc}	@ restore registers

.end
