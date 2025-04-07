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
