DECLARE SUB collisions ()
DECLARE SUB cllsntct ()
DECLARE SUB bullets ()
DECLARE SUB menu ()
DECLARE SUB gtshp ()
DECLARE SUB drwshp ()
DIM SHARED sh(100)
DIM SHARED c(360)
DIM SHARED s(360)
DIM SHARED p(100)
DIM SHARED an
DIM SHARED x
DIM SHARED y
DIM SHARED x2
DIM SHARED y2
DIM SHARED score
DIM SHARED sheild
DIM SHARED sh

DIM SHARED re(100)  'rock egsists
DIM SHARED rht(100)  'rock being hit
DIM SHARED rd(100)   'rocks diameter
DIM SHARED rno  'number of rocks
DIM SHARED rds(100)  'rock destroyed
DIM SHARED rx(100)  'rock x coordinate
DIM SHARED ry(100)  'rock y coordinate
DIM SHARED rx2(100)  'rock x movement
DIM SHARED ry2(100)  'rock y movement
DIM SHARED rcl(100)

DIM SHARED by(10)  'bullet y coordinate
DIM SHARED bx(10) 'bullet x coordinate
DIM SHARED by2(10)  'bullet y movement
DIM SHARED bx2(10)  'bullet x movement
DIM SHARED f(10)
DIM bl
DIM SHARED ad
SCREEN 7, 0, 1, 0

CALL gtshp
CALL menu


ad = 20
an = 1
FOR i = 1 TO 360
c(i) = COS(i / 180 * 3.14)
s(i) = SIN(i / 180 * 3.14)
NEXT i
x = 160
y = 100
RANDOMIZE (TIMER)

sheild = 10
lvlst = 1
rno = 10
bl = 0
DO
FOR i = 1 TO rno
 IF lvlst = 1 THEN rx(i) = RND * 320
 IF lvlst = 1 THEN ry(i) = RND * 200
 IF lvlst = 1 THEN rx2(i) = RND
 IF lvlst = 1 THEN ry2(i) = RND
 IF lvlst = 1 THEN rd(i) = 2 + (RND * ad)
 IF lvlst = 1 THEN re(i) = 1
 IF lvlst = 1 THEN rcl(i) = 16
NEXT i

k$ = INKEY$

CLS




IF sh = 0 THEN x = 160: y = 100: x2 = 0: y2 = 0
LOCATE 1, 1: PRINT sh
IF sh = 1 AND k$ = CHR$(0) + "K" THEN an = an + 5
IF sh = 1 AND k$ = CHR$(0) + "M" THEN an = an - 5
IF sh = 1 AND k$ = CHR$(0) + "H" THEN x2 = x2 + (.25 * s(an)): y2 = y2 + (.25 * c(an)): LINE ((5 + x + (7 * s(an))), (5 + y + (7 * c(an))))-(5 + x + (5 * SIN((an - 30) / 180 * 3.14)), (5 + y + (5 * COS((an - 30) / 180 * 3.14)))), 14: LINE ((5 + x + (7 * s(an))), (5 + y + (7 * c(an))))-(5 + x + (5 * SIN((an + 30) / 180 * 3.14)), (5 + y + (5 * COS((an + 30) / 180 * 3.14)))), 14
IF sh = 1 AND k$ = CHR$(0) + "P" THEN x2 = x2 - (.25 * s(an)): y2 = y2 - (.25 * c(an))
IF sh = 1 AND k$ = "s" THEN x2 = 0: y2 = 0
IF k$ = "q" THEN CALL menu

IF sh = 1 THEN x = x - x2
IF sh = 1 THEN y = y - y2

IF x < 0 THEN x = x + 320
IF x > 320 THEN x = x - 320
IF y < o THEN y = y + 200
IF y > 200 THEN y = y - 200


IF an > 360 THEN an = an - 360
IF an < 0 THEN an = an + 360

CALL collisions
IF sheild > 0 THEN LINE (220, 1)-(220 + sheild, 5), 2, BF
LINE (219, 0)-(319, 6), 4, B
IF k$ = " " THEN f(bl) = 1: bx2(bl) = (6 * s(an)): by2(bl) = (6 * c(an)): bx(bl) = (5 + x + (-5 * s(an))): by(bl) = (5 + y + (-5 * c(an))): bl = bl + 1: SOUND 500, .5: sh = 1
IF bl > 10 THEN bl = 1
CALL bullets
IF sh = 1 THEN CALL drwshp
REM LOCATE 1, 1: PRINT score
PCOPY 1, 0

 
lvlst = 0
LOOP

