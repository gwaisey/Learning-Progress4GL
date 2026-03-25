DEFINE VARIABLE cString   AS CHARACTER NO-UNDO FORMAT "X(60)".
DEFINE VARIABLE cResult   AS CHARACTER NO-UNDO.
DEFINE VARIABLE cWord     AS CHARACTER NO-UNDO.
DEFINE VARIABLE iCount    AS INTEGER   NO-UNDO.
DEFINE VARIABLE i         AS INTEGER   NO-UNDO.

/* ── Input ── */
UPDATE cString LABEL "String".

/* ── Process each word ── */
iCount  = NUM-ENTRIES(cString, " ").
cResult = "".

DO i = 1 TO iCount:
    cWord = ENTRY(i, cString, " ").

    /* Only keep words longer than 6 characters */
    IF LENGTH(cWord) > 6 THEN DO:
        IF cResult = "" THEN cResult = cWord.
        ELSE cResult = cResult + " " + cWord.
    END.
END.

/* ── Show result ── */
MESSAGE "Hasil : " + cResult VIEW-AS ALERT-BOX.

/* Output: */
/*
+------------------------------------------------------------+
¦String                                                      ¦
¦------------------------------------------------------------¦
¦aku sedang belajar progress                                 ¦
+------------------------------------------------------------+



                          +-------- Message ---------+
                          ¦ Hasil : belajar progress ¦
                          ¦ ------------------------ ¦
                          ¦           <OK>           ¦
                          +--------------------------+ 
*/
