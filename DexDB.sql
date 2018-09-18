-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 18, 2018 at 12:39 PM
-- Server version: 5.7.21
-- PHP Version: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dexdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `dex`
--

DROP TABLE IF EXISTS `dex`;
CREATE TABLE IF NOT EXISTS `dex` (
  `Id` varchar(3) NOT NULL,
  `Name` varchar(15) NOT NULL,
  `PrimaryType` varchar(15) NOT NULL,
  `SecondaryType` varchar(15) NOT NULL,
  `Entry` text NOT NULL,
  `Sprite` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dex`
--

INSERT INTO `dex` (`Id`, `Name`, `PrimaryType`, `SecondaryType`, `Entry`, `Sprite`) VALUES
('001', 'Bulbasaur', 'Grass', 'Poison', 'Bulbasaur can be seen napping in bright sunlight. There is a seed on its back. By soaking up the sun\'s rays, the seed grows progressively larger.', 'http://dsmedia.ign.com/ds/image/article/115/1152217/why-pokemon-starters-matter-20110225052440597.jpg');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
