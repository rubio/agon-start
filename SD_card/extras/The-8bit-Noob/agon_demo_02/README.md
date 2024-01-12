# AGON_DEMO_02_UDC2
A simple demo of using user defined characters.<BR>
The same as AGON_DEMO_01_UDC but using VDU statements chained together instead of PRINT TAB etc.
Less code but not as human readable.

# Look at this section of line 9030:
```
9030 VDU 31,T1X,T1Y,27,201,27,202,
VDU 31,T1X,T1Y = PRINT TAB(T1X,T1Y)......
VDU 27,201     = CHR$(201)......
VDU 27,202     = CHR$(202)......
```
Now look at AGON_DEMO_01_UDC and you see there on line 9060.
```
PRINT TAB(T1X,T1Y);CHR$(201);CHR$(202)
```
