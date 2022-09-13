#include "asm_regnames.h"

	.data
str:	.asciiz	"Enter a number: "
str2:	.asciiz "Sum: "
	.text
	.globl entry
entry:


	la $4, str
	jal writestring
	jal readdec

	move $17, $2

	la $4, str
	jal writestring
	jal readdec

	addu $16, $2, $17
	jal writecrlf
	la $4, str2
	jal writestring
	move $4, $16
	jal writedec
	jal writecrlf

