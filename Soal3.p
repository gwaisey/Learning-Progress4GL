/* 3. Program memecah kalimat menjadi potongan kata */
DEFINE VARIABLE vKalimat AS CHARACTER INITIAL "saya suka bekerja di polytron".

/* Menampilkan Kalimat utuh di atas sebagai header */
DISPLAY "Kalimat: " + vKalimat FORMAT "x(40)" NO-LABEL
    WITH FRAME frAtas NO-BOX.

    /* Menampilkan tiap kata ke bawah menggunakan SKIP */
    DISPLAY
        ENTRY(1, vKalimat, " ") FORMAT "x(15)" NO-LABEL SKIP
            ENTRY(2, vKalimat, " ") FORMAT "x(15)" NO-LABEL SKIP
                ENTRY(3, vKalimat, " ") FORMAT "x(15)" NO-LABEL SKIP
                    ENTRY(4, vKalimat, " ") FORMAT "x(15)" NO-LABEL SKIP
                        ENTRY(5, vKalimat, " ") FORMAT "x(15)" NO-LABEL
                            WITH FRAME frBawah NO-BOX NO-LABELS.     
/* Output */
/*
Kalimat: saya suka bekerja di polytron
saya
suka
bekerja
di
polytron
*/
