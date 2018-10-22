
     AREA     appcode, CODE, READONLY
     export __main	 
	 ENTRY 
__main  function
	          MOV r0 , #2   ;1st no
	          MOV r1 , #22    ;2nd no
              MOV r2 , #12 	  ;3rd num 			  
              CMP r0 , r1
              IT HI
              MOVHI r1 , r0 
			  CMP r1 , r2
			  IT HI 
			  MOVHI r2 , r1
			  MOV r3 , r2         ;result in r3
STOP		      B STOP  ; stop program
        endfunc
      end

