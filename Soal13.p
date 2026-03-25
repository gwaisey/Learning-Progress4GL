DEFINE VARIABLE iDeret    AS INTEGER   NO-UNDO.
DEFINE VARIABLE cResult   AS CHARACTER NO-UNDO.
DEFINE VARIABLE iNum      AS INTEGER   NO-UNDO.
DEFINE VARIABLE iLetter   AS INTEGER   NO-UNDO.
DEFINE VARIABLE i         AS INTEGER   NO-UNDO.

UPDATE iDeret LABEL "Deret ke".

cResult = "".
iNum    = 1.
iLetter = 1.

DO i = 1 TO iDeret:
    IF i MOD 2 = 1 THEN DO:
        IF cResult = "" THEN cResult = STRING(iNum).
        ELSE cResult = cResult + " " + STRING(iNum).
        iNum = iNum + 1.
    END.
    ELSE DO:
        cResult = cResult + " " + CHR(96 + iLetter).
        iLetter = iLetter + 1.
    END.
END.

MESSAGE "Hasil : " + cResult VIEW-AS ALERT-BOX.

/* OUtput */
/*
+----------+
¦  Deret ke¦
¦----------¦
¦        11¦
+----------+



                       +----------- Message -----------+
                       ¦ Hasil : 1 a 2 b 3 c 4 d 5 e 6 ¦
                       ¦ ----------------------------- ¦
                       ¦             <OK>              ¦
                       +-------------------------------+                        
*/
