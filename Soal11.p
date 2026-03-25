DEFINE VARIABLE iLebar    AS INTEGER   NO-UNDO.
DEFINE VARIABLE iNum      AS INTEGER   NO-UNDO.
DEFINE VARIABLE iLetter   AS INTEGER   NO-UNDO.
DEFINE VARIABLE iCol      AS INTEGER   NO-UNDO.
DEFINE VARIABLE iGroup    AS INTEGER   NO-UNDO.
DEFINE VARIABLE cLine     AS CHARACTER NO-UNDO.
DEFINE VARIABLE cTemp     AS CHARACTER NO-UNDO.
DEFINE VARIABLE cResult   AS CHARACTER NO-UNDO.

/* ── Input ── */
UPDATE iLebar LABEL "Lebar (1-6)".

/* ── Validation ── */
IF iLebar < 1 OR iLebar > 6 THEN DO:
    MESSAGE "ERROR: Lebar harus bernilai antara 1 sampai 6."
        VIEW-AS ALERT-BOX ERROR.
    RETURN.
END.

/* ── Init ── */
iNum    = 1.
iLetter = 1.
cResult = "".

/* ── Build output string ── */
DO iGroup = 1 TO 3:

    /* --- Number row --- */
    cLine = "".
    DO iCol = 1 TO iLebar:
        cTemp = STRING(iNum).
        IF cLine = "" THEN cLine = cTemp.
        ELSE cLine = cLine + " " + cTemp.
        iNum = iNum + 1.
    END.
    IF cResult = "" THEN cResult = cLine.
    ELSE cResult = cResult + CHR(10) + cLine.

    /* --- Letter row --- */
    cLine = "".
    DO iCol = 1 TO iLebar:
        cTemp = CHR(64 + iLetter).
        IF cLine = "" THEN cLine = cTemp.
        ELSE cLine = cLine + " " + cTemp.
        iLetter = iLetter + 1.
    END.
    cResult = cResult + CHR(10) + cLine.

END.

/* ── Show result ── */
MESSAGE cResult VIEW-AS ALERT-BOX.

/* Output: */
/*
+-----------+
¦Lebar (1-6)¦
¦-----------¦
¦          5¦
+-----------+

                            +------ Message -------+
                            ¦      1 2 3 4 5       ¦
                            ¦      A B C D E       ¦
                            ¦      6 7 8 9 10      ¦
                            ¦      F G H I J       ¦
                            ¦    11 12 13 14 15    ¦
                            ¦      K L M N O       ¦
                            ¦ -------------------- ¦
                            ¦         <OK>         ¦
                            +----------------------+
*/
