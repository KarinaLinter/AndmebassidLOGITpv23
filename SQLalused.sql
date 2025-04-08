--kommentaar
--Xampp control panel
--Conect TO:
Serer Name: localhost - 127.0.0.1
--Authentification 2 tüüpi:
-- kasutaja: root
-- parool: ei ole

CREATE DATABASE linterLOGITpv23;
USE linterLOGITpv23;

--tabeli loomine
--identity(1,1) - ise täidab tabeli 1,2,3,...
CREATE TABLE inimene(
inimeneID int PRIMARY KEY identity(1,1),
nimi varchar(50) unique,
sunniaeg date,
telefon char(12),
pikkus decimal(5,2),
opilaskodu bit
);
SELECT * FROM inimene;

--tabeli kustutamine
DROP table inimene;
--andmete lisamine
--DDL -data definition language
--DML -data manipulation language

INSERT INTO inimene
(nimi, sunniaeg, telefon, pikkus, opilaskodu)
VALUES
('Mati Käsk', '2021-12-30', '2568952', 90.5, 0),
('Paul Gert', '2007-4-23', '4651358', 183, 0),
('Ivan Immel', '2011-8-16', '1567954', 165.5, 0),
('Aaron Ivil', '2001-1-22', '3587196', 192, 1),
('Marleen Tint', '2006-9-11', '1587429', 170, 0)
;

SELECT * FROM inimene;

DELETE FROM inimene;
--kustuta id=2
WHERE inimeneID=2;

CREATE TABLE elukoht(
elukohtID int PRIMARY KEY identity(1,1),
elukoht varchar(50) UNIQUE,
maakond varchar(50)
);
SELECT * FROM elukoht;
--andmete lisamine tabeli elukoht
INSERT INTO elukoht(elukoht, maakond)
VALUES ('Tartu', 'Tartumaa'),
('Pärnu','Pärnumaa');

--tabeli mutmine uue veergu lisamine
ALTER TABLE inimene ADD elukohtID int;
SELECT * FROM inimene;
--foreign key lisamine
Alter table inimene ADD Constraint fk_elukoht
FOREIGN KEY (elukohtID)
references elukoht(elukohtID);

SELECT * FROM inimene;
SELECT * FROM elukoht;

INSERT INTO inimene
(nimi, sunniaeg, telefon, pikkus, opilaskodu, elukohtID)
VALUES
('Mati Kask', '2021-12-30', '2568952', 90.5, 0, 1),
('Paul Gertt', '2007-4-23', '4651358', 183, 0, 1),
('Ivan Immell', '2011-8-16', '1567954', 165.5, 0, 1),
('Aaron Iviil', '2001-1-22', '3587196', 192, 1, 1),
('Marleen Tiint', '2006-9-11', '1587429', 170, 0, 1)
;

Select i.nimi, i.sunniaeg, e.elukoht
from inimene i join elukoht e
ON i.elukohtID=e.elukohtID;

--tabeli auto lomine
CREATE TABLE autod(
autodID int PRIMARY KEY identity(1,1),
autodNr varchar(50) UNIQUE,
mudell varchar(50),
mark varchar(50),
v_aasta int
);
SELECT * FROM autod;
INSERT INTO autod(autodNr, mudell, mark, v_aasta)
VALUES
('222 kar', 'sq8', 'audi', '2022')
;

--auto lisamine
Alter table inimene ADD autodID int;
SELECT * FROM inimene;
--foreign key
ALTER TABLE inimene
ADD Constraint fk_autod
FOREIGN KEY (autodID)
references autod(autodID);

INSERT INTO inimene
(nimi, sunniaeg, telefon, pikkus, opilaskodu, elukohtID, autodID)
VALUES
('Karina Linter', '2007-3-22', '5803073', 170, 1, 1, 1)
;
