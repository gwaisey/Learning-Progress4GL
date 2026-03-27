/* 8. Buat program kalender */
DEFINE VARIABLE vBulan AS INTEGER INITIAL 3.
DEFINE VARIABLE vTahun AS INTEGER INITIAL 2026.
DEFINE VARIABLE vTgl   AS INTEGER.
DEFINE VARIABLE vDay1  AS INTEGER. /* 1=Senin, 7=Minggu */
DEFINE VARIABLE vMax   AS INTEGER. /* Jumlah hari dalam bulan */
DEFINE VARIABLE vLine  AS CHARACTER FORMAT "x(60)".
DEFINE VARIABLE vCount AS INTEGER.
DEFINE VARIABLE vAwal  AS DATE.

/* 1. Input Dinamis */
UPDATE vBulan LABEL "Bulan: ".
UPDATE vTahun LABEL "Tahun: " FORMAT "9999".        

/* 2. Logika Penentuan Tanggal Akurat */
vAwal = DATE(vBulan, 1, vTahun). /* Tanggal 1 di bulan terpilih */

/* Cari hari pertama (Progress: 1=Minggu, 2=Senin... 7=Sabtu) */
/* Kita konversi ke: 1=Senin, 2=Selasa ... 7=Minggu */
vDay1 = WEEKDAY(vAwal) - 1. 
IF vDay1 = 0 THEN vDay1 = 7. /* Jika Minggu, set ke 7 */

/* Cari tanggal terakhir bulan ini */
IF vBulan = 12 THEN 
    vMax = DAY(DATE(1, 1, vTahun + 1) - 1).
ELSE 
    vMax = DAY(DATE(vBulan + 1, 1, vTahun) - 1).

/* 3. Tampilan Header */
DISPLAY "Senin  Selasa Rabu   Kamis  Jumat  Sabtu  Minggu" AT 2 SKIP
        WITH FRAME frCalHeader NO-LABELS NO-BOX.

/* 4. Pembuatan Baris Kalender */
/* Kosongkan kolom sebelum hari pertama (tiap kolom 7 karakter) */
vLine = FILL(" ", (vDay1 - 1) * 7).
vCount = vDay1.

DO vTgl = 1 TO vMax:
    vLine = vLine + STRING(vTgl, "99") + "     ".
    
    /* Jika sudah Minggu (7) atau hari terakhir bulan */
    IF vCount MOD 7 = 0 OR vTgl = vMax THEN DO:
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

 Senin  Selasa  Rabu  Kamis  Jumat  Sabtu  Minggu
                              01     02     03
 04     05      06     07     08     09     10
 11     12      13     14     15     16     17
 18     19      20     21     22     23     24
 25     26      27     28     29     30  
 */
