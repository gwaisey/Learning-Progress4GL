DEFINE VARIABLE dInput      AS DECIMAL   NO-UNDO FORMAT ">>>>>>9.9999999".
DEFINE VARIABLE dRounded    AS DECIMAL   NO-UNDO FORMAT ">>>>>>9.999".
DEFINE VARIABLE dSisa       AS DECIMAL   NO-UNDO FORMAT ">>>>>>9.999999".
DEFINE VARIABLE iWhole      AS INT64     NO-UNDO.

/* ── Input ── */
UPDATE dInput LABEL "Input".

/* ── Truncate to 3 decimal places ── */
iWhole   = TRUNCATE(dInput * 1000, 0).
dRounded = iWhole / 1000.

/* ── Remainder rounded to 6 decimal places ── */
dSisa = ROUND(dInput - dRounded, 6).

/* ── Show result ── */
MESSAGE
    "Pembulatan : " + STRING(dRounded, ">>>>>>9.999") + CHR(10) +
    "Sisa       : " + STRING(dSisa,    ">>>>>>9.999999")
    VIEW-AS ALERT-BOX.
    
/*Output*/
/*
+---------------+
¦          Input¦
¦---------------¦
¦    557.1234567¦
+---------------+



                        +---------- Message -----------+
                        ¦   Pembulatan :     557.123   ¦
                        ¦ Sisa       :       0.000457  ¦
                        ¦ ---------------------------- ¦
                        ¦             <OK>             ¦
                        +------------------------------+                        
*/
