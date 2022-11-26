-- ZADANIE 2.1

-- 1
SELECT nazwa, ulica, miejscowosc FROM klienci ORDER BY nazwa;

-- 2
SELECT nazwa, ulica, miejscowosc FROM klienci ORDER BY miejscowosc DESC, nazwa ASC;

-- 3
SELECT nazwa, ulica, miejscowosc FROM klienci WHERE miejscowosc IN ('Kraków', 'Warszawa')
ORDER BY miejscowosc DESC, nazwa ASC;

SELECT nazwa, ulica, miejscowosc FROM klienci WHERE miejscowosc = 'Kraków' OR miejscowosc ='Warszawa'
ORDER BY miejscowosc DESC, nazwa ASC;

-- 4
SELECT nazwa, ulica, miejscowosc FROM klienci ORDER BY miejscowosc DESC;

-- 5
SELECT nazwa, ulica, miejscowosc FROM klienci WHERE miejscowosc = 'Kraków' ORDER BY nazwa;


-- ZADANIE 2.2

-- 1
SELECT nazwa, masa FROM czekoladki WHERE masa > 20;

-- 2
SELECT nazwa, masa, koszt FROM czekoladki WHERE masa > 20 AND koszt > 0.25;

-- 3
SELECT nazwa, masa, koszt*100 "koszt (grosze)" FROM czekoladki WHERE masa > 20 AND koszt > 0.25;

-- 4
SELECT nazwa, czekolada, nadzienie, orzechy FROM czekoladki
WHERE (czekolada = 'mleczna' AND (nadzienie IN ('maliny', 'truskawki')))
OR (orzechy = 'laskowe' AND czekolada <> 'gorzka');

-- 5
SELECT nazwa, koszt FROM czekoladki WHERE koszt > 0.25;

-- 6
SELECT nazwa, czekolada FROM czekoladki WHERE czekolada IN ('biala', 'mleczna');


-- ZADANIE 2.3

-- 1
SELECT (124 * 7 + 45) AS "result";

-- 2
SELECT POW(2, 20) AS "result";

-- 3
SELECT SQRT(3) AS "result";

-- 4
SELECT PI() AS "result";


-- ZADANIE 2.4

-- 1
SELECT idczekoladki, nazwa, masa, koszt FROM czekoladki WHERE masa BETWEEN 15 AND 24;

-- 2
SELECT idczekoladki, nazwa, masa, koszt FROM czekoladki WHERE koszt BETWEEN 25 AND 35;

-- 3
SELECT idczekoladki, nazwa, masa, koszt FROM czekoladki WHERE masa BETWEEN 25 AND 35
                                                           OR koszt BETWEEN 15 AND 24;


-- ZADANIE 2.5

-- 1
SELECT idczekoladki, nazwa, czekolada, orzechy, nadzienie FROM czekoladki
WHERE orzechy IS NOT NULL;


-- 2
SELECT idczekoladki, nazwa, czekolada, orzechy, nadzienie FROM czekoladki
WHERE orzechy IS NULL;

-- 3
SELECT idczekoladki, nazwa, czekolada, orzechy, nadzienie FROM czekoladki
WHERE orzechy IS NOT NULL OR nadzienie IS NOT NULL;

-- 4
SELECT idczekoladki, nazwa, czekolada, orzechy, nadzienie FROM czekoladki
WHERE czekolada IN ('biala', 'mleczna') AND orzechy IS NULL;

-- 5
SELECT idczekoladki, nazwa, czekolada, orzechy, nadzienie FROM czekoladki
WHERE czekolada NOT IN ('biala', 'mleczna')
AND (orzechy IS NOT NULL or nadzienie IS NOT NULL);

-- 6
SELECT idczekoladki, nazwa, czekolada, orzechy, nadzienie FROM czekoladki
WHERE nadzienie IS NOT NULL;

-- 7
SELECT idczekoladki, nazwa, czekolada, orzechy, nadzienie FROM czekoladki
WHERE nadzienie IS NULL;

-- 8
SELECT idczekoladki, nazwa, czekolada, orzechy, nadzienie FROM czekoladki
WHERE nadzienie IS NULL AND orzechy IS NULL;

-- 9
SELECT idczekoladki, nazwa, czekolada, orzechy, nadzienie FROM czekoladki
WHERE czekolada IN ('mleczna', 'biala') AND nadzienie IS NULL;


-- ZADANIE 2.6

-- 1
SELECT * FROM czekoladki WHERE masa BETWEEN 15 AND 24 OR koszt BETWEEN 0.15 AND 0.24;

-- 2
SELECT * FROM czekoladki WHERE (masa BETWEEN 15 AND 24 AND koszt BETWEEN 0.15 AND 0.24)
                            OR (masa BETWEEN 25 AND 35 AND koszt BETWEEN 0.25 AND 0.35);

-- 3
SELECT * FROM czekoladki WHERE masa BETWEEN 15 AND 24 AND koszt BETWEEN 0.15 AND 0.24;

-- 4
SELECT * FROM czekoladki WHERE masa BETWEEN 25 AND 35 AND koszt NOT BETWEEN 0.25 AND 0.35;

-- 5
SELECT * FROM czekoladki WHERE masa BETWEEN 25 AND 35 AND
                               (koszt NOT BETWEEN 0.15 AND 0.24 AND koszt NOT BETWEEN 0.25 AND 0.35);