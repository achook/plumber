-- ZADANIE 6.1

-- 1
INSERT INTO czekoladki (idczekoladki, nazwa, czekolada, orzechy, nadzienie, opis, koszt, masa)
VALUES ('W98', 'Biały kieł', 'biała', 'laskowe', 'marcepan', 'Rozpływające się w rękach i kieszeniach', 0.45, 20);

-- 2
INSERT INTO klienci (idklienta, nazwa, ulica, miejscowosc, kod, telefon)
VALUES (90, 'Matusiak Edward', 'Kropiwnickiego 6/3', 'Leningrad', '31-471', '031 423 45 38'),
       (91, 'Matusiak Alina', 'Kropiwnickiego 6/3', 'Leningrad', '31-471', '031 423 45 38'),
       (92, 'Kimono Franek', 'Karateków 8', 'Mistrz', '30-029', '501 498 324');

-- 3
INSERT INTO klienci (idklienta, nazwa, ulica, miejscowosc, kod, telefon)
SELECT 93, 'Matusiak Iza', ulica, miejscowosc, kod, telefon FROM klienci WHERE idklienta = 90;

-- 4
SELECT * FROM czekoladki WHERE idczekoladki = 'W98';
SELECT * FROM klienci WHERE idklienta >= 90;


-- ZADANIE 6.2

-- 1
INSERT INTO czekoladki
VALUES ('X91', 'Nieznana Nieznajoma', NULL, NULL, NULL, 'Niewidzialna czekoladka wspomagajaca odchudzanie.', 0.26, 0),
       ('M98', 'Mleczny Raj', 'mleczna', NULL, NULL, 'Aksamitna mleczna czekolada w ksztalcie butelki z mlekiem.', 0.26, 36);

-- 2
SELECT * FROM czekoladki WHERE idczekoladki IN ('X91', 'M98');


-- ZADANIE 6.3

-- 1
DELETE FROM czekoladki WHERE idczekoladki IN ('X91', 'M98');

-- 2
SELECT * FROM czekoladki WHERE idczekoladki IN ('X91', 'M98');

-- 3
INSERT INTO czekoladki (idczekoladki, nazwa, opis, koszt, masa)
VALUES ('X91', 'Nieznana Nieznajoma', 'Niewidzialna czekoladka wspomagajaca odchudzanie.', 0.26, 0);

INSERT INTO czekoladki (idczekoladki, nazwa, czekolada, opis, koszt, masa)
VALUES ('M98', 'Mleczny Raj', 'mleczna', 'Aksamitna mleczna czekolada w ksztalcie butelki z mlekiem.', 0.26, 36);

-- 4
SELECT * FROM czekoladki WHERE idczekoladki IN ('X91', 'M98');


-- ZADANIE 6.4

-- 1
UPDATE klienci SET nazwa = 'Nowak Iza' WHERE nazwa = 'Matusiak Iza';
SELECT * FROM klienci WHERE nazwa IN ('Nowak Iza', 'Matusiak Iza');


-- 2
SELECT idczekoladki, koszt FROM czekoladki WHERE idczekoladki IN ('W98', 'M98', 'X91');
UPDATE czekoladki SET koszt = koszt*0.9 WHERE idczekoladki IN ('W98', 'M98', 'X91');
SELECT idczekoladki, koszt FROM czekoladki WHERE idczekoladki IN ('W98', 'M98', 'X91');

-- 3
UPDATE czekoladki SET koszt = (SELECT koszt FROM czekoladki WHERE idczekoladki = 'W98') WHERE nazwa = 'Nieznana Nieznajoma';
SELECT nazwa, idczekoladki, koszt FROM czekoladki WHERE nazwa = 'Nieznana Nieznajoma' OR idczekoladki = 'W98';

-- 4
UPDATE klienci SET miejscowosc = 'Piotrograd' WHERE miejscowosc = 'Leningrad';
SELECT idklienta, miejscowosc FROM klienci WHERE miejscowosc IN ('Leningrad', 'Piotrograd');

-- 5
SELECT idczekoladki, koszt FROM czekoladki WHERE RIGHT(idczekoladki, 2)::integer > 90;
UPDATE czekoladki SET koszt = koszt+0.15 WHERE RIGHT(idczekoladki, 2)::integer > 90;
SELECT idczekoladki, koszt FROM czekoladki WHERE RIGHT(idczekoladki, 2)::integer > 90;