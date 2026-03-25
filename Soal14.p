DEFINE VARIABLE cInput    AS CHARACTER NO-UNDO FORMAT "X(60)".
DEFINE VARIABLE cResult   AS CHARACTER NO-UNDO.
DEFINE VARIABLE cChar     AS CHARACTER NO-UNDO.
DEFINE VARIABLE i         AS INTEGER   NO-UNDO.
DEFINE VARIABLE iPos      AS INTEGER   NO-UNDO.

/* ── Input ── */
UPDATE cInput LABEL "Input".

/* ── Process each character ── */
cResult = "".
iPos    = 1.

DO i = 1 TO LENGTH(cInput):
    cChar = SUBSTRING(cInput, i, 1).

    /* Space = keep as is, do NOT increment position counter */
    IF cChar = " " THEN
        cResult = cResult + " ".

    /* Odd position = uppercase */
    ELSE IF iPos MOD 2 = 1 THEN DO:
        IF ASC(cChar) >= 97 AND ASC(cChar) <= 122 THEN
            cResult = cResult + CHR(ASC(cChar) - 32).
        ELSE
            cResult = cResult + cChar.
        iPos = iPos + 1.
    END.

    /* Even position = lowercase */
    ELSE DO:
        IF ASC(cChar) >= 65 AND ASC(cChar) <= 90 THEN
            cResult = cResult + CHR(ASC(cChar) + 32).
        ELSE
            cResult = cResult + cChar.
        iPos = iPos + 1.
    END.

END.

/* ── Show result ── */
MESSAGE "Hasil : " + cResult VIEW-AS ALERT-BOX.

/* Output */
/*
+------------------------------------------------------------+
¦Input                                                       ¦
¦------------------------------------------------------------¦
¦Aku sedang belajar di polytron.                             ¦
+------------------------------------------------------------+



                  +---------------- Message ----------------+
                  ¦ Hasil : AkU sEdAnG bElAjAr Di PoLyTrOn. ¦
                  ¦ --------------------------------------- ¦
                  ¦                  <OK>                   ¦
                  +-----------------------------------------+   
*/
