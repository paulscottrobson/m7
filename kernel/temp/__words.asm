; *********************************************************************************
; *********************************************************************************
;
;		File:		console.asm
;		Purpose:	Console words.
;		Date : 		5th January 2019
;		Author:		paul@robsons.org.uk
;
; *********************************************************************************
; *********************************************************************************

; ========= console.setmode word =========
def_63_6f_6e_73_6f_6c_65_2e_73_65_74_6d_6f_64_65:
    call compileCallToSelf
		jp 		GFXMode

; ========= console.char! word =========
def_63_6f_6e_73_6f_6c_65_2e_63_68_61_72_21:
    call compileCallToSelf
		jp 		GFXWriteCharacter

; ========= console.hex! word =========
def_63_6f_6e_73_6f_6c_65_2e_68_65_78_21:
    call compileCallToSelf
		jp 		GFXWriteHexWord

; ========= console.inkey word =========
def_63_6f_6e_73_6f_6c_65_2e_69_6e_6b_65_79:
    call compileCallToSelf
		ex 		de,hl
		call 	IOScanKeyboard 						; read keyboard
		ld 		l,a
		ld 		h,$00
		ret
; ***************************************************************************************
; ***************************************************************************************
;
;		Name : 		unary.asm
;		Author :	Paul Robson (paul@robsons.org.uk)
;		Date : 		5th January 2019
;		Purpose :	Unary operators (A ? B -> A)
;
; ***************************************************************************************
; ***************************************************************************************

; ========= -- xmacro =========
def_2d_2d:
    call compileExecutableCopySelf
start_2d_2d:
    db end_2d_2d-start_2d_2d-1
		dec 	hl
end_2d_2d:
    ret

; ***************************************************************************************

; ========= --- xmacro =========
def_2d_2d_2d:
    call compileExecutableCopySelf
start_2d_2d_2d:
    db end_2d_2d_2d-start_2d_2d_2d-1
		dec 	hl
		dec 	hl
end_2d_2d_2d:
    ret

; ***************************************************************************************

; ========= ++ xmacro =========
def_2b_2b:
    call compileExecutableCopySelf
start_2b_2b:
    db end_2b_2b-start_2b_2b-1
		inc 	hl
end_2b_2b:
    ret

; ***************************************************************************************

; ========= +++ xmacro =========
def_2b_2b_2b:
    call compileExecutableCopySelf
start_2b_2b_2b:
    db end_2b_2b_2b-start_2b_2b_2b-1
		inc 	hl
		inc 	hl
end_2b_2b_2b:
    ret

; ***************************************************************************************

; ========= 0- word =========
def_30_2d:
    call compileCallToSelf
__negate:
		ld 		a,h
		cpl
		ld 		h,a
		ld 		a,l
		cpl
		ld 		l,a
		inc 	hl
		ret

; ***************************************************************************************

; ========= 0< word =========
def_30_3c:
    call compileCallToSelf
		bit 	7,h
		ld 		hl,$0000
		ret 	z
		dec 	hl
		ret

; ***************************************************************************************

; ========= 0= word =========
def_30_3d:
    call compileCallToSelf
		ld 		a,h
		or 		l
		ld 		hl,$0000
		ret 	nz
		dec 	hl
		ret

; ***************************************************************************************

; ========= 2* xmacro =========
def_32_2a:
    call compileExecutableCopySelf
start_32_2a:
    db end_32_2a-start_32_2a-1
		add 	hl,hl
end_32_2a:
    ret

; ========= 4* xmacro =========
def_34_2a:
    call compileExecutableCopySelf
start_34_2a:
    db end_34_2a-start_34_2a-1
		add 	hl,hl
		add 	hl,hl
end_34_2a:
    ret

; ========= 8* xmacro =========
def_38_2a:
    call compileExecutableCopySelf
start_38_2a:
    db end_38_2a-start_38_2a-1
		add 	hl,hl
		add 	hl,hl
		add 	hl,hl
