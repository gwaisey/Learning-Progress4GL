/* 7. Program Konter 4 Digit Alfanumerik */
/* Mendeklarasikan variabel nilai awal konter 4 digit */
DEFINE VARIABLE vAwal    AS CHARACTER INITIAL "001Z".

/* Mendeklarasikan variabel jumlah iterasi penambahan konter */
DEFINE VARIABLE vIterasi AS INTEGER   INITIAL 4.

/* Daftar karakter yang digunakan dalam sistem penomoran (0-9 lalu A-Z) */
DEFINE VARIABLE vChars   AS CHARACTER INITIAL "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ".

/* Variabel counter untuk perulangan luar dan dalam */
DEFINE VARIABLE i        AS INTEGER.
DEFINE VARIABLE j        AS INTEGER.

/* Variabel penampung posisi karakter dalam daftar vChars */
DEFINE VARIABLE vPos     AS INTEGER.

/* Variabel penampung karakter yang sedang diproses */
DEFINE VARIABLE vChar    AS CHARACTER.

/* Variabel penampung nilai konter yang sedang berjalan */
DEFINE VARIABLE vNextVal AS CHARACTER.

/* Agar user bisa input secara dinamis */
UPDATE vAwal LABEL "Nilai Awal: " FORMAT "x(4)".
UPDATE vIterasi LABEL "Iterasi: ". 

/* Menampilkan nilai awal dan jumlah iterasi sebagai header */
DISPLAY "Nilai Awal:" AT 2 vAwal FORMAT "x(4)" SKIP
        "Iterasi   :" AT 2 vIterasi FORMAT ">>9" 
        WITH FRAME fr7Header NO-LABELS NO-BOX WIDTH 80.

/* Inisialisasi nilai konter dengan nilai awal */
vNextVal = vAwal.

/* Loop sebanyak jumlah iterasi untuk menampilkan nilai konter */
DO i = 1 TO vIterasi:

    /* Tampilkan nilai konter saat ini ke bawah */
    DISPLAY vNextVal AT 2 NO-LABEL WITH FRAME fr7Res 10 DOWN NO-BOX.
    DOWN WITH FRAME fr7Res.

    /* Hitung nilai konter berikutnya (kecuali pada iterasi terakhir) */
    IF i < vIterasi THEN DO:
        
        /* Loop dari digit paling kanan (posisi 4) ke kiri (posisi 1) */
        DO j = 4 TO 1 BY -1:
            /* Ambil karakter pada posisi j */
            vChar = SUBSTRING(vNextVal, j, 1).
            /* Cari posisi karakter tersebut dalam daftar vChars */
            vPos  = INDEX(vChars, vChar).

            /* Jika karakter bukan 'Z', ganti dengan karakter berikutnya dalam daftar */
            IF vChar <> "Z" THEN DO:
                SUBSTRING(vNextVal, j, 1) = SUBSTRING(vChars, vPos + 1, 1).
                LEAVE. /* Hentikan loop karena tidak ada carry over */
            END.

            /* Jika karakter adalah 'Z', reset ke '1' dan lanjut ke digit sebelumnya */
            ELSE DO:
                SUBSTRING(vNextVal, j, 1) = "1".
            END.
        END.
    END.
END.

/* Output */
/*
 Nilai Awal: 001Z
 Iterasi   :   4
 001Z
 0021
 0022
 0023 
 */
