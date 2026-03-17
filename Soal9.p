/* 9. Buat program pola simbol */
DEFINE VARIABLE vIterasi AS INTEGER INITIAL 5.
DEFINE VARIABLE i AS INTEGER.
DEFINE VARIABLE j AS INTEGER.
DEFINE VARIABLE vBaris AS CHARACTER FORMAT "x(10)".

/* Kita gunakan FORMAT "x(3)" pada vIterasi agar angka 5 rata kiri */
DISPLAY "Ganjil"  AT 2 ":" AT 11 "+" AT 13 SKIP
        "Genap"   AT 2 ":" AT 11 "=" AT 13 SKIP
        "Iterasi" AT 2 ":" AT 11 STRING(vIterasi) FORMAT "x(3)" AT 13 SKIP
        "Hasil"   AT 2 ":" AT 11 SKIP 
        WITH FRAME fr9Header NO-LABELS NO-BOX WIDTH 80.

DO i = 1 TO vIterasi:
    vBaris = "".
    DO j = 1 TO 5:
        IF (i + j) MOD 2 = 0 THEN 
        vBaris = vBaris + "+".
        ELSE 
        vBaris = vBaris + "=".
    END.
    
    /* Menampilkan hasil tepat di bawah kolom angka/simbol (AT 13) */
    DISPLAY vBaris AT 13 NO-LABEL WITH FRAME fr9Body 10 DOWN NO-BOX.
    DOWN WITH FRAME fr9Body.
END.

/* Output */
/*
 Ganjil   : +
 Genap    : =
 Iterasi  : 5
 Hasil    :
            +=+=+
            =+=+=
            +=+=+
            =+=+=
            +=+=+
*/
