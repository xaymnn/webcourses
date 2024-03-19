-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 19, 2024 at 02:15 AM
-- Server version: 5.7.24
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webcourses`
--

-- --------------------------------------------------------

--
-- Table structure for table `adherer`
--

CREATE TABLE `adherer` (
  `co_id` int(11) NOT NULL,
  `cl_id` int(11) NOT NULL,
  `ad_mtadhesion` decimal(6,2) DEFAULT NULL,
  `ad_dateadhesion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `adherer`
--

INSERT INTO `adherer` (`co_id`, `cl_id`, `ad_mtadhesion`, `ad_dateadhesion`) VALUES
(1, 2, '142.00', '2020-01-01'),
(2, 1, '125.00', '2020-01-01'),
(3, 3, '130.00', '2020-08-29'),
(4, 4, '110.00', '2021-04-23'),
(5, 7, '140.00', '2020-03-10');

-- --------------------------------------------------------

--
-- Table structure for table `amateur`
--

CREATE TABLE `amateur` (
  `amateur_id` int(11) NOT NULL,
  `date_debut` date DEFAULT NULL,
  `co_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `amateur`
--

INSERT INTO `amateur` (`amateur_id`, `date_debut`, `co_id`) VALUES
(4, '2023-03-06', NULL),
(5, '2023-03-06', 106),
(6, '2023-03-06', 106),
(7, '2023-03-06', 106),
(8, '2023-03-06', 106),
(9, '2023-03-06', 106);

-- --------------------------------------------------------

--
-- Table structure for table `categorie`
--

CREATE TABLE `categorie` (
  `cat_id` int(11) NOT NULL,
  `cat_nom` varchar(50) DEFAULT NULL,
  `cat_age_tranche_deb` varchar(10) DEFAULT NULL,
  `cat_age_tranche_fin` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categorie`
--

INSERT INTO `categorie` (`cat_id`, `cat_nom`, `cat_age_tranche_deb`, `cat_age_tranche_fin`) VALUES
(1, 'Bébé', '3', '6'),
(2, 'Jeune', '7', '12'),
(3, 'Junior', '13', '16'),
(4, 'Ado', '17', '20'),
(5, 'Etudiant', '21', '25'),
(6, 'Adulte', '26', '50'),
(7, 'Senior', '51', '65'),
(8, 'Vétéran', '65', 'et plus');

-- --------------------------------------------------------

--
-- Table structure for table `championnat`
--

CREATE TABLE `championnat` (
  `ch_id` int(11) NOT NULL,
  `ch_nom` varchar(50) NOT NULL,
  `ch_année` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `championnat`
--

INSERT INTO `championnat` (`ch_id`, `ch_nom`, `ch_année`) VALUES
(1, 'Championnat régional', '1964-10-02'),
(2, 'Championnat national', '1980-04-09'),
(3, 'Championnat du val de Marne', '1986-07-06'),
(4, 'Championnat de Paris', '1988-08-06');

-- --------------------------------------------------------

--
-- Table structure for table `club`
--

CREATE TABLE `club` (
  `cl_id` int(11) NOT NULL,
  `cl_nom` varchar(50) DEFAULT NULL,
  `cl_adresse` varchar(100) DEFAULT NULL,
  `cl_numtel` int(11) DEFAULT NULL,
  `cl_email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `club`
--

INSERT INTO `club` (`cl_id`, `cl_nom`, `cl_adresse`, `cl_numtel`, `cl_email`) VALUES
(1, 'La foulée bordelaise', '74 Avenue Charles de Gaulle, 33200 Bordeaux', 981972091, '33bordeaux-centre@foulees.com'),
(2, 'UFA du Médoc', '12 rue Général de Gaulle 33112 Saint-Aubin-De-Médoc', 128382938, 'uadumedoc@gmail.com'),
(3, 'La foulée Arcachon', '21 Rue du Maréchal de Lattre de Tassigny, 33120 Arcachon', 128382938, 'foulée@gmail.com'),
(4, 'Les coureurs du bassin', '63 Rue du Ruisseau, 75018 Paris', 129303938, 'coureursdubassin@gmail.com'),
(5, 'Les scientifiques du sport', '7 Rue d\'Amiens, 59800 Lille', 348293938, 'scientifiquedusport@gmail.com'),
(6, 'Les coureurs de la dune ', '50 Rue Sainte-Catherine, 33000 Bordeaux', 348293938, 'coureursdeladune@gmail.com'),
(7, 'Les galopins de Guyane ', '36 rue christophe colomb, 97300 Cayenne', 834393938, 'galopinsguyane@gmail.com'),
(8, 'Les petits pas', '202 Rue Solférino, 59000 Lille', 103839289, 'lespetitspas@gmail.com'),
(9, 'Le club des Saussaies à Arcachon', '30 Place Sébastopol 59000 Lille', 667394732, 'clubdessaussaues@gmail.com'),
(10, 'Association sport', '36 Rue de Gand 59800 Lille', 662947232, 'assossportwebcoursesiens@gmail.com'),
(11, 'Le club de cheval', '35 Rue de Grandin 93300 Bondy', 648392839, 'clubcheval@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `consentement_cookie`
--

CREATE TABLE `consentement_cookie` (
  `cok_id` int(11) NOT NULL,
  `cok_type_consentement` char(1) DEFAULT NULL,
  `cok_necessaire` tinyint(1) DEFAULT NULL,
  `cok_performance` tinyint(1) DEFAULT NULL,
  `cok_fonctionnalite` tinyint(1) DEFAULT NULL,
  `cok_marketing` tinyint(1) DEFAULT NULL,
  `cok_autres` tinyint(1) DEFAULT NULL,
  `person_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `consentement_cookie`
--

INSERT INTO `consentement_cookie` (`cok_id`, `cok_type_consentement`, `cok_necessaire`, `cok_performance`, `cok_fonctionnalite`, `cok_marketing`, `cok_autres`, `person_id`) VALUES
(1, 'E', 0, 1, 1, 0, 0, 19),
(2, NULL, 1, 1, 1, 1, 1, 19),
(3, NULL, 1, 1, 1, 1, 1, 19),
(4, 't', 1, 1, 1, 1, 1, 19),
(5, 'E', 1, 1, 1, 1, 1, 19),
(6, 'E', 1, 1, 1, 1, 1, 19),
(7, 'E', 0, 0, 0, 0, 0, 19),
(8, 'E', 1, 0, 0, 0, 0, 19),
(9, 'E', 1, 1, 1, 1, 1, 19),
(10, 'E', 1, 1, 1, 1, 1, 19),
(11, 'E', 0, 0, 0, 0, 0, 19),
(12, 'E', 0, 0, 0, 0, 0, 19),
(13, 'E', 1, 1, 1, 1, 1, 19),
(14, 'E', 1, 1, 1, 1, 1, 19),
(15, 'E', 0, 0, 0, 0, 0, 19),
(16, 'E', 0, 0, 0, 0, 0, 19),
(17, 'E', 0, 0, 0, 0, 0, 19),
(18, 'E', 1, 1, 1, 1, 1, 19),
(19, 'I', 1, 1, 0, 0, 0, 19),
(20, 'E', 1, 1, 1, 1, 1, 19),
(21, 'E', 0, 0, 0, 0, 0, 19),
(22, 'E', 1, 1, 1, 1, 1, 19),
(23, 'E', 0, 0, 0, 0, 0, 19),
(24, 'E', 1, 1, 1, 1, 1, 19),
(25, 'E', 1, 1, 1, 1, 1, 19),
(26, 'E', 0, 0, 0, 0, 0, 19),
(27, 'E', 1, 1, 1, 1, 1, 19),
(28, 'E', 1, 1, 1, 1, 1, 19),
(29, 'E', 0, 0, 0, 0, 0, 19),
(30, 'E', 1, 1, 1, 1, 1, 19),
(31, 'E', 0, 0, 0, 0, 0, 19),
(32, 'E', 0, 0, 0, 0, 0, 19),
(33, 'E', 1, 1, 1, 1, 1, 19),
(34, 'E', 0, 0, 0, 0, 0, 19),
(35, 'E', 0, 0, 0, 0, 0, 19),
(36, 'E', 1, 1, 1, 1, 1, 19),
(37, 'E', 1, 1, 1, 1, 1, 19),
(38, 'E', 0, 0, 0, 0, 0, 19),
(39, 'E', 1, 1, 1, 1, 1, 19),
(40, 'E', 0, 0, 0, 0, 0, 19),
(41, 'E', 0, 0, 0, 0, 0, 19),
(42, 'E', 1, 1, 1, 1, 1, 19),
(43, 'E', 1, 1, 1, 1, 1, 19),
(44, 'E', 1, 1, 1, 1, 1, 19),
(45, 'E', 1, 1, 1, 1, 1, 19),
(46, 'E', 1, 1, 1, 1, 1, 19),
(47, 'E', 0, 0, 0, 0, 0, 19),
(48, 'E', 1, 1, 1, 1, 1, 38),
(49, 'E', 0, 0, 0, 0, 0, 38),
(50, 'E', 1, 1, 1, 1, 1, 40),
(51, 'E', 0, 0, 0, 0, 0, 40),
(52, 'E', 0, 0, 0, 0, 0, 40),
(53, 'E', 1, 1, 1, 1, 1, 40),
(54, 'E', 1, 1, 1, 1, 1, 40),
(55, 'E', 0, 0, 0, 0, 0, 40),
(56, 'E', 0, 0, 0, 0, 0, 40),
(57, 'E', 1, 1, 1, 1, 1, 40),
(58, 'E', 0, 0, 0, 0, 0, 40),
(59, 'E', 1, 0, 1, 0, 0, 40),
(60, 'E', 1, 1, 1, 1, 1, 41),
(61, 'E', 1, 1, 1, 1, 1, 41),
(62, 'E', 1, 1, 1, 1, 1, 41),
(63, 'E', 0, 0, 0, 0, 0, 41),
(64, 'E', 1, 1, 1, 1, 1, 41),
(65, 'E', 1, 1, 0, 0, 0, 41),
(66, 'E', 0, 0, 0, 0, 0, 41),
(67, 'E', 1, 1, 1, 1, 1, 41),
(68, 'E', 1, 1, 1, 1, 1, 41),
(69, 'E', 1, 1, 1, 1, 1, 41),
(70, 'E', 1, 1, 1, 1, 1, 41),
(71, 'E', 1, 1, 1, 1, 1, 41),
(72, 'E', 1, 1, 1, 1, 1, 41),
(73, 'E', 0, 0, 0, 0, 0, 76),
(74, 'E', 1, 1, 1, 1, 1, 76),
(75, 'E', 1, 1, 1, 1, 1, 76),
(76, 'E', 0, 0, 0, 0, 0, 76),
(77, 'E', 1, 1, 1, 1, 1, 76),
(78, 'E', 1, 0, 0, 0, 0, 76),
(79, 'E', 0, 0, 0, 0, 0, 77),
(80, 'E', 0, 0, 0, 0, 0, 77),
(81, 'I', 0, 0, 0, 0, 0, 120),
(82, 'I', 0, 0, 0, 1, 1, 120),
(83, 'I', 0, 0, 0, 1, 1, 120),
(84, 'I', 0, 0, 0, 1, 1, 120),
(85, 'X', 0, 0, 0, 1, 0, 120),
(86, 'A', 0, 0, 0, 1, 0, 120),
(87, 'E', 1, 1, 1, 1, 1, 120),
(88, 'I', 0, 0, 0, 0, 0, 120),
(89, 'E', 0, 0, 0, 0, 0, 120),
(90, 'E', 0, 0, 0, 0, 0, 120),
(91, 'E', 1, 1, 1, 1, 1, 121),
(92, 'E', 1, 1, 1, 1, 1, 121),
(93, 'E', 1, 1, 1, 1, 1, 121),
(94, 'E', 1, 1, 1, 1, 1, 122),
(95, 'E', 1, 1, 1, 1, 1, 122),
(96, 'E', 1, 1, 1, 1, 1, 122),
(97, 'E', 1, 1, 1, 1, 1, 122),
(98, 'E', 1, 1, 1, 1, 1, 122),
(99, 'E', 1, 1, 1, 1, 1, 122),
(100, 'E', 1, 1, 1, 1, 1, 122),
(101, 'E', 1, 1, 1, 1, 1, 122),
(102, 'E', 1, 1, 1, 1, 1, 122),
(103, 'E', 1, 1, 1, 1, 1, 122),
(104, 'E', 1, 1, 1, 1, 1, 122),
(105, 'E', 1, 1, 1, 1, 1, 122),
(106, 'E', 1, 1, 1, 1, 1, 122),
(107, 'E', 1, 1, 1, 1, 1, 122),
(108, 'E', 1, 1, 1, 1, 1, 122),
(109, 'E', 0, 0, 0, 0, 0, 122),
(110, 'E', 0, 0, 0, 0, 0, 122),
(111, 'E', 0, 0, 0, 0, 0, 122),
(112, 'E', 0, 0, 0, 0, 0, 122),
(113, 'E', 1, 1, 1, 1, 1, 122),
(114, 'E', 1, 1, 1, 1, 1, 122),
(115, 'E', 1, 1, 1, 1, 1, 122),
(116, 'E', 1, 1, 1, 1, 1, 122),
(117, 'E', 1, 1, 1, 1, 1, 122),
(118, 'E', 1, 1, 1, 1, 1, 122),
(119, 'E', 1, 1, 1, 1, 1, 122),
(120, 'E', 1, 1, 1, 1, 1, 122),
(121, 'E', 1, 0, 1, 0, 0, 122),
(122, 'E', 1, 0, 1, 0, 0, 122),
(123, 'E', 1, 0, 1, 0, 0, 122),
(124, 'E', 1, 1, 1, 1, 1, 122),
(125, 'E', 0, 0, 0, 0, 0, 122),
(126, 'E', 1, 1, 1, 1, 1, 122),
(127, 'E', 0, 0, 0, 0, 0, 122);

-- --------------------------------------------------------

--
-- Table structure for table `coureur`
--

CREATE TABLE `coureur` (
  `co_id` int(11) NOT NULL,
  `co_datenais` date DEFAULT NULL,
  `co_sexe` varchar(11) DEFAULT NULL,
  `person_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `coureur`
--

INSERT INTO `coureur` (`co_id`, `co_datenais`, `co_sexe`, `person_id`) VALUES
(1, '2013-02-15', '1', 1),
(2, '2010-02-22', '1', 2),
(3, '2018-06-20', NULL, 3),
(4, '2018-06-20', 'Homme', 4),
(5, '2018-06-20', 'Homme', 5),
(6, '2018-06-20', 'Femme', 6),
(7, '2018-07-22', 'Femme', 7),
(8, '2018-07-22', 'Homme', 8),
(9, '2018-07-22', 'Femme', 9),
(10, '2018-07-22', 'Homme', 10),
(11, '2015-02-22', 'Femme', 11),
(12, '2010-06-22', 'Femme', 12),
(13, '2011-02-02', 'Femme', 13),
(14, '2011-02-02', 'Femme', 14),
(15, '2011-02-02', 'Femme', 15),
(16, '2016-06-16', 'Femme', 16),
(17, '2018-07-22', 'Femme', 17),
(18, '2018-07-22', 'Homme', 18),
(19, '2018-07-22', 'Homme', 19),
(20, '2018-07-22', 'Femme', 20),
(21, '2018-07-22', 'Femme', 21),
(22, '2018-07-22', 'Homme', 22),
(23, '2018-07-22', 'Femme', 23),
(24, '2018-07-22', 'Femme', 24),
(25, '2018-07-22', 'Femme', 25),
(26, '2018-07-22', 'Homme', 26),
(27, '2018-07-22', 'Homme', 27),
(28, '2018-07-22', 'Homme', 28),
(29, '2018-07-22', 'Homme', 29),
(30, '2018-07-22', 'Homme', 30),
(31, '2018-07-22', 'Homme', 31),
(32, '2018-07-22', 'Homme', 32),
(33, '2018-07-22', 'Homme', 33),
(34, '2018-07-22', 'Homme', 34),
(35, '2018-07-22', 'Homme', 35),
(36, '2018-07-22', 'Homme', 36),
(37, '1999-01-01', 'Homme', 37),
(38, '2018-07-22', 'Homme', 38),
(39, '2010-02-02', 'Femme', 39),
(40, '2012-02-15', 'Femme', 40),
(41, '2016-02-03', 'Femme', 41),
(42, '2018-07-22', 'Homme', 42),
(43, '2018-07-22', 'Homme', 43),
(44, '2018-07-22', 'Homme', 44),
(45, '2018-07-22', 'Homme', 45),
(46, '2018-07-22', 'Homme', 46),
(47, '2018-07-22', 'Homme', 47),
(48, '2018-07-22', 'Homme', 48),
(49, '2018-07-22', 'Homme', 49),
(50, '2018-07-22', 'Homme', 50),
(51, '2018-07-22', 'Homme', 51),
(52, '2018-07-22', 'Homme', 52),
(53, '2018-07-22', 'Homme', 53),
(54, '2018-07-22', 'Homme', 54),
(55, '2018-07-22', 'Homme', 55),
(56, '2018-07-22', 'Homme', 56),
(57, '2018-07-22', 'Homme', 57),
(58, '2018-07-22', 'Homme', 58),
(59, '2018-07-22', 'Homme', 59),
(60, '2018-07-22', 'Homme', 60),
(61, '2018-07-22', 'Homme', 61),
(62, '2018-07-22', 'Homme', 62),
(63, '2018-07-22', 'Homme', 63),
(64, '2018-07-22', 'Homme', 64),
(65, '2018-07-22', 'Homme', 65),
(66, '2018-07-22', 'Homme', 66),
(67, '2018-07-22', 'Homme', 67),
(68, '2018-07-22', 'Homme', 68),
(69, '2018-07-22', 'Homme', 69),
(70, '2018-07-22', 'Homme', 70),
(71, '2018-07-22', 'Homme', 71),
(72, '2018-07-22', 'Homme', 72),
(73, '2018-07-22', 'Homme', 73),
(74, '2018-07-22', 'Homme', 74),
(75, '2018-07-22', 'Femme', 75),
(76, '2018-07-22', 'Femme', 76),
(77, '2018-07-22', 'Homme', 77),
(78, '2018-07-22', 'Homme', 78),
(79, '2018-07-22', 'Homme', 79),
(80, '2018-07-22', 'Homme', 80),
(81, '2018-07-22', 'Homme', 84),
(82, '2018-07-22', 'Homme', 85),
(83, '2018-07-22', 'Femme', 86),
(84, '2018-07-22', 'Femme', 93),
(85, '2018-07-22', 'Femme', 98),
(86, '2018-07-22', 'Femme', 100),
(87, '2018-07-22', 'Femme', 101),
(88, '2018-07-22', 'Femme', 102),
(89, '2018-07-22', 'Homme', 103),
(90, '2018-07-22', 'Homme', 104),
(91, '2018-07-22', 'Homme', 105),
(92, '2018-07-22', 'Homme', 113),
(93, '2018-07-22', 'Homme', 114),
(94, '2018-07-22', 'Homme', 115),
(95, '2018-07-22', 'Femme', 116),
(96, '2018-07-22', 'Homme', 117),
(97, '2018-07-22', 'Homme', 118),
(98, '2018-07-22', 'Femme', 119),
(99, '2018-07-22', 'Homme', 120),
(100, '2018-07-22', 'Homme', 121),
(101, '2018-07-22', 'Homme', 106),
(102, '2018-07-22', 'Homme', 122),
(103, '2018-07-22', 'Homme', 123),
(104, '2018-07-22', 'Homme', 124),
(105, '2018-07-22', 'Homme', 125),
(106, '2018-07-22', 'Homme', 126);

-- --------------------------------------------------------

--
-- Table structure for table `epreuve`
--

CREATE TABLE `epreuve` (
  `ep_id` int(11) NOT NULL,
  `ep_nom` varchar(50) DEFAULT NULL,
  `ep_lieu` varchar(50) DEFAULT NULL,
  `ep_datedeb` datetime DEFAULT NULL,
  `ep_datefin` datetime DEFAULT NULL,
  `pa_id` int(11) NOT NULL,
  `typep_id` int(11) NOT NULL,
  `ma_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `epreuve`
--

INSERT INTO `epreuve` (`ep_id`, `ep_nom`, `ep_lieu`, `ep_datedeb`, `ep_datefin`, `pa_id`, `typep_id`, `ma_id`) VALUES
(1, 'Arkétop', 'Champigny-Sur-Marne', '1999-03-01 13:00:00', '1999-03-07 00:00:00', 1, 1, 4),
(2, 'Aventure', 'Créteil', '2004-05-07 00:00:00', '2005-06-10 00:00:00', 3, 2, 12),
(3, 'Suprême sensation', 'Paris', '2006-01-13 00:00:00', '2005-01-19 00:00:00', 7, 4, 6),
(4, 'Coule douce', 'Joinville-le-pont', '2007-02-17 00:00:00', '2007-02-23 00:00:00', 8, 3, 3),
(5, 'Admirer le paysage', 'Saint-maurice', '2001-08-31 00:00:00', '2001-09-10 00:00:00', 7, 1, 4),
(6, 'Verdoyants parcours', 'Nogent-sur-marne', '2003-03-01 00:00:00', '2003-03-10 00:00:00', 5, 2, 11),
(7, 'Extrême', 'Saint-Maur-des-Fossés', '2003-07-01 00:00:00', '2003-07-02 00:00:00', 2, 3, 10),
(8, 'Pour les mordues', 'Vincennes', '1997-04-20 00:00:00', '1997-04-30 00:00:00', 4, 2, 9),
(9, 'Vive demain', 'Paris', '1998-09-07 00:00:00', '1998-09-10 00:00:00', 6, 3, 8),
(10, 'La perle de la montagne', 'Evreux', '1995-11-28 00:00:00', '1995-12-01 00:00:00', 6, 3, 8),
(11, 'Tous en plaine', 'Perpignan', '2000-01-10 00:00:00', '2000-01-12 00:00:00', 8, 1, 7),
(12, 'Parcours aventure', 'Nice', '1987-04-13 00:00:00', '1987-04-19 00:00:00', 10, 2, 1),
(13, 'Le chemin des petits', 'Versailles', '2013-06-15 00:00:00', '2013-06-19 00:00:00', 9, 1, 1),
(14, 'Warriorss', 'Thiais', '2014-07-17 00:00:00', '2013-07-21 00:00:00', 7, 2, 3),
(15, 'La baby course', 'Melun', '2011-03-12 00:00:00', '2011-03-21 00:00:00', 6, 3, 4),
(16, 'Upgrade', 'Melun', '2012-04-14 00:00:00', '2012-04-21 00:00:00', 7, 4, 5),
(17, 'Toujours plus loin', 'Paris', '2009-02-14 00:00:00', '2012-02-15 00:00:00', 8, 3, 6),
(18, 'Les 5 bornes', 'Paris', '2008-03-16 00:00:00', '2008-03-17 00:00:00', 9, 4, 7),
(19, 'La courses 100m', 'Paris', '2023-10-15 13:21:47', '2023-10-15 13:21:47', 3, 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `inscriptions_evenements`
--

CREATE TABLE `inscriptions_evenements` (
  `inscription_id` int(11) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `pseudo` varchar(255) DEFAULT NULL,
  `numero_licence` varchar(255) DEFAULT NULL,
  `categorie_coureur` varchar(255) DEFAULT NULL,
  `epreuve_choisie` varchar(255) DEFAULT NULL,
  `date_debut` date DEFAULT NULL,
  `certificat_medical` tinyint(1) DEFAULT NULL,
  `taille_maillot` varchar(4) DEFAULT NULL,
  `type_reglement` varchar(20) DEFAULT NULL,
  `niveau` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `inscriptions_evenements`
--

INSERT INTO `inscriptions_evenements` (`inscription_id`, `nom`, `prenom`, `pseudo`, `numero_licence`, `categorie_coureur`, `epreuve_choisie`, `date_debut`, `certificat_medical`, `taille_maillot`, `type_reglement`, `niveau`) VALUES
(1, 'Kharj', 'Aymane', 'aymanegp', NULL, NULL, 'Parcours aventure', NULL, NULL, 'XL', 'Carte bleu', 'Amateur'),
(2, 'Dabouih', 'Ilyass', 'idoubbih', '920475', 'Ado', 'Toujours plus loin', '2024-03-16', 0, 'XL', 'Liquide', 'Amateur'),
(3, 'Baq', 'Mina', 'minasta', '938452', 'Adulte', 'La courses 100m', '2024-03-21', 0, 'L', 'Carte bleu', 'Professionnel'),
(4, 'El hidaoui', 'Ilyass', 'hidouin', '64732', 'Junior', 'Les 5 bornes', '2024-03-29', 1, 'S', 'Liquide', 'Amateur'),
(5, 'Ouafi', 'Hugo', 'oufHugo', '72640', 'Junior', 'Le chemin des petits', '2024-05-30', 0, 'L', 'Liquide', 'Amateur'),
(6, 'Lec', 'Amandia', 'amandiaLec', '9385732', 'Adulte', 'Upgrade', '2024-03-20', 0, 'L', 'Liquide', 'Professionnel'),
(7, 'Lecco', 'Aline', 'LoAline', '48392', 'Junior', 'Verdoyants parcours', '2024-03-16', 0, 'L', 'Liquide', 'Amateur'),
(111, 'Ouafi', 'Med', 'Froxyz', '32982', 'Ado', 'La baby course', '2024-03-27', 0, 'M', 'Chèque', 'Amateur'),
(112, 'GP', 'Aymn', 'AymaneGP', '837342', 'Jeune', 'Pour les mordues', '2024-03-22', 1, 'S', 'Liquide', 'Amateur'),
(113, 'Onana', 'Andre', 'AOnana', '74832', 'Adulte', 'Coule douce', '2024-04-06', 1, 'L', 'Chèque', 'Professionnel'),
(114, 'Arki', 'Clement', 'clementArki', '2342', 'Bebe', 'La baby course', '2024-03-10', 1, 'L', 'Liquide', 'Amateur'),
(115, 'XX', 'YY', 'xxyy', '53345', 'Junior', 'Warriorss', '2024-03-23', 0, 'M', 'Chèque', 'Amateur'),
(116, 'Nouveau', 'Membre', 'nmembre', '342', 'Junior', 'Arkétop', '2024-03-21', 0, 'M', 'Chèque', 'Amateur');

-- --------------------------------------------------------

--
-- Table structure for table `inscrire`
--

CREATE TABLE `inscrire` (
  `ep_id` int(11) DEFAULT NULL,
  `reg_id` int(11) DEFAULT NULL,
  `co_id` int(11) DEFAULT NULL,
  `cat_id` int(11) DEFAULT NULL,
  `ins_num_inscription` int(11) NOT NULL,
  `ins_date` date DEFAULT NULL,
  `ins_carte_licencier` int(11) DEFAULT NULL,
  `ins_certificat_medical` varchar(10) DEFAULT NULL,
  `ins_taille_maillot` varchar(3) DEFAULT NULL,
  `ins_dossard` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inscrire`
--

INSERT INTO `inscrire` (`ep_id`, `reg_id`, `co_id`, `cat_id`, `ins_num_inscription`, `ins_date`, `ins_carte_licencier`, `ins_certificat_medical`, `ins_taille_maillot`, `ins_dossard`) VALUES
(18, 2, 19, NULL, 2, '2023-03-06', 2, '0', 'Tai', 6),
(NULL, NULL, 19, NULL, 3, '2023-03-06', 2, 'o', 'Tai', 6),
(NULL, NULL, 19, NULL, 4, '2023-03-06', 2, 'oui', 'Tai', 6),
(NULL, NULL, 19, NULL, 5, '2023-03-06', 2, 'oui', 'Tai', 6),
(NULL, NULL, 19, NULL, 6, '2023-03-06', 12, 'Non', 'S', 12),
(NULL, NULL, 19, NULL, 7, '2023-03-06', 12, 'Non', 'S', 12),
(NULL, NULL, 19, NULL, 8, '2012-01-24', 30, 'Non', 'L', 7),
(NULL, NULL, 19, NULL, 9, '2012-01-24', 30, 'Non', 'L', 7),
(NULL, NULL, 19, NULL, 11, '2023-03-06', 3, 'Non', 'M', 4),
(NULL, NULL, 19, NULL, 12, '2023-03-06', 1, 'Oui', 'L', 7),
(NULL, NULL, 19, NULL, 13, '2023-03-06', 1, 'Oui', 'L', 7),
(NULL, NULL, 19, NULL, 14, '2023-03-06', 1, 'Oui', 'L', 7),
(NULL, NULL, 19, NULL, 15, '2023-03-06', 1, 'Oui', 'L', 7),
(NULL, NULL, 19, NULL, 16, '2023-03-06', 1, 'Oui', 'L', 7),
(NULL, NULL, 19, NULL, 17, '2023-03-06', 1, 'Oui', 'L', 7),
(NULL, NULL, 19, NULL, 18, '2023-03-06', 1, 'Oui', 'L', 7),
(NULL, NULL, 19, NULL, 19, '2023-03-06', 0, '', 'M', 12),
(NULL, NULL, 39, NULL, 20, '2023-03-06', 10, 'Non', 'XL', 12),
(NULL, NULL, 41, NULL, 21, '2020-06-10', 3, 'Oui', 'XXL', 15),
(NULL, NULL, 76, NULL, 22, '2023-03-06', 3, 'Oui', 'M', 3),
(NULL, NULL, NULL, NULL, 23, '2023-03-06', 3, 'Oui', 'M', 3),
(NULL, NULL, 76, NULL, 24, '2023-03-06', 3, 'Oui', 'M', 3),
(NULL, NULL, 76, NULL, 25, '2023-03-06', 4, 'Oui', 'S', 3),
(NULL, NULL, 76, NULL, 26, '2023-03-06', 4, 'Oui', 'S', 3),
(1, NULL, 76, NULL, 30, '2023-03-06', 2, 'Oui', 'M', 4),
(18, NULL, 76, NULL, 31, '2023-03-06', 2, 'Oui', 'M', 4),
(18, NULL, 76, NULL, 32, '2023-03-06', 2, 'Oui', 'M', 4),
(3, NULL, 76, NULL, 33, '2023-03-06', 5, 'Non', 'M', 8),
(3, NULL, 76, NULL, 34, '2023-03-06', 5, 'Non', 'M', 8),
(15, NULL, 76, 1, 35, '2023-03-06', 1, 'Oui', 'S', 4),
(15, NULL, 76, 1, 36, '2023-03-06', 1, 'Oui', 'S', 4),
(3, NULL, 76, 6, 37, '2023-03-06', 2, 'Oui', 'M', 6),
(1, NULL, 76, 1, 38, '2023-03-06', 2, 'Oui', 'S', 6),
(1, NULL, 76, 1, 39, '2023-03-06', 2, 'Oui', 'S', 6),
(1, NULL, 76, 1, 40, '2023-03-06', 2, 'Oui', 'S', 6),
(12, 3, 76, 4, 41, '2023-03-06', 6, 'Non', 'M', 9),
(12, 3, 76, 4, 42, '2023-03-06', 6, 'Non', 'M', 9),
(3, 1, 76, 4, 43, '2023-03-06', 3, 'Oui', 'M', 2),
(3, 1, 76, 6, 46, '2023-03-06', 3, 'Oui', 'M', 3),
(3, 1, 76, 6, 47, '2023-03-06', 3, 'Oui', 'M', 3),
(3, 1, 76, 6, 48, '2023-03-06', 3, 'Oui', 'M', 3),
(3, 1, 76, 6, 49, '2023-03-06', 3, 'Non', 'M', 4),
(3, 1, 76, 6, 50, '2023-03-06', 1, 'Oui', 'M', 4),
(12, 1, 76, 5, 51, '2023-03-06', 3, 'Oui', 'S', 2),
(11, 2, 76, 4, 52, '2023-03-06', 4, 'Oui', 'S', 10),
(11, 2, 76, 4, 53, '2023-03-06', 4, 'Oui', 'S', 10),
(3, 1, 77, 6, 54, '2023-03-06', 2, 'Non', 'M', 6),
(3, 2, 77, 6, 55, '2023-03-06', 3, 'Oui', 'S', 3),
(3, 2, 77, 6, 56, '2023-03-06', 3, 'Oui', 'S', 3),
(3, 1, 78, 6, 57, '2023-03-06', 0, 'Non', 'M', 12),
(3, 2, 99, 6, 59, '2023-03-06', 2, 'Non', 'M', 3),
(2, 1, 75, 4, 122335, '2017-10-16', 3, 'Oui', 'S', 2344),
(3, 1, 101, 6, 122338, '2023-03-06', 4, 'Oui', 'XXL', 2344),
(3, 1, 101, 6, 122339, '2023-03-06', 4, 'Oui', 'XXL', 2344),
(3, 1, 101, 6, 122340, '2023-03-06', 4, 'Oui', 'XXL', 2344),
(3, 1, 101, 6, 122341, '2023-03-06', 4, 'Oui', 'XXL', 2344),
(3, 1, 101, 6, 122342, '2023-03-06', 4, 'Oui', 'XXL', 2344),
(3, 1, 101, 6, 122343, '2023-03-06', 4, 'Oui', 'XXL', 2344),
(3, 1, 101, 6, 122344, '2023-03-06', 4, 'Oui', 'XXL', 2344),
(3, 1, 101, 6, 122345, '2023-03-06', 4, 'Oui', 'XXL', 2344),
(3, 1, 101, 6, 122346, '2023-03-06', 4, 'Oui', 'XXL', 2344),
(3, 1, 101, 6, 122347, '2023-03-06', 4, 'Oui', 'XXL', 2344),
(2, 2, 17, 1, 122348, '2014-10-01', 3, 'Non', 'XS', 2344),
(5, 1, 16, 4, 122349, '2015-10-14', 3, 'Non', 'XXL', 9767),
(5, 2, 20, 4, 122350, '2013-10-01', 4, 'Non', 'XXL', 2304),
(19, 2, 101, 5, 122351, '2023-03-25', 4, 'Non', 'M', 3137),
(19, 2, 101, 5, 122352, '2023-03-25', 4, 'Non', 'M', 7430),
(19, 2, 101, 5, 122353, '2023-03-25', 4, 'Non', 'M', 6048),
(19, 2, 101, 5, 122354, '2023-03-25', 4, 'Non', 'M', 9236),
(19, 2, 101, 5, 122355, '2023-03-25', 4, 'Non', 'M', 9014),
(19, 2, 101, 5, 122356, '2023-03-25', 4, 'Non', 'M', 5642),
(19, 2, 101, 5, 122357, '2023-03-25', 4, 'Non', 'M', 3144),
(19, 2, 101, 5, 122358, '2023-03-25', 4, 'Non', 'M', 7691),
(19, 2, 101, 5, 122359, '2023-03-25', 4, 'Non', 'M', 3814),
(19, 2, 101, 5, 122360, '2023-03-25', 4, 'Non', 'M', 9772),
(19, 2, 101, 5, 122361, '2023-03-25', 4, 'Non', 'M', 2462),
(19, 2, 101, 5, 122362, '2023-03-25', 4, 'Non', 'M', 7242),
(19, 2, 101, 5, 122363, '2023-03-25', 4, 'Non', 'M', 3739),
(19, 2, 101, 5, 122364, '2023-03-25', 4, 'Non', 'M', 3812),
(19, 2, 101, 5, 122365, '2023-03-25', 4, 'Non', 'M', 2201),
(19, 2, 101, 5, 122366, '2023-03-25', 4, 'Non', 'M', 8642),
(19, 2, 101, 5, 122367, '2023-03-25', 4, 'Non', 'M', 9976),
(19, 2, 101, 5, 122368, '2023-03-25', 4, 'Non', 'M', 9363),
(19, 2, 101, 5, 122369, '2023-03-25', 4, 'Non', 'M', 1595),
(19, 2, 101, 5, 122370, '2023-03-25', 4, 'Non', 'M', 8948),
(19, 2, 101, 5, 122371, '2023-03-25', 4, 'Non', 'M', 7353),
(19, 2, 101, 5, 122372, '2023-03-25', 4, 'Non', 'M', 7098),
(19, 2, 101, 5, 122373, '2023-03-25', 4, 'Non', 'M', 2260),
(19, 2, 101, 5, 122374, '2023-03-25', 4, 'Non', 'M', 5128),
(19, 2, 101, 5, 122375, '2023-03-25', 4, 'Non', 'M', 2292),
(19, 2, 101, 5, 122376, '2023-03-25', 4, 'Non', 'M', 5337),
(19, 2, 101, 5, 122377, '2023-03-25', 4, 'Non', 'M', 6052),
(19, 2, 101, 5, 122378, '2023-03-25', 4, 'Non', 'M', 7075),
(19, 2, 101, 5, 122379, '2023-03-25', 4, 'Non', 'M', 5163),
(19, 2, 101, 5, 122380, '2023-03-25', 4, 'Non', 'M', 1482),
(19, 2, 101, 5, 122381, '2023-03-25', 4, 'Non', 'M', 4249),
(3, 1, 102, 6, 122382, '2023-03-06', 2, 'Oui', 'M', 5773),
(3, 1, 102, 6, 122383, '2023-03-06', 1, 'Oui', 'M', 2041),
(3, 1, 102, 6, 122384, '2023-03-06', 1, 'Oui', 'M', 5994),
(3, 1, 103, 6, 122385, '2023-03-06', 1, 'Oui', 'M', 375),
(3, 1, 103, 6, 122386, '2023-03-06', 1, 'Oui', 'M', 6708),
(3, 1, 103, 6, 122387, '2023-03-06', 1, 'Oui', 'M', 2091),
(3, 1, 103, 6, 122388, '2023-03-06', 1, 'Oui', 'M', 9018),
(3, 1, 103, 6, 122389, '2023-03-06', 1, 'Oui', 'M', 644),
(3, 1, 103, 6, 122390, '2023-03-06', 1, 'Oui', 'M', 9476),
(3, 1, 103, 6, 122391, '2023-03-06', 1, 'Oui', 'M', 3030),
(3, 1, 104, 6, 122392, '2023-03-06', 12, 'Oui', 'M', 4242),
(3, 1, 105, 6, 122393, '2023-03-06', 12, 'Non', 'M', 8334),
(3, 1, 105, 6, 122394, '2023-03-06', 12, 'Non', 'M', 2277),
(3, 1, 105, 6, 122395, '2023-03-06', 12, 'Non', 'M', 1094),
(3, 1, 105, 6, 122396, '2023-03-06', 12, 'Non', 'M', 841),
(3, 1, 105, 6, 122397, '2023-03-06', 12, 'Non', 'M', 8615),
(3, 1, 105, 6, 122398, '2023-03-06', 12, 'Non', 'M', 4136),
(3, 1, 105, 6, 122399, '2023-03-06', 12, 'Non', 'M', 4529),
(3, 1, 106, 6, 122400, '2023-03-06', 1, 'Oui', 'M', 547),
(3, 1, 106, 6, 122401, '2023-03-06', 1, 'Oui', 'M', 6310),
(3, 1, 106, 6, 122402, '2023-03-06', 1, 'Oui', 'M', 2688),
(3, 1, 106, 6, 122403, '2023-03-06', 1, 'Oui', 'M', 8104),
(3, 1, 106, 6, 122404, '2023-03-06', 1, 'Oui', 'M', 3696),
(3, 1, 106, 6, 122405, '2023-03-06', 2, 'Oui', 'M', 4304),
(3, 1, 106, 6, 122406, '2023-03-06', 2, 'Oui', 'M', 9631),
(3, 1, 106, 6, 122407, '2023-03-06', 2, 'Oui', 'M', 6575),
(3, 1, 106, 6, 122408, '2023-03-06', 2, 'Non', 'M', 7775),
(3, 1, 106, 6, 122409, '2023-03-06', 3, 'Oui', 'M', 5454),
(3, 1, 106, 6, 122410, '2023-03-06', 2, 'Oui', 'S', 3114),
(3, 1, 106, 6, 122411, '2023-03-06', 2, 'Oui', 'S', 9693),
(3, 1, 106, 6, 122412, '2023-03-06', 2, 'Oui', 'S', 9272),
(3, 1, 106, 6, 122413, '2023-03-06', 2, 'Oui', 'S', 3377),
(3, 1, 106, 6, 122414, '2023-03-06', 2, 'Oui', 'M', 4443),
(3, 1, 106, 6, 122415, '2023-03-06', 2, 'Oui', 'M', 9040),
(3, 1, 106, 6, 122416, '2023-03-06', 2, 'Oui', 'M', 5767),
(3, 1, 106, 6, 122417, '2023-03-06', 2, 'Oui', 'M', 1943),
(3, 1, 106, 6, 122418, '2023-03-06', 2, 'Oui', 'M', 4466),
(3, 1, 106, 6, 122419, '2023-03-06', 3, 'Oui', 'M', 6546),
(3, 1, 106, 6, 122420, '2023-03-06', 3, 'Oui', 'M', 6746),
(3, 1, 106, 6, 122421, '2023-03-06', 2, 'Non', 'M', 7410),
(3, 1, 106, 6, 122422, '2023-03-06', 2, 'Non', 'M', 9540),
(3, 1, 106, 6, 122423, '2023-03-06', 2, 'Non', 'M', 278),
(3, 1, 106, 6, 122424, '2023-03-06', 2, 'Non', 'M', 6313),
(3, 1, 106, 6, 122425, '2023-03-06', 3, 'Oui', 'M', 332),
(3, 1, 106, 6, 122426, '2023-03-06', 3, 'Oui', 'M', 4457);

--
-- Triggers `inscrire`
--
DELIMITER $$
CREATE TRIGGER `before_insert_inscrire` BEFORE INSERT ON `inscrire` FOR EACH ROW BEGIN
    -- Générez un numéro de dossard aléatoire entre 0 et 9999
    SET NEW.ins_dossard = FLOOR(RAND() * 10000);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `manifestation`
--

CREATE TABLE `manifestation` (
  `ma_id` int(11) NOT NULL,
  `ma_nom` varchar(50) NOT NULL,
  `ma_lieu` varchar(50) DEFAULT NULL,
  `ma_datefin` date DEFAULT NULL,
  `ma_datedeb` date DEFAULT NULL,
  `ch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `manifestation`
--

INSERT INTO `manifestation` (`ma_id`, `ma_nom`, `ma_lieu`, `ma_datefin`, `ma_datedeb`, `ch_id`) VALUES
(1, 'Meeting des pros Stade Pierre Mauroy', 'Lille', '2015-08-29', '2015-09-10', 2),
(2, 'Meeting de Paris Stade Charlety', 'Paris', '1998-06-01', '1999-05-10', 2),
(3, 'Meeting de Paris Stade', 'Paris', '1999-05-29', '1999-02-10', 2),
(4, 'Meeting des Jeunes Paris Stade Charlety', 'Paris', '1999-06-29', '1999-05-10', 2),
(5, 'Journée du printemps', 'Senlis', '1993-06-21', '1993-06-18', 1),
(6, 'Journée de l’été', 'Rambouillet', '1996-06-21', '1996-06-13', 1),
(7, 'Journée de l’automne', 'Melun', '2004-04-17', '2004-04-13', 1),
(8, 'Journée de l’hivers', 'Soissons', '2006-05-03', '0000-00-00', 1),
(9, 'Day of one part1', 'Champigny-sur-Marne', '2002-12-03', '2004-11-29', 3),
(10, 'Day of one part1', 'Thiais', '2007-11-23', '2007-11-20', 3),
(11, 'Day of one part1', 'Orly', '2008-09-10', '2008-09-02', 3),
(12, 'Day of one part1', 'Créteil', '2009-05-14', '2008-05-11', 3);

-- --------------------------------------------------------

--
-- Table structure for table `membre`
--

CREATE TABLE `membre` (
  `mem_id` int(11) NOT NULL,
  `mem_email` varchar(100) DEFAULT NULL,
  `mem_pseudo` varchar(50) DEFAULT NULL,
  `mem_mdp` varchar(255) DEFAULT NULL,
  `person_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `membre`
--

INSERT INTO `membre` (`mem_id`, `mem_email`, `mem_pseudo`, `mem_mdp`, `person_id`) VALUES
(1, 'candice@gmail.com', 'chips', 'azertyuiop', 1),
(2, 'gusthy@gmail.com', 'Gusthy', 'azerty1234', 2),
(3, 'quarell@gmail.com', 'Quarell', 'azertyuiop', 3),
(4, 'quarell@gmail.com', 'Quarell', 'azertyuiop', 4),
(5, 'quarell@gmail.com', 'Quarell', 'azertyuiop', 5),
(6, 'quarell@gmail.com', 'Quarell', 'azertyuiop', 6),
(7, 'paulquarell@gmail.com', 'Quarell', '123456789', 7),
(8, 'paulquarell@gmail.com', 'Quarell', '123456789', 8),
(9, 'paulquarell@gmail.com', 'Quarell', '123456789', 9),
(10, 'paulquarell@gmail.com', 'Quarell', '123456789', 10),
(11, 'quarell@gmail.com', 'Quarell', 'azertyuiop', 11),
(12, 'chris@gmail.com', 'Chris94', 'azertyuio', 12),
(13, 'caroline@gmail.com', 'Chips', 'azertyuiop', 13),
(14, 'caroline@gmail.com', 'Chips', 'azertyuiop', 14),
(15, 'caroline@gmail.com', 'Chips', 'azertyuiop', 15),
(16, 'pauline@gmail.com', 'Iviana', 'azertyuiop', 16),
(17, 'mirabelle@gmail.com', 'mimipromaos', '12392839483', 17),
(18, 'mirabelle@gmail.com', 'mimipromaos', '12392839483', 18),
(19, 'clement@gmail.com', 'clairman', 'zaasazadazdaz', 19),
(20, 'quarell@gmail.com', 'mimipromaos', 'azertyuiop', 20),
(21, 'arthurbernard@gmail.com', 'Mitine94', 'azertyuiop', 21),
(22, 'arthurbernard@gmail.com', 'Mitine94', 'azertyuiop', 22),
(23, 'arthurbernard@gmail.com', 'Mitine94', 'azertyuiop', 23),
(24, 'arthurbernard@gmail.com', 'Mitine94', 'azertyuiop', 24),
(25, 'arthurbernard@gmail.com', 'Mitine94', 'azertyuiop', 25),
(26, 'paulquarell@gmail.com', 'chips', 'azertyuiop', 26),
(27, 'paulquarell@gmail.com', 'chips', 'azertyuiop', 27),
(28, 'paulquarell@gmail.com', 'chips', 'azertyuiop', 28),
(29, 'paulquarell@gmail.com', 'chips', 'azertyuiop', 29),
(30, 'quarell@gmail.com', 'Mitine94', 'azertyuiop', 30),
(31, 'arthurbernard@gmail.com', 'chips', 'azertyuiop', 31),
(32, 'arthurbernard@gmail.com', 'chips', 'azertyuiop', 32),
(33, 'azertyy@gmail.com', 'azerty', 'azertyuhgfdsd', 33),
(34, 'azertyy@gmail.com', 'azerty', 'azertyuhgfdsd', 34),
(35, 'azertyy@gmail.com', 'azerty', 'azertyuhgfdsd', 35),
(36, 'clement.arki@hotmail.fr', 'Mitine94', 'zertyuiop', 36),
(37, 'arthurbernard@gmail.com', 'chips', 'zertyuiop', 37),
(38, 'arthurbernard@gmail.com', 'chips', 'zertyuiop', 38),
(39, 'arthurbernard@gmail.com', 'chips', '12345678', 39),
(40, 'paulquarell@gmail.com', 'Quarell94', 'azertyuiop', 40),
(41, 'theo@gmail.com', 'Dr4ix', 'azertyuiop', 41),
(42, 'arthurbernard@gmail.com', 'candidi', 'azertyuiop', 42),
(43, 'arthurbernard@gmail.com', 'candidi', 'azertyuiop', 43),
(44, 'pseudo@gmail.com', 'pseudo', 'azertyuiop', 44),
(45, 'pseudo@gmail.com', 'pseudo', 'azertyuio*', 45),
(46, 'quarell@gmail.com', 'Quarell', 'azertyuiop', 46),
(47, 'quarell@gmail.com', 'Quarell', 'azertyuiop', 47),
(48, 'quarell@gmail.com', 'Quarell', 'azertyuiop', 48),
(49, 'quarell@gmail.com', 'Quarell', 'azertyuiop', 49),
(50, 'quarell@gmail.com', 'Quarell', 'azertyuiop', 50),
(51, 'quarell@gmail.com', 'Quarell', 'azertyuiop', 51),
(54, 'clement@gmail.com', 'clairman', 'azertyuio', 52),
(55, 'clem@gmail.com', 'Quarell', 'azertyuio', 53),
(56, 'clem@gmail.com', 'Quarell', 'azertyuio', 54),
(57, 'clem@gmail.com', 'Quarell', 'azertyuio', 55),
(58, 'paulquarell@gmail.com', 'Chips', 'azertyutyuio', 56),
(59, 'candice@gmail.com', 'candidi', 'azertyuiop', 57),
(60, 'candice@gmail.com', 'candidi', 'azertyuiop', 58),
(61, 'candice@gmail.com', 'candidi', 'azertyuiop', 59),
(62, 'candice@gmail.com', 'candidi', 'azertyuiop', 60),
(63, 'candice@gmail.com', 'candidi', 'azertyuiop', 61),
(64, 'candice@gmail.com', 'candidi', 'azertyuiop', 62),
(65, 'candice@gmail.com', 'candidi', 'azertyuiop', 63),
(66, 'candice@gmail.com', 'candidi', 'azertyuiop', 64),
(67, 'quarell@gmail.com', 'chips', 'azertyuiop', 65),
(68, 'paulquarell@gmail.com', 'Quarell', 'azertyuiop', 66),
(69, 'paulquarell@gmail.com', 'Mitine94', 'azertyuio', 67),
(70, 'paulquarell@gmail.com', 'Mitine94', 'azertyuio', 68),
(71, 'arthurbernard@gmail.com', 'candidi', 'azertyuio', 69),
(72, 'arthurbernard@gmail.com', 'candidi', 'azertyuio', 70),
(73, 'arthurbernard@gmail.com', 'candidi', 'azertyuio', 71),
(74, 'quarell@gmail.com', 'Chips', 'azertyui', 72),
(75, 'quarell@gmail.com', 'Chips', 'azertyui', 73),
(76, 'arthurbernard@gmail.com', 'candidi', 'azertyuio', 74),
(77, 'paulquarell@gmail.com', '\\&quot;\\\'eéeé', 'azertyui', 75),
(78, 'paulquarell@gmail.com', '\\\'\\&quot;eéeé', 'azertyui', 76),
(79, 'brigittearki@hotmail.com', 'mimipromaos', '12345678', 77),
(80, 'arthurbernard@gmail.com', '&lt;!Nikita?&gt;', '12345678765432', 78),
(81, 'brigittearki@hotmail.com', 'Chips', 'zertyuiokj', 79),
(82, 'brigittearki@hotmail.com', 'Chips', 'zertyuiokj', 80),
(83, 'brigittearki@hotmail.com', 'Chips', '433bb5c4d95b0810aa9266661aa5575d', 84),
(84, 'quarell@gmail.com', 'Chips', '0b8ca6a00a440d28ade4968c8fdd8d72', 85),
(85, 'clement@gmail.com', 'candidi', '0b8ca6a00a440d28ade4968c8fdd8d72', 86),
(86, 'clement@gmail.com', 'candidi', '19f8c8136e813d800d75a969c8ae2fa2', 93),
(87, 'clement@gmail.com', 'candidi', '19f8c8136e813d800d75a969c8ae2fa2', 98),
(88, 'clement@gmail.com', 'candidi', '$2y$10$BtN5NZn9mob8XGaE8FxoX.5NwIcJtzm3EpZbeXvIQuU', 100),
(89, 'clement@gmail.com', 'candidi', '$2y$10$4t52e6e1d7E3ox98yii6L.vY/nHpcCdrDvd46TjXwvE', 101),
(90, 'clement@gmail.com', 'candidi', '$2y$10$RzAdGHR7BmG.AgbPzsydLOuRfQBa0FO6jNp2pe6Tspq', 102),
(91, 'arthurbernard@gmail.com', 'quarell94', '$2y$10$Qrafl23qOcRUIB5MOUchQ.MjYEcvgMuiW8RsaFGxXwP', 103),
(92, 'paulquarell@gmail.com', 'Mitine94', '$2y$10$PB.xiNtFAdfZwXszSxzuCOoSoBLUdcWCOfOXrr98gD2', 104),
(93, 'paulquarell@gmail.com', 'Mitine94', '$2y$10$BPlk1zMaObooys9OewGUQuIbbH9IQWIqlwLchH5fsLo', 105),
(94, 'paulquarell@gmail.com', NULL, NULL, 106),
(95, 'paulquarell@gmail.com', NULL, NULL, 107),
(96, 'paulquarell@gmail.com', NULL, NULL, 108),
(97, 'paulquarell@gmail.com', NULL, NULL, 109),
(98, 'paulquarell@gmail.com', NULL, NULL, 110),
(99, 'paulquarell@gmail.com', NULL, NULL, 111),
(100, 'paulquarell@gmail.com', NULL, NULL, 112),
(101, 'paulquarell@gmail.com', NULL, NULL, 113),
(102, 'paulquarell@gmail.com', NULL, NULL, 114),
(103, 'paulquarell@gmail.com', NULL, NULL, 115),
(104, 'candice@gmail.com', NULL, NULL, 116),
(105, 'candice@gmail.com', NULL, NULL, 117),
(106, 'paulquarell@gmail.com', NULL, NULL, 118),
(107, 'quarell@gmail.com', NULL, NULL, 119),
(108, 'clement@gmail.com', NULL, NULL, 120),
(109, 'anthea@gmail.com', NULL, NULL, 121),
(110, 'ginette@gmail.com', NULL, NULL, 122),
(111, 'clement@gmail.com', NULL, NULL, 123),
(112, 'paulquarell@gmail.com', NULL, NULL, 124),
(113, 'paulquarell@gmail.com', NULL, NULL, 125),
(114, 'testcmsi@gmail.com', NULL, NULL, 126),
(115, 'zbi@gmail.com', 'zbi', '$2y$10$9CMBQ7J6MkgqkMEi4GiS7O/P3GV7mH7C2l4OO0U1uwV11mKSxs1RO', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `newsletter`
--

CREATE TABLE `newsletter` (
  `email_id` int(11) NOT NULL,
  `nw_email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `newsletter`
--

INSERT INTO `newsletter` (`email_id`, `nw_email`) VALUES
(10, 'aymanouu@hotmail.fr'),
(4, 'aymngp@gmail.com'),
(12, 'aymngppo@gmail.com'),
(1, 'k.aymnpro@hotmail.com'),
(2, 'safa12kharj@gmail.com'),
(7, 'safa12kharja@gmail.com'),
(13, 'safJKa@hotmail.fr'),
(5, 'skibididab@gmail.com'),
(3, 'wa7djdid@gmail.com'),
(6, 'wa7djdidaa@gmail.com'),
(9, 'wa7djdido@gmail.com'),
(16, 'xxyy@gmail.com'),
(15, 'zabifkarrak@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `parcours`
--

CREATE TABLE `parcours` (
  `pa_id` int(11) NOT NULL,
  `pa_nom_parcours` varchar(30) DEFAULT NULL,
  `pa_distance` int(11) DEFAULT NULL,
  `pa_point_depart` varchar(50) DEFAULT NULL,
  `pa_point_arrivee` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `parcours`
--

INSERT INTO `parcours` (`pa_id`, `pa_nom_parcours`, `pa_distance`, `pa_point_depart`, `pa_point_arrivee`) VALUES
(1, 'Parcours 1', 100, 'Champigny Bois l\'Abbé', 'Champigny Centre Ville'),
(2, 'Parcours 2', 250, 'Joinville-le-Pont Mairie', 'Joinville-le-Pont Avenue Gallieni'),
(3, 'Parcours 3', 500, 'Saint-Maurice Hopital', 'Saint-Maurice Centre Ville'),
(4, 'Parcours 4', 1000, 'Créteil Eglise', 'Créteil Préfecture'),
(5, 'Parcours 5', 3000, 'Créteil Eglise', 'Créteil Préfecture'),
(6, 'Parcours 6', 5000, 'Charenton-le-Pont Hôtel de ville', 'Charenton-le-Pont marché'),
(7, 'Parcours 7', 6000, 'Arcachon plage', 'Arcachon centre ville'),
(8, 'Parcours 8', 10000, 'Vincennes Hôtel de ville', 'Vincennes patinoire'),
(9, 'Parcours 9', 20000, 'Lille la coulée verte', 'Lille centre ville'),
(10, 'Parcours 10', 42000, 'Paris champs Elysées', 'Paris Avenue Foch');

-- --------------------------------------------------------

--
-- Table structure for table `personne`
--

CREATE TABLE `personne` (
  `person_id` int(11) NOT NULL,
  `person_nom` varchar(50) DEFAULT NULL,
  `person_prenom` varchar(50) DEFAULT NULL,
  `person_adresse` varchar(50) DEFAULT NULL,
  `person_tel` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `personne`
--

INSERT INTO `personne` (`person_id`, `person_nom`, `person_prenom`, `person_adresse`, `person_tel`) VALUES
(1, 'Maj', 'Arthur', '4 avenue de marne', '0348393849'),
(2, 'Boubou', 'Anthéa', '5 avenue evreux', '0193929389'),
(3, 'Delamare', 'Clément', '5 avenue evreux', '069394294'),
(4, 'Quetel', 'François', '5 avenue evreux', '069394294'),
(5, 'Math', 'Elliot', '5 avenue evreux', '069394294'),
(6, 'Delamaré', 'Clément', '5 avenue evreux', '069394294'),
(7, 'Quitin', 'Paul', '5 avenue de la marne', '0348293839'),
(8, 'Clars', 'Clarisse', '5 avenue de la marne', '0348293839'),
(9, 'Carl', 'Caroline', '5 avenue de la marne', '0348293839'),
(10, 'Mimi', 'Mirabelle', '5 avenue de la marne', '0348293839'),
(11, 'clarisse', 'clar', '3 avenue clarissa', '0398392933'),
(12, 'chris', 'shishi', '6 rue de champ', '0394849293'),
(13, 'caroline', 'caro', '5 avenue de la marne', '0495943839'),
(14, 'caroline', 'caro', '5 avenue de la marne', '0495943839'),
(15, 'caroline', 'caro', '5 avenue de la marne', '0495943839'),
(16, 'Pauline', 'Delamare', '23 rue d\'evreux', '0348393849'),
(17, 'Myrabelle', 'mimi', '4 avenue de champigny', '0384939384'),
(18, 'Myrabelle', 'mimi', '4 avenue de champigny', '0384939384'),
(19, 'clementos', 'clement', '40 rue de la jatte', '0933483938'),
(20, 'delamare', 'mimi', '5 avenue evreux', '0193929389'),
(21, 'Paul', 'Bernard', '5 avenue de la marne', '0384939384'),
(22, 'Paul', 'Bernard', '5 avenue de la marne', '0384939384'),
(23, 'Arthur', 'Bernard', '4 avenue de champigny', '0384939384'),
(24, 'bernard', 'arthur', '4 avenue de champigny', '0384939384'),
(25, 'bernard', 'arthur', '4 avenue de champigny', '0384939384'),
(26, '', 'delamare', '4 avenue de champigny', '0348293839'),
(27, '', 'delamare', '4 avenue de champigny', '0348293839'),
(28, '', 'delamare', '4 avenue de champigny', '0348293839'),
(29, '', 'delamare', '4 avenue de champigny', '0348293839'),
(30, 'Arthur', 'arthur', '4 avenue de marne', '0348293839'),
(31, '', 'delamare', '4 avenue de champigny', '0348393849'),
(32, '', 'delamare', '4 avenue de champigny', '0348393849'),
(33, '', 'azerty', 'azerty', 'azerty'),
(34, '', 'azerty', 'azerty', 'azerty'),
(35, '', 'azerty', 'azerty', 'azerty'),
(36, 'Arthur', 'Maj', '4 avenue de champigny', '0348393849'),
(37, 'Paul', 'arthur', 'azertyu', '0348293839'),
(38, 'Paul', 'arthur', 'azertyu', '0348293839'),
(39, 'Arthur', 'delamare', '3 avenue de arthur', '0348293839'),
(40, 'Quintin', 'Paul', '5 rue de marne', '0739437343'),
(41, 'Hihihi', 'Théo', '5 avenue de tour', '0638382933'),
(42, '\'&quot; azert', '\'&quot;azer', '5 avenue evreux', '0398392933'),
(43, '\'&quot; azert', '\'&quot; or die', '5 avenue evreux', '0398392933'),
(44, '\'&quot;azert', 'azert', 'azert', '093494949'),
(45, '\'&quot;azert', 'azert', 'azert', '093494949'),
(46, '\'&quot;azer', 'azert', 'azer', '0303039339'),
(47, '\\\'\\&quot;azer', 'azert', 'azer', '0303039339'),
(48, '\\\'\\\"azer', 'azert', 'azer', '0303039339'),
(49, '\\\'\\&quot;azer', 'azert', 'azer', '0303039339'),
(50, '\\\'\\&quot;azer@', 'azert', 'azer', '0303039339'),
(51, '\\\'@azer', 'azert', 'azer', '0303039339'),
(52, 'clément', 'clement', '', ''),
(53, 'clement', 'clem', '', '039484393'),
(54, 'clement', 'clem', '', '039484393'),
(55, 'clement', 'clem', '', '039484393'),
(56, 'Arthur', 'Maj', ' ', '0193929389'),
(57, 'Arthur', 'delamare', '', '0193929389'),
(58, 'Arthur', 'delamare', '', '0193929389'),
(59, 'Arthur', 'delamare', '', '0193929389'),
(60, 'Arthur', 'delamare', '', '0193929389'),
(61, 'Arthur', 'delamare', '', '0193929389'),
(62, 'Arthur', 'delamare', '', '0193929389'),
(63, 'Arthur', 'delamare', '', '0193929389'),
(64, 'Arthur', 'delamare', '', '0193929389'),
(65, 'Arthur', 'arthur', '', '0349829383'),
(66, 'Arthur', 'arthur', 'azertyui', '0348293839'),
(67, 'Arthur', 'Maj', '', '0348293839'),
(68, 'Arthur', 'aze', 'az', '0348293839'),
(69, '', 'Bernard', '5 avenue evreux', '0193929389'),
(70, '', 'Bernard', '5 avenue evreux', '0193929389'),
(71, 'aze', 'Bernard', '5 avenue evreux', '0193929389'),
(72, 'aze', 'azer', 'azer', '0349829383'),
(73, 'aze', 'azer', 'azer', '0349829383'),
(74, 'azert', 'mimi', '5 avenue de la marne', '0384939384'),
(75, 'bernard', 'Maj', '5 avenue de la marne', '0348393849'),
(76, 'bernard', 'Maj', '5 avenue de la marne', '0348393849'),
(77, 'Candice', 'arthur', '3 avenue clarissa', '0384939384'),
(78, '&lt;12!/&gt;', '&lt;12!/&gt;', '&lt;12!/&gt;', '&lt;0928329192&lt;'),
(79, 'Paul', 'Maj', '4 avenue de marne', '0348293839'),
(80, 'Paul', 'Maj', '4 avenue de marne', '0348293839'),
(81, 'Paul', 'Maj', '4 avenue de marne', '0348293839'),
(82, 'Paul', 'Maj', '4 avenue de marne', '0348293839'),
(83, 'Paul', 'Maj', '4 avenue de marne', '0348293839'),
(84, 'Paul', 'Maj', '4 avenue de marne', '0348293839'),
(85, 'quentin', 'querell', '4 avenue de marne', '0348293839'),
(86, 'quentin', 'paul', '4 avenue de marne', '0348293839'),
(87, 'quentin', 'paul', '4 avenue de marne', '0348293839'),
(88, 'quentin', 'paul', '4 avenue de marne', '0348293839'),
(89, 'quentin', 'paul', '4 avenue de marne', '0348293839'),
(90, 'quentin', 'paul', '4 avenue de marne', '0348293839'),
(91, 'quentin', 'paul', '4 avenue de marne', '0348293839'),
(92, 'quentin', 'paul', '4 avenue de marne', '0348293839'),
(93, 'quentin', 'paul', '4 avenue de marne', '0348293839'),
(94, 'quentin', 'paul', '4 avenue de marne', '0348293839'),
(95, 'quentin', 'paul', '4 avenue de marne', '0348293839'),
(96, 'quentin', 'paul', '4 avenue de marne', '0348293839'),
(97, 'quentin', 'paul', '4 avenue de marne', '0348293839'),
(98, 'quentin', 'paul', '4 avenue de marne', '0348293839'),
(99, 'quentin', 'paul', '4 avenue de marne', '0348293839'),
(100, 'quentin', 'paul', '4 avenue de marne', '0348293839'),
(101, 'quentin', 'paul', '4 avenue de marne', '0348293839'),
(102, 'hach', 'paul', '4 avenue de marne', '0348293839'),
(103, 'paul', 'quintin', '5 avenue de la marne', '0638383748'),
(104, 'Arthur', 'Maj', '1 avenue rue', '0349829383'),
(105, 'Arthur', 'Maj', '1 avenue rue', '0349829383'),
(106, 'Arthur', 'Maj', '1 avenue rue', '0349829383'),
(107, 'Arthur', 'Maj', '1 avenue rue', '0349829383'),
(108, 'Arthur', 'Maj', '1 avenue rue', '0349829383'),
(109, 'Arthur', 'Maj', '1 avenue rue', '0349829383'),
(110, 'Arthur', 'Maj', '1 avenue rue', '0349829383'),
(111, 'Arthur', 'Maj', '1 avenue rue', '0349829383'),
(112, 'Arthur', 'Maj', '1 avenue rue', '0349829383'),
(113, 'Arthur', 'Maj', '1 avenue rue', '0349829383'),
(114, 'Arthur', 'Maj', '1 avenue rue', '0349829383'),
(115, 'Arthur', 'Maj', '1 avenue rue', '0349829383'),
(116, 'Candice', 'delamare', '5 avenue de la marne', '0193929389'),
(117, 'Cand', 'Maj', '5 avenue de la marne', '0193929389'),
(118, 'Arthur', 'Quintin', '5 avenue evreux', '0193929389'),
(119, 'quintin', 'paul', '4 avenue de champigny', '0398392933'),
(120, 'Paul', 'arthur', '5 avenue evreux', '0348293839'),
(121, 'Anthéa', 'boulet', '5 evreux', '0393939399'),
(122, 'Anthéa', 'Delamares', '4 avenue de marne', '0348293839'),
(123, 'Arthur', 'Quintin', '5 avenue de la marne', '0348293839'),
(124, 'Arthur', 'Bernard', '5 avenue evreux', '0349829383'),
(125, 'Arthur', 'Bernard', '5 avenue evreux', '0348293839'),
(126, 'Test_cmsi', 'Test_cmsi', '4 avenue de champigny', '0348393849');

-- --------------------------------------------------------

--
-- Table structure for table `professionnel`
--

CREATE TABLE `professionnel` (
  `pro_id` int(11) NOT NULL,
  `date_debut` date DEFAULT NULL,
  `co_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `professionnel`
--

INSERT INTO `professionnel` (`pro_id`, `date_debut`, `co_id`) VALUES
(1, '2023-03-06', 106),
(2, '2023-03-06', 106),
(3, '2023-03-06', 106),
(4, '2023-03-06', 106),
(5, '2023-03-06', 106);

-- --------------------------------------------------------

--
-- Table structure for table `reglement`
--

CREATE TABLE `reglement` (
  `reg_id` int(11) NOT NULL,
  `reg_date_reglement` date DEFAULT NULL,
  `reg_montant_du` decimal(10,0) DEFAULT NULL,
  `typreg_code` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reglement`
--

INSERT INTO `reglement` (`reg_id`, `reg_date_reglement`, `reg_montant_du`, `typreg_code`) VALUES
(1, '2022-01-01', '1000', 1),
(2, '2022-01-02', '2000', 2),
(3, '2022-01-03', '3000', 3);

-- --------------------------------------------------------

--
-- Table structure for table `resultat`
--

CREATE TABLE `resultat` (
  `result_id` int(11) NOT NULL,
  `co_id` int(11) NOT NULL,
  `temps` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `resultat`
--

INSERT INTO `resultat` (`result_id`, `co_id`, `temps`) VALUES
(1, 1, '2 heures 30 minutes'),
(2, 2, '1 heure 45 minutes');

-- --------------------------------------------------------

--
-- Table structure for table `type_epreuve`
--

CREATE TABLE `type_epreuve` (
  `typep_id` int(11) NOT NULL,
  `typep_nom` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `type_epreuve`
--

INSERT INTO `type_epreuve` (`typep_id`, `typep_nom`) VALUES
(1, 'Vélo'),
(2, 'Courses à pied'),
(3, 'Natation'),
(4, 'Bateau ');

-- --------------------------------------------------------

--
-- Table structure for table `type_reglement`
--

CREATE TABLE `type_reglement` (
  `typreg_code` int(11) NOT NULL,
  `typreg_nom` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `type_reglement`
--

INSERT INTO `type_reglement` (`typreg_code`, `typreg_nom`) VALUES
(1, 'Chèque'),
(2, 'Liquide'),
(3, 'Carte Bleue');

-- --------------------------------------------------------

--
-- Table structure for table `utilisateurs`
--

CREATE TABLE `utilisateurs` (
  `u_id` int(11) NOT NULL,
  `u_pseudo` varchar(50) DEFAULT NULL,
  `u_email` varchar(250) DEFAULT NULL,
  `u_password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `utilisateurs`
--

INSERT INTO `utilisateurs` (`u_id`, `u_pseudo`, `u_email`, `u_password`) VALUES
(1, 'aymn', 'aymn@gmail.com', 'xDhT@96FDWEV@$#%#%#@CS@1342342VESD34DSF$$%#'),
(2, 'safa', 'safa@gmail.com', '$2y$10$UsQZi1fEuBtJzseNtXtgpeqfAzAc6EBQHKFOobc7ykNECj8GHldza'),
(4, 'aymn123', 'aymn123@gmail.com', '$2y$10$t.rSYaKz8iCYz6L8nAeAjePNx5k84BSGuL9Nd.0tzaVQrsgdOWMMC'),
(6, 'aymn1234', 'aymn1234@gmail.com', '$2y$10$QF74vVzo2eYaMce61M7RHOw7QAv2Rm4SXodTyr7wDTVRnu2jRrTdm'),
(7, 'aymanegp', 'aymanegp@gmail.com', '$2y$10$UgRh/w1mtlB0JQNqkeN2n.K1U4V1vJLaalFXQu768BjcnvkLl6EzK'),
(8, 'zaml', 'zaml@gmail.com', '$2y$10$RGiOO913ZjUVnk4A7egqle3eRe4eH3qBnsmkNE5XH9cn4AUEKsdCi'),
(9, '9a7ba', '9a7ba@gmail.com', '$2y$10$xUep0SudYJWcE6NnorvwM.AQ8Ad.zNPmYz3iKNFWzun/8HjT.JqQ6'),
(10, 'hugo', 'hugo@gmail.com', '$2y$10$pkcpgNN6wz64L1aZMTuHmu6Tp7sMNMsHDsIxmCaLZh0KXqir3rdai'),
(11, 'aymane', 'aymane@gmail.com', '$2y$10$llN4UjGhz7KO77uf5ZFoUudLedbiBIWKdJz7cLW7EsZcFLNWN7/fG'),
(12, 'klima', 'klima@gmail.com', '$2y$10$TTJZ3VL7YjKDzqhsQqE2yuhxYx9sc0KKiYCiMDrC9Zb0Ysixxq6ua'),
(15, 'klimaa', 'klimaa@gmail.com', '$2y$10$2jQ27PodWNkHP65RCvCZI.mPe9nbquQGzOfM/KvoVcVnZzkAx5WRa'),
(16, 'anzilati', 'anzilati@gmail.com', '$2y$10$SsRzQ/d9sl448Qgi7zTE7evofCCBCY4GNia2u6hHgReECKK07Y.ti'),
(17, 'skibididab', 'skibididab@gmail.com', '$2y$10$sLXk7UG.gigGPDDXXTczBe0XUPIG2f4nX7dutXsqTcjjcICcrHdqa'),
(18, 'aymen', 'aymen@gmail.com', '$2y$10$pqQ3kT0.q2F0iGWJ/.tNVezRVNSNPKWioYvjMaDyZjmzku2F2vV9y'),
(19, 'clement', 'clement@gmail.com', '$2y$10$8V1uqIfaJf6UZUqqC1JIj.h6UAvd7lTYbACe6a.amQnSmhgSaIcLi'),
(20, 'nouveau', 'nouveau@gmail.com', '$2y$10$2OnyUrKTZyW/i76YVIqd0u.k549xp52AptwDeBSlEk8QEsA1Jyylq'),
(21, 'test', 'test@gmail.com', '$2y$10$NZ4CJTnibH05fIlXUCdEDOKbxQeMY5VC7w6L0i3w26kXF9ZwVJ7Pe');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adherer`
--
ALTER TABLE `adherer`
  ADD PRIMARY KEY (`co_id`,`cl_id`),
  ADD KEY `cl_id` (`cl_id`);

--
-- Indexes for table `amateur`
--
ALTER TABLE `amateur`
  ADD PRIMARY KEY (`amateur_id`),
  ADD KEY `co_id` (`co_id`);

--
-- Indexes for table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `championnat`
--
ALTER TABLE `championnat`
  ADD PRIMARY KEY (`ch_id`);

--
-- Indexes for table `club`
--
ALTER TABLE `club`
  ADD PRIMARY KEY (`cl_id`);

--
-- Indexes for table `consentement_cookie`
--
ALTER TABLE `consentement_cookie`
  ADD PRIMARY KEY (`cok_id`),
  ADD KEY `person_id` (`person_id`);

--
-- Indexes for table `coureur`
--
ALTER TABLE `coureur`
  ADD PRIMARY KEY (`co_id`),
  ADD KEY `fk_coureur_personne` (`person_id`);

--
-- Indexes for table `epreuve`
--
ALTER TABLE `epreuve`
  ADD PRIMARY KEY (`ep_id`),
  ADD KEY `pa_id` (`pa_id`),
  ADD KEY `typep_id` (`typep_id`),
  ADD KEY `ma_id` (`ma_id`);

--
-- Indexes for table `inscriptions_evenements`
--
ALTER TABLE `inscriptions_evenements`
  ADD PRIMARY KEY (`inscription_id`);

--
-- Indexes for table `inscrire`
--
ALTER TABLE `inscrire`
  ADD PRIMARY KEY (`ins_num_inscription`),
  ADD KEY `ep_id` (`ep_id`),
  ADD KEY `reg_id` (`reg_id`),
  ADD KEY `co_id` (`co_id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Indexes for table `manifestation`
--
ALTER TABLE `manifestation`
  ADD PRIMARY KEY (`ma_id`),
  ADD KEY `ch_id` (`ch_id`);

--
-- Indexes for table `membre`
--
ALTER TABLE `membre`
  ADD PRIMARY KEY (`mem_id`),
  ADD KEY `fk_membre_personne` (`person_id`);

--
-- Indexes for table `newsletter`
--
ALTER TABLE `newsletter`
  ADD PRIMARY KEY (`email_id`),
  ADD UNIQUE KEY `email_id` (`email_id`),
  ADD UNIQUE KEY `nw_email` (`nw_email`);

--
-- Indexes for table `parcours`
--
ALTER TABLE `parcours`
  ADD PRIMARY KEY (`pa_id`);

--
-- Indexes for table `personne`
--
ALTER TABLE `personne`
  ADD PRIMARY KEY (`person_id`);

--
-- Indexes for table `professionnel`
--
ALTER TABLE `professionnel`
  ADD PRIMARY KEY (`pro_id`),
  ADD KEY `co_id` (`co_id`);

--
-- Indexes for table `reglement`
--
ALTER TABLE `reglement`
  ADD PRIMARY KEY (`reg_id`),
  ADD KEY `typreg_code` (`typreg_code`);

--
-- Indexes for table `resultat`
--
ALTER TABLE `resultat`
  ADD PRIMARY KEY (`result_id`),
  ADD KEY `co_id` (`co_id`);

--
-- Indexes for table `type_epreuve`
--
ALTER TABLE `type_epreuve`
  ADD PRIMARY KEY (`typep_id`);

--
-- Indexes for table `type_reglement`
--
ALTER TABLE `type_reglement`
  ADD PRIMARY KEY (`typreg_code`);

--
-- Indexes for table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD PRIMARY KEY (`u_id`),
  ADD UNIQUE KEY `u_email` (`u_email`),
  ADD UNIQUE KEY `u_pseudo` (`u_pseudo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adherer`
--
ALTER TABLE `adherer`
  MODIFY `co_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `amateur`
--
ALTER TABLE `amateur`
  MODIFY `amateur_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `championnat`
--
ALTER TABLE `championnat`
  MODIFY `ch_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `club`
--
ALTER TABLE `club`
  MODIFY `cl_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `consentement_cookie`
--
ALTER TABLE `consentement_cookie`
  MODIFY `cok_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT for table `coureur`
--
ALTER TABLE `coureur`
  MODIFY `co_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT for table `epreuve`
--
ALTER TABLE `epreuve`
  MODIFY `ep_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `inscriptions_evenements`
--
ALTER TABLE `inscriptions_evenements`
  MODIFY `inscription_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT for table `inscrire`
--
ALTER TABLE `inscrire`
  MODIFY `ins_num_inscription` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122427;

--
-- AUTO_INCREMENT for table `manifestation`
--
ALTER TABLE `manifestation`
  MODIFY `ma_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `membre`
--
ALTER TABLE `membre`
  MODIFY `mem_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT for table `newsletter`
--
ALTER TABLE `newsletter`
  MODIFY `email_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `parcours`
--
ALTER TABLE `parcours`
  MODIFY `pa_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `personne`
--
ALTER TABLE `personne`
  MODIFY `person_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT for table `professionnel`
--
ALTER TABLE `professionnel`
  MODIFY `pro_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `reglement`
--
ALTER TABLE `reglement`
  MODIFY `reg_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `resultat`
--
ALTER TABLE `resultat`
  MODIFY `result_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `type_epreuve`
--
ALTER TABLE `type_epreuve`
  MODIFY `typep_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `type_reglement`
--
ALTER TABLE `type_reglement`
  MODIFY `typreg_code` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  MODIFY `u_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `adherer`
--
ALTER TABLE `adherer`
  ADD CONSTRAINT `adherer_ibfk_1` FOREIGN KEY (`co_id`) REFERENCES `coureur` (`co_id`),
  ADD CONSTRAINT `adherer_ibfk_2` FOREIGN KEY (`cl_id`) REFERENCES `club` (`cl_id`);

--
-- Constraints for table `amateur`
--
ALTER TABLE `amateur`
  ADD CONSTRAINT `amateur_ibfk_1` FOREIGN KEY (`co_id`) REFERENCES `coureur` (`co_id`);

--
-- Constraints for table `consentement_cookie`
--
ALTER TABLE `consentement_cookie`
  ADD CONSTRAINT `consentement_cookie_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `personne` (`person_id`);

--
-- Constraints for table `coureur`
--
ALTER TABLE `coureur`
  ADD CONSTRAINT `fk_coureur_personne` FOREIGN KEY (`person_id`) REFERENCES `personne` (`person_id`);

--
-- Constraints for table `epreuve`
--
ALTER TABLE `epreuve`
  ADD CONSTRAINT `epreuve_ibfk_1` FOREIGN KEY (`pa_id`) REFERENCES `parcours` (`pa_id`),
  ADD CONSTRAINT `epreuve_ibfk_2` FOREIGN KEY (`typep_id`) REFERENCES `type_epreuve` (`typep_id`),
  ADD CONSTRAINT `epreuve_ibfk_3` FOREIGN KEY (`ma_id`) REFERENCES `manifestation` (`ma_id`);

--
-- Constraints for table `inscrire`
--
ALTER TABLE `inscrire`
  ADD CONSTRAINT `inscrire_ibfk_1` FOREIGN KEY (`ep_id`) REFERENCES `epreuve` (`ep_id`),
  ADD CONSTRAINT `inscrire_ibfk_2` FOREIGN KEY (`reg_id`) REFERENCES `reglement` (`reg_id`),
  ADD CONSTRAINT `inscrire_ibfk_3` FOREIGN KEY (`co_id`) REFERENCES `coureur` (`co_id`),
  ADD CONSTRAINT `inscrire_ibfk_4` FOREIGN KEY (`cat_id`) REFERENCES `categorie` (`cat_id`);

--
-- Constraints for table `manifestation`
--
ALTER TABLE `manifestation`
  ADD CONSTRAINT `manifestation_ibfk_1` FOREIGN KEY (`ch_id`) REFERENCES `championnat` (`ch_id`);

--
-- Constraints for table `membre`
--
ALTER TABLE `membre`
  ADD CONSTRAINT `fk_membre_personne` FOREIGN KEY (`person_id`) REFERENCES `personne` (`person_id`);

--
-- Constraints for table `professionnel`
--
ALTER TABLE `professionnel`
  ADD CONSTRAINT `professionnel_ibfk_1` FOREIGN KEY (`co_id`) REFERENCES `coureur` (`co_id`);

--
-- Constraints for table `reglement`
--
ALTER TABLE `reglement`
  ADD CONSTRAINT `reglement_ibfk_1` FOREIGN KEY (`typreg_code`) REFERENCES `type_reglement` (`typreg_code`);

--
-- Constraints for table `resultat`
--
ALTER TABLE `resultat`
  ADD CONSTRAINT `resultat_ibfk_1` FOREIGN KEY (`co_id`) REFERENCES `coureur` (`co_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