end_38_2a:
    ret

; ========= 16* xmacro =========
def_31_36_2a:
    call compileExecutableCopySelf
start_31_36_2a:
    db end_31_36_2a-start_31_36_2a-1
		add 	hl,hl
		add 	hl,hl
		add 	hl,hl
		add 	hl,hl
end_31_36_2a:
    ret

; ***************************************************************************************

; ========= 2/ xmacro =========
def_32_2f:
    call compileExecutableCopySelf
start_32_2f:
    db end_32_2f-start_32_2f-1
		sra 	h
		rr 		l
end_32_2f:
    ret

; ========= 4/ xmacro =========
def_34_2f:
    call compileExecutableCopySelf
start_34_2f:
    db end_34_2f-start_34_2f-1
		sra 	h
		rr 		l
		sra 	h
		rr 		l
end_34_2f:
    ret

; ***************************************************************************************

; ========= abs word =========
def_61_62_73:
    call compileCallToSelf
		bit 	7,h
		ret		z
		jp 		__negate

; ***************************************************************************************

; ========= bswap xmacro =========
def_62_73_77_61_70:
    call compileExecutableCopySelf
start_62_73_77_61_70:
    db end_62_73_77_61_70-start_62_73_77_61_70-1
		ld 		a,l
		ld 		l,h
		ld 		h,a
end_62_73_77_61_70:
    ret

; ***************************************************************************************

; ========= not word =========
def_6e_6f_74:
    call compileCallToSelf
		ld 		a,h
		cpl
		ld 		h,a
		ld 		a,l
		cpl
		ld 		l,a
; ***************************************************************************************
; ***************************************************************************************
;
;		Name : 		binary.asm
;		Author :	Paul Robson (paul@robsons.org.uk)
;		Date : 		5th January 2019
;		Purpose :	Binary operators (A ? B -> A)
;
; ***************************************************************************************
; ***************************************************************************************

; ***************************************************************************************

; ========= < word =========
def_3c:
    call compileCallToSelf
	ld 		a,h 								 	; check if signs different.
	xor 	d
	add 	a,a 									; CS if different
	jr 		nc,__less_samesign
	ld 		a,d 									; different. set CS to sign of B
	add 	a,a 									; if set (negative) B must be < A as A is +ve
	jr 		__less_returnc
__less_samesign:
	push 	de 										; save DE
	ex 		de,hl 									; -1 if B < A
	sbc 	hl,de 									; calculate B - A , hencs CS if < (Carry clear by add a,a)
	pop 	de 										; restore DE
__less_returnc:
	ld 		a,0 									; A 0
	sbc 	a,0 									; A $FF if CS.
	ld 		l,a 									; put in HL
	ld 		h,a
	ret

; ***************************************************************************************

; ========= = word =========
def_3d:
    call compileCallToSelf
	ld 		a,h 									; H = H ^ D
	xor 	d
	ld 		h,a
	ld 		a,l 									; A = (L ^ E) | (H ^ D)
	or 		h 										; if A == 0 they are the same.
	ld 		hl,$0000 								; return 0 if different
	ret 	nz
	dec 	hl 										; return -1
	ret

; ***************************************************************************************

; ========= - word =========
def_2d:
    call compileCallToSelf
	push 	de 										; save DE
	ex 		de,hl 									; HL = B, DE = A
	xor 	a  										; clear carry
	sbc 	hl,de 									; calculate B-A
	pop 	de 										; restore DE
	ret

; ***************************************************************************************

; ========= * word =========
def_2a:
    call compileCallToSelf
	jp  	MULTMultiply16

; ***************************************************************************************

; ========= / word =========
def_2f:
    call compileCallToSelf
	push 	de
	call 	DIVDivideMod16
	ex 		de,hl
	pop 	de
	ret

; ***************************************************************************************

