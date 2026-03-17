/* 6. Buat program deret angka horizontal */
DEFINE VARIABLE vAngka AS INTEGER INITIAL 4.
DEFINE VARIABLE vBaris AS INTEGER.
DEFINE VARIABLE vKolom AS INTEGER.
DEFINE VARIABLE vHasil AS CHARACTER FORMAT "x(20)".

/* Menggunakan FORMAT ">>9" agar angka 4 tidak terlalu jauh dari label */
DISPLAY "Angka :" AT 2 vAngka FORMAT ">>9" SKIP
        "Hasil :" AT 2 SKIP
        WITH FRAME fr6 NO-LABELS NO-BOX.

/* Frame isi tetap menggunakan 10 DOWN untuk menampung baris */
FORM 
    WITH FRAME frIsi 10 DOWN NO-LABELS NO-BOX.

DO vBaris = 1 TO vAngka:
    vHasil = "".
    
    /* Baris Ganjil: Naik (1 2 3 4) */
    IF vBaris MOD 2 <> 0 THEN DO:
        DO vKolom = 1 TO vAngka:
            vHasil = vHasil + STRING(vKolom).
        END.
    END.
    
    /* Baris Genap: Turun (4 3 2 1) */
    ELSE DO:
        DO vKolom = vAngka TO 1 BY -1:
            vHasil = vHasil + STRING(vKolom).
        END.
    END.
    
    /* Tampilkan hasil per baris dengan posisi AT yang konsisten */
    DISPLAY vHasil AT 10 WITH FRAME frIsi.
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
