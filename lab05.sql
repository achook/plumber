-- ZADANIE 5.1

-- 1
SELECT COUNT(nazwa) FROM czekoladki;

-- 2
SELECT COUNT(*) FROM czekoladki WHERE nadzienie IS NOT NULL;

SELECT COUNT(nadzienie) FROM czekoladki;

-- 3
SELECT idpudelka, COUNT(*) FROM zawartosc GROUP BY idpudelka ORDER BY COUNT(*) DESC LIMIT 1;

-- 4
SELECT idpudelka, COUNT(*) FROM zawartosc GROUP BY idpudelka;

-- 5
SELECT idpudelka, COUNT(*) FROM czekoladki c INNER JOIN zawartosc z USING (idczekoladki) GROUP BY idpudelka;

-- 6
SELECT idpudelka, COUNT(*) FROM czekoladki c INNER JOIN zawartosc z USING (idczekoladki)
                           WHERE czekolada = 'mleczna' GROUP BY idpudelka;


-- ZADANIE 5.2

-- 1
SELECT idpudelka, SUM(masa) FROM czekoladki c INNER JOIN zawartosc z USING (idczekoladki) GROUP BY idpudelka;

-- 2
SELECT idpudelka, SUM(masa) FROM czekoladki c INNER JOIN zawartosc z USING (idczekoladki) GROUP BY idpudelka
ORDER BY SUM(masa) DESC LIMIT 1;

-- 3
SELECT AVG(sum) FROM
(SELECT SUM(masa) sum FROM czekoladki c INNER JOIN zawartosc z USING (idczekoladki) GROUP BY idpudelka) as m;

-- 4
SELECT idpudelka, AVG(masa) srednia FROM czekoladki c INNER JOIN zawartosc z USING (idczekoladki) GROUP BY idpudelka;


-- ZADANIE 5.3

-- 1
SELECT datarealizacji, COUNT(*) FROM zamowienia GROUP BY datarealizacji;

-- 2
SELECT COUNT(*) from zamowienia;

-- 3
SELECT SUM(cena) FROM zamowienia INNER JOIN artykuly USING (idzamowienia) INNER JOIN pudelka USING (idpudelka);

-- 4
SELECT idklienta, liczba, suma FROM
(SELECT idklienta, COUNT(idzamowienia) liczba FROM zamowienia INNER JOIN klienci USING (idklienta) GROUP BY idklienta) l INNER JOIN
(SELECT idklienta, SUM(cena) suma FROM zamowienia INNER JOIN artykuly USING (idzamowienia) INNER JOIN pudelka USING (idpudelka)
GROUP BY idklienta) s USING (idklienta);


-- ZADANIE 5.4

-- 1
SELECT c.idczekoladki, COUNT(z.idpudelka) liczba FROM czekoladki c INNER JOIN zawartosc z ON c.idczekoladki = z.idczekoladki
GROUP BY c.idczekoladki ORDER BY liczba DESC LIMIT 1;

-- 2
SELECT z.idpudelka, COUNT(c.idczekoladki) liczba FROM zawartosc z INNER JOIN czekoladki c ON c.idczekoladki = z.idczekoladki
WHERE c.orzechy IS NULL GROUP BY z.idpudelka ORDER BY liczba DESC LIMIT 1;

-- 3
SELECT c.idczekoladki, COUNT(z.idpudelka) liczba FROM czekoladki c LEFT JOIN zawartosc z ON c.idczekoladki = z.idczekoladki
GROUP BY c.idczekoladki ORDER BY liczba ASC LIMIT 1;

-- 4
SELECT idpudelka, COUNT(idpudelka) liczba FROM zamowienia z INNER JOIN artykuly a on z.idzamowienia = a.idzamowienia
GROUP BY idpudelka ORDER BY liczba DESC LIMIT 1;


-- ZADANIE 5.5

-- 1
SELECT date_part('quarter', datarealizacji) kwartal, date_part('year', datarealizacji) rok, COUNT (datarealizacji) FROM zamowienia
GROUP BY (kwartal, rok);

-- 2
SELECT date_part('month', datarealizacji) miesiac, date_part('year', datarealizacji) rok, COUNT (datarealizacji) FROM zamowienia
GROUP BY (miesiac, rok);

-- 3
SELECT date_part('week', datarealizacji) tydzien, date_part('year', datarealizacji) rok, COUNT (datarealizacji) FROM zamowienia
GROUP BY (tydzien, rok);

-- 4
SELECT miejscowosc, COUNT(idzamowienia) FROM zamowienia z INNER JOIN klienci k on z.idklienta = k.idklienta
GROUP BY miejscowosc;


-- ZADANIE 5.6

-- 1
SELECT SUM(masa) FROM czekoladki c
    INNER JOIN zawartosc z on c.idczekoladki = z.idczekoladki
    INNER JOIN pudelka p on p.idpudelka = z.idpudelka;

-- 2
SELECT SUM(cena) FROM pudelka;

-- 3
WITH k AS
    (SELECT SUM(koszt) koszt_produkcji, idpudelka FROM czekoladki INNER JOIN zawartosc USING (idczekoladki) GROUP BY idpudelka),
c AS
    (SELECT cena, idpudelka FROM pudelka)
SELECT idpudelka, cena-koszt_produkcji zysk FROM k INNER JOIN c USING (idpudelka);

-- 4
WITH z AS
    (WITH k AS
        (SELECT SUM(koszt) koszt_produkcji, idpudelka FROM czekoladki INNER JOIN zawartosc USING (idczekoladki) GROUP BY idpudelka),
    c AS
        (SELECT cena, idpudelka FROM pudelka)
    SELECT idpudelka, cena-koszt_produkcji zysk FROM k INNER JOIN c USING (idpudelka))
SELECT SUM(zysk*sztuk) FROM z INNER JOIN artykuly USING (idpudelka);

-- 5
WITH z AS
    (WITH k AS
        (SELECT SUM(koszt) koszt_produkcji, idpudelka FROM czekoladki INNER JOIN zawartosc USING (idczekoladki) GROUP BY idpudelka),
    c AS
        (SELECT cena, idpudelka FROM pudelka)
    SELECT idpudelka, cena-koszt_produkcji zysk FROM k INNER JOIN c USING (idpudelka))
SELECT SUM(zysk*stan) FROM z INNER JOIN pudelka USING (idpudelka);


-- ZADANIE 5.8

-- 1
SELECT ROW_NUMBER() OVER (ORDER BY idpudelka ASC) AS num, idpudelka FROM pudelka;