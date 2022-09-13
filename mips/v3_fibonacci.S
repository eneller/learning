#include "asm_regnames.h"
	.data
getNbr:	.asciiz "Enter which fibonacci number you want to compute: "
printNbr: .asciiz "The result is: "
	
	.text
	.globl entry
entry:
	addiu sp, sp, -4
	sw ra, 0(sp)

	la $4, getNbr	#get input
	jal writestring
	jal writecrlf
	jal readdec
	
	move $4, $2		#move number into $4 as initial position to start recursion
	jal fib


	end:
	la $4, printNbr	#print the output
	jal writestring
	jal writecrlf
	move $4, $2
	jal writedec

	lw	ra, 0(sp)		# Rücksprungadresse aus Stack laden
	addiu	sp, sp, 4	# Verwendeten Stack verkleinern
	jr	ra 				# An die Rücksprungadresse springen


fib:
	addiu sp, sp, -12	#save everything : $4, $3, ra
	sw $4, 8(sp)
	sw $3, 4(sp)
	sw ra, 0(sp)


	bgt $4, 1, rec		#return n if n<2
	move $2, $4
	j return

rec:
	addiu $4, $4, -1	#calculate f(n-1)
	jal fib
	move $3, $2
	
	addiu $4, $4, -1	#calculate f(n-1)
	jal fib

	add $2, $2, $3		#sum of f(n-1)+f(n-2)
	

return:
	lw $4, 8(sp)		# restore everything
	lw $3, 4(sp)
	lw ra, 0(sp)
	addiu sp, sp, 12
	jr ra
