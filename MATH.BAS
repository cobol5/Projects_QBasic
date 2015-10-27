CLS
COLOR 1
PRINT "welcome to mike's math program, enter your choice"
choice:
  COLOR 14
  PRINT "1. multiplacation *"
  PRINT "2. devision /"
  PRINT "3. addition +"
  PRINT "4. subtraction -"
  PRINT "5. powers ^"
  PRINT "6. Quit"
  COLOR 1
  INPUT "choice = ", c
 IF c < 1 THEN PRINT "thats not a choice": SLEEP 1: CLS : GOTO choice
 IF c > 6 THEN PRINT "thats not a choice": SLEEP 1: CLS : GOTO choice
 IF c = 2 THEN GOTO devide
 IF c = 3 THEN GOTO addition
 IF c = 4 THEN GOTO subtraction
 IF c = 5 THEN GOTO power
  IF c = 6 THEN : CLS : COLOR 4: LOCATE 15, 35: PRINT "BYE BYE": COLOR 1: END
 COLOR 14
 PRINT "what two numbers do you want to multiply?"
 PRINT "(press M to go back to the menu)"
SLEEP: IF INKEY$ = "m" THEN : CLS : GOTO choice
COLOR 1
INPUT "first number =", n1
PRINT "multiplied by"
INPUT "second number =", n2
COLOR 4
PRINT n1; "*"; n2; "="; n1 * n2
SLEEP: CLS : GOTO choice
devide:
COLOR 14
PRINT "what two numbers do you want to devide?"
PRINT "(press M to go back to the main menu)"
SLEEP: IF INKEY$ = "m" THEN : CLS : GOTO choice
COLOR 1
INPUT "first number =", n1
PRINT "devided by"
INPUT "second number =", n2
COLOR 4
PRINT n1; "/"; n2; "="; n1 / n2
SLEEP: CLS : GOTO choice
addition:
COLOR 14
PRINT "what two numbers do you want to add together?"
PRINT "(press M to go back to the main menu)"
SLEEP: IF INKEY$ = "m" THEN : CLS : GOTO choice
COLOR 1
INPUT "first number =", n1
PRINT "plus"
INPUT "second number =", n2
COLOR 4
PRINT n1; "+"; n2; "="; n1 + n2
SLEEP: CLS : GOTO choice
subtraction:
COLOR 14
PRINT "what two numbers do you want to subtract?"
PRINT "(press M to go back to the main menu)"
SLEEP: IF INKEY$ = "m" THEN : CLS : GOTO choice
COLOR 1
INPUT "first number =", n1
PRINT "minus"
INPUT "second number =", n2
COLOR 4
PRINT n1; "-"; n2; "="; n1 - n2
SLEEP: CLS : GOTO choice
power:
COLOR 14
PRINT "type the numbers (first # to the power of the second #)"
PRINT "(press M to go back to the main menu)"
SLEEP: IF INKEY$ = "m" THEN : CLS : GOTO choice
COLOR 1
INPUT "first number =", n1
PRINT "to the power of"
INPUT "second number =", n2
COLOR 4
PRINT n1; "to the power of"; n2; "="; n1 ^ n2
SLEEP: CLS : GOTO choice

