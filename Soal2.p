/* 2. Program input tanggal dengan validasi */
DEFINE VARIABLE vTgl   AS INTEGER FORMAT "99" LABEL "Tgl".
DEFINE VARIABLE vBln   AS INTEGER FORMAT "99" LABEL "Bulan".
DEFINE VARIABLE vThn   AS INTEGER FORMAT "9999" LABEL "Tahun".
DEFINE VARIABLE vValid AS LOGICAL INITIAL TRUE.

/* Input data dari user */
UPDATE vTgl vBln vThn WITH FRAME frTanggal.

/* Logika Validasi */
IF vBln = 2 THEN DO:
    /* Cek Tahun Kabisat */
    IF (vThn MODULO 4 = 0 AND vThn MODULO 100 <> 0) OR (vThn MODULO 400 = 0) THEN DO:
        IF vTgl > 29 THEN DO:
            MESSAGE "ERROR: Bulan 02 pada tahun kabisat hanya memiliki tanggal 29" VIEW-AS ALERT-BOX.
            vValid = FALSE.
        END.
    END.
    ELSE DO:
        IF vTgl > 28 THEN DO:
            MESSAGE "ERROR: Bulan 02 hanya memiliki tanggal 28" VIEW-AS ALERT-BOX.
            vValid = FALSE.
        END.
    END.
END.
ELSE IF vBln = 4 OR vBln = 6 OR vBln = 9 OR vBln = 11 THEN DO:
    IF vTgl > 30 THEN DO:
        MESSAGE "ERROR: Bulan " vBln " hanya memiliki tanggal 30" VIEW-AS ALERT-BOX.
        vValid = FALSE.
    END.
END.
ELSE IF vTgl > 31 OR vTgl < 1 OR vBln > 12 THEN DO:
    MESSAGE "ERROR: Input Tanggal/Bulan tidak valid" VIEW-AS ALERT-BOX.
    vValid = FALSE.
END.

/* Jika valid, tampilkan konfirmasi */
IF vValid = TRUE THEN 
    MESSAGE "Tanggal Valid: " vTgl "/" vBln "/" vThn VIEW-AS ALERT-BOX.

/* Output */
/*
+---------------+
¦Tgl Bulan Tahun¦
¦--- ----- -----¦
¦ 00    00  0000¦
+---------------+
*/
