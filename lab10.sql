-- ZADANIE 10.2

-- 1
SELECT datarealizacji, idzamowienia FROM zamowienia WHERE idklienta IN
       (SELECT idklienta FROM klienci WHERE nazwa LIKE '%Antoni');

-- 2
SELECT datarealizacji, idzamowienia FROM zamowienia WHERE idklienta IN
        (SELECT idklienta FROM klienci WHERE ulica LIKE '%/%');

-- 3
SELECT datarealizacji, idzamowienia FROM zamowienia
WHERE idklienta IN (SELECT idklienta FROM klienci WHERE miejscowosc LIKE 'Kraków')
AND idklienta IN (SELECT idklienta FROM zamowienia WHERE datarealizacji::text LIKE '2013-11-%');


-- ZADANIE 10.3

-- 1
SELECT nazwa, ulica, miejscowosc FROM klienci
WHERE idklienta = ANY (SELECT idklienta FROM zamowienia WHERE datarealizacji = '2013-11-12');

-- 2
SELECT nazwa, ulica, miejscowosc FROM klienci
WHERE idklienta = ANY (SELECT idklienta FROM zamowienia WHERE datarealizacji::text LIKE '2013-11-%');

-- 3
