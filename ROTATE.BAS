SCREEN 13
a = 1
d = 1
DIM C#(360)
DIM S#(360)
FOR i = 1 TO 360
C#(i) = COS(i / 180 * 3.14)
S#(i) = SIN(i / 180 * 3.14)
NEXT i
COLOR 4
DO
a = a + .1
IF a > 360 THEN a = 1: d = d + 1
h = 160 + (d * COS(a / 180 * 3.14))
v = 100 + (d * SIN(a / 180 * 3.14))
PSET (h, v), 100 * (a / 360)
IF d > 200 THEN GOTO here
LOOP
here:
DIM p%(10)
DIM C%(20000)
GET (110, 50)-(210, 150), C%
CLS
a% = 1
DO
key$ = INKEY$
IF key$ = "," THEN a% = a% + 2: CLS
IF key$ = "." THEN a% = a% - 2: CLS
PUT (3, 3), C%, PSET
IF a% > 360 THEN a% = 1
IF a% < 1 THEN a% = 360
FOR h = -50 TO 56
FOR v = -50 TO 56
GET (h + 50, v + 50)-(h + 50, v + 50), p%
h3 = h * C#(a%) + v * S#(a%)
v3 = v * C#(a%) - h * S#(a%)
PUT (200 + h3 * 1, 100 + v3 * 1), p%, PSET
NEXT
NEXT
a% = a% + 1
REM LINE (0, 0)-(320, 200), 4, B
IF INKEY$ = CHR$(27) THEN END
LOOP

