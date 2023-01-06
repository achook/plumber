-- ZADANIE 9.1

CREATE SCHEMA kwiaciarnia;

CREATE TABLE kwiaciarnia.klienci (
    idklienta VARCHAR(10) PRIMARY KEY,
    haslo VARCHAR(10) NOT NULL CHECK ( LENGTH(haslo) >= 4 ),
    nazwa VARCHAR(40) NOT NULL,
    miasto VARCHAR(40) NOT NULL,
    kod CHAR(6) NOT NULL,
    adres VARCHAR(40) NOT NULL,
    email VARCHAR(40),
    telefon VARCHAR(16) NOT NULL,
    fax VARCHAR(16),
    nip CHAR(13),
    regon CHAR(9)
);

CREATE TABLE kwiaciarnia.kompozycje (
    idkompozycji CHAR(5) PRIMARY KEY,
    nazwa VARCHAR(40) NOT NULL,
    opis VARCHAR(100),
    cena NUMERIC(5,2) CHECK ( cena > 40.00 ),
    minimum INTEGER,
    stan INTEGER
);

CREATE TABLE kwiaciarnia.odbiorcy (
    idodbiorcy SERIAL PRIMARY KEY,
    nazwa VARCHAR(40) NOT NULL,
    miasto VARCHAR(40) NOT NULL,
    kod CHAR(6) NOT NULL,
    adres VARCHAR(40) NOT NULL
);

CREATE TABLE kwiaciarnia.zamowienia (
    idzamowienia INTEGER PRIMARY KEY,
    idklienta VARCHAR(10) NOT NULL REFERENCES kwiaciarnia.klienci(idklienta),
    idodbiorcy INTEGER NOT NULL REFERENCES kwiaciarnia.odbiorcy(idodbiorcy),
    idkompozycji CHAR(5) NOT NULL REFERENCES kwiaciarnia.kompozycje(idkompozycji),
    termin DATE NOT NULL,
    cena NUMERIC(5,2),
    zaplacone BOOLEAN,
    uwagi VARCHAR(200)
);

CREATE TABLE kwiaciarnia.zapotrzebowanie (
    idkompozycji CHAR(5) PRIMARY KEY REFERENCES kwiaciarnia.kompozycje(idkompozycji),
    data DATE
);


-- ZADANIE 9.3

DROP SCHEMA IF EXISTS firma CASCADE;
CREATE SCHEMA firma;

CREATE TABLE firma.dzialy (
    iddzialu CHAR(5) PRIMARY KEY,
    nazwa VARCHAR(32) NOT NULL,
    lokalizacja VARCHAR(24) NOT NULL,
    kierownik INTEGER
);

CREATE TABLE firma.pracownicy (
    idpracownika INTEGER PRIMARY KEY,
    nazwisko VARCHAR(32) NOT NULL,
    imie VARCHAR(16) NOT NULL,
    dataUrodzenia DATE NOT NULL,
    dzial CHAR(5) NOT NULL REFERENCES firma.dzialy(iddzialu),
    stanowisko VARCHAR(24),
    pobory NUMERIC(10,2)
);

ALTER TABLE firma.dzialy ADD CONSTRAINT dzial_fk FOREIGN KEY (kierownik) REFERENCES firma.pracownicy(idpracownika)
ON UPDATE CASCADE DEFERRABLE;

BEGIN;
SET CONSTRAINTS dzial_fk DEFERRED;

INSERT INTO firma.dzialy VALUES
                             ('PH101','Handlowy','Marki',77),
                             ('PR202','Projektowy','Olecko',27),
                             ('PK101','Personalny','Niwka',72);

INSERT INTO firma.pracownicy VALUES
                                 (27,'Kruk','Adam','1989-12-15','PK101','kierownik',2200.00),
                                 (270,'Kowalik','Artur','1988-12-13','PK101','analityk',2400.00),
                                 (72,'Kowalik','Adam','1989-11-15','PR202','kierownik',2600.00),
                                 (720,'Kowalik','Amadeusz','1988-12-17','PK101','analityk',3200.00),
                                 (707,'Kukulka','Antoni','1999-12-15','PH101','robotnik',1600.00),
                                 (207,'Kowal','Alojzy','1998-10-15','PH101','robotnik',2000.00),
                                 (77,'Kowalus','Adam','1998-11-12','PH101','kierownik',5400.00),
                                 (1010,'Kawula','Alojzy','1998-11-15','PK101','robotnik',2500.00);
COMMIT;