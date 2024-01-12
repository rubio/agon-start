The MOS API command [mos_sysvars](#0x08-mos_sysvars) returns a pointer to the base of the MOS system variables area in IXU - a 24-bit pointer.

The following system variables are available in [mos_api.inc](#usage-from-z80-assembler):

```
; System variable indexes for api_sysvars
; Index into _sysvars in globals.asm
;
sysvar_time:		EQU	00h	; 4: Clock timer in centiseconds (incremented by 2 every VBLANK)
sysvar_vpd_pflags:	EQU	04h	; 1: Flags to indicate completion of VDP commands
sysvar_keyascii:	EQU	05h	; 1: ASCII keycode, or 0 if no key is pressed
sysvar_keymods:		EQU	06h	; 1: Keycode modifiers
sysvar_cursorX:		EQU	07h	; 1: Cursor X position
sysvar_cursorY:		EQU	08h	; 1: Cursor Y position
sysvar_scrchar:		EQU	09h	; 1: Character read from screen
sysvar_scrpixel:	EQU	0Ah	; 3: Pixel data read from screen (R,B,G)
sysvar_audioChannel:	EQU	0Dh	; 1: Audio channel 
sysvar_audioSuccess:	EQU	0Eh	; 1: Audio channel note queued (0 = no, 1 = yes)
sysvar_scrWidth:	EQU	0Fh	; 2: Screen width in pixels
sysvar_scrHeight:	EQU	11h	; 2: Screen height in pixels
sysvar_scrCols:		EQU	13h	; 1: Screen columns in characters
sysvar_scrRows:		EQU	14h	; 1: Screen rows in characters
sysvar_scrColours:	EQU	15h	; 1: Number of colours displayed
sysvar_scrpixelIndex:	EQU	16h	; 1: Index of pixel data read from screen
sysvar_vkeycode:	EQU	17h	; 1: Virtual key code from FabGL
sysvar_vkeydown		EQU	18h	; 1: Virtual key state from FabGL (0=up, 1=down)
sysvar_vkeycount:	EQU	19h	; 1: Incremented every time a key packet is received
sysvar_rtc:		EQU	1Ah	; 8: Real time clock data
sysvar_keydelay:	EQU	22h	; 2: Keyboard repeat delay
sysvar_keyrate:		EQU	24h	; 2: Keyboard repeat rate
sysvar_keyled:		EQU	26h	; 1: Keyboard LED status
;
; From MOS 1.04 RC1 onwards
;
sysvar_scrMode:		EQU	27h	; 1: Screen mode
;
; From MOS 1.04 RC3 onwards
;
sysvar_rtcEnable:	EQU	28h	; 1: RTC enable flag (0: disabled, 1: use ESP32 RTC)
sysvar_mouseX:		EQU	29h	; 2: Mouse X position
sysvar_mouseY:		EQU	2Bh	; 2: Mouse Y position
sysvar_mouseButtons:	EQU	2Dh	; 1: Mouse button state
sysvar_mouseWheel:	EQU	2Eh	; 1: Mouse wheel delta
sysvar_mouseXDelta:	EQU	2Fh	; 2: Mouse X delta
sysvar_mouseYDelta:	EQU	31h	; 2: Mouse Y delta
```
Example: Reading a virtual keycode in ADL mode (24-bit):
```
		MOSCALL	mos_getkey
		LD	A, (IX + sysvar_vkeycode)	; Load A with the virtual keycode from FabGL
```
Example: Reading a virtual keycode in Z80 mode (16-bit):
```
		MOSCALL	mos_getkey
		LD.LIL	A, (IX + sysvar_vkeycode)	; Load A with the virtual keycode from FabGL
```