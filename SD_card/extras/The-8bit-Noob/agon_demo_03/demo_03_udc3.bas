   10 REM ******************************
   20 REM *        AGON LIGHT 2        *
   30 REM *          DEMO 03           *
   40 REM *      BBC BASIC MODE 0      *
   50 REM *    USER DEFINED CHARS 3    *
   60 REM *      WITH KUNG-FU LOGO     *
   70 REM *      BY STEVE LOVEJOY      *
   80 REM ******************************
   90 REM MAIN PROGRAM.
  100 CLEAR : REM CLEAR MEMORY
  110 PROC_LOAD_VARS : REM CALL LOAD_VARS.
  120 PROC_LOAD_CHARS : REM CALL LOAD_CHARS.
  130 PROC_LOAD_LOGO : REM CALL LOAD_LOGO.
  140 PROC_INIT : REM CALL INIT.
  150 PROC_MAINLOOP : REM CALL MAIN LOOP.
  160 VDU 30,17,15 : REM MOVES CURSOR HOME (TOP LEFT) | 0,0) AND COLOUR WHITE.
  170 END : REM END MAIN PROGRAM.
  180 :
 1000 DEF PROC_MAINLOOP : REM ** MAIN LOOP **
 1010 NX = 34 : REM SET TITLE TEXT X.
 1020 NY = 27 : REM SET TITLE TEXT Y.
 1030 LX = 36 : REM SET X FOR LOGO.
 1040 LY = 18 : REM SET Y FOR LOGO.
 1050 FOR J=1 TO 15 : REM LOOP FOR COLOUR CHANGE.
 1060 VDU 17,J : REM ASSIGN COLOUR OF J.
 1070 PROC_DRAW_HUD : REM DRAW THE HUD (BORDER).
 1080 PROC_DRAW_LOGO(LX,LY) : REM DRAW LOGO AT POSITION LX & LY.
 1090 PROC_DRAW_AGON(NX,NY) : REM THIS ALLOWS YOU TO MOVE THE AGON TEXT WITH CODE.
 1100 PROC_DRAW_LIGHT(NX+2,NY+2) : REM THIS ALLOWS YOU TO MOVE THE LIGHT TEXT WITH CODE.
 1300 ANYKEY%=INKEY(100) : REM DELAY
 1500 NEXT J
 1600 ENDPROC : REM END MAIN_LOOP.
 1610 :
 2010 DEF PROC_INIT : REM ** INIT **
 2020 MODE mode% : REM SETS SCREEN MODE FROM VARS.
 2030 CLS : REM CLEAR TEXT SCREEN.
 2040 CLG : REM CLEAR GRAPHICS SCREEN.
 2050 PROC_HIDE_CURSOR : REM CALL HIDE_CURSOR.
 2060 ENDPROC : REM END INIT
 2070 :
 5000 DEF PROC_HIDE_CURSOR : REM ** HIDE_CURSOR **
 5010 VDU 23,1,0
 5020 ENDPROC
 5030 :
 5040 DEF PROC_SHOW_CURSOR : REM ** SHOW_CURSOR **
 5050 VDU 23,1,1
 5050 ENDPROC
 5070 :
 6000 DEF PROC_LOAD_LOGO : REM ** LOAD_LOGO **
 6010 VDU 23,160,7,15,31,31,31,31,31,63
 6020 VDU 23,161,192,224,240,240,240,240,240,248
 6030 VDU 23,162,63,63,31,15,15,15,7,7
 6040 VDU 23,163,248,248,240,224,224,224,192,192
 6050 VDU 23,164,0,1,7,15,31,63,127,127
 6060 VDU 23,165,7,199,199,195,227,225,240,240
 6070 VDU 23,166,192,195,195,135,135,15,15,31
 6090 VDU 23,167,0,0,224,240,248,252,252,254
 6100 VDU 23,168,0,0,1,1,3,3,7,7
 6110 VDU 23,169,255,255,255,255,255,255,255,255
 6120 VDU 23,170,248,248,248,240,224,225,193,195
 6130 VDU 23,171,63,63,127,255,255,255,255,255
 6140 VDU 23,172,255,255,255,255,255,255,223,223
 6150 VDU 23,173,0,0,128,128,128,192,192,192
 6160 VDU 23,174,7,7,15,15,15,15,15,31
 6170 VDU 23,175,255,247,231,231,231,199,135,130
 6180 VDU 23,176,199,135,135,143,15,15,31,31
 6190 VDU 23,177,207,207,207,199,199,195,129,1
 6200 VDU 23,178,224,224,224,240,240,240,240,240
 6210 VDU 23,179,31,31,31,31,15,15,15,31
 6220 VDU 23,180,128,128,128,128,129,143,135,143
 6230 VDU 23,181,31,63,15,0,128,224,224,195
 6240 VDU 23,182,252,240,128,0,3,7,35,243
 6250 VDU 23,183,1,1,1,129,193,225,241,241
 6260 VDU 23,184,240,240,240,240,240,240,240,240
 6270 VDU 23,185,31,31,3,3,3,3,7,15
 6280 VDU 23,186,223,255,255,255,255,255,254,254
 6290 VDU 23,187,199,135,135,7,15,15,31,31
 6300 VDU 23,188,241,241,241,248,248,248,248,248
 6310 VDU 23,189,253,255,255,255,255,255,255,127
 6320 VDU 23,190,240,248,248,224,224,224,240,248
 6330 VDU 23,191,31,63,63,63,31,31,15,0
 6340 VDU 23,192,254,252,252,252,248,248,224,0
 6350 VDU 23,193,31,60,32,0,0,0,0,0
 6360 VDU 23,194,120,28,12,12,0,0,0,0
 6370 VDU 23,195,127,127,127,127,127,63,15,0
 6380 VDU 23,196,248,252,252,252,252,248,240,0
 6390 VDU 23,197,255,254,252,248,240,224,192,128
 6400 ENDPROC : REM END LOAD_LOGO
 7000 :
 7010 DEF PROC_LOAD_CHARS : REM ** LOAD_CHARS TO MEMORY **
 7020 REM ASSIGN A to CHRS.
 7030 VDU 23,201,0,0,0,0,1,1,7,7,23,202,30,30,126,126,254,254,254,254
 7040 VDU 23,203,31,31,126,126,120,120,0,0,23,204,158,158,30,30,30,30,6,6
 7070 REM ASSIGN G to CHARS.
 7080 VDU 23,205,127,127,127,112,112,112,112,112,23,206,254,254,254,0,0,6,6,30
 7090 VDU 23,207,112,112,112,127,127,127,0,0,23,208,30,30,30,254,254,254,24,24
 7100 REM ASSIGN O to CHARS.
 7110 VDU 23,209,127,127,127,112,112,112,112,112,23,210,254,254,254,14,14,14,14,14
 7120 VDU 23,211,112,112,112,127,127,127,0,0,23,212,14,14,14,254,254,254,0,0
 7130 REM ASSIGN N to CHARS.
 7140 VDU 23,213,96,120,120,126,126,127,127,127,23,214,14,14,14,14,14,142,142,254
 7150 VDU 23,215,127,113,113,112,112,112,0,0,23,216,254,254,254,126,126,30,30,6
 7160 :
 7170 REM ASSIGN L to CHRS.
 7180 VDU 23,217,120,120,120,120,120,120,120,120,23,218,0,0,0,0,0,0,0,0
 7190 VDU 23,219,120,120,120,127,127,127,0,0,23,220,0,0,0,254,254,254,0,0
 7200 REM ASSIGN I to CHARS.
 7210 VDU 23,221,127,127,127,3,3,3,3,3,23,222,254,254,254,192,192,192,192,192
 7220 VDU 23,223,3,3,3,127,127,127,0,0,23,224,192,192,192,254,254,254,0,0
 7230 REM ASSIGN H to CHARS.
 7240 VDU 23,225,120,120,120,120,120,120,127,127,23,226,6,6,30,30,30,30,254,254
 7250 VDU 23,227,127,127,120,120,120,120,96,96,23,228,254,254,30,30,30,30,0,0
 7260 REM ASSIGN T to CHARS.
 7270 VDU 23,229,127,127,127,3,3,3,3,3,23,230,254,254,254,192,192,192,192,192
 7280 VDU 23,231,3,3,3,3,3,3,0,0,23,232,192,192,192,192,192,192,192,192
 7290 :
 7300 REM HUD CHARS.
 7310 VDU 23,237,255,255,192,192,192,192,192,192 : REM TOP LEFT CORNER.
 7320 VDU 23,238,255,255,3,3,3,3,3,3 : REM TOP RIGHT CORNER.
 7330 VDU 23,239,192,192,192,192,192,192,255,255 : REM BOT LEFT CORNER.
 7340 VDU 23,240,3,3,3,3,3,3,255,255 : REM BOT RIGHT CORNER.
 7350 VDU 23,241,255,255,0,0,0,0,0,0 : REM TOP STRAIGHT.
 7360 VDU 23,242,0,0,0,0,0,0,255,255 : REM BOT STRAIGHT.
 7370 VDU 23,243,192,192,192,192,192,192,192,192 : REM LEFT STRAIGHT.
 7380 VDU 23,244,3,3,3,3,3,3,3,3 : REM RIGHT STRAIGHT.
 7400 ENDPROC : REM END LOAD_CHARS.
 7410 :
 8000 DEF PROC_LOAD_VARS : REM ** LOAD_VARS **
 8010 REM GIVE COLOURS A NAME.
 8020 COLBLACK% = 0
 8030 COLRED% = 1
 8040 COLGREEN% = 2
 8050 COLYELLOW% = 3
 8060 COLBLUE% = 4
 8070 COLMAGENTA% = 5
 8080 COLCYAN% = 6
 8090 COLWHITE% = 7
 8100 COLINTRED% = 9
 8110 COLINTGREEN% = 10
 8120 COLINTYELLOW% = 11
 8130 COLINTBLUE% = 12
 8140 COLINTMAGENTA% = 13
 8150 COLINTCYAN% = 14
 8160 COLINTWHITE% = 15
 8170 mode% = 0 : REM SET MODE HERE.
 8180 RT% = 31 : REM SET RIGHT TEXT.
 8190 LT% = 2 : REM SET LEFT TEXT.
 8200 T1X = 0 : REM TITLE TEXT AGON X.
 8210 T1Y = 0 : REM TITLE TEXT AGON Y.
 8220 T2X = 0 : REM TITLE TEXT LIGHT X.
 8230 T2Y = 0 : REM TITLE TEXT LIGHT Y.
 8240 LX = 0 : REM LOGO X.
 8250 LY = 0 : REM LOGO Y.
 8500 ENDPROC : REM END LOAD_VARS.
 8510 :
 8520 DEF PROC_DRAW_LOGO(LX,LY) : REM ** DRAW_LOGO **
 8530 REM DISPLAY THE LOGO LINE BY LINE FROM PREVIOUSLY USER DEFINED CHARS..
 8540 VDU 31,LX+2,LY,27,160,27,161,31,LX+2,LY+1,27,162,27,163,31,LX+1,LY+2,27,164,27,165,27,166,27,167,31,LX,LY+3,27,168,27,169,27,170,27,171,27,172,27,173
 8550 VDU 31,LX,LY+4,27,174,27,175,27,176,27,169,27,177,27,178,31,LX,LY+5,27,179,27,180,27,181,27,182,27,183,27,184
 8560 VDU 31,LX,LY+6,27,185,27,186,27,187,27,188,27,189,27,190,31,LX,LY+7,27,191,27,192,27,193,27,194,27,195,27,196
 8630 ENDPROC
 9000 DEF PROC_DRAW_AGON(T1X,T1Y) : REM ** DRAW_AGON **
 9010 REM FROM CUSTOM CHARS DEFINED PREVIOUSLY DISPLAYED AS (2x2) CHARS.
 9020 REM AGON.
 9030 VDU 31,T1X,T1Y,27,201,27,202,31,T1X,T1Y+1,27,203,27,204,31,T1X+2,T1Y,27,205,27,206,31,T1X+2,T1Y+1,27,207,27,208,31,T1X+4,T1Y,27,209,27,210
 9040 VDU 31,T1X+4,T1Y+1,27,211,27,212,31,T1X+6,T1Y,27,213,27,214,31,T1X+6,T1Y+1,27,215,27,216
 9050 ENDPROC : REM END DRAW_AGON.
 9060 :
 9070 DEF PROC_DRAW_LIGHT(T2X,T2Y) : REM ** DRAW_LIGHT **
 9080 REM FROM CUSTOM CHARS DEFINED PREVIOUSLY DISPLAY L (2x2) CHARS.
 9090 REM LIGHT.
 9100 VDU 31,T2X,T2Y,27,217,27,218,31,T2X,T2Y+1,27,219,27,220,31,T2X+2,T2Y,27,221,27,222,31,T2X+2,T2Y+1,27,223,27,224,31,T2X+4,T2Y,27,205,27,206
 9110 VDU 31,T2X+4,T2Y+1,27,207,27,208,31,T2X+6,T2Y,27,225,27,226,31,T2X+6,T2Y+1,27,227,27,228,31,T2X+8,T2Y,27,229,27,230,31,T2X+8,T2Y+1,27,231,27,232
 9120 ENDPROC : REM END DRAW_LIGHT.
 9130 :
 9200 DEF PROC_DRAW_HUD : REM ** DRAW_HUD **
 9210 VDU 31,0,0,27,237 : REM TL CORNER.
 9220 FOR TB = 1 TO 78
 9230  VDU 31,TB,0,27,241 : REM TOP BORDER.
 9240 NEXT TB
 9250 VDU 31,79,0,27,238 : REM TR CORNER.
 9260 FOR LB = 1 TO 57
 9270  VDU 31,0,LB,27,243 : REM LEFT BORDER.
 9280 NEXT LB
 9290 FOR RB = 1 TO 57
 9300  VDU 31,79,RB,27,244 : REM RIGHT BORDER.
 9310 NEXT RB
 9320 VDU 31,0,57,27,239 : REM BL CORNER.
 9330 FOR BB = 1 TO 78
 9340  VDU 31,BB,57,27,242 : REM BOTTOM BORDER.
 9350 NEXT BB
 9360 VDU 31,79,57,27,240 : REM BR CORNER.
 9400 ENDPROC : REM END DRAW_HUD.