; ========= + xmacro =========
def_2b:
    call compileExecutableCopySelf
start_2b:
    db end_2b-start_2b-1
	add 	hl,de
end_2b:
    ret

; ***************************************************************************************

; ========= and word =========
def_61_6e_64:
    call compileCallToSelf
	ld 		a,h
	and 	d
	ld 		h,a
	ld 		a,l
	and 	e
	ld 		l,a
	ret

; ***************************************************************************************

; ========= mod word =========
def_6d_6f_64:
    call compileCallToSelf
	push 	de
	call 	DIVDivideMod16
	pop 	de
	ret

; ***************************************************************************************

; ========= or word =========
def_6f_72:
    call compileCallToSelf
	ld 		a,h
	or 		d
	ld 		h,a
	ld 		a,l
	or 		e
	ld 		l,a
	ret

; ***************************************************************************************

; ========= xor word =========
def_78_6f_72:
    call compileCallToSelf
	ld 		a,h
	xor 	d
	ld 		h,a
	ld 		a,l
	xor 	e
	ld 		l,a
	ret

; ***************************************************************************************
; ***************************************************************************************
;
;		Name : 		stack.asm
;		Author :	Paul Robson (paul@robsons.org.uk)
;		Date : 		5th January 2019
;		Purpose :	Stack words
;
; ***************************************************************************************
; ***************************************************************************************

; ========= push macro =========
def_70_75_73_68:
    call compileCopySelf
start_70_75_73_68:
    db end_70_75_73_68-start_70_75_73_68-1
	push 	hl
end_70_75_73_68:
    ret

; ========= pop macro =========
def_70_6f_70:
    call compileCopySelf
start_70_6f_70:
    db end_70_6f_70-start_70_6f_70-1
	ex 		de,hl
	pop 	hl
end_70_6f_70:
    ret

; ***************************************************************************************

; ========= a>r macro =========
def_61_3e_72:
    call compileCopySelf
start_61_3e_72:
    db end_61_3e_72-start_61_3e_72-1
	push 	hl
end_61_3e_72:
    ret

; ========= r>a macro =========
def_72_3e_61:
    call compileCopySelf
start_72_3e_61:
    db end_72_3e_61-start_72_3e_61-1
	pop 	hl
end_72_3e_61:
    ret

; ***************************************************************************************

; ========= b>r macro =========
def_62_3e_72:
    call compileCopySelf
start_62_3e_72:
    db end_62_3e_72-start_62_3e_72-1
	push 	de
end_62_3e_72:
    ret

; ========= r>b macro =========
def_72_3e_62:
    call compileCopySelf
start_72_3e_62:
    db end_72_3e_62-start_72_3e_62-1
	pop 	de
end_72_3e_62:
    ret

; ***************************************************************************************

; ========= c>r macro =========
def_63_3e_72:
    call compileCopySelf
start_63_3e_72:
    db end_63_3e_72-start_63_3e_72-1
	push 	bc
end_63_3e_72:
    ret

; ========= r>c macro =========
def_72_3e_63:
    call compileCopySelf
start_72_3e_63:
    db end_72_3e_63-start_72_3e_63-1
	pop 	bc
end_72_3e_63:
    ret


; ***************************************************************************************

; ========= ab>r macro =========
def_61_62_3e_72:
    call compileCopySelf
start_61_62_3e_72:
    db end_61_62_3e_72-start_61_62_3e_72-1
	push 	de
	push 	hl
end_61_62_3e_72:
    ret

; ========= r>ab macro =========
def_72_3e_61_62:
    call compileCopySelf
start_72_3e_61_62:
    db end_72_3e_61_62-start_72_3e_61_62-1
	pop 	hl
	pop 	de
end_72_3e_61_62:
    ret

; ***************************************************************************************

; ========= abc>r macro =========
def_61_62_63_3e_72:
    call compileCopySelf
