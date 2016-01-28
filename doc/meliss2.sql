-- phpMyAdmin SQL Dump
-- version 3.5.0
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Loomise aeg: Jaan 18, 2016 kell 11:34 AM
-- Serveri versioon: 5.5.27-1~dotdeb.0
-- PHP versioon: 5.3.16-1~dotdeb.0

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Andmebaas: `retekeytuibo_meliss`
--

-- --------------------------------------------------------
--
-- Tabeli struktuur tabelile `ADMIN`
--

CREATE TABLE IF NOT EXISTS `ADMIN` (
  `Admin_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Kasutajanimi` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Parool` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Admin_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `BRONEERING`
--

CREATE TABLE IF NOT EXISTS `BRONEERING` (
  `Broneering_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Klient_ID` int(10) unsigned NOT NULL,
  `Roog_ID` int(10) unsigned NOT NULL,
  `Kuupäev` date DEFAULT NULL,
  `Kellaaeg` time DEFAULT NULL,
  `Inimeste_arv` int(11) DEFAULT NULL,
  PRIMARY KEY (`Broneering_ID`),
  KEY `fk_Klient_ID` (`Klient_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Triggers `BRONEERING`
--
DELIMITER $$
CREATE TRIGGER `kohta_valideerimine` BEFORE INSERT ON `BRONEERING`
 FOR EACH ROW BEGIN

DECLARE kohtade_arv INTEGER;

SELECT SUM(Inimeste_arv) INTO kohtade_arv
        FROM broneering 
        WHERE Kuupäev = NEW.Kuupäev;

IF (kohtade_arv + NEW.Inimeste_arv) > 26 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ainult 26 inimest saavad tulla samal päeval.';
END IF;

END
$$
DELIMITER ;

--
-- Tabeli struktuur tabelile `KLIENT`
--

CREATE TABLE IF NOT EXISTS `KLIENT` (
  `Klient_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nimi` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Telefoninumber` bigint(20) DEFAULT NULL,
  `Epost` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Klient_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `RESTORAN`
--

CREATE TABLE IF NOT EXISTS `RESTORAN` (
  `Restoran_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Broneering_ID` int(10) unsigned NOT NULL,
  `Kohtade_arv` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`Restoran_ID`),
  KEY `Broneering_ID` (`Broneering_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `ROOG`
--

CREATE TABLE IF NOT EXISTS `ROOG` (
  `Roog_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Broneering_ID` int(10) unsigned NOT NULL,
  `Eelroog` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Põhiroog` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Järelroog` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Roog_ID`),
  KEY `Broneering_ID` (`Broneering_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Tõmmistatud tabelite piirangud
--

--
-- Piirangud tabelile `BRONEERING`
--
ALTER TABLE `BRONEERING`
  ADD CONSTRAINT `fk_Klient_ID` FOREIGN KEY (`Klient_ID`) REFERENCES `KLIENT` (`Klient_ID`);

--
-- Piirangud tabelile `RESTORAN`
--
ALTER TABLE `RESTORAN`
  ADD CONSTRAINT `RESTORAN_ibfk_1` FOREIGN KEY (`Broneering_ID`) REFERENCES `BRONEERING` (`Broneering_ID`);

--
-- Piirangud tabelile `ROOG`
--
ALTER TABLE `ROOG`
  ADD CONSTRAINT `ROOG_ibfk_1` FOREIGN KEY (`Broneering_ID`) REFERENCES `BRONEERING` (`Broneering_ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
