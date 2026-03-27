# Progress 4GL Programming Assignment
**Author:** Grace Mae Gozali  
**Environment:** ZOC Software 2005 (Progress 4GL)

---

## Overview
This project contains 15 Progress 4GL programs, each solving a different programming problem. All programs are written and tested in ZOC Software 2005 and use syntax compatible with that version.

---

## How to Run
1. Open ZOC Software 2005
2. Type or paste the program code into the editor
3. Press **F1** or go to **Compile > Run** to execute
4. Enter input values when prompted

---

## Program List

### Soal1.p — Count Letter Occurrences
Counts how many times a specific letter appears in a given sentence.  
**Key functions:** `LENGTH()`, `SUBSTRING()`  
**Example:**
```
Kalimat : selamatdatang
Abjad   : a
Jumlah  : 4
```

---

### Soal2.p — Date Validation
Accepts a date input (day, month, year) and validates it. Handles leap years, months with 30 days, and invalid date ranges.  
**Key functions:** `MODULO`, `MESSAGE ... VIEW-AS ALERT-BOX`  
**Example:**
```
Tgl   : 31
Bulan : 02
Tahun : 2011
ERROR : Bulan 02 hanya memiliki tanggal 28
```

---

### Soal3.p — Word Splitter
Splits a sentence into individual words and displays each word on a new line.  
**Key functions:** `ENTRY()`, `SKIP`  
**Example:**
```
Kalimat : saya suka bekerja di polytron
saya
suka
bekerja
di
polytron
```

---

### Soal4.p — Number to Words Converter
Converts a number into its Indonesian word representation (terbilang) and appends "rupiah".  
**Key functions:** Recursive `FUNCTION`, `ENTRY()`, `TRUNC()`, `MOD`  
**Example:**
```
Angka dalam Rupiah : 12500
Pembilang          : dua belas ribu lima ratus rupiah
```

---

### Soal5.p — Fibonacci Series
Generates a Fibonacci series up to a given number of iterations.  
**Key logic:** Each number is the sum of the two previous numbers, starting from 1 and 1.  
**Example:**
```
Iterasi : 11
1 1 2 3 5 8 13 21 34 55 89
```

---

### Soal6.p — Alternating Number Pattern
Displays a number pattern that alternates between ascending (1 2 3 4) on odd rows and descending (4 3 2 1) on even rows.  
**Key logic:** `MOD` to determine odd/even rows, nested loops for columns.  
**Example:**
```
Angka : 4
1 2 3 4
4 3 2 1
1 2 3 4
4 3 2 1
```

---

### Soal7.p — 4-Digit Alphanumeric Counter
Increments a 4-digit alphanumeric counter using base-36 numbering (0-9 then A-Z). Handles carry-over when a digit reaches 'Z'.  
**Key functions:** `INDEX()`, `SUBSTRING()`, `LEAVE`  
**Example:**
```
Nilai Awal : 001Z
Iterasi    : 4
001Z → 0021 → 0022 → 0023
```

---

### Soal8.p — Calendar Display
Displays a calendar for a given month and year, with days aligned to the correct columns (Monday to Sunday).  
**Key logic:** Uses a starting day offset to align the first date to the correct column, then fills 7 characters per column.  
**Example:**
```
Bulan : 04
Tahun : 2011
Senin  Selasa Rabu   Kamis  Jumat  Sabtu  Minggu
                              01     02     03
04     05     06     07     08     09     10
...
```

---

### Soal9.p — Plus/Equals Pattern
Displays a 5x5 grid pattern alternating between "+" and "=" symbols. The pattern shifts on each row.  
**Key logic:** `(i + j) MOD 2` determines whether to place "+" or "=".  
**Example:**
```
Iterasi : 5
+ = + = +
= + = + =
+ = + = +
= + = + =
+ = + = +
```

---

### Soal10.p — Decreasing Star Pattern
Displays a triangle pattern of asterisks (*) that decreases by one star per row.  
**Key functions:** `FILL()`  
**Example:**
```
Input : 4
* * * *
* * *
* *
*
```

---

### Soal11.p — Number and Letter Series (Grid)
Displays alternating rows of numbers and uppercase letters in a grid format. Width is validated between 1 and 6.  
**Key functions:** `CHR()`, `STRING()`, `MESSAGE ... VIEW-AS ALERT-BOX`  
**Example:**
```
Lebar : 5
1 2 3 4 5
A B C D E
6 7 8 9 10
F G H I J
11 12 13 14 15
K L M N O
```

---

### Soal12.p — Remove Short Words
Removes all words with 6 or fewer characters from a given string, keeping only words longer than 6 characters.  
**Key functions:** `NUM-ENTRIES()`, `ENTRY()`, `LENGTH()`  
**Example:**
```
String : aku sedang belajar progress
Hasil  : belajar progress
```

---

### Soal13.p — Alternating Number and Letter Series
Generates a series that alternates between numbers and lowercase letters up to a given position.  
**Key logic:** Odd positions get numbers, even positions get lowercase letters using `CHR(96 + index)`.  
**Example:**
```
Deret ke : 11
Hasil    : 1 a 2 b 3 c 4 d 5 e 6
```

---

### Soal14.p — Swap Uppercase and Lowercase
Swaps the case of each letter in a string. Spaces are ignored in the position count, so the odd/even counter continues across words.  
**Key logic:** `ASC()` to get ASCII value, subtract 32 for uppercase, add 32 for lowercase.  
**Example:**
```
Input : Aku sedang belajar di polytron.
Hasil : AkU sEdAnG bElAjAr Di PoLyTrOn.
```

---

### Soal15.p — Separate Decimal Remainder
Truncates a decimal number to 3 decimal places and calculates the remaining digits rounded to 6 decimal places.  
**Key functions:** `TRUNCATE()`, `ROUND()`, `STRING()`  
**Example:**
```
Input       : 557.1234567
Pembulatan  : 557.123
Sisa        : 0.000457
```

---

## Key Progress 4GL Concepts Used

| Concept | Description |
|---|---|
| `DEFINE VARIABLE` | Declares a variable with a data type and optional format |
| `UPDATE` | Prompts user for input in a frame |
| `DISPLAY` | Outputs values to the screen |
| `MESSAGE ... VIEW-AS ALERT-BOX` | Shows a popup message dialog |
| `DO ... END` | Defines a loop or block of code |
| `SUBSTRING(str, pos, len)` | Extracts part of a string |
| `ENTRY(n, str, delim)` | Gets the nth entry from a delimited string |
| `NUM-ENTRIES(str, delim)` | Counts entries in a delimited string |
| `LENGTH(str)` | Returns the length of a string |
| `STRING(val)` | Converts a value to a string |
| `CHR(n)` | Returns the character for an ASCII code |
| `ASC(char)` | Returns the ASCII code of a character |
| `TRUNCATE(val, decimals)` | Truncates a decimal to given decimal places |
| `ROUND(val, decimals)` | Rounds a decimal to given decimal places |
| `FILL(char, n)` | Fills a string with a repeated character |
| `INDEX(str, sub)` | Finds the position of a substring |
| `MOD` | Returns the remainder of a division |
| `CHR(10)` | Newline character used in MESSAGE output |

---

## Notes
- All programs are tested with the sample inputs provided in the assignment.
- `PUT UNFORMATTED` is not used as it does not display output in ZOC's screen mode — `MESSAGE ... VIEW-AS ALERT-BOX` is used instead for multi-line output.
- Input field width is limited to `FORMAT "X(60)"` to prevent the `FILL-IN will not fit in FRAME` error in ZOC.