start_61_62_63_3e_72:
    db end_61_62_63_3e_72-start_61_62_63_3e_72-1
	push 	bc
	push 	de
	push 	hl
end_61_62_63_3e_72:
    ret

; ========= r>abc macro =========
def_72_3e_61_62_63:
    call compileCopySelf
start_72_3e_61_62_63:
    db end_72_3e_61_62_63-start_72_3e_61_62_63-1
	pop 	hl
	pop 	de
	pop 	bc
end_72_3e_61_62_63:
    ret
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

; ========= , word =========
def_2c:
    call compileCallToSelf
		jp 		FARCompileWord

; ***************************************************************************************

; ========= ; macro =========
def_3b:
    call compileCopySelf
start_3b:
    db end_3b-start_3b-1
		ret
end_3b:
    ret

; ***************************************************************************************

; ========= c, word =========
def_63_2c:
    call compileCallToSelf
		ld 		a,l
		jp 		FARCompileWord

; ***************************************************************************************

; ========= copy word =========
def_63_6f_70_79:
    call compileCallToSelf
		ld 		a,b 								; exit if C = 0
		or 		c
		ret 	z

		push 	bc 									; BC count
		push 	de 									; DE target
		push 	hl 									; HL source

		xor 	a 									; Clear C
		sbc 	hl,de 								; check overlap ?
		jr 		nc,__copy_gt_count 					; if source after target
		add 	hl,de 								; undo subtract

		add 	hl,bc 								; add count to HL + DE
		ex 		de,hl
		add 	hl,bc
		ex 		de,hl
		dec 	de 									; dec them, so now at the last byte to copy
		dec 	hl
		lddr 										; do it backwards
		jr 		__copy_exit

__copy_gt_count:
		add 	hl,de 								; undo subtract
		ldir										; do the copy
__copy_exit:
		pop 	hl 									; restore registers
		pop 	de
		pop 	bc
		ret

; ***************************************************************************************

; ========= fill word =========
def_66_69_6c_6c:
    call compileCallToSelf
		ld 		a,b 								; exit if C = 0
		or 		c
		ret 	z

		push 	bc 									; BC count
		push 	de 									; DE target, L byte
__fill_loop:
		ld 		a,l 								; copy a byte
		ld 		(de),a
		inc 	de 									; bump pointer
		dec 	bc 									; dec counter and loop
		ld 		a,b
		or 		c
		jr 		nz,__fill_loop
		pop 	de 									; restore
		pop 	bc
		ret

; ***************************************************************************************

; ========= halt word =========
def_68_61_6c_74:
    call compileCallToSelf
__halt_loop:
		di
		halt
		jr 		__halt_loop

; ***************************************************************************************

; ========= sys.stdheaderroutine word =========
def_73_79_73_2e_73_74_64_68_65_61_64_65_72_72_6f_75_74_69_6e_65:
    call compileCallToSelf

compileCallToSelf:
		ex 		(sp),hl 							; get the routine addr into HL, old HL on TOS.

		ld 		a,$CD 								; Z80 Call
		call 	FARCompileByte
		call 	FARCompileWord

		pop 	hl 									; restore HL and exit
		ret

; ***************************************************************************************

; ========= sys.stdmacroroutine word =========
def_73_79_73_2e_73_74_64_6d_61_63_72_6f_72_6f_75_74_69_6e_65:
    call compileCallToSelf

compileCopySelf: 									; different addresses to tell executable ones.
		nop
compileExecutableCopySelf:
		ex 		(sp),hl 							; routine start into HL, old HL on TOS
		push 	bc 									; save BC
		ld 		b,(hl)								; get count
		inc 	hl
__copyMacroCode:
		ld 		a,(hl)								; do next byte
		call 	FARCompileByte
		inc 	hl
		djnz 	__copyMacroCode
		pop 	bc 									; restore and exit.
		pop 	hl
		ret
