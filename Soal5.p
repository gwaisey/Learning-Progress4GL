/* 5. Buat program deret fibonansi! */
DEFINE VARIABLE vIterasi AS INTEGER INITIAL 11.
DEFINE VARIABLE vAngka1  AS INTEGER INITIAL 1.
DEFINE VARIABLE vAngka2  AS INTEGER INITIAL 1.
DEFINE VARIABLE vNext    AS INTEGER.
DEFINE VARIABLE vHasil   AS CHARACTER FORMAT "x(60)".
DEFINE VARIABLE i        AS INTEGER.

/* Masukkan dua angka pertama ke dalam hasil */
vHasil = STRING(vAngka1) + " " + STRING(vAngka2).

/* Loop mulai dari posisi ke-3 hingga jumlah iterasi */
DO i = 3 TO vIterasi:
    vNext = vAngka1 + vAngka2.
    vHasil = vHasil + " " + STRING(vNext).
    
    /* Geser nilai untuk perhitungan berikutnya */
    vAngka1 = vAngka2.
    vAngka2 = vNext.
END.

/* Tampilan agar rapi dan sejajar */
DISPLAY 
    "Iterasi" AT 2 ":" AT 11 vIterasi SKIP
    vHasil    AT 2 NO-LABEL 
    WITH FRAME frSoal5 NO-LABELS NO-BOX WIDTH 80.

/* Output */

/*
 Iterasi  :         11
 1 1 2 3 5 8 13 21 34 55 89  
*/
