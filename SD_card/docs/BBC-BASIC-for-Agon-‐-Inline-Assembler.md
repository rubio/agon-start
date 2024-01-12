# How to use the inline assembler

BBC BASIC is rather unique in the way that the language provided support for inline 6502 assembler. BBC BASIC for Z80 carries on this trend with a built in Z80 assembler which is used in pretty much the same way.

For more details on using the assembler, please read [this section](https://oldpatientsea.github.io/agon-bbc-basic-manual/0.1/bbc3.html) in the BBC BASIC (Z80) manual.

### Example

```
   10 REM Hello World in Assembler
   20 :
   22 REM Check if we are running in 24-bit BASIC
   24 :
   25 IF HIMEM < &10000 PRINT "This code will only run on BBC BASIC for eZ80": STOP
   30 :
   40 DIM code% 1024
   50 :
   60 REM Z80 code
   70 :
   80 FOR I%=0 TO 3 STEP 3
   90   P%=code%
  100   [
  110   OPT I%
  120   :
  200   LD HL, data ; Address of the message
  210   CALL print
  220   RET
  290   :
  300   .print ; The print routine
  310   LD A,(HL)
  320   OR A
  330   RET Z
  340   RST.LIL &10 ; Print a character (in A)
  350   INC HL
  360   JR print
  390   :
  400   .data ; The message, zero terminated
  410   DEFM "Hello World": DEFB 13: DEFB 10: DEFB 0
  960   ]
  970 NEXT
  980 :
  985 PRINT
  990 CALL code%
```
The assembly language code is assembled in two passes, controlled by the FOR/NEXT loop, and stored in the block of memory reserved in the DIM statement on line 40.

The resultant code can be executed by using either the CALL or USR functions from BASIC.

Note that there is a check to see if this is running in BBC BASIC for eZ80. It will STOP if it is not. To run this on the 16-bit BBC BASIC for Z80 then make the following changes:

```
   22 REM Check if we are running in 16-bit BASIC
   24 :
   25 IF HIMEM > &FFFF PRINT "This code will only run on BBC BASIC for Z80": STOP
```
and
```
   340 RST &10 ; Print a character (in A)

```

## Changes for the Agon versions of BBC BASIC

### BBC BASIC for Z80

This is pretty much the same as stock BBC BASIC for Z80 with the addition of the MLT instruction

### BBC BASIC for eZ80

The assembler has had a thorough overall with the addition of the following features:

- The program counters P% and O% are now 24-bit
- All the additional eZ80 instructions are supported
- The pseudo-instruction ADL allows the user to switch the assembler compilation between ADL and Z80 mode
- DEFL has been added for defining 24-bit values
- The eZ80 instruction postfixes are supported (.LIS, .SIL, .SIS, .LIL, .S, .L, .IS, .IL)