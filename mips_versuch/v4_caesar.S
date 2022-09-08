#include "asm_regnames.h"
	.data
getStr:	.asciiz	"Enter a String: "
getNbr:	.asciiz "Enter a number to shift the String by: "
printStr: .asciiz "The shifted string is: "
	
inStr: .space 81
outStr: .space 81
	.text
	.globl entry
entry:
	addiu	sp, sp, -4	# 4 Bytes auf dem Stack reservieren (Stack Pointer verschieben)			GET INPUT
	sw	ra, 0(sp)		# Rücksprungadresse auf Stack legen

	la $4, getStr		#Adresse von getStr in $4 laden
	jal	writestring		#String an Adresse aus $4 ausgeben
	jal writecrlf		#Zeilenumbruch

	la $4, inStr		#Adresse von inStr in $4 laden
	jal readline		#Eingabe von readline in str speichern

	la $4, getNbr		#Adresse von getNbr in $4 laden
	jal	writestring		#String an Adresse aus $4 ausgeben
	jal writecrlf		#Zeilenumbruch

	jal readdec			#dezimalzahl einlesen, $2 Wert, $3 Länge

	la $6, inStr
	la $7, outStr

	li $9, 26

	la $4, printStr																				#LOAD ADDRESS
	jal writestring
	jal writecrlf

loop:																							#LOOP
	
	lb $4, 0($6)		#load String with offset
	beq $4, $0, end	#end if reached null-termination
	
	bgt $4, 122, save	#just save if value is greater than 'z' 					BRANCH LOGIC
	blt $4, 65, save	#just save if value is lower than 'A'
	bgt $4, 96, lowercase	#if value is >= 'a' and <= 'z'
	blt $4, 91, uppercase	#if value is <= 'Z' and >= 'A'


save:																							# s[i]=c
	sb $4, 0($7)
	
	addi $6, $6, 1		#move pointer in inStr
	addi $7, $7, 1		#move pointer in outStr

	j loop				#end of loop, go back

uppercase:
	li $8, 65
	sub $4, $4, $8
	
	add $4, $4, $2
	j modulo

	
lowercase:
	li $8, 97	
	sub $4, $4, $8

	add $4,$4, $2
	j modulo

modulo:
	div $4, $9
	mfhi $4			#move rest of division into $4
	add $4, $4, $8
	j save
	

end:
	
	la $4, outStr		#Adresse von outStr in $4 laden											PRINT STRING
	jal writestring		#String an Adresse aus $4 ausgeben
	jal writecrlf		#Zeilenumbruch

	lw	ra, 0(sp)		# Rücksprungadresse aus Stack laden
	addiu	sp, sp, 4	# Verwendeten Stack verkleinern
	jr	ra 				# An die Rücksprungadresse springen
				
