DIM x(3), y(3) ' x and y coordinates
DIM t, b, m 'top,middle, and bottom points
DIM tm, mb, tb 'slopes
DIM str, stp 'horizontal start and stop positions
RANDOMIZE TIMER
SCREEN 12
time = TIMER
DO
FOR i = 1 TO 3  'get random points
y(i) = (RND * 480)
x(i) = (RND * 640)
NEXT i

FOR i = 1 TO 3 'find out which points are at the top and  bottom
IF i = 2 THEN GOTO two
IF i = 3 THEN GOTO three

IF y(i) < y(2) AND y(i) < y(3) THEN t = i
IF y(i) > y(2) AND y(i) > y(3) THEN b = i
GOTO done
two:
IF y(i) < y(1) AND y(i) < y(3) THEN t = i
IF y(i) > y(1) AND y(i) > y(3) THEN b = i
GOTO done
three:
IF y(i) < y(1) AND y(i) < y(2) THEN t = i
IF y(i) > y(1) AND y(i) > y(2) THEN b = i
done:
NEXT i
FOR i = 1 TO 3 'find out which point is in the middle
IF i <> t AND i <> b THEN m = i
NEXT i

REM CLS 'clear the screen
clr = RND * 16
FOR v = y(t) TO y(b)
tm = ((x(m) - x(t)) / (y(m) - y(t))) 'find the slop between the top and middle points
mb = ((x(b) - x(m)) / (y(b) - y(m))) 'find the slop between the middle and bottom points
tb = ((x(b) - x(t)) / (y(b) - y(t))) 'find the slop between the top and bottom points
str = x(t) + (tb * (v - y(t))) 'get the starting position to draw the fill line
IF v < y(m) THEN stp = x(t) + (tm * (v - y(t))) 'find the stoping position to draw the fill line
IF v > y(m) THEN stp = x(m) + (mb * (v - y(m)))
LINE (str, v)-(stp, v), clr
NEXT v
LINE (x(1), y(1))-(x(2), y(2)), 0 'draw a line between all the points (make the triangle)
LINE (x(2), y(2))-(x(3), y(3)), 0
LINE (x(3), y(3))-(x(1), y(1)), 0
REM SLEEP 1
speed = speed + 1
IF TIMER > time + 1 THEN LOCATE 1, 1: PRINT speed: time = TIMER: speed = 0
LOOP

