-- Zadanie 4.2

-- 1
SELECT datarealizacji, idzamowienia, nazwa FROM zamowienia z INNER JOIN klienci k on z.idklienta = k.idklienta
WHERE k.nazwa ~ 'Antoni$';

-- 2
SELECT datarealizacji, idzamowienia, ulica FROM zamowienia z INNER JOIN klienci k on z.idklienta = k.idklienta
WHERE k.ulica ~ '/';

-- 3
SELECT datarealizacji, idzamowienia FROM zamowienia z INNER JOIN klienci k on z.idklienta = k.idklienta
WHERE k.miejscowosc = 'Kraków' AND datarealizacji::text ~ '2013-11-';


-- Zadanie 4.3

-- 1
SELECT DISTINCT nazwa, ulica, miejscowosc, datarealizacji FROM klienci k INNER JOIN zamowienia z on k.idklienta = z.idklienta
WHERE (now() - datarealizacji) < '10 years'::interval;

-- 2
SELECT DISTINCT k.nazwa, k.ulica, k.miejscowosc, p.nazwa FROM klienci k INNER JOIN zamowienia z USING (idklienta)
INNER JOIN artykuly a USING (idzamowienia) INNER JOIN pudelka p USING (idpudelka)
WHERE p.nazwa IN ('Kremowa fantazja', 'Kolekcja jesienna');

-- 3
SELECT DISTINCT nazwa, ulica, miejscowosc FROM klienci k INNER JOIN zamowienia z on k.idklienta = z.idklienta;

-- 4
SELECT DISTINCT nazwa, ulica, miejscowosc FROM klienci k LEFT JOIN zamowienia z on k.idklienta = z.idklienta
WHERE z.idklienta IS NULL;

-- 5
SELECT DISTINCT nazwa, ulica, miejscowosc, datarealizacji FROM klienci k LEFT JOIN zamowienia z on k.idklienta = z.idklienta
WHERE datarealizacji::text ~ '2013-11-';

-- 6
SELECT DISTINCT k.nazwa, k.ulica, k.miejscowosc, a.sztuk, p.nazwa FROM klienci k INNER JOIN zamowienia z USING (idklienta)
INNER JOIN artykuly a USING (idzamowienia) INNER JOIN pudelka p USING (idpudelka)
WHERE a.sztuk > 1 AND p.nazwa IN ('Kremowa fantazja', 'Kolekcja jesienna');

-- 7
SELECT DISTINCT k.nazwa, k.ulica, k.miejscowosc, c.orzechy FROM klienci k INNER JOIN zamowienia z USING (idklienta)
INNER JOIN artykuly a USING (idzamowienia) INNER JOIN zawartosc USING (idpudelka) INNER JOIN czekoladki c USING (idczekoladki)
WHERE orzechy = 'migdały';


-- Zadanie 4.4

-- 1
SELECT DISTINCT p.nazwa, p.opis, c.nazwa, c.opis FROM czekoladki c
    INNER JOIN zawartosc z USING (idczekoladki)
    INNER JOIN pudelka p USING (idpudelka)
    ORDER BY p.nazwa;

-- 2
SELECT DISTINCT p.nazwa, p.opis, c.nazwa, c.opis FROM czekoladki c
    INNER JOIN zawartosc z USING (idczekoladki)
    INNER JOIN pudelka p USING (idpudelka)
    WHERE idpudelka = 'heav'
    ORDER BY p.nazwa;

-- 3
SELECT DISTINCT p.nazwa, p.opis, c.nazwa, c.opis FROM czekoladki c
    INNER JOIN zawartosc z USING (idczekoladki)
    INNER JOIN pudelka p USING (idpudelka)
    WHERE p.nazwa ~ 'Kolekcja'
    ORDER BY p.nazwa;


-- ZADANIE 4.5

-- 1
SELECT DISTINCT p.nazwa, p.opis, p.cena FROM pudelka p
    INNER JOIN zawartosc z on p.idpudelka = z.idpudelka
    INNER JOIN czekoladki c on c.idczekoladki = z.idczekoladki
WHERE c.idczekoladki = 'd09';

-- 2
SELECT DISTINCT p.nazwa, p.opis, p.cena FROM pudelka p
    INNER JOIN zawartosc z on p.idpudelka = z.idpudelka
    INNER JOIN czekoladki c on c.idczekoladki = z.idczekoladki
WHERE c.nazwa ~ '^S';

-- 3
SELECT DISTINCT p.nazwa, p.opis, p.cena FROM pudelka p
    INNER JOIN zawartosc z on p.idpudelka = z.idpudelka
WHERE z.sztuk >= 4;

-- 4
SELECT DISTINCT p.nazwa, p.opis, p.cena FROM pudelka p
    INNER JOIN zawartosc z on p.idpudelka = z.idpudelka
    INNER JOIN czekoladki c on c.idczekoladki = z.idczekoladki
WHERE c.nadzienie = 'truskawki';

-- 5
SELECT nazwa, opis, cena FROM pudelka WHERE idpudelka NOT IN (
    SELECT idpudelka FROM zawartosc z
        INNER JOIN czekoladki c on c.idczekoladki = z.idczekoladki
    WHERE c.czekolada = 'gorzka');

-- 6
SELECT DISTINCT p.nazwa, p.opis, p.cena FROM pudelka p
    INNER JOIN zawartosc z on p.idpudelka = z.idpudelka
    INNER JOIN czekoladki c on c.idczekoladki = z.idczekoladki
WHERE c.nazwa = 'Gorzka truskawkowa' AND z.sztuk >= 3;

-- 7
SELECT nazwa, opis, cena FROM pudelka WHERE idpudelka NOT IN (
    SELECT idpudelka FROM zawartosc z
        INNER JOIN czekoladki c on c.idczekoladki = z.idczekoladki
    WHERE c.orzechy IS NOT NULL);

-- 8
SELECT DISTINCT p.nazwa, p.opis, p.cena FROM pudelka p
    INNER JOIN zawartosc z on p.idpudelka = z.idpudelka
    INNER JOIN czekoladki c on c.idczekoladki = z.idczekoladki
WHERE c.nazwa = 'Gorzka truskawkowa';

-- 9
SELECT DISTINCT p.nazwa, p.opis, p.cena FROM pudelka p
    INNER JOIN zawartosc z on p.idpudelka = z.idpudelka
    INNER JOIN czekoladki c on c.idczekoladki = z.idczekoladki
WHERE c.nadzienie IS NULL;