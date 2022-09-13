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
        sw      ra, 0(sp)               # Rücksprungadresse auf Stack legen

	la a0, prompt_input
	jal writestring

	la a0, input_string	# get input string
	jal readline

	la s0, input_string
	la s1, debug_string
	li s3, 0		# counts character occurrences
	li s4, 10		# constant
	li s5, 48		# lower bound ascii number
  	li s6, 57   # upper bound ascii number
	
	
loop_read: 
	lb a0, 0(s0)			# load string with offset
	beq a0, $0, loop_read_end	# end if reached null-termination of string
	jal writechar			# DEBUG
	blt a0, s5 , handle_char
	bgt a0, s6, handle_char		# is only a number if 0<x<10
	addi s0, s0, 1			# move pointer in input_string
	# handle decimals
	mult s3, s4			# do decimal shift
	mflo s3
	add s3, a0
	j loop_read
handle_char:
	beq s3, $0, loop_read		# counted down to zero, return
	lb s1, 0(a0)
	addi s1, 1			# move pointer in debug_string	
	addi s3, -1			# count down runlength
	j handle_char
	
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
	la s1, debug_string
	li s3, 0
	lb t0, 0(s1)
loop_constrict:
	addi s1, 1
	lb t1, 0(s1)
	bne t0, t1, constrict_print
	addi s3, 1
constrict_print:
	lb a0, 0(s3)
	jal writedec
	lb a0, 0(t0)
	jal writechar
	li s3, 0	# move variables
	lb t0, 0(t1)
	j loop_constrict

end:
        jal writecrlf           #Zeilenumbruch
        lw      ra, 0(sp)               # Rücksprungadresse aus Stack laden
        addiu   sp, sp, 4       # Verwendeten Stack verkleinern
        jr      ra                              # An die Rücksprungadresse springen

