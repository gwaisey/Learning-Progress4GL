/* 12. Membuat program menghilangkan kata yang lebar kata lebih kecil sama dengan 6 pada suatu string */

/* Mendeklarasikan variabel string input dengan panjang maksimal 60 karakter */
DEFINE VARIABLE cString   AS CHARACTER NO-UNDO FORMAT "X(60)".

/* Variabel penampung hasil string setelah kata pendek dihapus */
DEFINE VARIABLE cResult   AS CHARACTER NO-UNDO.

/* Variabel penampung setiap kata yang sedang diproses */
DEFINE VARIABLE cWord     AS CHARACTER NO-UNDO.

/* Variabel penampung jumlah total kata dalam string */
DEFINE VARIABLE iCount    AS INTEGER   NO-UNDO.

/* Variabel counter untuk perulangan */
DEFINE VARIABLE i         AS INTEGER   NO-UNDO.

/* Meminta user untuk menginput string */
UPDATE cString LABEL "String".

/* Menghitung jumlah kata dalam string berdasarkan pemisah spasi */
iCount  = NUM-ENTRIES(cString, " ").
cResult = "".

/* Loop menelusuri setiap kata dalam string satu per satu */
DO i = 1 TO iCount:

    /* Mengambil kata ke-i dari string berdasarkan pemisah spasi */
    cWord = ENTRY(i, cString, " ").

    /* Hanya simpan kata yang panjangnya lebih dari 6 karakter */
    /* Kata dengan panjang <= 6 karakter akan diabaikan/dihapus */
    IF LENGTH(cWord) > 6 THEN DO:
        IF cResult = "" THEN cResult = cWord.
        ELSE cResult = cResult + " " + cWord.
    END.
END.

/* Menampilkan hasil string yang sudah dihapus kata-kata pendeknya */
MESSAGE "Hasil : " + cResult VIEW-AS ALERT-BOX.

/* Output: */
/*
+------------------------------------------------------------+
¦String                                                      ¦
¦------------------------------------------------------------¦
¦aku sedang belajar progress                                 ¦
+------------------------------------------------------------+



                          +-------- Message ---------+
                          ¦ Hasil : belajar progress ¦
                          ¦ ------------------------ ¦
                          ¦           <OK>           ¦
                          +--------------------------+ 
*/
