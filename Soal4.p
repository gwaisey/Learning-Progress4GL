/* 4. Program Konversi Angka ke Pembilang */
/* Mendeklarasikan variabel angka yang akan dikonversi menjadi terbilang */
DEFINE VARIABLE vAngka AS DECIMAL INITIAL 0.

/* Variabel penampung hasil konversi terbilang */
DEFINE VARIABLE vHasil AS CHARACTER FORMAT "x(60)".

/* Fungsi rekursif untuk mengkonversi angka menjadi kata terbilang */
FUNCTION Terbilang RETURNS CHARACTER (INPUT pAngka AS DECIMAL):
    
    /* Daftar kata untuk angka 0-11 dipisahkan dengan koma */
    DEFINE VARIABLE cHuruf AS CHARACTER INITIAL " ,satu,dua,tiga,empat,lima,enam,tujuh,delapan,sembilan,sepuluh,sebelas".
    
    /* Angka 0-11: langsung ambil dari daftar kata menggunakan ENTRY */
    IF pAngka < 12 THEN 
        RETURN ENTRY(INTEGER(pAngka) + 1, cHuruf).
    
    /* Angka 12-19: ambil kata satuannya lalu tambahkan "belas" */
    ELSE IF pAngka < 20 THEN 
        RETURN Terbilang(pAngka - 10) + " belas".
    
    /* Angka 20-99: ambil kata puluhan lalu rekursif untuk satuannya */
    ELSE IF pAngka < 100 THEN 
        RETURN Terbilang(TRUNC(pAngka / 10, 0)) + " puluh " + Terbilang(pAngka MOD 10).
    
    /* Angka 100-199: gunakan "seratus" lalu rekursif untuk sisanya */    
    ELSE IF pAngka < 200 THEN 
        RETURN "seratus " + Terbilang(pAngka - 100).
    
    /* Angka 200-999: ambil kata ratusannya lalu rekursif untuk sisanya */
    ELSE IF pAngka < 1000 THEN 
        RETURN Terbilang(TRUNC(pAngka / 100, 0)) + " ratus " + Terbilang(pAngka MOD 100).

    /* Angka 1000-1999: gunakan "seribu" lalu rekursif untuk sisanya */
    ELSE IF pAngka < 2000 THEN 
        RETURN "seribu " + Terbilang(pAngka - 1000).
    
    /* Angka 2000-999999: ambil kata ribuannya lalu rekursif untuk sisanya */
    ELSE IF pAngka < 1000000 THEN 
        RETURN Terbilang(TRUNC(pAngka / 1000, 0)) + " ribu " + Terbilang(pAngka MOD 1000).
    RETURN "".
END FUNCTION.

/* Meminta user menginput angka */
 UPDATE vAngka LABEL "Masukkan Angka".  

/* Memanggil fungsi Terbilang dan menambahkan kata "rupiah" di akhir */
vHasil = Terbilang(vAngka) + " rupiah".

/* Menampilkan angka dalam rupiah dan hasil terbilangnya */
DISPLAY 
    "Angka dalam Rupiah" AT 2 ":" AT 21 vAngka FORMAT ">>,>>>,>>9" SKIP
    "Pembilang"          AT 2 ":" AT 21 vHasil FORMAT "x(80)"
    WITH FRAME frSoal4 NO-LABELS NO-BOX WIDTH 80.

/* Output */
/*
+--------------+
¦Masukkan Angka¦
¦--------------¦
¦     99,999.00¦
+--------------+
 Angka dalam Rupiah :     99,999
 Pembilang          :
sembilan puluh sembilan ribu sembilan ratus sembilan puluh sembilan rupiah    
*/
