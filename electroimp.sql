-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3307
-- Temps de generació: 14-12-2021 a les 15:54:04
-- Versió del servidor: 10.4.21-MariaDB
-- Versió de PHP: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de dades: `electroimp`
--

-- --------------------------------------------------------

--
-- Estructura de la taula `categoria`
--

CREATE TABLE `categoria` (
  `codi_cat` int(8) NOT NULL,
  `nom` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Bolcament de dades per a la taula `categoria`
--

INSERT INTO `categoria` (`codi_cat`, `nom`) VALUES
(1, 'Plaques bases'),
(2, 'Processadors'),
(3, 'Discs Durs'),
(4, 'RAM');

-- --------------------------------------------------------

--
-- Estructura de la taula `fet`
--

CREATE TABLE `fet` (
  `codi_prod` int(8) NOT NULL,
  `codi_mat` int(8) DEFAULT NULL,
  `nom2` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Bolcament de dades per a la taula `fet`
--

INSERT INTO `fet` (`codi_prod`, `codi_mat`, `nom2`) VALUES
(1, 2, 'Silici'),
(2, 2, 'Silici'),
(3, 2, 'Silici'),
(4, 2, 'Silici'),
(5, 2, 'Silici'),
(6, 2, 'Silici'),
(7, 2, 'Silici'),
(8, 2, 'Silici'),
(9, 2, 'Silici'),
(10, 1, 'Ferro'),
(11, 2, 'Silici'),
(12, 2, 'Silici'),
(13, 2, 'Silici'),
(14, 2, 'Silici'),
(15, 2, 'Silici'),
(16, 2, 'Silici');

-- --------------------------------------------------------

--
-- Estructura de la taula `material`
--

CREATE TABLE `material` (
  `codi_mat` int(8) NOT NULL,
  `nom1` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Bolcament de dades per a la taula `material`
--

INSERT INTO `material` (`codi_mat`, `nom1`) VALUES
(1, 'Ferro'),
(2, 'Silici');

-- --------------------------------------------------------

--
-- Estructura de la taula `productes`
--

CREATE TABLE `productes` (
  `codi_prod` int(8) NOT NULL,
  `model` varchar(20) DEFAULT NULL,
  `estoc` int(10) DEFAULT NULL,
  `marca` varchar(20) DEFAULT NULL,
  `codi_cat` int(8) DEFAULT NULL,
  `codi_mat` int(8) DEFAULT NULL,
  `codi_prov` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Bolcament de dades per a la taula `productes`
--

INSERT INTO `productes` (`codi_prod`, `model`, `estoc`, `marca`, `codi_cat`, `codi_mat`, `codi_prov`) VALUES
(1, 'Z490-A PRO', 10, 'MSI', 1, 2, 2),
(2, 'MAG B560M BAZOOKA', 25, 'MSI', 1, 2, 1),
(3, 'B550-PLUS', 75, 'Asus', 1, 2, 1),
(4, 'B550M AORUS PRO', 19, 'Gigabyte', 1, 2, 2),
(5, 'I7 11700K', 28, 'Intel Core', 2, 2, 1),
(6, 'I5 10400F', 12, 'Intel', 2, 2, 4),
(7, ' Ryzen 5 5600X', 55, 'AMD', 2, 2, 2),
(8, 'Ryzen 7 3800X', 2, 'AMD', 2, 2, 3),
(9, 'A400 SSD 240GB', 19, 'Kingston', 3, 2, 1),
(10, 'BarraCuda 35', 30, 'Seagate', 3, 1, 1),
(11, 'A400 SSD 480GB', 23, 'Kingston', 3, 2, 2),
(12, 'A400 SSD 120GB', 374, 'Kingston', 3, 2, 1),
(13, 'LPX DDR4', 14, 'Corsair', 4, 2, 1),
(14, 'T-Force DARK Z DDR4', 20, 'Team Group', 4, 2, 4),
(15, 'FURY Beast DDR4 2666', 36, 'Kingston', 4, 2, 2),
(16, 'FURY Beast DDR4 3600', 12, 'Kingston', 4, 2, 3),
(20, 'MSI', 20, 'MSI', 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de la taula `proveïdors`
--

CREATE TABLE `proveïdors` (
  `codi_prov` int(8) NOT NULL,
  `nom` varchar(20) DEFAULT NULL,
  `codi_prod` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Bolcament de dades per a la taula `proveïdors`
--

INSERT INTO `proveïdors` (`codi_prov`, `nom`, `codi_prod`) VALUES
(1, 'Candelsa', 2),
(2, 'Amazon', 1),
(3, 'Vinzeo', 8),
(4, 'Tech data es', 6);

--
-- Índexs per a les taules bolcades
--

--
-- Índexs per a la taula `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`codi_cat`);

--
-- Índexs per a la taula `fet`
--
ALTER TABLE `fet`
  ADD PRIMARY KEY (`codi_prod`),
  ADD KEY `codi_mat` (`codi_mat`);

--
-- Índexs per a la taula `material`
--
ALTER TABLE `material`
  ADD PRIMARY KEY (`codi_mat`);

--
-- Índexs per a la taula `productes`
--
ALTER TABLE `productes`
  ADD PRIMARY KEY (`codi_prod`),
  ADD KEY `codi_cat` (`codi_cat`);

--
-- Índexs per a la taula `proveïdors`
--
ALTER TABLE `proveïdors`
  ADD PRIMARY KEY (`codi_prov`),
  ADD KEY `codi_prod` (`codi_prod`);

--
-- Restriccions per a les taules bolcades
--

--
-- Restriccions per a la taula `fet`
--
ALTER TABLE `fet`
  ADD CONSTRAINT `fet_ibfk_1` FOREIGN KEY (`codi_prod`) REFERENCES `productes` (`codi_prod`),
  ADD CONSTRAINT `fet_ibfk_2` FOREIGN KEY (`codi_mat`) REFERENCES `material` (`codi_mat`);

--
-- Restriccions per a la taula `productes`
--
ALTER TABLE `productes`
  ADD CONSTRAINT `productes_ibfk_1` FOREIGN KEY (`codi_cat`) REFERENCES `categoria` (`codi_cat`);

--
-- Restriccions per a la taula `proveïdors`
--
ALTER TABLE `proveïdors`
  ADD CONSTRAINT `proveïdors_ibfk_1` FOREIGN KEY (`codi_prod`) REFERENCES `productes` (`codi_prod`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
