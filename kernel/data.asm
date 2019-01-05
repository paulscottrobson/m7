; ***************************************************************************************
; ***************************************************************************************
;
;		Name : 		data.asm
;		Author :	Paul Robson (paul@robsons.org.uk)
;		Date : 		5th January 2019
;		Purpose :	Data area
;
; ***************************************************************************************
; ***************************************************************************************

; ***************************************************************************************
;
;								System Information
;
; ***************************************************************************************

SystemInformation:

Here:												; +0 	Here 
		dw 		FreeMemory
HerePage: 											; +2	Here.Page
		db 		FirstCodePage,0
NextFreePage: 										; +4 	Next available code page (2 8k pages/page)
		db 		FirstCodePage+2,0,0,0
DisplayInfo: 										; +8 	Display information
		dw 		DisplayInformation,0		

; ***************************************************************************************
;
;							 Display system information
;
; ***************************************************************************************

DisplayInformation:

__DIScreenWidth: 									; +0 	screen width
		db 		0,0,0,0
__DIScreenHeight:									; +4 	screen height
		db 		0,0,0,0
__DIScreenSize:										; +8 	char size of screen
		dw 		0,0		
__DIScreenMode:										; +12 	current mode
		db 		0,0,0,0
__DIFontBase:										; font in use
		dw 		AlternateFont
__DIScreenDriver:									; Screen Driver
		dw 		0	

; ***************************************************************************************
;
;								 Other data and buffers
;
; ***************************************************************************************

__PAGEStackPointer: 								; stack used for switching pages
		dw 		0
__PAGEStackBase:
		ds 		16


FreeMemory:		
		org 	$C000
		include	"temp/__dictionary.asm"