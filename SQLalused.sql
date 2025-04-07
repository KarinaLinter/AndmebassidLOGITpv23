--kommentaar
--SQL SERVER Managment Stuudio
--Conect TO:
Serer Name: (localdb)\mssqllocaldb
--Authentification 2 tüüpi:
--1. Windows Auth - localdb admini õigused
--2. SQL Server Auth - kontrollida varem tehtud kasutajad

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
