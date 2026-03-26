/* 5. Buat program deret fibonansi! */
/* Mendeklarasikan variabel jumlah iterasi deret fibonacci yang akan ditampilkan */
DEFINE VARIABLE vIterasi AS INTEGER INITIAL 11.

/* Mendeklarasikan dua angka pertama deret fibonacci */
DEFINE VARIABLE vAngka1  AS INTEGER INITIAL 1.
DEFINE VARIABLE vAngka2  AS INTEGER INITIAL 1.

/* Variabel penampung angka fibonacci berikutnya hasil penjumlahan */
DEFINE VARIABLE vNext    AS INTEGER.

/* Variabel penampung hasil deret fibonacci dalam bentuk string */
DEFINE VARIABLE vHasil   AS CHARACTER FORMAT "x(60)".

/* Variabel counter untuk perulangan */
DEFINE VARIABLE i        AS INTEGER.

/* Memasukkan dua angka pertama fibonacci (1 dan 1) ke dalam string hasil */
vHasil = STRING(vAngka1) + " " + STRING(vAngka2).

/* Loop mulai dari posisi ke-3 karena dua angka pertama sudah dimasukkan */
DO i = 3 TO vIterasi:
    
    /* Hitung angka fibonacci berikutnya dengan menjumlahkan dua angka sebelumnya */
    vNext = vAngka1 + vAngka2.
    /* Tambahkan angka fibonacci baru ke string hasil */
    vHasil = vHasil + " " + STRING(vNext).
    
    /* Geser nilai: angka kedua menjadi pertama, angka baru menjadi kedua */
    vAngka1 = vAngka2.
    vAngka2 = vNext.
END.

/* Menampilkan jumlah iterasi dan hasil deret fibonacci */
DISPLAY 
    "Iterasi" AT 2 ":" AT 11 vIterasi SKIP
    vHasil    AT 2 NO-LABEL 
    WITH FRAME frSoal5 NO-LABELS NO-BOX WIDTH 80.

/* Output */

/*
 Iterasi  :         11
 1 1 2 3 5 8 13 21 34 55 89  
*/
