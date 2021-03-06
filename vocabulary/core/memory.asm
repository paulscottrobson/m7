; ***************************************************************************************
; ***************************************************************************************
;
;		Name : 		memory.asm
;		Author :	Paul Robson (paul@robsons.org.uk)
;		Date : 		5th January 2019
;		Purpose :	Memory operators
;
; ***************************************************************************************
; ***************************************************************************************

@xmacro	!
		ld 		(hl),e
		inc 	hl
		ld 		(hl),d
		dec 	hl
@end

; ***************************************************************************************

@xmacro	@
		ld 		a,(hl)
		inc 	hl
		ld		h,(hl)
		ld		l,a
@end

; ***************************************************************************************

@word	+!
		ld 		a,(hl)
		add 	a,e
		ld 		(hl),a
		inc 	hl
		ld 		a,(hl)
		adc 	a,d
		ld 		(hl),a
		dec 	hl
		ret
@end

; ***************************************************************************************

@xmacro	c!
		ld 		(hl),e
@end

; ***************************************************************************************

@xmacro	c@
		ld 		l,(hl)
		ld 		h,0
@end

; ***************************************************************************************

@xmacro	p@
		in 		l,(c)
		ld 		h,0
@end

; ***************************************************************************************

@macro 	p!
		out 	(c),l
@end
