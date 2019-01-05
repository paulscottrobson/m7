; ***************************************************************************************
; ***************************************************************************************
;
;		Name : 		miscellany.asm
;		Author :	Paul Robson (paul@robsons.org.uk)
;		Date : 		5th January 2019
;		Purpose :	Miscellaneous words
;
; ***************************************************************************************
; ***************************************************************************************

@word 	,
		jp 		FARCompileWord
@endm

; ***************************************************************************************

@macro 	;
		ret
@endm

; ***************************************************************************************

@word 	c,
		ld 		a,l
		jp 		FARCompileWord
@endm

