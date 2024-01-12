This feature was introduced from MOS 1.04 RC2 and VDP 1.04 RC2

The Virtual Keyboard was set up primarily for BBC BASIC to emulate INKEY(-n), where n is one of the numbers in the virtual keycode list in this article. It allows for the user to detect multiple key presses from within a BASIC program. Where possible, the numbers match those in the Acorn standard for compatibility with typed-in programs.

Example: Check for cursor keys being pressed in BASIC
```
   10 CLS
   20 PRINT TAB(0,0);
   30 PRINT "UP ";INKEY(-58);" "
   40 PRINT "DOWN ";INKEY(-42);" "
   50 PRINT "LEFT ";INKEY(-26);" "
   60 PRINT "RIGHT ";INKEY(-122);" "
   70 GOTO 20
```
## Via MOS

It is possible to read this keymap directly; it is stored in a bit-packed 16-byte table, where each bit position corresponds to a value in the table, where bit 0 is keycode 1 and bit 127 is keycode 128.

Example: Reading a virtual keycode in ADL mode (24-bit):
```
	MOSCALL	mos_getkbmap
	BIT	1, (IX + 3)		; Test bit 25 of the virtual keymap (keycode 26 = LEFT)
```
Example: Reading a virtual keycode in Z80 mode (16-bit):
```
	MOSCALL	mos_getkbmap
	BIT.LIL	1, (IX + 15)		; Test bit 121 of the virtual keymap (keycode 122 = RIGHT)
```

## Virtual Keycodes

| Code | Key           | Code | Key          | Code | Key        | Code | Key          |
|-----:|:--------------|-----:|:-------------|-----:|:-----------|-----:|:-------------|
|   -1 | Shift         |  -17 | Q            |  -33 | F0/Print   |  -49 | 1            |
|   -2 | Ctrl          |  -18 | 3            |  -34 | W          |  -50 | 2            |
|   -3 | Alt           |  -19 | 4            |  -35 | E          |  -51 | D            |
|   -4 | Left Shift    |  -20 | 5            |  -36 | T          |  -52 | R            |
|   -5 | Left Ctrl     |  -21 | F4           |  -37 | 7          |  -53 | 6            |
|   -6 | Left Alt      |  -22 | 8            |  -38 | I          |  -54 | U            |
|   -7 | Right Shift   |  -23 | F7           |  -39 | 9          |  -55 | O            |
|   -8 | Right Ctrl    |  -24 | -            |  -40 | 0          |  -56 | P            |
|   -9 | Right Alt     |  -25 | ^            |  -41 | _          |  -57 | [            |
|  -10 | Mouse Select  |  -26 | Left         |  -42 | Down       |  -58 | Up           |
|  -11 | Mouse Menu    |  -27 | Keypad 6     |  -43 | Keypad 8   |  -59 | Keypad +     |
|  -12 | Mouse Adjust  |  -28 | Keypad 7     |  -44 | Keypad 9   |  -60 | Keypad -     |
|  -13 |               |  -29 | F11          |  -45 | Break      |  -61 | Keypad Enter | 
|  -14 |               |  -30 | F12          |  -46 | ` ~        |  -62 | Insert       |
|  -15 |               |  -31 | F10          |  -47 |            |  -63 | Home         |
|  -16 |               |  -32 | Scroll Lock  |  -48 | Backspace  |  -64 | PgUp         |
|      |               |      |              |      |            |      |              |
|  -65 | Caps Lock     |  -81 | Shift Lock   |  -97 | TAB        | -113 | Escape       |
|  -66 | A             |  -82 | S            |  -98 | Z          | -114 | F1           |
|  -67 | X             |  -83 | C            |  -99 | Space      | -115 | F2           |
|  -68 | F             |  -84 | G            | -100 | V          | -116 | F3           |
|  -69 | Y             |  -85 | H            | -101 | B          | -117 | F5           |
|  -70 | J             |  -86 | N            | -102 | M          | -118 | F6           |
|  -71 | K             |  -87 | L            | -103 | , <        | -119 | F8           |
|  -72 | @             |  -88 | ;            | -104 | . >        | -120 | F9           |
|  -73 | :             |  -89 | ]            | -105 | / ?        | -121 |              |
|  -74 | Return        |  -90 | Delete       | -106 | Copy/End   | -122 | Right        |
|  -75 | Keypad /      |  -91 |              | -107 | Keypad 0   | -123 | Keypad 4     |
|  -76 | Keypad Del    |  -92 | Keypad *     | -108 | Keypad 1   | -124 | Keypad 5     |
|  -77 | Keypad .      |  -93 | Keypad ,     | -109 | Keypad 3   | -125 | Keypad 2     |
|  -78 | Num Lock      |  -94 | Keypad = +   | -110 |            | -126 | WinLeft      |
|  -79 | PgDn          |  -95 |              | -111 |            | -127 | WinRight     |
|  -80 |               |  -96 | _            | -112 |            | -128 | WinMenu      |
