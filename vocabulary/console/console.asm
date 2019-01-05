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

@word 	console.setmode
		jp 		GFXMode
@end

@word 	console.char!
		jp 		GFXWriteCharacter
@end

@word 	console.hex!
		jp 		GFXWriteHexWord
@end

@word 	console.inkey
		ex 		de,hl
		call 	IOScanKeyboard 						; read keyboard
		ld 		l,a
		ld 		h,$00
		ret
@end
