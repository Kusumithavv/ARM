
     AREA     appcode, CODE, READONLY
     export __main	 
	 ENTRY 
__main  function
          MOV r0 , #0  ; 1st no in series
	          MOV r1 , #1    ; 2nd no in series
              MOV r7 , #9	  ;   fibonacci series upto 9 numbers
              MOV r2 , r7	 ; result in r2		  
              CMP r2 , #1  ; repeat until r2=1
              IT LS 
              BLS STOP				  
			  SUB r3 , r2 ,#1      ; loop
fibloop             
                  ADD r4 , r1 , r0   ;store sum of last two values
                  MOV r0 ,r1
                  MOV r1 ,r4
                  MOV r2 , r4
                  SUB r3 ,#1 
				  CMP r3 ,#0
                  BNE fibloop
 
STOP		      B STOP  ; stop program
        endfunc
      end
