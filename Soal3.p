/* 3. Program memecah kalimat menjadi potongan kata */
/* Mendeklarasikan variabel kalimat yang akan dipotong per kata */
DEFINE VARIABLE vKalimat AS CHARACTER INITIAL "saya suka bekerja di polytron".

/* Menampilkan Kalimat utuh di atas sebagai header */
DISPLAY "Kalimat: " + vKalimat FORMAT "x(40)" NO-LABEL
    WITH FRAME frAtas NO-BOX.

    /* Menampilkan setiap kata satu per satu ke bawah menggunakan SKIP */
    /* ENTRY(n, string, delimiter) mengambil kata ke-n berdasarkan pemisah spasi */
    DISPLAY
        ENTRY(1, vKalimat, " ") FORMAT "x(15)" NO-LABEL SKIP    /* Kata ke-1: saya    */
            ENTRY(2, vKalimat, " ") FORMAT "x(15)" NO-LABEL SKIP    /* Kata ke-2: suka    */
                ENTRY(3, vKalimat, " ") FORMAT "x(15)" NO-LABEL SKIP    /* Kata ke-3: bekerja */
                    ENTRY(4, vKalimat, " ") FORMAT "x(15)" NO-LABEL SKIP    /* Kata ke-4: di      */
                        ENTRY(5, vKalimat, " ") FORMAT "x(15)" NO-LABEL    /* Kata ke-5: polytron */
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
