/* 11. Membuat  program deret angka dan huruf */

/* Mendeklarasikan variabel lebar yang menentukan jumlah kolom deret */
DEFINE VARIABLE iLebar    AS INTEGER   NO-UNDO.

/* Variabel counter untuk angka yang akan ditampilkan */
DEFINE VARIABLE iNum      AS INTEGER   NO-UNDO.

/* Variabel counter untuk huruf yang akan ditampilkan (1=A, 2=B, dst) */
DEFINE VARIABLE iLetter   AS INTEGER   NO-UNDO.

/* Variabel counter untuk kolom dalam satu baris */
DEFINE VARIABLE iCol      AS INTEGER   NO-UNDO.

/* Variabel counter untuk grup (setiap grup = 1 baris angka + 1 baris huruf) */
DEFINE VARIABLE iGroup    AS INTEGER   NO-UNDO.

/* Variabel penampung satu baris deret */
DEFINE VARIABLE cLine     AS CHARACTER NO-UNDO.

/* Variabel penampung satu elemen deret (angka atau huruf) */
DEFINE VARIABLE cTemp     AS CHARACTER NO-UNDO.

/* Variabel penampung seluruh hasil output */
DEFINE VARIABLE cResult   AS CHARACTER NO-UNDO.

/* Meminta user untuk menginput lebar deret */
UPDATE iLebar LABEL "Lebar (1-6)".

/* Validasi: lebar harus bernilai antara 1 sampai 6 */
IF iLebar < 1 OR iLebar > 6 THEN DO:
    MESSAGE "ERROR: Lebar harus bernilai antara 1 sampai 6."
        VIEW-AS ALERT-BOX ERROR.
    RETURN.
END.

/* Inisialisasi: angka dimulai dari 1, huruf dimulai dari A (index 1) */
iNum    = 1.
iLetter = 1.
cResult = "".

/* Loop sebanyak 3 grup, setiap grup menghasilkan 1 baris angka dan 1 baris huruf */
DO iGroup = 1 TO 3:

    /* Membuat baris angka: menambahkan angka sebanyak iLebar kolom */
    cLine = "".
    DO iCol = 1 TO iLebar:
        cTemp = STRING(iNum).
        IF cLine = "" THEN cLine = cTemp.
        ELSE cLine = cLine + " " + cTemp.
        iNum = iNum + 1.
    END.
    
    /* Tambahkan baris angka ke hasil, pisahkan dengan newline jika bukan baris pertama */
    IF cResult = "" THEN cResult = cLine.
    ELSE cResult = cResult + CHR(10) + cLine.

    /* Membuat baris huruf: CHR(64 + index) menghasilkan A=65, B=66, dst */
    cLine = "".
    DO iCol = 1 TO iLebar:
        cTemp = CHR(64 + iLetter).
        IF cLine = "" THEN cLine = cTemp.
        ELSE cLine = cLine + " " + cTemp.
        iLetter = iLetter + 1.
    END.
    
    /* Tambahkan baris huruf ke hasil dengan newline */
    cResult = cResult + CHR(10) + cLine.

END.

/* Menampilkan seluruh hasil deret angka dan huruf */
MESSAGE cResult VIEW-AS ALERT-BOX.

/* Output: */
/*
+-----------+
¦Lebar (1-6)¦
¦-----------¦
¦          5¦
+-----------+

                            +------ Message -------+
                            ¦      1 2 3 4 5       ¦
                            ¦      A B C D E       ¦
                            ¦      6 7 8 9 10      ¦
                            ¦      F G H I J       ¦
                            ¦    11 12 13 14 15    ¦
                            ¦      K L M N O       ¦
                            ¦ -------------------- ¦
                            ¦         <OK>         ¦
                            +----------------------+
*/
