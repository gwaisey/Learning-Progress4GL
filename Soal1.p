   /* 1. Program hitung jumlah abjad */
/* Mendeklarasikan variabel kalimat yang akan dicari abjadnya */
DEFINE VARIABLE vKalimat AS CHARACTER INITIAL "selamatdatang".

/* Mendeklarasikan variabel abjad yang ingin dihitung kemunculannya */
DEFINE VARIABLE vAbjad   AS CHARACTER INITIAL "a".

/* Mendeklarasikan variabel penampung jumlah kemunculan abjad */
DEFINE VARIABLE vJumlah AS INTEGER INITIAL 0.

/* Variabel counter untuk perulangan */
DEFINE VARIABLE i AS INTEGER.

/* Loop untuk mengecek setiap huruf satu per satu */
DO i = 1 TO LENGTH(vKalimat):
    /* Jika karakter pada posisi i sama dengan abjad yang dicari, tambah jumlah */
    IF SUBSTRING(vKalimat, i, 1) = vAbjad THEN
            vJumlah = vJumlah + 1.
            END.

/* Menampilkan hasil: kalimat, abjad yang dicari, dan jumlah kemunculannya */
DISPLAY
    vKalimat LABEL "Kalimat" FORMAT "x(20)"
        vAbjad   LABEL "Abjad"   FORMAT "x(5)"
            vJumlah  LABEL "Jumlah"  FORMAT ">>9"
                WITH FRAME frSoal1 SIDE-LABELS.

/* Output */
/*
+------------------------------------------------------+
¦Kalimat: selamatdatang        Abjad: a     Jumlah: 4  ¦
+------------------------------------------------------+
*/
