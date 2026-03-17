/* 4. Program Konversi Angka ke Pembilang */
DEFINE VARIABLE vAngka AS DECIMAL INITIAL 12500.
DEFINE VARIABLE vHasil AS CHARACTER FORMAT "x(60)".

FUNCTION Terbilang RETURNS CHARACTER (INPUT pAngka AS DECIMAL):
    DEFINE VARIABLE cHuruf AS CHARACTER INITIAL " ,satu,dua,tiga,empat,lima,enam,tujuh,delapan,sembilan,sepuluh,sebelas".
    IF pAngka < 12 THEN 
        RETURN ENTRY(INTEGER(pAngka) + 1, cHuruf).
    ELSE IF pAngka < 20 THEN 
        RETURN Terbilang(pAngka - 10) + " belas".
    ELSE IF pAngka < 100 THEN 
        RETURN Terbilang(TRUNC(pAngka / 10, 0)) + " puluh " + Terbilang(pAngka MOD 10).
    ELSE IF pAngka < 200 THEN 
        RETURN "seratus " + Terbilang(pAngka - 100).
    ELSE IF pAngka < 1000 THEN 
        RETURN Terbilang(TRUNC(pAngka / 100, 0)) + " ratus " + Terbilang(pAngka MOD 100).
    ELSE IF pAngka < 2000 THEN 
        RETURN "seribu " + Terbilang(pAngka - 1000).
    ELSE IF pAngka < 1000000 THEN 
        RETURN Terbilang(TRUNC(pAngka / 1000, 0)) + " ribu " + Terbilang(pAngka MOD 1000).
    RETURN "".
END FUNCTION.

vHasil = Terbilang(vAngka) + " rupiah".

/* Mengatur posisi kolom agar sejajar */
DISPLAY 
    "Angka dalam Rupiah" AT 2 ":" AT 21 vAngka FORMAT ">>,>>>,>>9" SKIP
    "Pembilang"          AT 2 ":" AT 21 vHasil FORMAT "x(50)"
    WITH FRAME frSoal4 NO-LABELS NO-BOX WIDTH 80.

/* Output */
/*
 Angka dalam Rupiah :     12,500
 Pembilang          : dua belas ribu lima ratus   rupiah      
*/
