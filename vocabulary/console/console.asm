; *********************************************************************************
; *********************************************************************************
;
;		File:		con.raw.asm
;		Purpose:	con.raw words.
;		Date : 		5th January 2019
;		Author:		paul@robsons.org.uk
;
; *********************************************************************************
; *********************************************************************************

@word 	con.raw.setmode
		jp 		GFXMode
@end

@word 	con.raw.char!
		jp 		GFXWriteCharacter
@end

@word 	con.raw.hex!
		jp 		GFXWriteHexWord
@end

@word 	con.raw.inkey
		ex 		de,hl
		call 	IOScanKeyboard 						; read keyboard
		ld 		l,a
		ld 		h,$00
		ret
@end
