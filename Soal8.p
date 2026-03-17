/* 8. Buat program kalender */
DEFINE VARIABLE vBulan AS INTEGER INITIAL 04.
DEFINE VARIABLE vTahun AS INTEGER INITIAL 2011.
DEFINE VARIABLE vTgl   AS INTEGER.
DEFINE VARIABLE vDay1  AS INTEGER INITIAL 5. /* 1 April 2011 = Jumat */
DEFINE VARIABLE vLine  AS CHARACTER FORMAT "x(60)".
DEFINE VARIABLE vCount AS INTEGER.

/* Menampilkan Bulan dan Tahun secara vertikal menggunakan SKIP */
DISPLAY "Bulan :" AT 2 vBulan FORMAT "99" SKIP
        "Tahun :" AT 2 vTahun FORMAT "9999" SKIP(1)
        /* Header hari dengan jarak kolom yang konsisten */
        "Senin  Selasa Rabu   Kamis  Jumat  Sabtu  Minggu" AT 2 SKIP
        WITH FRAME frCalHeader NO-LABELS NO-BOX.

/* Inisialisasi: 4 kolom kosong (Senin-Kamis) x 7 spasi = 28 spasi */
vLine = FILL(" ", 28). 
vCount = vDay1.

DO vTgl = 1 TO 30:
    /* Angka 2 digit + 5 spasi = total 7 karakter per kolom */
    vLine = vLine + STRING(vTgl, "99") + "     ".
    
    /* Cetak baris setiap 7 hari atau di tanggal terakhir */
    IF vCount MOD 7 = 0 OR vTgl = 30 THEN DO:
        DISPLAY vLine AT 2 NO-LABEL WITH FRAME frCalBody 10 DOWN NO-BOX.
        DOWN WITH FRAME frCalBody.
        vLine = "". 
    END.
    
    vCount = vCount + 1.
END.

/* Output */
/*
 Bulan : 04
 Tahun : 2011

 Senin  Selasa Rabu   Kamis  Jumat  Sabtu  Minggu
                             01     02     03
 04     05     06     07     08     09     10
 11     12     13     14     15     16     17
 18     19     20     21     22     23     24
 25     26     27     28     29     30  
 */
