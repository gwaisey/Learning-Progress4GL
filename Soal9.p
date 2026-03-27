/* 9. Buat program pola simbol */
DEFINE VARIABLE vGanjil  AS CHARACTER FORMAT "x(1)" INITIAL "+".
DEFINE VARIABLE vGenap   AS CHARACTER FORMAT "x(1)" INITIAL "=".
DEFINE VARIABLE vIterasi AS INTEGER   FORMAT ">>9"  INITIAL 5.

DEFINE VARIABLE i      AS INTEGER.
DEFINE VARIABLE j      AS INTEGER.
DEFINE VARIABLE vBaris AS CHARACTER FORMAT "x(20)".

/* 1. UPDATE di baris pertama */
UPDATE 
    vGanjil  LABEL "Ganjil" 
    vGenap   LABEL "Genap" 
    vIterasi LABEL "Iterasi"
    WITH SIDE-LABELS FRAME frInput TITLE " Input " ROW 1.

/* 2. Tampilkan Label Hasil tepat di baris ke-6 (di luar box) */
/* Kita buat frame baru tanpa BOX agar tidak ada garis */
DISPLAY "Hasil :" AT 2 NO-LABEL WITH FRAME frLabel ROW 6 NO-BOX.

/* 3. Tampilkan isi polanya tepat di baris ke-7 dan seterusnya */
DO i = 1 TO vIterasi:
    vBaris = "".
    DO j = 1 TO 5:
        IF (i + j) MOD 2 = 0 THEN 
            vBaris = vBaris + vGanjil.
        ELSE 
            vBaris = vBaris + vGenap.
    END.
    
    /* Gunakan FRAME frIsi yang dimulai dari baris ke-7 */
    DISPLAY vBaris AT 11 NO-LABEL WITH FRAME frIsi 20 DOWN NO-BOX ROW 7.
    DOWN WITH FRAME frIsi.
END.

/* Output */
/*
+------------ Input ------------+
¦Ganjil: + Genap: = Iterasi: 5  ¦
+-------------------------------+


 Hasil :
          +=+=+
          =+=+=
          +=+=+
          =+=+=
          +=+=+                       
*/
