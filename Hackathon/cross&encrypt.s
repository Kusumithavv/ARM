PRESERVE8
     THUMB
     AREA     appcode, CODE, READONLY
     EXPORT __main
	 ENTRY 
__main  FUNCTION
;Considering 10 X 10 
		LDR r0 , =0x2000000A   ;starting address
		LDR r1 , =0x2000006D   ;end address
		LDR r3 , =0x20000042	; focus location pushing on stack for demo purpose
		PUSH {r3}
		MOV r5 , #5				;5 represents crossline data i.e data for red color
		POP {r6}				;r6=Xpixel = start add and r7=Ypixel = start add
		MOV r7,r6	
		
		MOV r8, r7
COUNTY
		CMP r7 , r0
		IT GT
		SUBGT r7, r7 , #0x0000000A
		BGT COUNTY 
		SUB r9 , r0 , r7	; r9 represents no. of locations required to go to start of y axis
		LDR r4 , =0
		MOV r2, #10
		CMP r9 ,r4
		IT GT
		SUBGT r9 , r2 , r9
		;SUBGT r9 , r9 , r2
		SUB r8 , r8 , r9	;r8 represents starting location of y axis
		
		MOV r9, #1			;counter for no. of consecutive y locations for cross	
LOOP		

		STRB r5 , [r8]		;storing r5 content to y location stored in r7
		ADD r9 , r9 , #1	;increasing counter
		ADD r8 , r8 , #1
		CMP r9 , #10
		BLE LOOP
		
DRAWX1	
		ADD r6 , r6 , #0x0000000A	; if given pixel location is in between then going to end of line first
		CMP r6 , r1
		BLE DRAWX1
		SUB r6 , r6 , #0x0000000A
DRAWX2
		STRB r5 , [r6]		; storing r5 content to x location stored in r6
		CMP r6 , r0
		SUBGE r6 , r6 , #0x0000000A	;Every x location of cross will be 240 apart
		BGE DRAWX2
    
 ENCRYPT MOV r4, r0
	LDR r6,=0x20000C02 ;location of IV
	LDR r8,=0x20005C01 ;location of cipher text
	MOV r9, #10	;value for IV
	STR r9, [r6]  ;store 10 to IV
	LDR r10,[r6]    ;initialization vector
	
	LDR r7, [r4]  ; reading plain text from start add
	CMP r10, #10 ;initialization vector value = 10
	EOR r7,r7,r10 ; exor of plaintext & initialization vector
	STR r10 , [r6]       ;store IV 
	STR r7,[r8] ;storing the result
	ADD r4, r4,#4
ELOOP
	LDR r7, [r4]  ; reading plain text from start add
	LDR r11, [r8]  ; load encrypted result to r11
	EOR r7,r7,r11  ;exor result with plain text
	ADD r4, r4,#4
	CMP r4,r1
	BNE ELOOP
      
stop B stop ; stop program
	 ENDFUNC
	 END
