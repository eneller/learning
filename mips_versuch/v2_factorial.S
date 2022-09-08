#include "asm_regnames.h"
	.data
getNbr:	.asciiz "Enter which factorial you want to compute: "
printNbr: .asciiz "The factorial is: "
space: .asciiz ": "
	
	.text
	.globl entry
entry:
	addiu sp, sp, -4
	sw ra, 0(sp)

	la $4, getNbr
	jal writestring
	jal writecrlf
	jal readdec #wert in $2
	li $8, 1
	mult $2, $8
	mflo $5
	mfhi $6
	sub $2, $2, $8


loop:
	
	blt $2, 2, end
	mult $5, $2
	mflo $5
	mfhi $7

	#debug 1
	move $4, $2
	jal writedec
	la $4, space
	jal writestring
	move $4, $7
	jal writehex
	jal writecrlf
	
	mult $6, $2
	mflo $6
	
	#debug 2
	move $4, $2
	jal writedec
	la $4, space
	jal writestring
	move $4, $6
	jal writehex
	jal writecrlf

	add $6, $6, $7

	sub $2, $2, $8

	j loop

end:
	la $4, printNbr
	jal writestring
	jal writecrlf
	beq $6, zero, low
	move $4, $6
	jal writedec
low:
	move $4, $5
	jal writedec
	
	lw	ra, 0(sp)		# Rücksprungadresse aus Stack laden
	addiu	sp, sp, 4	# Verwendeten Stack verkleinern
	jr	ra 				# An die Rücksprungadresse springen