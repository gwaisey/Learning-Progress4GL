   /* 1. Program hitung jumlah abjad */

/* Agar user bisa menginput secara dinamis */
UPDATE vKalimat LABEL "Kalimat" FORMAT "x(20)".
UPDATE vAbjad LABEL "Abjad". 

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
+-----------------------------+
¦Kalimat              Abjad   ¦
¦-------------------- --------¦
¦POLYTRON             o       ¦
+-----------------------------+
+------------------------------------------------------+
¦Kalimat: POLYTRON             Abjad: o     Jumlah: 2  ¦
+------------------------------------------------------+                             
*/
