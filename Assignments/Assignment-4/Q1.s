PRESERVE8
     THUMB
     AREA     appcode, CODE, READONLY
     EXPORT __main
	 ENTRY 
__main  FUNCTION

	VMOV.F32 S1, #4   ; e^4
	VMOV.F32 S2, #15       ;Number of terms in e^4 expansion
	VMOV.F32 S3, #1    ;count
	VMOV.F32 S4, #1    ; temporary variable,t
	VMOV.F32 S5, #1    ; result stored in s5
	VMOV.F32 S7, #1    ;register to hold one
Loop 
	 VCMP.F32 S2, S3   ;Compare for e^x for s2 no of terms
	 VMRS.F32 APSR_nzcv,FPSCR  ;copy FPSCR to APSR
	 BLT stop;
	 VDIV.F32 S6, S1, S3; t1=x/count
	 VMUL.F32 S4, S4, S6; t=t*t1;
	 VADD.F32 S5, S5, S4; result=result+t;
	 VADD.F32 S3, S3, S7; inc count
	 B Loop; 
	 
stop B stop ; stop program
	 ENDFUNC
	 END
