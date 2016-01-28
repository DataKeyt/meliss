-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 28, 2016 at 08:36 
-- Server version: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `meliss`
--

-- --------------------------------------------------------

--
-- Table structure for table `broneering`
--

CREATE TABLE IF NOT EXISTS `broneering` (
  `broneering_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `kuupaeva_id` int(10) unsigned NOT NULL,
  `kellaja_id` int(10) unsigned NOT NULL,
  `inimeste_arv` int(10) unsigned NOT NULL,
  `eelrooga_arv` int(10) unsigned NOT NULL,
  `pohirooga_arv` int(10) unsigned NOT NULL,
  `jarelrooga_arv` int(10) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `broneering`
--

INSERT INTO `broneering` (`broneering_id`, `user_id`, `kuupaeva_id`, `kellaja_id`, `inimeste_arv`, `eelrooga_arv`, `pohirooga_arv`, `jarelrooga_arv`) VALUES
(1, 1, 1, 1, 25, 1, 1, 1),
(3, 1, 1, 1, 1, 1, 1, 1);

--
-- Triggers `broneering`
--
DELIMITER $$
CREATE TRIGGER `kohta_valideerimine_insert` AFTER INSERT ON `broneering`
 FOR EACH ROW BEGIN

  DECLARE kohtade_arv INTEGER;

  SELECT SUM(inimeste_arv) INTO kohtade_arv
  FROM broneering
  WHERE kuupaeva_id = NEW.kuupaeva_id;

  IF (kohtade_arv + NEW.inimeste_arv) > 26 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ainult 26 inimest saavad tulla samal päeval.';
  END IF;

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `kohta_valideerimine_update` AFTER UPDATE ON `broneering`
 FOR EACH ROW BEGIN

  DECLARE kohtade_arv INTEGER;

  SELECT SUM(inimeste_arv) INTO kohtade_arv
  FROM broneering
  WHERE kuupaeva_id = NEW.kuupaeva_id;

  IF (kohtade_arv + NEW.inimeste_arv) > 26 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ainult 26 inimest saavad tulla samal päeval.';
  END IF;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `kellaeg`
--

CREATE TABLE IF NOT EXISTS `kellaeg` (
  `kellaja_id` int(10) unsigned NOT NULL,
  `kellaeg` char(5) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kellaeg`
--

INSERT INTO `kellaeg` (`kellaja_id`, `kellaeg`) VALUES
(1, '11:30'),
(2, '11:45'),
(3, '12:00'),
(4, '12:15'),
(5, '12:30'),
(6, '12:45'),
(7, '13:00');

-- --------------------------------------------------------

--
-- Table structure for table `kuupaev`
--

CREATE TABLE IF NOT EXISTS `kuupaev` (
  `kuupaeva_id` int(10) unsigned NOT NULL,
  `kuupaev` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kuupaev`
--

INSERT INTO `kuupaev` (`kuupaeva_id`, `kuupaev`) VALUES
(1, '2016-01-06'),
(2, '2016-01-07'),
(3, '2016-01-13'),
(4, '2016-01-14'),
(5, '2016-01-20'),
(6, '2016-01-21'),
(7, '2016-01-27'),
(8, '2016-01-28'),
(9, '2016-02-03'),
(10, '2016-02-04'),
(11, '2016-02-10'),
(12, '2016-02-11'),
(13, '2016-02-17'),
(14, '2016-02-18'),
(15, '2016-02-24'),
(16, '2016-02-25'),
(17, '2016-03-02'),
(18, '2016-03-03'),
(19, '2016-03-09'),
(20, '2016-03-10'),
(21, '2016-03-16'),
(22, '2016-03-17'),
(23, '2016-03-23'),
(24, '2016-03-24'),
(25, '2016-03-30'),
(26, '2016-03-31'),
(27, '2016-04-06'),
(28, '2016-04-07'),
(29, '2016-04-13'),
(30, '2016-04-14'),
(31, '2016-04-20'),
(32, '2016-04-21'),
(33, '2016-04-27'),
(34, '2016-04-28'),
(35, '2016-05-04'),
(36, '2016-05-05'),
(37, '2016-05-11'),
(38, '2016-05-12'),
(39, '2016-05-18'),
(40, '2016-05-19'),
(41, '2016-05-25'),
(42, '2016-05-26'),
(43, '2016-06-01'),
(44, '2016-06-02'),
(45, '2016-06-08'),
(46, '2016-06-09'),
(47, '2016-06-15'),
(48, '2016-06-16'),
(49, '2016-06-22'),
(50, '2016-06-23'),
(51, '2016-06-29'),
(52, '2016-06-30'),
(53, '2016-07-06'),
(54, '2016-07-07'),
(55, '2016-07-13'),
(56, '2016-07-14'),
(57, '2016-07-20'),
(58, '2016-07-21'),
(59, '2016-07-27'),
(60, '2016-07-28'),
(61, '2016-08-03'),
(62, '2016-08-04'),
(63, '2016-08-10'),
(64, '2016-08-11'),
(65, '2016-08-17'),
(66, '2016-08-18'),
(67, '2016-08-24'),
(68, '2016-08-25'),
(69, '2016-08-31'),
(70, '2016-09-01'),
(71, '2016-09-07'),
(72, '2016-09-08'),
(73, '2016-09-14'),
(74, '2016-09-15'),
(75, '2016-09-21'),
(76, '2016-09-22'),
(77, '2016-09-28'),
(78, '2016-09-29'),
(79, '2016-10-05'),
(80, '2016-10-06'),
(81, '2016-10-12'),
(82, '2016-10-13'),
(83, '2016-10-19'),
(84, '2016-10-20'),
(85, '2016-10-26'),
(86, '2016-10-27'),
(87, '2016-11-02'),
(88, '2016-11-03'),
(89, '2016-11-09'),
(90, '2016-11-10'),
(91, '2016-11-16'),
(92, '2016-11-17'),
(93, '2016-11-23'),
(94, '2016-11-24'),
(95, '2016-11-30'),
(96, '2016-12-01'),
(97, '2016-12-07'),
(98, '2016-12-08'),
(99, '2016-12-14'),
(100, '2016-12-15'),
(101, '2016-12-21'),
(102, '2016-12-22'),
(103, '2016-12-28'),
(104, '2016-12-29');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(10) unsigned NOT NULL,
  `username` varchar(25) NOT NULL,
  `is_admin` tinyint(4) NOT NULL DEFAULT '0',
  `password` varchar(255) NOT NULL,
  `active` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `email` varchar(255) NOT NULL,
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `telefon` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `is_admin`, `password`, `active`, `email`, `deleted`, `name`, `telefon`) VALUES
(1, 'demo', 0, 'demo', 1, 'example@example.com', 0, 'Mingi Mees', '55555555'),
(2, 'admin', 1, 'nokkloom', 1, 'example@example.com', 0, 'VIP', '66666666');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `broneering`
--
ALTER TABLE `broneering`
  ADD PRIMARY KEY (`broneering_id`),
  ADD KEY `kasutaja_id` (`user_id`),
  ADD KEY `kuupaeva_id` (`kuupaeva_id`),
  ADD KEY `kellaja_id` (`kellaja_id`);

--
-- Indexes for table `kellaeg`
--
ALTER TABLE `kellaeg`
  ADD PRIMARY KEY (`kellaja_id`);

--
-- Indexes for table `kuupaev`
--
ALTER TABLE `kuupaev`
  ADD PRIMARY KEY (`kuupaeva_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `UNIQUE` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `broneering`
--
ALTER TABLE `broneering`
  MODIFY `broneering_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `kellaeg`
--
ALTER TABLE `kellaeg`
  MODIFY `kellaja_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `kuupaev`
--
ALTER TABLE `kuupaev`
  MODIFY `kuupaeva_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=105;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `broneering`
--
ALTER TABLE `broneering`
  ADD CONSTRAINT `broneering_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `broneering_ibfk_2` FOREIGN KEY (`kuupaeva_id`) REFERENCES `kuupaev` (`kuupaeva_id`),
  ADD CONSTRAINT `broneering_ibfk_3` FOREIGN KEY (`kellaja_id`) REFERENCES `kellaeg` (`kellaja_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
