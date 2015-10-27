
SCREEN 13
DIM c#(360)
DIM g%(15000)
DIM c%(2200)
FOR i = 1 TO 360
c#(i) = COS(i / (180 / 3.141593))
NEXT i
CIRCLE (10, 50), 5, 3
GET (3, 0)-(17, 99), c%
CLS
p# = 1
a# = 1
a! = -1
DO
IF v# < 100 THEN c% = 1
IF v# = 100 THEN c% = 8
IF v# > 100 THEN c% = 4

KEY$ = INKEY$
LOCATE 1, 1
PRINT "Cosine ="; -1 * (c#(p#)); "        "
IF KEY$ = "-" THEN a# = a# - .25
IF KEY$ = "=" THEN a# = a# + .25
IF a# < 0 THEN a# = 0
p# = p# + a#
IF p# > 360 THEN p# = 1
v# = 100 + (50 * c#(p#))
REM SOUND 1040 + (1000 * c#(p#)), .4
REM PSET (290, v#), 12
IF p# > 1 AND p# < 360 THEN LINE (290, v#)-(289, 100 + (50 * c#(p# - a#))), c%
REM CIRCLE (300, v#), 5, 3
GET (2, 50)-(290, 150), g%
REM CLs
PUT (295, (v# - 50)), c%, PSET
PUT (1, 50), g%, PSET
LINE (290, 49)-(290, v# - 1), 0
LINE (49, 100)-(289, 100), 8
LINE (290, 151)-(290, v# + 1), 0
LINE (0, 49)-(291, 151), 7, B

LOOP

