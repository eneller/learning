#include "asm_regnames.h"

	.data
prompt_input: .asciiz "Input (runlength): "
prompt_debug:	.asciiz	"Debug: "
prompt_result:	.asciiz "Result: "
input_string: .space 81
debug_string: .space 81

	.text
	.globl entry
entry:
	addiu   sp, sp, -4      # 4 Bytes auf dem Stack reservieren (Stack Pointer verschieben)                 GET INPUT
 	 sw     ra, 0(sp)       # Rücksprungadresse auf Stack legen

	la a0, prompt_input
	jal writestring

	la a0, input_string	# get input string
	jal readline
	la v0, debug_string	
	la s0, input_string
	la s1, debug_string
	li s3, 0		# counts character occurrences
	li s4, 10		# constant
	li s5, 48		# lower bound ascii number
 	li s6, 57  		# upper bound ascii number
	
	
loop_read: 
	lb a0, 0(s0)			# load string with offset
	beq a0, $0, loop_read_end	# end if reached null-termination of string
	jal writechar			# DEBUG

	
	blt a0, s5, handle_char
	bgt a0, s6, handle_char		# is only a number if 0<x<10
	addi s0, s0, 1			# move pointer in input_string
	#handle decimals
	jal handle_decimals
handle_decimals:
	beq s3, -1, initialize_s3
	mult s3, s4
	mflo s3
	add s3, a0
	addi s3, -48
	j loop_read
initialize_s3:
	add s3, a0
	addi s3,-47
	j loop_read
handle_char:
	beq s3, $0, move_char_pointer		# counted down to zero, return
	

	sb a0, 0(s1) 	
	addi s1, 1			# move pointer in debug_string
	
	
	addi s3, -1			# count down runlength
	j handle_char
	
move_char_pointer:
	addi s0, s0, 1
	li v0, -1
	j loop_read
loop_read_end:			# END LOOP
	jal writecrlf

	la a0, prompt_debug
	jal writestring
	la a0, debug_string
	jal writestring
	jal writecrlf

	la a0, prompt_result
	jal writestring

constrict:
	la s0, debug_string
	li s1, 0		#counter for character occurrences
	lb s2, 0(s1)		# store current character
loop_constrict:
	addi s0, 1
	lb s3, 0(s0)		# newest character in this register
	beq s3, 0, end
	bne s2, s3, constrict_print
	addi s1, 1
constrict_print:
	lb a0, 0(s1)
	jal writedec
	lb a0, 0(s2)
	jal writechar
	li s1, 0	# reset counter
	move s2, s3
	j loop_constrict

end:
        jal writecrlf           #Zeilenumbruch
        lw      ra, 0(sp)               # Rücksprungadresse aus Stack laden
        addiu   sp, sp, 4       # Verwendeten Stack verkleinern
        jr      ra                              # An die Rücksprungadresse springen
