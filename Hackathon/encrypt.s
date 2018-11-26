	PRESERVE8
     THUMB
     AREA     appcode, CODE, READONLY
     EXPORT __main
	 ENTRY 
__main  FUNCTION

	
	MOV r7, #11  ; plain text
	LDR r6,=0x20000C02 ;location of IV
	LDR r8,=0x20005C01 ;location of cipher text
	MOV r9, #10
	STR r9, [r6]
	LDR r10,[r6]    ;initialization vector
	CMP r10, #10 ;initialization vector value = 10
	BEQ STARTMSG
	LDR r11, [r8]
	EOR r7,r7,r11


STARTMSG	EOR r7,r7,r10 ; exor of plaintext & initialization vector
	LDR r10 , =0 
	STR r10 , [r6] 
	STRB r7,[r8] ;storing the result
      
stop B stop ; stop program
	 ENDFUNC
	 END
