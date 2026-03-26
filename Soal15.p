/* 15. Program untuk memisahkan sisa pembulatan tiga digit belakang koma dari suatu decimal */

/* Mendeklarasikan variabel input decimal dengan panjang 7 angka di belakang koma */
DEFINE VARIABLE dInput      AS DECIMAL   NO-UNDO FORMAT ">>>>>>9.9999999".

/* Variabel penampung hasil pembulatan 3 angka di belakang koma */
DEFINE VARIABLE dRounded    AS DECIMAL   NO-UNDO FORMAT ">>>>>>9.999".

/* Variabel penampung sisa setelah pembulatan 3 digit belakang koma */
DEFINE VARIABLE dSisa       AS DECIMAL   NO-UNDO FORMAT ">>>>>>9.999999".

/* Variabel penampung nilai integer sementara untuk proses truncate */
DEFINE VARIABLE iWhole      AS INT64     NO-UNDO.

/* Meminta user untuk menginput angka decimal */
UPDATE dInput LABEL "Input".

/* Proses truncate 3 angka di belakang koma: */
/* Kalikan 1000 untuk menggeser 3 desimal ke kiri, */
/* lalu TRUNCATE untuk membuang sisa desimal, */
/* lalu bagi 1000 kembali untuk mendapatkan nilai aslinya */
iWhole   = TRUNCATE(dInput * 1000, 0).
dRounded = iWhole / 1000.

/* Menghitung sisa pembulatan dengan mengurangi input dengan hasil pembulatan */
/* Kemudian ROUND ke 6 angka di belakang koma untuk membuang floating point error */
dSisa = ROUND(dInput - dRounded, 6).

/* Menampilkan hasil pembulatan 3 desimal dan sisa 6 desimal */
MESSAGE
    "Pembulatan : " + STRING(dRounded, ">>>>>>9.999") + CHR(10) +
    "Sisa       : " + STRING(dSisa,    ">>>>>>9.999999")
    VIEW-AS ALERT-BOX.
    
/* Output: */
/*
+---------------+
¦          Input¦
¦---------------¦
¦    557.1234567¦
+---------------+



                        +---------- Message -----------+
                        ¦   Pembulatan :     557.123   ¦
                        ¦ Sisa       :       0.000457  ¦
                        ¦ ---------------------------- ¦
                        ¦             <OK>             ¦
                        +------------------------------+                        
*/
