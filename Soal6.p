/* 6. Buat program deret angka horizontal */
/* Mendeklarasikan variabel angka yang menentukan lebar deret */
DEFINE VARIABLE vAngka AS INTEGER INITIAL 4.

/* Variabel counter untuk baris dan kolom */
DEFINE VARIABLE vBaris AS INTEGER.
DEFINE VARIABLE vKolom AS INTEGER.

/* Variabel penampung hasil deret per baris */
DEFINE VARIABLE vHasil AS CHARACTER FORMAT "x(20)".

/* Menampilkan header angka dan label hasil */
DISPLAY "Angka :" AT 2 vAngka FORMAT ">>9" SKIP
        "Hasil :" AT 2 SKIP
        WITH FRAME fr6 NO-LABELS NO-BOX.

/* Mendefinisikan frame untuk isi deret dengan 10 baris ke bawah */
FORM 
    WITH FRAME frIsi 10 DOWN NO-LABELS NO-BOX.
    
/* Loop untuk setiap baris sebanyak nilai vAngka */
DO vBaris = 1 TO vAngka:
    
    vHasil = "".
    
    /* Baris ganjil: tampilkan angka dari kecil ke besar (1 2 3 4) */
    IF vBaris MOD 2 <> 0 THEN DO:
        DO vKolom = 1 TO vAngka:
            vHasil = vHasil + STRING(vKolom).
        END.
    END.
    
    /* Baris genap: tampilkan angka dari besar ke kecil (4 3 2 1) */
    ELSE DO:
        DO vKolom = vAngka TO 1 BY -1:
            vHasil = vHasil + STRING(vKolom).
        END.
    END.
    
    /* Tampilkan hasil baris saat ini pada posisi kolom 10 */
    DISPLAY vHasil AT 10 WITH FRAME frIsi.
    
    /* Pindah ke baris berikutnya dalam frame */
    DOWN WITH FRAME frIsi.
END.

/* Output */
/*
Angka :   4
Hasil :
         1234
         4321
         1234
         4321
*/