; ***************************************************************************************
; ***************************************************************************************
;
;		Name : 		register.asm
;		Author :	Paul Robson (paul@robsons.org.uk)
;		Date : 		5th January 2019
;		Purpose :	Register manipulation
;
; ***************************************************************************************
; ***************************************************************************************

; ========= swap xmacro =========
def_73_77_61_70:
    call compileExecutableCopySelf
start_73_77_61_70:
    db end_73_77_61_70-start_73_77_61_70-1
		ex 		de,hl
end_73_77_61_70:
    ret

; ***************************************************************************************

; ========= a>b xmacro =========
def_61_3e_62:
    call compileExecutableCopySelf
start_61_3e_62:
    db end_61_3e_62-start_61_3e_62-1
		ld 		d,h
		ld 		e,l
end_61_3e_62:
    ret

; ========= a>c xmacro =========
def_61_3e_63:
    call compileExecutableCopySelf
start_61_3e_63:
    db end_61_3e_63-start_61_3e_63-1
		ld 		b,h
		ld 		c,l
end_61_3e_63:
    ret

; ***************************************************************************************

; ========= b>a xmacro =========
def_62_3e_61:
    call compileExecutableCopySelf
start_62_3e_61:
    db end_62_3e_61-start_62_3e_61-1
		ld 		h,d
		ld 		l,e
end_62_3e_61:
    ret

; ========= b>c xmacro =========
def_62_3e_63:
    call compileExecutableCopySelf
start_62_3e_63:
    db end_62_3e_63-start_62_3e_63-1
		ld 		b,d
		ld 		c,e
end_62_3e_63:
    ret

; ***************************************************************************************

; ========= c>a xmacro =========
def_63_3e_61:
    call compileExecutableCopySelf
start_63_3e_61:
    db end_63_3e_61-start_63_3e_61-1
		ld 		h,b
		ld 		l,c
end_63_3e_61:
    ret

; ========= c>b xmacro =========
def_63_3e_62:
    call compileExecutableCopySelf
start_63_3e_62:
    db end_63_3e_62-start_63_3e_62-1
		ld 		d,b
		ld 		e,c
end_63_3e_62:
    ret

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

; ========= ! xmacro =========
def_21:
    call compileExecutableCopySelf
start_21:
    db end_21-start_21-1
		ld 		(hl),e
		inc 	hl
		ld 		(hl),d
		dec 	hl
end_21:
    ret

; ***************************************************************************************

; ========= @ xmacro =========
def_40:
    call compileExecutableCopySelf
start_40:
    db end_40-start_40-1
		ld 		a,(hl)
		inc 	hl
		ld		h,(hl)
		ld		l,a
end_40:
    ret

; ***************************************************************************************

; ========= +! word =========
def_2b_21:
    call compileCallToSelf
		ld 		a,(hl)
		add 	a,e
		ld 		(hl),a
		inc 	hl
		ld 		a,(hl)
		adc 	a,d
		ld 		(hl),a
		dec 	hl
		ret

; ***************************************************************************************

; ========= c! xmacro =========
def_63_21:
    call compileExecutableCopySelf
start_63_21:
    db end_63_21-start_63_21-1
		ld 		(hl),e
end_63_21:
    ret

; ***************************************************************************************

; ========= c@ xmacro =========
def_63_40:
    call compileExecutableCopySelf
start_63_40:
    db end_63_40-start_63_40-1
		ld 		l,(hl)
		ld 		h,0
end_63_40:
    ret

; ***************************************************************************************

; ========= p@ xmacro =========
def_70_40:
    call compileExecutableCopySelf
start_70_40:
    db end_70_40-start_70_40-1
		in 		l,(c)
		ld 		h,0
end_70_40:
    ret

; ***************************************************************************************

; ========= p! macro =========
def_70_21:
    call compileCopySelf
start_70_21:
    db end_70_21-start_70_21-1
		out 	(c),l
end_70_21:
    ret
