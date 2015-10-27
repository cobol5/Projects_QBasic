DIM c!(360), s!(360)
DIM x(6), y(6), z(6), x2(6), y2(6), Z2(6), x3(6), y3(6)
DIM a1(80), a2(80), a3(80), a4(80), a5(80), a6(80)
FOR i = 1 TO 360
c!(i) = COS(i * 3.1415934# / 180): s!(i) = SIN(i * 3.141593# / 180)
NEXT
p = 1: t = 1
xcenter = 150: ycenter = 100: zcenter = 150
delay = 0
SCREEN 7, 0, 1, 0
PRINT 1
GET (0, 0)-(16, 16), a1
CLS
PRINT 2
GET (0, 0)-(16, 16), a2
CLS
PRINT 3
GET (0, 0)-(16, 16), a3
CLS
PRINT 4
GET (0, 0)-(16, 16), a4
CLS
PRINT 5
GET (0, 0)-(16, 16), a5
CLS
PRINT 6
GET (0, 0)-(16, 16), a6
x(1) = 50
y(1) = 0
z(1) = 0
x(2) = -50
y(2) = 0
z(2) = 0
x(3) = 0
y(3) = -50
z(3) = 0
x(4) = 0
y(4) = 50
z(4) = 0
x(5) = 0
y(5) = 0
z(5) = -50
x(6) = 0
y(6) = 0
z(6) = 50
DO
press$ = INKEY$
REM IF press$ <> "" THEN CLS
CLS
FOR i = 1 TO 6
x2(i) = -x(i) * s!(t) + y(i) * c!(t)
y2(i) = -x(i) * c!(t) * s!(p) - y(i) * s!(t) * s!(p) - z(i) * c!(p)
Z2(i) = -x(i) * c!(t) * c!(p) - y(i) * s!(t) * c!(p) + z(i) * s!(p)
x3(i) = 256 * (x2(i) / (Z2(i) + zcenter)) + xcenter
y3(i) = 256 * (y2(i) / (Z2(i) + zcenter)) + ycenter
PSET (x3(i), y3(i)), 15
NEXT
LINE (x3(1), y3(1))-(x3(2), y3(2)), 4
LINE (x3(3), y3(3))-(x3(4), y3(4)), 4
LINE (x3(5), y3(5))-(x3(6), y3(6)), 4
LINE (x3(1), y3(1))-(x3(5), y3(5)), 4
LINE (x3(2), y3(2))-(x3(5), y3(5)), 4
LINE (x3(3), y3(3))-(x3(5), y3(5)), 4
LINE (x3(4), y3(4))-(x3(5), y3(5)), 4
LINE (x3(2), y3(2))-(x3(6), y3(6)), 4
LINE (x3(1), y3(1))-(x3(6), y3(6)), 4
LINE (x3(6), y3(6))-(x3(3), y3(3)), 4
LINE (x3(4), y3(4))-(x3(6), y3(6)), 4
LINE (x3(1), y3(1))-(x3(4), y3(4)), 4
LINE (x3(5), y3(5))-(x3(6), y3(6)), 4
LINE (x3(4), y3(4))-(x3(2), y3(2)), 4
LINE (x3(3), y3(3))-(x3(2), y3(2)), 4
LINE (x3(3), y3(3))-(x3(1), y3(1)), 4

REM PUT (x3(1), y3(1)), a1: PUT (x3(2), y3(2)), a2: PUT (x3(3), y3(3)), a3: PUT (x3(4), y3(4)), a4: PUT (x3(5), y3(5)), a5: PUT (x3(6), y3(6)), a6
PCOPY 1, 0
IF press$ = "8" THEN p = p + 2
IF press$ = "2" THEN p = p - 2
IF press$ = "4" THEN t = t + 2
IF press$ = "6" THEN t = t - 2
p = p + 1
t = t + 1
IF p > 360 THEN p = 1
IF p < 1 THEN p = 360
IF t > 360 THEN t = 1
IF t < 1 THEN t = 360
FOR i = 1 TO delay: NEXT
LOOP UNTIL press$ = CHR$(27)

