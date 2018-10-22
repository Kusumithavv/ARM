
        AREA     appcode, CODE, READONLY
     export __main	 
	 ENTRY 
__main  function
	          MOV r0 , #12	  ;1st no	
			  MOV r1 , #60     ;2nd no
LOOP			  CMP r0 , r1       ;compare if they are =/>/<
              IT EQ 
              BEQ STOP	
              ITE HI			  
			  SUBHI r0 , r0 , r1 	;if higher		  
			  SUBLS r1 , r1 , r0    ;if lower
              B LOOP			  
STOP		      B STOP  ; stop program
        endfunc
      end
