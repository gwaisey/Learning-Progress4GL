/* 8. Buat program kalender */
/* Mendeklarasikan variabel bulan dan tahun yang akan ditampilkan kalendernya */
DEFINE VARIABLE vBulan AS INTEGER INITIAL 04.
DEFINE VARIABLE vTahun AS INTEGER INITIAL 2011.

/* Variabel counter untuk tanggal */
DEFINE VARIABLE vTgl   AS INTEGER.

/* Variabel penanda hari pertama di bulan tersebut (5 = Jumat, karena 1 April 2011 = Jumat) */
DEFINE VARIABLE vDay1  AS INTEGER INITIAL 5.

/* Variabel penampung satu baris kalender */
DEFINE VARIABLE vLine  AS CHARACTER FORMAT "x(60)".

/* Variabel counter untuk menghitung posisi hari dalam minggu */
DEFINE VARIABLE vCount AS INTEGER.

/* Menampilkan header kalender: bulan, tahun, dan nama-nama hari */
DISPLAY "Bulan :" AT 2 vBulan FORMAT "99" SKIP
        "Tahun :" AT 2 vTahun FORMAT "9999" SKIP(1)
        /* Header hari dengan jarak kolom yang konsisten (7 karakter per kolom) */
        "Senin  Selasa  Rabu  Kamis  Jumat  Sabtu  Minggu" AT 2 SKIP
        WITH FRAME frCalHeader NO-LABELS NO-BOX.

/* Inisialisasi baris pertama dengan spasi kosong sesuai hari pertama */
/* Karena hari pertama adalah Jumat (kolom ke-5), maka 4 kolom pertama dikosongkan */
/* Setiap kolom = 7 karakter, jadi 4 x 7 = 28 spasi */
vLine = FILL(" ", 28). 
vCount = vDay1.

/* Loop untuk setiap tanggal dalam bulan April (1-30) */
DO vTgl = 1 TO 30:
    /* Tambahkan tanggal 2 digit ke baris, diikuti 5 spasi (total 7 karakter per kolom) */
    vLine = vLine + STRING(vTgl, "99") + "     ".
    
    /* Cetak baris jika sudah mencapai hari Minggu (kolom ke-7) atau tanggal terakhir */
    IF vCount MOD 7 = 0 OR vTgl = 30 THEN DO:
        DISPLAY vLine AT 2 NO-LABEL WITH FRAME frCalBody 10 DOWN NO-BOX.
        DOWN WITH FRAME frCalBody.
        /* Reset baris untuk minggu berikutnya */
        vLine = "". 
    END.

    /* Tambah counter hari untuk melacak posisi kolom hari */
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
