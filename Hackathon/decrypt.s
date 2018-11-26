PRESERVE8
     THUMB
     AREA     appcode, CODE, READONLY
     EXPORT __main
	 ENTRY 
__main  FUNCTION
	LDR r8 , =0x20005C01   ;location of cipher texT
	LDR r9,[r8]  ;ciphertext msg from encryption
	MOV r10,r9	;storing previos ciphertext
	EOR r9,r9,#10 ; r9 = exor of ciphertext & initialization vector(cdtn for 1st msg)
	STR r9,[r8]		;store decrypted msg
	ADD r8,r8,#4	;increament to store decrypted msg
	MOV r11,#1 ; counter for decrypting all words
LOOP	
		LDR r9, [r8] ;loading result from ciphertext location (of encryped text) to r11
		EOR r9,r9,r10
		MOV r10,r9	;storing previos ciphertext
		ADD r8,r8,#4		;increament to store decrypted msg
		ADD r11,r11,#1	; counter for decrypting all words
		CMP r11,#25
		BNE LOOP
		
stop B stop ; stop program
	 ENDFUNC
	 END
