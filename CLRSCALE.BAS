SCREEN 13
a = 1
d = 1
DIM c#(360)
DIM s#(360)
FOR i = 1 TO 360
c#(i) = COS(i / 180 * 3.14)
s#(i) = SIN(i / 180 * 3.14)
NEXT i
DO
a = a + .1
IF a > 360 THEN a = 1: d = d + 1
h = 160 + (d * COS(a / 180 * 3.14))
v = 100 + (d * SIN(a / 180 * 3.14))
PSET (h, v), 256 * (a / 360)
IF d > 200 THEN GOTO here
LOOP
here:
DO
IF INKEY$ <> "" THEN END
LOOP

