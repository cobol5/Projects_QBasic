'                WELCOME TO MY HUMBLE 3D PLANE PROGRAM.
' written by Michael Peterson on December 31, 2001 (New Years Eve)
' Ok, David, here is my latest invention,  It's the newest version of
' My 3D plane program.  The other versions I made required four seperate
' files which contained the data for the 3d points as well as data that
' the program used to determine what points to draw lines between.
' This program is different in that the data is inbedded in it with data
' statements, so it is completely self contained.
'  I had to write a program that read all the data files for the older versions
'  and wrote them into data statments at the end of this program. then I
'  rewrote the rest of the program
'
'to change the angle of the plane, use the arrow keys.
'NUMLOCK MUST BE ON.  To change the zcenter, use nubmers 7 and 1 on the
'keypad.  to change the magnafication use the 9 and 3 numbers on the keypad
'move the plane up and down with the with the 8 and 2 buttons.
'to move the plane left and right use 4 and 6
' and finnely to reset roll and pitch back to zero, hit number 5.
'  ENJOY

DECLARE SUB getpoints ()
DECLARE SUB drw ()
SCREEN 12
DIM SHARED pl.x(41), pl.y(41), pl.z(41), p1(66), p2(66)
DIM SHARED pl.xb(41), pl.yb(41), pl.x2(41), pl.y2(41), pl.z2(41)
DIM SHARED s(360), c(360)
DIM SHARED roll, pitch, pnt, xcenter, ycenter, zcenter, mag
DIM SHARED btn  AS STRING
xcenter = 320: ycenter = 240: zcenter = 200: mag = 3500

'this part takes sine and cosine and puts them into an array
FOR i = 0 TO 360
c(i) = COS(i / 180 * 3.14)
s(i) = SIN(i / 180 * 3.14)
NEXT i

CALL getpoints
DO
key$ = INKEY$

' all of these "if" statements determine what the user is pressing on the keyboard
' and changes the variables accordingly.
IF key$ <> "" THEN CLS

'this part detects if an arow key is pressed, it's kinda wierd but
'if the user presses up the key that is detected is actually
' ASCI charactor #0 plus H.
IF key$ = CHR$(0) + "H" THEN pitch = pitch + 1
IF key$ = CHR$(0) + "P" THEN pitch = pitch - 1
IF key$ = CHR$(0) + "K" THEN roll = roll + 1
IF key$ = CHR$(0) + "M" THEN roll = roll - 1

IF key$ = "5" THEN pitch = 0: roll = 0
IF key$ = "8" THEN ycenter = ycenter - 1
IF key$ = "2" THEN ycenter = ycenter + 1
IF key$ = "4" THEN xcenter = xcenter - 1
IF key$ = "6" THEN xcenter = xcenter + 1
IF key$ = "7" THEN zcenter = zcenter + 10
IF key$ = "1" THEN zcenter = zcenter - 10

IF key$ = "9" THEN mag = mag + 100
IF key$ = "3" THEN mag = mag - 100

IF key$ = "-" THEN pnt = pnt - 1
IF key$ = "=" THEN pnt = pnt + 1
IF pnt < 0 THEN pnt = 41
IF pnt > 41 THEN pnt = 0
CALL drw
LOOP



