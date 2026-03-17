DEFINE VARIABLE iInput AS INTEGER NO-UNDO.
DEFINE VARIABLE i      AS INTEGER NO-UNDO.
DEFINE VARIABLE cRow   AS CHARACTER FORMAT "x(70)" NO-UNDO.

UPDATE iInput LABEL "Input" WITH FRAME frInp NO-BOX SIDE-LABELS.

DISPLAY "Hasil:" WITH FRAME frRes NO-BOX NO-LABELS.

DO i = iInput TO 1 BY -1:
  cRow = FILL("*", i).
    DISPLAY cRow WITH FRAME frRes NO-BOX NO-LABELS DOWN.
      DOWN WITH FRAME frRes.
        END.    
/* Output */
/*
Input: 4
Hasil: ****
       ***
       **
       *       
*/
