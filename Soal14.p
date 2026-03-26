/* Program untuk mengganti huruf besar dan kecil dari suatu string */

/* Mendeklarasikan variabel input string dengan panjang maksimal 60 karakter */
DEFINE VARIABLE cInput    AS CHARACTER NO-UNDO FORMAT "X(60)".

/* Variabel penampung hasil string setelah huruf besar/kecil ditukar */
DEFINE VARIABLE cResult   AS CHARACTER NO-UNDO.

/* Variabel penampung satu karakter yang sedang diproses */
DEFINE VARIABLE cChar     AS CHARACTER NO-UNDO.

/* Variabel counter untuk perulangan */
DEFINE VARIABLE i         AS INTEGER   NO-UNDO.

/* Variabel counter posisi huruf, tidak menghitung spasi */
DEFINE VARIABLE iPos      AS INTEGER   NO-UNDO.

/* Meminta user untuk menginput string */
UPDATE cInput LABEL "Input".

/* Inisialisasi hasil dan posisi huruf */
cResult = "".
iPos    = 1.

/* Loop menelusuri setiap karakter dalam string satu per satu */
DO i = 1 TO LENGTH(cInput):
    
    /* Mengambil satu karakter pada posisi i */
    cChar = SUBSTRING(cInput, i, 1).

    /* Jika karakter adalah spasi, langsung tambahkan ke hasil */
    /* Posisi iPos tidak diincrement karena spasi tidak dihitung */
    IF cChar = " " THEN
        cResult = cResult + " ".

    /* Posisi ganjil: ubah huruf menjadi UPPERCASE */
    /* ASCII 97-122 = a-z (huruf kecil), kurangi 32 untuk dapat huruf besar */
    ELSE IF iPos MOD 2 = 1 THEN DO:
        IF ASC(cChar) >= 97 AND ASC(cChar) <= 122 THEN
            cResult = cResult + CHR(ASC(cChar) - 32).
        ELSE
            cResult = cResult + cChar.
        iPos = iPos + 1.
    END.

    /* Posisi genap: ubah huruf menjadi lowercase */
    /* ASCII 65-90 = A-Z (huruf besar), tambah 32 untuk dapat huruf kecil */
    ELSE DO:
        IF ASC(cChar) >= 65 AND ASC(cChar) <= 90 THEN
            cResult = cResult + CHR(ASC(cChar) + 32).
        ELSE
            cResult = cResult + cChar.
        iPos = iPos + 1.
    END.

END.

/* Menampilkan hasil string dengan huruf besar dan kecil yang sudah ditukar */
MESSAGE "Hasil : " + cResult VIEW-AS ALERT-BOX.

/* Output: */
/*
+------------------------------------------------------------+
¦Input                                                       ¦
¦------------------------------------------------------------¦
¦Aku sedang belajar di polytron.                             ¦
+------------------------------------------------------------+



                  +---------------- Message ----------------+
                  ¦ Hasil : AkU sEdAnG bElAjAr Di PoLyTrOn. ¦
                  ¦ --------------------------------------- ¦
                  ¦                  <OK>                   ¦
                  +-----------------------------------------+   
*/
