-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 19, 2020 at 02:18 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pokegame`
--
CREATE DATABASE IF NOT EXISTS `pokegame` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `pokegame`;

-- --------------------------------------------------------

--
-- Table structure for table `dresseur`
--

DROP TABLE IF EXISTS `dresseur`;
CREATE TABLE IF NOT EXISTS `dresseur` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) NOT NULL,
  `mail` varchar(30) NOT NULL,
  `mdp` varchar(100) NOT NULL,
  `pieces` int(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `migration_versions`
--

DROP TABLE IF EXISTS `migration_versions`;
CREATE TABLE IF NOT EXISTS `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migration_versions`
--

INSERT INTO `migration_versions` (`version`, `executed_at`) VALUES
('20200519102046', '2020-05-19 10:21:37');

-- --------------------------------------------------------

--
-- Table structure for table `pokemon`
--

DROP TABLE IF EXISTS `pokemon`;
CREATE TABLE IF NOT EXISTS `pokemon` (
  `idP` int(3) NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) NOT NULL,
  `sexe` varchar(30) NOT NULL,
  `xp` int(30) NOT NULL,
  `niveau` int(2) NOT NULL,
  `prix_vente` int(30) NOT NULL,
  `dresseurId` int(30) NOT NULL,
  `disponibleEntrainement` tinyint(1) NOT NULL,
  PRIMARY KEY (`idP`),
  KEY `dresseurId_const` (`dresseurId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ref_elementary_type`
--

DROP TABLE IF EXISTS `ref_elementary_type`;
CREATE TABLE IF NOT EXISTS `ref_elementary_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ref_elementary_type`
--

INSERT INTO `ref_elementary_type` (`id`, `libelle`) VALUES
(1, 'ACIER'),
(2, 'COMBAT'),
(3, 'DRAGON'),
(4, 'EAU'),
(5, 'ELECTRIK'),
(6, 'FEE'),
(7, 'FEU'),
(8, 'GLACE'),
(9, 'INSECTE'),
(10, 'NORMAL'),
(11, 'PLANTE'),
(12, 'POISON'),
(13, 'PSY'),
(14, 'ROCHE'),
(15, 'SOL'),
(16, 'SPECTRE'),
(17, 'TENEBRES'),
(18, 'VOL');

-- --------------------------------------------------------

--
-- Table structure for table `ref_pokemon_type`
--

DROP TABLE IF EXISTS `ref_pokemon_type`;
CREATE TABLE IF NOT EXISTS `ref_pokemon_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_1` int(11) DEFAULT NULL,
  `type_2` int(11) DEFAULT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `evolution` tinyint(1) NOT NULL,
  `starter` tinyint(1) NOT NULL,
  `type_courbe_niveau` char(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_5483EF999C6D843C` (`type_1`),
  KEY `IDX_5483EF99564D586` (`type_2`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ref_pokemon_type`
--

INSERT INTO `ref_pokemon_type` (`id`, `type_1`, `type_2`, `nom`, `evolution`, `starter`, `type_courbe_niveau`) VALUES
(1, 11, 12, 'Bulbizarre', 0, 0, 'P'),
(2, 11, 12, 'Herbizarre', 0, 0, 'P'),
(3, 11, 12, 'Florizarre', 0, 0, 'P'),
(4, 7, 0, 'SalamÃ¨che', 0, 0, 'P'),
(5, 7, 0, 'Reptincel', 0, 0, 'P'),
(6, 7, 18, 'Dracau7', 0, 0, 'P'),
(7, 4, 0, 'Carapuce', 0, 0, 'P'),
(8, 4, 0, 'Carabaffe', 0, 0, 'P'),
(9, 4, 0, 'Tortank', 0, 0, 'P'),
(10, 9, 0, 'Chenipan', 0, 0, 'M'),
(11, 9, 0, 'Chrys1', 0, 0, 'M'),
(12, 9, 18, 'Papilusion', 0, 0, 'M'),
(13, 9, 12, 'Aspicot', 0, 0, 'M'),
(14, 9, 12, 'Coconfort', 0, 0, 'M'),
(15, 9, 12, 'Dardargnan', 0, 0, 'M'),
(16, 10, 18, 'Roucool', 0, 0, 'P'),
(17, 10, 18, 'Roucoups', 0, 0, 'P'),
(18, 10, 18, 'Roucarnage', 0, 0, 'P'),
(19, 10, 0, 'Rattata', 0, 0, 'M'),
(20, 10, 0, 'Rattatac', 0, 0, 'M'),
(21, 10, 18, 'Piafabec', 0, 0, 'M'),
(22, 10, 18, 'Rapasdepic', 0, 0, 'M'),
(23, 12, 0, 'Abo', 0, 0, 'M'),
(24, 12, 0, 'Arbok', 0, 0, 'M'),
(25, 5, 0, 'Pikachu', 0, 0, 'M'),
(26, 5, 0, 'Raichu', 0, 0, 'M'),
(27, 15, 0, 'Sabelette', 0, 0, 'M'),
(28, 15, 0, 'Sablair4', 0, 0, 'M'),
(29, 12, 0, 'Nidoran_', 0, 0, 'P'),
(30, 12, 0, 'Nidorina', 0, 0, 'P'),
(31, 12, 15, 'Nidoqueen', 0, 0, 'P'),
(32, 12, 0, 'Nidoran_', 0, 0, 'P'),
(33, 12, 0, 'Nidorino', 0, 0, 'P'),
(34, 12, 15, 'Nidoking', 0, 0, 'P'),
(35, 6, 0, 'MÃ©lofÃ©e', 0, 0, 'R'),
(36, 6, 0, 'MÃ©lodelfe', 0, 0, 'R'),
(37, 7, 0, 'Goupix', 0, 0, 'M'),
(38, 7, 0, '7nard', 0, 0, 'M'),
(39, 10, 6, 'Rondoudou', 0, 0, 'R'),
(40, 10, 6, 'Grodoudou', 0, 0, 'R'),
(41, 12, 18, 'Nosferapti', 0, 0, 'M'),
(42, 12, 18, 'Nosferalto', 0, 0, 'M'),
(43, 11, 12, 'Mystherbe', 0, 0, 'P'),
(44, 11, 12, 'Ortide', 0, 0, 'P'),
(45, 11, 12, 'Rafflesia', 0, 0, 'P'),
(46, 9, 11, 'Paras', 0, 0, 'M'),
(47, 9, 11, 'Parasect', 0, 0, 'M'),
(48, 9, 12, 'Mimitoss', 0, 0, 'M'),
(49, 9, 12, 'AÃ©romite', 0, 0, 'M'),
(50, 15, 0, 'Taupiqueur', 0, 0, 'M'),
(51, 15, 0, 'Triopikeur', 0, 0, 'M'),
(52, 10, 0, 'Miaouss', 0, 0, 'M'),
(53, 10, 0, 'Persian', 0, 0, 'M'),
(54, 4, 0, '13kokwak', 0, 0, 'M'),
(55, 4, 0, 'Akwakwak', 0, 0, 'M'),
(56, 2, 0, 'FÃ©rosinge', 0, 0, 'M'),
(57, 2, 0, 'Colossinge', 0, 0, 'M'),
(58, 7, 0, 'Caninos', 0, 0, 'L'),
(59, 7, 0, 'Arcanin', 0, 0, 'L'),
(60, 4, 0, 'Ptitard', 0, 0, 'P'),
(61, 4, 0, 'TÃ©tarte', 0, 0, 'P'),
(62, 4, 2, 'Tartard', 0, 0, 'P'),
(63, 13, 0, 'Abra', 0, 0, 'P'),
(64, 13, 0, 'Kadabra', 0, 0, 'P'),
(65, 13, 0, 'Alakazam', 0, 0, 'P'),
(66, 2, 0, 'Machoc', 0, 0, 'P'),
(67, 2, 0, 'Machopeur', 0, 0, 'P'),
(68, 2, 0, 'Mackogneur', 0, 0, 'P'),
(69, 11, 12, 'ChÃ©tiflor', 0, 0, 'P'),
(70, 11, 12, 'Boustiflor', 0, 0, 'P'),
(71, 11, 12, 'Empiflor', 0, 0, 'P'),
(72, 4, 12, 'Tentacool', 0, 0, 'L'),
(73, 4, 12, 'Tentacruel', 0, 0, 'L'),
(74, 14, 15, 'Racaillou', 0, 0, 'P'),
(75, 14, 15, 'Gravalanch', 0, 0, 'P'),
(76, 14, 15, 'Grolem', 0, 0, 'P'),
(77, 7, 0, 'Ponyta', 0, 0, 'M'),
(78, 7, 0, 'Galopa', 0, 0, 'M'),
(79, 4, 13, 'Ramoloss', 0, 0, 'M'),
(80, 4, 13, 'Flagadoss', 0, 0, 'M'),
(81, 5, 1, 'MagnÃ©ti', 0, 0, 'M'),
(82, 5, 1, 'MagnÃŒÂ©ton', 0, 0, 'M'),
(83, 10, 18, 'Canarticho', 0, 0, 'M'),
(84, 10, 18, 'Doduo', 0, 0, 'M'),
(85, 10, 18, 'Dodrio', 0, 0, 'M'),
(86, 4, 0, 'Otaria', 0, 0, 'M'),
(87, 4, 8, 'Lamantine', 0, 0, 'M'),
(88, 12, 0, 'Tadmorv', 0, 0, 'M'),
(89, 12, 0, 'Grotadmorv', 0, 0, 'M'),
(90, 4, 0, 'Kokiyas', 0, 0, 'L'),
(91, 4, 8, 'Crustabri', 0, 0, 'L'),
(92, 16, 12, 'Fantominus', 0, 0, 'P'),
(93, 16, 12, 'Spectrum', 0, 0, 'P'),
(94, 16, 12, 'Ectoplasma', 0, 0, 'P'),
(95, 14, 15, 'Onix', 0, 0, 'M'),
(96, 13, 0, 'Soporifik', 0, 0, 'M'),
(97, 13, 0, 'Hypnomade', 0, 0, 'M'),
(98, 4, 0, 'Krabby', 0, 0, 'M'),
(99, 4, 0, 'Krabboss', 0, 0, 'M'),
(100, 5, 0, '18torbe', 0, 0, 'M'),
(101, 5, 0, 'Electrode', 0, 0, 'M'),
(102, 11, 13, 'Noeunoeuf', 0, 0, 'L'),
(103, 11, 13, 'Noadkoko', 0, 0, 'L'),
(104, 15, 0, 'Osselait', 0, 0, 'M'),
(105, 15, 0, 'Ossatueur', 0, 0, 'M'),
(106, 2, 0, 'Kicklee', 0, 0, 'M'),
(107, 2, 0, 'Tygnon', 0, 0, 'M'),
(108, 10, 0, 'Excelangue', 0, 0, 'M'),
(109, 12, 0, 'Smogo', 0, 0, 'M'),
(110, 12, 0, 'Smogogo', 0, 0, 'M'),
(111, 15, 14, 'Rhinocorne', 0, 0, 'L'),
(112, 15, 14, 'RhinofÃ©ros', 0, 0, 'L'),
(113, 10, 0, 'Leveinard', 0, 0, 'R'),
(114, 11, 0, 'Saquedeneu', 0, 0, 'M'),
(115, 10, 0, 'Kangourex', 0, 0, 'M'),
(116, 4, 0, 'Hypotrempe', 0, 0, 'M'),
(117, 4, 0, 'HypocÃŒÂ©an', 0, 0, 'M'),
(118, 4, 0, 'PoissirÃŒÂ¬ne', 0, 0, 'M'),
(119, 4, 0, 'Poissoroy', 0, 0, 'M'),
(120, 4, 0, 'Stari', 0, 0, 'L'),
(121, 4, 13, 'Staross', 0, 0, 'L'),
(122, 13, 6, 'M. Mime', 0, 0, 'M'),
(123, 9, 18, 'InsÃ©cateur', 0, 0, 'M'),
(124, 8, 13, 'Lippoutou', 0, 0, 'M'),
(125, 5, 0, 'Elektek', 0, 0, 'M'),
(126, 7, 0, 'Magmar', 0, 0, 'M'),
(127, 9, 0, 'Scarabrute', 0, 0, 'L'),
(128, 10, 0, 'Tauros', 0, 0, 'L'),
(129, 4, 0, 'Magicarpe', 0, 0, 'L'),
(130, 4, 18, 'LÃ©viator', 0, 0, 'L'),
(131, 4, 8, 'Lokhlass', 0, 0, 'L'),
(132, 10, 0, 'MÃ©tamorph', 0, 0, 'M'),
(133, 10, 0, 'E18i', 0, 0, 'M'),
(134, 4, 0, 'Aquali', 0, 0, 'M'),
(135, 5, 0, '18tali', 0, 0, 'M'),
(136, 7, 0, 'Pyroli', 0, 0, 'M'),
(137, 10, 0, 'Porygon', 0, 0, 'M'),
(138, 14, 4, 'Amonita', 0, 0, 'M'),
(139, 14, 4, 'Amonistar', 0, 0, 'M'),
(140, 14, 4, 'Kabuto', 0, 0, 'M'),
(141, 14, 4, 'Kabutops', 0, 0, 'M'),
(142, 14, 18, 'PtÃ©ra', 0, 0, 'L'),
(143, 10, 0, 'Ronflex', 0, 0, 'L'),
(144, 8, 18, 'Artikodin', 0, 0, 'L'),
(145, 5, 18, 'Electhor', 0, 0, 'L'),
(146, 7, 18, 'Sulfura', 0, 0, 'L'),
(147, 3, 0, 'Minidraco', 0, 0, 'L'),
(148, 3, 0, 'Draco', 0, 0, 'L'),
(149, 3, 18, 'Dracolosse', 0, 0, 'L'),
(150, 13, 0, 'Mewtwo', 0, 0, 'L'),
(151, 13, 0, 'Mew', 0, 0, 'P');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`roles`)),
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pieces` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649F85E0677` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ref_pokemon_type`
--
ALTER TABLE `ref_pokemon_type`
  ADD CONSTRAINT `TYPE_CONSTRAINT1` FOREIGN KEY (`type_1`) REFERENCES `ref_elementary_type` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
