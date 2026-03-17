/* 7. Program Konter 4 Digit Alfanumerik */
DEFINE VARIABLE vAwal    AS CHARACTER INITIAL "001Z".
DEFINE VARIABLE vIterasi AS INTEGER   INITIAL 4.
DEFINE VARIABLE vChars   AS CHARACTER INITIAL "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ".
DEFINE VARIABLE i        AS INTEGER.
DEFINE VARIABLE j        AS INTEGER.
DEFINE VARIABLE vPos     AS INTEGER.
DEFINE VARIABLE vChar    AS CHARACTER.
DEFINE VARIABLE vNextVal AS CHARACTER.

/* Menampilkan Label di baris yang berbeda menggunakan SKIP */
DISPLAY "Nilai Awal:" AT 2 vAwal FORMAT "x(4)" SKIP
        "Iterasi   :" AT 2 vIterasi FORMAT ">>9" 
        WITH FRAME fr7Header NO-LABELS NO-BOX WIDTH 80.

vNextVal = vAwal.

DO i = 1 TO vIterasi:
    /* Tampilkan nilai konter ke bawah */
    DISPLAY vNextVal AT 2 NO-LABEL WITH FRAME fr7Res 10 DOWN NO-BOX.
    DOWN WITH FRAME fr7Res.

    IF i < vIterasi THEN DO:
        DO j = 4 TO 1 BY -1:
            vChar = SUBSTRING(vNextVal, j, 1).
            vPos  = INDEX(vChars, vChar).
            
            IF vChar <> "Z" THEN DO:
                SUBSTRING(vNextVal, j, 1) = SUBSTRING(vChars, vPos + 1, 1).
                LEAVE. 
            END.
            ELSE DO:
                SUBSTRING(vNextVal, j, 1) = "1".
            END.
        END.
    END.
END.

/* Output */
/*
 Nilai Awal: 001Z
 Iterasi   :   4
 001Z
 0021
 0022
 0023 
 */
