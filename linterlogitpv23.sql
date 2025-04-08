-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Loomise aeg: Aprill 08, 2025 kell 01:41 PL
-- Serveri versioon: 10.4.32-MariaDB
-- PHP versioon: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Andmebaas: `linterlogitpv23`
--

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `autod`
--

CREATE TABLE `autod` (
  `autodID` int(11) NOT NULL,
  `autodNr` varchar(50) DEFAULT NULL,
  `mudell` varchar(50) DEFAULT NULL,
  `mark` varchar(50) DEFAULT NULL,
  `v_aasta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `autod`
--

INSERT INTO `autod` (`autodID`, `autodNr`, `mudell`, `mark`, `v_aasta`) VALUES
(1, '222 kar', 'sq8', 'audi', 2022);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `elukoht`
--

CREATE TABLE `elukoht` (
  `elukohtID` int(11) NOT NULL,
  `elukoht` varchar(50) DEFAULT NULL,
  `maakond` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `elukoht`
--

INSERT INTO `elukoht` (`elukohtID`, `elukoht`, `maakond`) VALUES
(1, 'Tartu', 'Tartumaa'),
(2, 'Pärnu', 'Pärnumaa');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `inimene`
--

CREATE TABLE `inimene` (
  `inimeneID` int(11) NOT NULL,
  `nimi` varchar(50) DEFAULT NULL,
  `sunniaeg` date DEFAULT NULL,
  `telefon` char(12) DEFAULT NULL,
  `pikkus` decimal(5,2) DEFAULT NULL,
  `opilaskodu` bit(1) DEFAULT NULL,
  `elukohtID` int(11) DEFAULT NULL,
  `autodID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `inimene`
--

INSERT INTO `inimene` (`inimeneID`, `nimi`, `sunniaeg`, `telefon`, `pikkus`, `opilaskodu`, `elukohtID`, `autodID`) VALUES
(1, 'Mati Käsk', '2021-12-30', '2568952', 90.50, b'0', NULL, NULL),
(2, 'Paul Gert', '2007-04-23', '4651358', 183.00, b'0', NULL, NULL),
(3, 'Ivan Immel', '2011-08-16', '1567954', 165.50, b'0', NULL, NULL),
(4, 'Aaron Ivil', '2001-01-22', '3587196', 192.00, b'1', NULL, NULL),
(5, 'Marleen Tint', '2006-09-11', '1587429', 170.00, b'0', NULL, NULL),
(21, 'Mati Käskk', '2021-12-30', '2568952', 90.50, b'0', 2, NULL),
(22, 'Paul Gertt', '2007-04-23', '4651358', 183.00, b'0', 1, NULL),
(23, 'Ivan Immell', '2011-08-16', '1567954', 165.50, b'0', 2, NULL),
(24, 'Aaron Ivill', '2001-01-22', '3587196', 192.00, b'1', 1, NULL),
(25, 'Marleen Tintt', '2006-09-11', '1587429', 170.00, b'0', 2, NULL),
(26, 'Karina Linter', '2007-03-22', '5803073', 170.00, b'1', 1, 1);

--
-- Indeksid tõmmistatud tabelitele
--

--
-- Indeksid tabelile `autod`
--
ALTER TABLE `autod`
  ADD PRIMARY KEY (`autodID`),
  ADD UNIQUE KEY `autodNr` (`autodNr`);

--
-- Indeksid tabelile `elukoht`
--
ALTER TABLE `elukoht`
  ADD PRIMARY KEY (`elukohtID`),
  ADD UNIQUE KEY `elukoht` (`elukoht`);

--
-- Indeksid tabelile `inimene`
--
ALTER TABLE `inimene`
  ADD PRIMARY KEY (`inimeneID`),
  ADD UNIQUE KEY `nimi` (`nimi`),
  ADD KEY `fk_elukoht` (`elukohtID`),
  ADD KEY `fk_autod` (`autodID`);

--
-- AUTO_INCREMENT tõmmistatud tabelitele
--

--
-- AUTO_INCREMENT tabelile `autod`
--
ALTER TABLE `autod`
  MODIFY `autodID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT tabelile `elukoht`
--
ALTER TABLE `elukoht`
  MODIFY `elukohtID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT tabelile `inimene`
--
ALTER TABLE `inimene`
  MODIFY `inimeneID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Tõmmistatud tabelite piirangud
--

--
-- Piirangud tabelile `inimene`
--
ALTER TABLE `inimene`
  ADD CONSTRAINT `fk_autod` FOREIGN KEY (`autodID`) REFERENCES `autod` (`autodID`),
  ADD CONSTRAINT `fk_elukoht` FOREIGN KEY (`elukohtID`) REFERENCES `elukoht` (`elukohtID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
