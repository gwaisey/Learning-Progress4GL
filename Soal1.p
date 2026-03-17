   /* 1. Program hitung jumlah abjad */
DEFINE VARIABLE vKalimat AS CHARACTER INITIAL "selamatdatang".
DEFINE VARIABLE vAbjad   AS CHARACTER INITIAL "a".
DEFINE VARIABLE vJumlah  AS INTEGER   INITIAL 0.
DEFINE VARIABLE i        AS INTEGER.

/* Loop untuk mengecek setiap huruf satu per satu */
DO i = 1 TO LENGTH(vKalimat):
    IF SUBSTRING(vKalimat, i, 1) = vAbjad THEN
            vJumlah = vJumlah + 1.
            END.

/* DISPLAY dengan FORMAT x(20) supaya tidak terpotong */
DISPLAY
    vKalimat LABEL "Kalimat" FORMAT "x(20)"
        vAbjad   LABEL "Abjad"   FORMAT "x(5)"
            vJumlah  LABEL "Jumlah"  FORMAT ">>9"
                WITH FRAME frSoal1 SIDE-LABELS. 
