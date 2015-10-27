DECLARE SUB split ()
DECLARE SUB unsplit ()
DIM SHARED filename AS STRING
DIM SHARED shortname AS STRING
DIM SHARED filedir AS STRING
DIM SHARED fullpath AS STRING
DIM SHARED opt AS STRING
SCREEN 12
CONST maxsize = 1457664
start:
CLS
COLOR 4
PRINT "                 Welcome To Mike's File Splitter"
COLOR 15
PRINT "Would you like to Split or Unsplit a file?"
INPUT "(s/u)", opt
IF opt = "u" THEN CALL unsplit
IF opt = "s" THEN CALL split
GOTO start:

 SUB split
PRINT "Enter the path of the file that you would like to split:"
INPUT "Path:", fullpath
temp$ = ""
tempname$ = ""
filename = ""
shortname = ""
 DO WHILE temp$ <> "\"
 i = i + 1
 temp$ = LEFT$(RIGHT$(fullpath, i), 1)
  IF temp$ <> "\" THEN tempname$ = tempname$ + temp$
 LOOP
 FOR i = 1 TO LEN(tempname$)
 filename = filename + LEFT$(RIGHT$(tempname$, i), 1)
 NEXT

PRINT filename
filedir = LEFT$(fullpath, LEN(fullpath) - LEN(filename))
shortname = LEFT$(filename, LEN(filename) - 4)
 OPEN fullpath FOR BINARY AS #1
 PRINT "The file that you chose is"; LOF(1); "bytes long."
 IF LOF(1) > maxsize THEN
 PRINT "This file is to large to fit in a floppy"
 PRINT "would you like to split it?"
 INPUT "(y/n)", opt
   IF opt = "y" THEN GOTO split
   IF opt = "n" THEN
   CLS
   PRINT "would you like to quit file splitter?"
   INPUT "(y/n)", opt
     IF opt = "y" THEN CLOSE #1: SYSTEM
     IF opt = "n" THEN CLOSE #1: EXIT SUB
   END IF
 END IF
 IF LOF(1) < maxsize AND LOF(1) > 0 THEN
 PRINT "This file is small enough to fit on a floppy disk, would you still like to split it?"
 INPUT "(y/n)", opt
  IF opt = "y" THEN GOTO split
  IF opt = "n" THEN
  PRINT "Would you like to Quit the program or Choose another file"
  INPUT "(q/c)", opt
   IF opt = "q" THEN CLOSE #1: SYSTEM
   IF opt = "c" THEN CLOSE #1: EXIT SUB
  END IF
END IF
 IF LOF(1) = 0 THEN
 PRINT "The file you have chosen contains no data, it cannot be split."
 PRINT "You must either Chose another file or Quit the program."
 INPUT "(c/q)", opt
  IF opt = "c" THEN CLOSE #1: EXIT SUB
  IF opt = "q" THEN CLOSE #1: SYSTEM
 END IF
split:
CLS
PRINT "how large of pieces would you like the file to be split into?"
PRINT "1> 1mb"
PRINT "2> .5mb"
PRINT "3> .25mb"
INPUT "(1/2/3)", opt
 IF opt = "1" THEN splitsize = maxsize
 IF opt = "2" THEN splitsize = (maxsize / 2)
 IF opt = "3" THEN splitsize = (maxsize / 4)
PRINT "this progam will now make the directory "; filedir
SLEEP 5

 MKDIR filedir + shortname
nofiles = INT(LOF(1) / splitsize) + 1
PRINT "The program will now split your file into"; nofiles; "pieces."
SLEEP 1
CLS
COLOR 3
PRINT "                        SPLITTING FILE!"
COLOR 15
PRINT ""
OPEN filedir + shortname + "\" + shortname + ".spl" FOR OUTPUT AS #2
PRINT #2, shortname
PRINT #2, filename
PRINT #2, nofiles
PRINT #2, LOF(1)
CLOSE #2
readbyte = 0
writebyte = 0
 FOR filenumber = 1 TO nofiles
 OPEN filedir + shortname + "\" + shortname + RIGHT$(STR$(filenumber), LEN(STR$(filenumber)) - 1) + ".dat" FOR BINARY AS #2
  PRINT "Now making split file#"; filenumber; "....Please wait"
  FOR writebyte = 1 TO splitsize
    readbyte = readbyte + 1
    IF readbyte > LOF(1) THEN CLOSE #1: CLOSE #2: GOTO done
    GET #1, readbyte, byte
  PUT #2, writebyte, byte
  NEXT
 CLOSE #2
 NEXT
done:
COLOR 3
PRINT "               FILE SUCCESSFULLY SPLIT!"

         
PRINT "Do you want to keep the directory that was created by this program?"
INPUT "(y/n)", opt
 IF opt = "y" THEN EXIT SUB
 IF opt = "n" THEN RMDIR filedir
CLOSE #1
END SUB

SUB unsplit
PRINT "Enter the path and file name of the make file (.spl extenstion):"
INPUT "Path:", fullpath
OPEN fullpath FOR INPUT AS #1
INPUT #1, shortname
INPUT #1, filename
INPUT #1, nofiles
INPUT #1, filesize
CLOSE #1
filedir = LEFT$(fullpath, (LEN(fullpath) - LEN(filename)))
 PRINT filedir
 REM SLEEP
 REM EXIT SUB



readbyte = 0
writebyte = 0
CLS
COLOR 3
PRINT "The program will now create the following file from the split files"
COLOR 15
PRINT filedir + filename
PRINT ""
SLEEP



OPEN filedir + filename FOR BINARY AS #1
COLOR 4
PRINT "the program will now unsplit the file: "; filename
COLOR 15
 LOCATE 5, 1
 FOR filenumber = 1 TO nofiles
 PRINT "unsplitting file: "; filedir + shortname + RIGHT$(STR$(filenumber), LEN(STR$(filenumber)) - 1) + ".dat"
 OPEN filedir + shortname + RIGHT$(STR$(filenumber), LEN(STR$(filenumber)) - 1) + ".dat" FOR BINARY AS #2
 readbyte = 0
  DO
  readbyte = readbyte + 1
  IF readbyte > LOF(2) THEN GOTO endoffile
  writebyte = writebyte + 1
  REM PRINT "Writeing byte"; writebyte; "out of "; filesize; "bytes ("; INT(100 * (writebyte / filesize)); "% done!)"
  GET #2, readbyte, byte

  PUT #1, writebyte, byte

  LOOP
endoffile:
 CLOSE #2

 NEXT
CLOSE #1
COLOR 4
PRINT "The file "; filename; " has been successfully created!"
SLEEP
END SUB

