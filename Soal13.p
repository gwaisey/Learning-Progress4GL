/* 13. Program deret angka dan huruf */

/* Mendeklarasikan variabel untuk menentukan panjang deret yang akan ditampilkan */
DEFINE VARIABLE iDeret    AS INTEGER   NO-UNDO.

/* Variabel penampung seluruh hasil deret angka dan huruf */
DEFINE VARIABLE cResult   AS CHARACTER NO-UNDO.

/* Variabel counter untuk angka yang akan ditampilkan */
DEFINE VARIABLE iNum      AS INTEGER   NO-UNDO.

/* Variabel counter untuk huruf yang akan ditampilkan (1=a, 2=b, dst) */
DEFINE VARIABLE iLetter   AS INTEGER   NO-UNDO.

/* Variabel counter untuk perulangan */
DEFINE VARIABLE i         AS INTEGER   NO-UNDO.

/* Meminta user untuk menginput panjang deret */
UPDATE iDeret LABEL "Deret ke".

/* Inisialisasi: angka dimulai dari 1, huruf dimulai dari a (index 1) */
cResult = "".
iNum    = 1.
iLetter = 1.

/* Loop sebanyak panjang deret yang diinput */
DO i = 1 TO iDeret:
    
    /* Posisi ganjil (1, 3, 5, ...): tampilkan angka */
    IF i MOD 2 = 1 THEN DO:
        IF cResult = "" THEN cResult = STRING(iNum).
        ELSE cResult = cResult + " " + STRING(iNum).
        iNum = iNum + 1.
    END.
    
    /* Posisi genap (2, 4, 6, ...): tampilkan huruf kecil */
    /* CHR(96 + index) menghasilkan a=97, b=98, c=99, dst */
    ELSE DO:
        cResult = cResult + " " + CHR(96 + iLetter).
        iLetter = iLetter + 1.
    END.
END.

/* Menampilkan hasil deret angka dan huruf */
MESSAGE "Hasil : " + cResult VIEW-AS ALERT-BOX.


/* Output */
/*
+----------+
¦  Deret ke¦
¦----------¦
¦        11¦
+----------+



                       +----------- Message -----------+
                       ¦ Hasil : 1 a 2 b 3 c 4 d 5 e 6 ¦
                       ¦ ----------------------------- ¦
                       ¦             <OK>              ¦
                       +-------------------------------+                        
*/