DATA 00, 00, 00, 00, 04, 04, 00, 00, 00, 00
DATA 00, 00, 00, 00, 04, 04, 00, 00, 00, 00
DATA 00, 00, 00, 00, 04, 04, 00, 00, 00, 00
DATA 00, 00, 00, 00, 04, 04, 00, 00, 00, 00
DATA 00, 00, 00, 00, 04, 04, 00, 00, 00, 00
DATA 00, 00, 00, 04, 04, 04, 04, 00, 00, 00
DATA 00, 00, 04, 04, 01, 01, 04, 04, 00, 00
DATA 04, 04, 04, 04, 01, 01, 04, 04, 04, 04
DATA 04, 04, 04, 04, 04, 04, 04, 04, 04, 04
DATA 04, 04, 04, 04, 04, 04, 04, 04, 04, 04

SUB bullets
FOR i = 1 TO 10
 IF bx(i) < 1 THEN f(i) = 0
 IF bx(i) > 320 THEN f(i) = 0
 IF by(i) < 1 THEN f(i) = 0
 IF by(i) > 200 THEN f(i) = 0
 IF f(i) = 1 THEN CIRCLE (bx(i), by(i)), 2, 14
 IF f(i) = 1 THEN bx(i) = bx(i) - bx2(i)
 IF f(i) = 1 THEN by(i) = by(i) - by2(i)
NEXT i
END SUB

SUB collisions
FOR i = 1 TO rno
 IF re(i) = 1 THEN rx(i) = rx(i) + rx2(i)
 IF re(i) = 1 THEN ry(i) = ry(i) + ry2(i)
 IF (re(i) OR rht(i)) = 1 THEN CIRCLE (rx(i), ry(i)), rd(i), rcl(i)
 IF re(i) = 1 AND rx(i) < 0 THEN rx(i) = rx(i) + 320
 IF re(i) = 1 AND rx(i) > 320 THEN rx(i) = rx(i) - 320
 IF re(i) = 1 AND ry(i) < 0 THEN ry(i) = ry(i) + 200
 IF re(i) = 1 AND ry(i) > 200 THEN ry(i) = ry(i) - 200
FOR B = 1 TO 10
 IF re(i) = 1 AND f(B) = 1 AND bx(B) > rx(i) - rd(i) AND bx(B) < rx(i) + rd(i) AND by(B) > ry(i) - rd(i) AND by(B) < ry(i) + rd(i) THEN f(B) = 0: rht(i) = 1: re(i) = 0: SOUND 200, .4: LOCATE 1, 1: score = score + 10

NEXT B
 IF rht(i) = 1 THEN rd(i) = rd(i) + 1: rcl(i) = rcl(i) + 1
 IF rcl(i) > 32 THEN rht(i) = 0
 IF sh = 1 AND re(i) = 1 AND (x + 10) > rx(i) - rd(i) AND (x) < rx(i) + rd(i) AND (y + 10) > ry(i) - rd(i) AND (y) < ry(i) + rd(i) THEN sheild = sheild - 1: rx2 = rx2(i): rx2(i) = -x2: x2 = -rx2: ry2 = ry2(i): ry2(i) = -y2: y2 = -ry2: SOUND 100, .5: IF sheild > 0 THEN CIRCLE (x + 5, y + 5), 10, 3: IF sheild < 0 THEN lives = lives - 1: sh = 0
NEXT i
END SUB

SUB drwshp
m = 0
FOR v = -5 TO 5 STEP 1.1
FOR h = -5 TO 5 STEP 1.1

m = m + 1
p = p(m)

h2 = h * c(an) + v * SIN(an / 180 * 3.14)
v2 = v * c(an) - h * SIN(an / 180 * 3.14)

h2 = h2 + (x + 5)
v2 = v2 + (y + 5)

IF h2 < 1 THEN h2 = h2 + 319
IF h2 > 319 THEN h2 = h2 - 319
IF v2 < 1 THEN v2 = v2 + 199
IF v2 > 199 THEN v2 = v2 - 199
PSET (h2, v2), p

NEXT
NEXT

END SUB

SUB gtshp
FOR h = 1 TO 10
FOR v = 1 TO 10
READ p
PSET (v, h), p
m = m + 1
p(m) = p
NEXT
NEXT
GET (0, 0)-(10, 10), sh
END SUB

SUB menu
FOR i = 1 TO 3
SCREEN 7
COLOR 15

LINE (0, 0)-(320, 200), 1, BF

LOCATE 2, 16: PRINT "ASTROIDS"
LOCATE 3, 11: PRINT "by michael Peterson"
LINE (5, 5)-(315, 195), 0, B
LINE (124, 60)-(190, 140), 8, BF
LINE (123, 59)-(191, 141), 0, B
LOCATE 9, 17: PRINT "1.play"
LOCATE 11, 17: PRINT "2.scores"
LOCATE 13, 17: PRINT "3.exit"
NEXT i
PCOPY 1, 0
DO
IF INKEY$ = "1" THEN GOTO 10
IF INKEY$ = "3" THEN CLS : PRINT "bye bye": END
LOOP
10
END SUB