' these data statements are what hold all the points and all the data for
' the arrays p1() and p2()
REM // X POINTS \\
DATA   1.5,-1.5,-1.5,-1.5, 1.5, 1.5, 1.5,-1.5, 1.5,-1.5,-1, 1,-1, 1, 1.5,-1.5,-1.5, 1.5, .5, .5,-.5,-.5, 6, 6, 0,-6,-6, 0, 0, 0, 1.2,-1.2, 15, 16, 16, 15,-15,-16,-16,-15, 0
REM // Y POINTS \\
DATA  -4,-4,-3.5,-3,-3,-3.5,-3,-3,-1,-1, 0, 0, 2, 2, 3, 3, 3, 3, 1, 0, 0, 1, .5, .5, .5, .5, .5,-5,-5,-.5,-1,-1,-4,-4.5,-5,-4,-4,-5,-4.5,-4, .5
REM // Z POINTS \\
DATA 0, 0,-1.5,-2,-2,-1.5, 5, 5,-3,-3,-8,-8,-8,-8,-2,-2, 5, 5, 20, 20, 20, 20, 20, 17, 14, 17, 20, 20, 17, 14, 8, 8,-2,-1.5, 0, 5, 5, 0,-1.5,-2, 20
REM // 1st line point \\
DATA  11, 11, 13, 13, 14, 16, 17, 18, 17, 17, 18, 19, 20, 22, 20, 41, 28, 29, 20, 21, 32, 31, 32, 7, 7, 1, 6, 4, 4, 3, 2, 5, 4, 10, 9, 10, 23, 27, 26, 25, 24, 5, 6, 1, 7, 33, 33, 34, 35, 4, 3, 2, 8, 37, 37, 38, 39, 5, 7, 4, 8, 3, 2, 5, 4, 12
REM // 2nd line point \\
DATA  13, 12, 14, 16, 15, 15, 16, 15, 18, 22, 19, 22, 19, 21, 21, 28, 29, 30, 31, 32, 31, 7, 8, 8, 1, 6, 5, 5, 3, 2, 8, 9, 10, 9, 12, 11, 27, 26, 25, 24, 23, 33, 34, 35, 36, 36, 34, 35, 36, 40, 39, 38, 37, 40, 38, 39, 40, 15, 18, 16, 17, 6, 1, 7, 8, 14

SUB drw
SHARED p1()
SHARED p2()

' this part prints some variables onto the screen
LOCATE 1, 1: PRINT "point :"; pnt
LOCATE 2, 1: PRINT "zcenter :"; zcenter
LOCATE 3, 1: PRINT "mag :"; mag
LOCATE 4, 1: PRINT "roll :"; STR$(roll) + CHR$(248)
LOCATE 5, 1: PRINT "pitch :"; STR$(pitch) + CHR$(248)

'this part determines if pitch or roll has out of the 360 degree range
'and fixes them
 IF pitch < 0 THEN pitch = pitch + 360
 IF pitch > 360 THEN pitch = pitch - 360
 IF roll < 0 THEN roll = roll + 360
 IF roll > 360 THEN roll = roll - 360

FOR i = 1 TO 41
' This section rotates the points around the pitch an roll axeses.
' I need some help on this part
pl.x2(i) = pl.x(i) * c(roll) + pl.y(i) * s(roll)
pl.y2(i) = pl.y(i) * c(roll) - pl.x(i) * s(roll)
pl.z2(i) = -pl.z(i)
pl.y2(i) = pl.y2(i) * c(pitch) + pl.z2(i) * s(pitch)
pl.z2(i) = pl.z2(i) * c(pitch) - pl.y2(i) * s(pitch)
' here is the equation for a 2D rotation
'X2 = X * c! + Y * s!
'Y2 = Y * c! - X * s!

' this part converts the 3D point into 2D point so that it can be drawn on the screen
pl.xb(i) = mag * (pl.x2(i) / (pl.z2(i) + zcenter)) + xcenter
pl.yb(i) = mag * (pl.y2(i) / (pl.z2(i) + zcenter)) + ycenter


PSET (pl.xb(i), pl.yb(i)), 4

' I used this part while I was debugging the program. It draws a circle around
' the point defined by pnt .  when I first ran it there was a line missing in
' the frame and I used it do determine what points the line should go between.
IF i = pnt THEN CIRCLE (pl.xb(i), pl.yb(i)), 10, 5
NEXT

' this loop is what actullay draws the frame of the plane.
' It works by using the p1() and p2() arrays wich tell it what points to draw
' the lines between
FOR i = 1 TO 66
LINE (pl.xb(p1(i)), pl.yb(p1(i)))-(pl.xb(p2(i)), pl.yb(p2(i))), 4
NEXT

' this statement waits for the verticle retrace on the screen (it doesn't
' make much of a difference in this program)
WAIT &H3DA, 8
END SUB

SUB getpoints
FOR i = 1 TO 41
READ pl.x(i)
NEXT
FOR i = 1 TO 41
READ pl.y(i)
NEXT
FOR i = 1 TO 41
READ pl.z(i)
NEXT
FOR i = 1 TO 66
READ p1(i)
NEXT
FOR i = 1 TO 66
READ p2(i)
NEXT

END SUB

