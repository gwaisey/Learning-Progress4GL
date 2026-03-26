/* 10. Membuat program asterix segitiga siku-siku */

/* Mendeklarasikan variabel input angka yang menentukan jumlah bintang di baris pertama */
DEFINE VARIABLE iInput AS INTEGER NO-UNDO.

/* Variabel counter untuk perulangan */
DEFINE VARIABLE i      AS INTEGER NO-UNDO.

/* Variabel penampung hasil bintang per baris */
DEFINE VARIABLE cRow   AS CHARACTER FORMAT "x(70)" NO-UNDO.

/* Meminta user untuk menginput angka */
UPDATE iInput LABEL "Input" WITH FRAME frInp NO-BOX SIDE-LABELS.

/* Menampilkan label "Hasil:" sebelum pola bintang */
DISPLAY "Hasil:" WITH FRAME frRes NO-BOX NO-LABELS.

/* Loop dari nilai input hingga 1, berkurang 1 setiap iterasi */
/* Menghasilkan pola bintang yang berkurang setiap barisnya */
DO i = iInput TO 1 BY -1:
  
  /* Membuat string bintang sebanyak nilai i menggunakan FILL */
  cRow = FILL("*", i).

    /* Menampilkan baris bintang saat ini */
    DISPLAY cRow WITH FRAME frRes NO-BOX NO-LABELS DOWN.
      
      /* Pindah ke baris berikutnya dalam frame */
      DOWN WITH FRAME frRes.
        END.    
/* Output */
/*
Input: 4
Hasil: ****
       ***
       **
       *       
*/
