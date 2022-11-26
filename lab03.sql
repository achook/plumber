-- ZADANIE 3.1

-- 1
SELECT idzamowienia, datarealizacji FROM zamowienia WHERE datarealizacji BETWEEN '2013-11-12' AND '2013-11-20';

-- 2
SELECT idzamowienia, datarealizacji FROM zamowienia WHERE datarealizacji BETWEEN '2013-12-01' AND '2013-12-06'
                                                       OR datarealizacji BETWEEN '2013-12-15' AND '2013-12-20';

-- 3
SELECT idzamowienia, datarealizacji FROM zamowienia WHERE datarealizacji::text LIKE '2013-12-%';

-- 4
SELECT idzamowienia, datarealizacji FROM zamowienia WHERE date_part('year', datarealizacji) = 2013
                                                      AND date_part('month', datarealizacji) = 11;

-- 5
SELECT idzamowienia, datarealizacji FROM zamowienia WHERE date_part('year', datarealizacji) = 2013
                                                      AND date_part('month', datarealizacji) IN (11, 12);

-- 6
SELECT idzamowienia, datarealizacji FROM zamowienia WHERE date_part('day', datarealizacji) BETWEEN 17 AND 19;

-- 7
SELECT idzamowienia, datarealizacji FROM zamowienia WHERE date_part('week', datarealizacji) IN (46, 47);


-- ZADANIE 3.2

-- 1
SELECT idczekoladki, nazwa, czekolada, orzechy, nadzienie FROM czekoladki
WHERE nazwa LIKE 'S%';

-- 2
SELECT idczekoladki, nazwa, czekolada, orzechy, nadzienie FROM czekoladki
WHERE nazwa LIKE 'S%i';

-- 3
SELECT idczekoladki, nazwa, czekolada, orzechy, nadzienie FROM czekoladki
WHERE nazwa LIKE 'S% m%';

-- 4
SELECT idczekoladki, nazwa, czekolada, orzechy, nadzienie FROM czekoladki
WHERE nazwa ~ '^[A-C]';

-- 5
SELECT idczekoladki, nazwa, czekolada, orzechy, nadzienie FROM czekoladki
WHERE nazwa ~ '[Oo]rzech';

-- 6
SELECT idczekoladki, nazwa, czekolada, orzechy, nadzienie FROM czekoladki
WHERE nazwa ~ '^S.*m';

-- 7
SELECT idczekoladki, nazwa, czekolada, orzechy, nadzienie FROM czekoladki
WHERE nazwa !~ '(maliny)|(truskawki)';

-- 8
SELECT idczekoladki, nazwa, czekolada, orzechy, nadzienie FROM czekoladki
WHERE nazwa !~ '^([D-K]|S|T)';

-- 9
SELECT idczekoladki, nazwa, czekolada, orzechy, nadzienie FROM czekoladki
WHERE nazwa ~ '^S(ł|l)od';

-- 10
SELECT idczekoladki, nazwa, czekolada, orzechy, nadzienie FROM czekoladki
WHERE nazwa !~ ' ';


-- ZADANIE 3.3

-- 1
SELECT DISTINCT miejscowosc FROM klienci WHERE miejscowosc LIKE '% %';

-- 2
SELECT nazwa FROM klienci WHERE LENGTH(telefon) = 13;

-- 3
SELECT nazwa FROM klienci WHERE LENGTH(telefon) = 11;


-- ZADANIE 3.4

-- 1
(SELECT * FROM czekoladki WHERE masa BETWEEN 15 AND 24)
UNION (SELECT * FROM czekoladki WHERE koszt BETWEEN 0.15 AND 0.24);

-- 2
(SELECT * FROM czekoladki WHERE masa BETWEEN 25 AND 35)
EXCEPT (SELECT * FROM czekoladki WHERE koszt BETWEEN 0.25 AND 0.35);

-- 3
((SELECT * FROM czekoladki WHERE masa BETWEEN 15 AND 24)
INTERSECT (SELECT * FROM czekoladki WHERE koszt BETWEEN 0.15 AND 0.24))
UNION
((SELECT * FROM czekoladki WHERE masa BETWEEN 25 AND 35)
INTERSECT (SELECT * FROM czekoladki WHERE koszt BETWEEN 0.25 AND 0.35));

-- 4
((SELECT * FROM czekoladki WHERE masa BETWEEN 15 AND 24)
INTERSECT (SELECT * FROM czekoladki WHERE koszt BETWEEN 0.15 AND 0.24));

-- 5
(SELECT * FROM czekoladki WHERE masa BETWEEN 25 AND 35)
EXCEPT
((SELECT * FROM czekoladki WHERE koszt BETWEEN 0.15 AND 0.24)
UNION (SELECT * FROM czekoladki WHERE koszt BETWEEN 0.29 AND 0.35));


-- ZADANIE 3.5

-- 1
SELECT DISTINCT idklienta FROM klienci
EXCEPT
SELECT DISTINCT idklienta FROM zamowienia;

-- 2
SELECT DISTINCT idpudelka FROM pudelka
EXCEPT
SELECT DISTINCT idpudelka FROM artykuly;

-- 3
SELECT DISTINCT nazwa FROM klienci WHERE lower(nazwa) LIKE '%rz%'
UNION
SELECT DISTINCT nazwa FROM czekoladki WHERE lower(nazwa) LIKE '%rz%'
UNION
SELECT DISTINCT nazwa FROM pudelka WHERE lower(nazwa) LIKE '%rz%';

-- 4
SELECT idczekoladki FROM czekoladki
EXCEPT
SELECT idczekoladki FROM zawartosc;


-- ZADANIE 3.6

-- 1
SELECT idmeczu, (SELECT SUM(a) FROM UNNEST(gospodarze) a) AS gospodarze,
       (SELECT SUM(b) FROM UNNEST(goscie) b) AS goscie FROM statystyki;

-- 2
SELECT idmeczu, (SELECT SUM(a) FROM UNNEST(gospodarze) a) AS gospodarze_suma,
       (SELECT SUM(b) FROM UNNEST(goscie) b) AS goscie_suma FROM statystyki
WHERE goscie[5] IS NOT NULL AND (goscie[5] > 15 OR gospodarze[5] > 15);
