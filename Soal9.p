/* 9. Buat program pola simbol */
/* Mendeklarasikan variabel jumlah iterasi baris dan kolom yang akan ditampilkan */
DEFINE VARIABLE vIterasi AS INTEGER INITIAL 5.

/* Variabel counter untuk baris dan kolom */
DEFINE VARIABLE i AS INTEGER.
DEFINE VARIABLE j AS INTEGER.

/* Variabel penampung hasil pola per baris */
DEFINE VARIABLE vBaris AS CHARACTER FORMAT "x(10)".

/* Menampilkan header: simbol ganjil, genap, iterasi, dan label hasil */
DISPLAY "Ganjil"  AT 2 ":" AT 11 "+" AT 13 SKIP
        "Genap"   AT 2 ":" AT 11 "=" AT 13 SKIP
        "Iterasi" AT 2 ":" AT 11 STRING(vIterasi) FORMAT "x(3)" AT 13 SKIP
        "Hasil"   AT 2 ":" AT 11 SKIP 
        WITH FRAME fr9Header NO-LABELS NO-BOX WIDTH 80.

/* Loop untuk setiap baris sebanyak vIterasi */
DO i = 1 TO vIterasi:
    vBaris = "".
    
    /* Loop untuk setiap kolom sebanyak 5 */
    DO j = 1 TO 5:
        
        /* Jika jumlah posisi baris dan kolom genap, tampilkan "+" */
        /* Jika ganjil, tampilkan "=" */
        /* Logika ini menghasilkan pola selang-seling "+" dan "=" */
        IF (i + j) MOD 2 = 0 THEN 
        vBaris = vBaris + "+".
        ELSE 
        vBaris = vBaris + "=".
    END.
    
    /* Tampilkan hasil pola baris saat ini pada posisi kolom 13 */
    DISPLAY vBaris AT 13 NO-LABEL WITH FRAME fr9Body 10 DOWN NO-BOX.
    
    /* Pindah ke baris berikutnya dalam frame */
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
