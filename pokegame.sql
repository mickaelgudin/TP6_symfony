-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 21, 2020 at 03:04 AM
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
CREATE DATABASE IF NOT EXISTS `pokegame` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `pokegame`;

-- --------------------------------------------------------

--
-- Table structure for table `dresseur`
--

DROP TABLE IF EXISTS `dresseur`;
CREATE TABLE IF NOT EXISTS `dresseur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mdp` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `pieces` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649F85E0677` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `pokemon`
--

DROP TABLE IF EXISTS `pokemon`;
CREATE TABLE IF NOT EXISTS `pokemon` (
  `idP` int(11) NOT NULL AUTO_INCREMENT,
  `sexe` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `xp` int(11) NOT NULL,
  `niveau` int(11) NOT NULL,
  `prix_vente` int(11) NOT NULL,
  `pokemonTypeId` int(11) NOT NULL,
  `dresseurId` int(11) NOT NULL,
  `status` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`idP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ref_elementary_type`
--

DROP TABLE IF EXISTS `ref_elementary_type`;
CREATE TABLE IF NOT EXISTS `ref_elementary_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `montagne` tinyint(1) NOT NULL DEFAULT 0,
  `prairie` tinyint(1) NOT NULL DEFAULT 0,
  `ville` tinyint(1) NOT NULL DEFAULT 0,
  `foret` tinyint(1) NOT NULL DEFAULT 0,
  `plage` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ref_elementary_type`
--

INSERT INTO `ref_elementary_type` (`id`, `libelle`, `montagne`, `prairie`, `ville`, `foret`, `plage`) VALUES
(1, 'ACIER', 1, 0, 0, 0, 0),
(2, 'COMBAT', 0, 0, 1, 0, 0),
(3, 'DRAGON', 1, 0, 0, 0, 1),
(4, 'EAU', 0, 0, 0, 0, 1),
(5, 'ELECTRIK', 0, 0, 1, 0, 0),
(6, 'FEE', 0, 1, 0, 0, 0),
(7, 'FEU', 0, 1, 0, 0, 0),
(8, 'GLACE', 1, 0, 0, 0, 0),
(9, 'INSECTE', 0, 0, 0, 1, 0),
(10, 'NORMAL', 1, 1, 1, 1, 1),
(11, 'PLANTE', 0, 1, 0, 0, 0),
(12, 'POISON', 0, 0, 0, 0, 1),
(13, 'PSY', 0, 0, 1, 0, 0),
(14, 'ROCHE', 1, 0, 0, 0, 0),
(15, 'SOL', 0, 1, 0, 0, 0),
(16, 'SPECTRE', 0, 0, 0, 1, 0),
(17, 'VOL', 0, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ref_pokemon`
--

DROP TABLE IF EXISTS `ref_pokemon`;
CREATE TABLE IF NOT EXISTS `ref_pokemon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `evolution` tinyint(1) NOT NULL,
  `starter` tinyint(1) NOT NULL,
  `type_courbe_niveau` char(1) NOT NULL,
  `type_1` int(11) NOT NULL,
  `type_2` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Déchargement des données de la table `ref_pokemon`
--

INSERT INTO `ref_pokemon` (`id`, `nom`, `evolution`, `starter`, `type_courbe_niveau`, `type_1`, `type_2`) VALUES
(1, 'Bulbizare', 0, 1, 'P', 10, 0),
(2, 'Herbizarre', 1, 0, 'P', 10, 11),
(3, 'Florizarre', 1, 0, 'P', 10, 11),
(4, 'Salamèche', 0, 1, 'P', 6, 0),
(5, 'Reptincel', 1, 0, 'P', 6, 0),
(6, 'Dracaufeu', 1, 0, 'P', 6, 16),
(7, 'Carapuce', 0, 1, 'P', 4, 0),
(8, 'Carabaffe', 1, 0, 'P', 4, 0),
(9, 'Tortank', 1, 0, 'P', 4, 0),
(10, 'Chenipan', 0, 0, 'M', 8, 0),
(11, 'Chrysacier', 1, 0, 'M', 8, 0),
(12, 'Papilusion', 1, 0, 'M', 8, 16),
(13, 'Aspicot', 0, 0, 'M', 8, 11),
(14, 'Coconfort', 1, 0, 'M', 8, 11),
(15, 'Dardargnan', 1, 0, 'M', 8, 11),
(16, 'Roucool', 0, 0, 'P', 9, 16),
(17, 'Roucoups', 1, 0, 'P', 9, 16),
(18, 'Roucarnage', 1, 0, 'P', 9, 16),
(19, 'Rattata', 0, 0, 'M', 9, 0),
(20, 'Rattatac', 1, 0, 'M', 9, 0),
(21, 'Piafabec', 0, 0, 'M', 9, 16),
(22, 'Rapasdepic', 1, 0, 'M', 9, 16),
(23, 'Abo', 0, 0, 'M', 11, 0),
(24, 'Arbok', 1, 0, 'M', 11, 0),
(25, 'Pikachu', 0, 0, 'M', 5, 0),
(26, 'Raichu', 1, 0, 'M', 5, 0),
(27, 'Sabelette', 0, 0, 'M', 14, 0),
(28, 'Sablaireau', 1, 0, 'M', 14, 0),
(29, 'Nidoran ♀', 0, 0, 'P', 11, 0),
(30, 'Nidorina', 1, 0, 'P', 11, 0),
(31, 'Nidoqueen', 1, 0, 'P', 11, 14),
(32, 'Nidoran ♂', 0, 0, 'P', 11, 0),
(33, 'Nidorino', 1, 0, 'P', 11, 0),
(34, 'Nidoking', 1, 0, 'P', 11, 14),
(35, 'Melofée', 0, 0, 'R', 17, 0),
(36, 'Mélodelfe', 1, 0, 'R', 17, 0),
(37, 'Goupix', 0, 0, 'M', 6, 0),
(38, 'Feunard', 1, 0, 'M', 6, 0),
(39, 'Rondoudou', 0, 0, 'R', 9, 17),
(40, 'Grodoudou', 1, 0, 'R', 9, 17),
(41, 'Nosferapti', 0, 0, 'M', 11, 16),
(42, 'Nosferalto', 1, 0, 'M', 11, 16),
(43, 'Mystherbe', 0, 0, 'P', 10, 11),
(44, 'Ortide', 1, 0, 'P', 10, 11),
(45, 'Rafflesia', 1, 0, 'P', 10, 11),
(46, 'Paras', 0, 0, 'M', 8, 10),
(47, 'Parasect', 1, 0, 'M', 8, 10),
(48, 'Mimitoss', 0, 0, 'M', 8, 11),
(49, 'Aeromite', 1, 0, 'M', 8, 11),
(50, 'Taupiqueur', 0, 0, 'M', 14, 0),
(51, 'Triopikeur', 1, 0, 'M', 14, 0),
(52, 'Miaouss', 0, 0, 'M', 9, 0),
(53, 'Persian', 1, 0, 'M', 9, 0),
(54, 'Psykokwak', 0, 0, 'M', 4, 0),
(55, 'Akwakwak', 1, 0, 'M', 4, 0),
(56, 'Ferosinge', 0, 0, 'M', 2, 0),
(57, 'Colossinge', 1, 0, 'M', 2, 0),
(58, 'Caninos', 0, 0, 'L', 6, 0),
(59, 'Arcanin', 1, 0, 'L', 6, 0),
(60, 'Ptitard', 0, 0, 'P', 4, 0),
(61, 'Tetarte', 1, 0, 'P', 4, 0),
(62, 'Tartard', 1, 0, 'P', 4, 2),
(63, 'Abra', 0, 0, 'P', 12, 0),
(64, 'Kadabra', 1, 0, 'P', 12, 0),
(65, 'Alakazam', 1, 0, 'P', 12, 0),
(66, 'Machoc', 0, 0, 'P', 2, 0),
(67, 'Machopeur', 1, 0, 'P', 2, 0),
(68, 'Mackogneur', 1, 0, 'P', 2, 0),
(69, 'Chetiflor', 0, 0, 'P', 10, 11),
(70, 'Boustiflor', 1, 0, 'P', 10, 11),
(71, 'Empiflor', 1, 0, 'P', 10, 11),
(72, 'Tentacool', 0, 0, 'L', 4, 11),
(73, 'Tentacruel', 1, 0, 'L', 4, 11),
(74, 'Racaillou', 0, 0, 'P', 13, 14),
(75, 'Gravalanch', 1, 0, 'P', 13, 14),
(76, 'Grolem', 1, 0, 'P', 13, 14),
(77, 'Ponyta', 0, 0, 'M', 6, 0),
(78, 'Galopa', 1, 0, 'M', 6, 0),
(79, 'Ramoloss', 0, 0, 'M', 4, 12),
(80, 'Flagadoss', 1, 0, 'M', 4, 12),
(81, 'Magneti', 0, 0, 'M', 5, 1),
(82, 'Magneton', 1, 0, 'M', 5, 1),
(83, 'Canarticho', 0, 0, 'M', 9, 16),
(84, 'Doduo', 0, 0, 'M', 9, 16),
(85, 'Dodrio', 1, 0, 'M', 9, 16),
(86, 'Otaria', 0, 0, 'M', 4, 0),
(87, 'Lamantine', 1, 0, 'M', 4, 7),
(88, 'Tadmorv', 0, 0, 'M', 11, 0),
(89, 'Grotadmorv', 1, 0, 'M', 11, 0),
(90, 'Kokiyas', 0, 0, 'L', 4, 0),
(91, 'Crustabri', 1, 0, 'L', 4, 7),
(92, 'Fantominus', 0, 0, 'P', 15, 11),
(93, 'Spectrum', 1, 0, 'P', 15, 11),
(94, 'Ectoplasma', 1, 0, 'P', 15, 11),
(95, 'Onix', 0, 0, 'M', 13, 14),
(96, 'Soporifik', 0, 0, 'M', 12, 0),
(97, 'Hypnomade', 1, 0, 'M', 12, 0),
(98, 'Krabby', 0, 0, 'M', 4, 0),
(99, 'Krabboss', 1, 0, 'M', 4, 0),
(100, '16torbe', 0, 0, 'M', 5, 0),
(101, 'Electrode', 1, 0, 'M', 5, 0),
(102, 'Noeunoeuf', 0, 0, 'L', 10, 12),
(103, 'Noadkoko', 1, 0, 'L', 10, 12),
(104, 'Osselait', 0, 0, 'M', 14, 0),
(105, 'Ossatueur', 1, 0, 'M', 14, 0),
(106, 'Kicklee', 0, 0, 'M', 2, 0),
(107, 'Tygnon', 0, 0, 'M', 2, 0),
(108, 'Excelangue', 0, 0, 'M', 9, 0),
(109, 'Smogo', 0, 0, 'M', 11, 0),
(110, 'Smogogo', 1, 0, 'M', 11, 0),
(111, 'Rhinocorne', 0, 0, 'L', 14, 13),
(112, 'Rhinoferos', 1, 0, 'L', 14, 13),
(113, 'Leveinard', 0, 0, 'R', 9, 0),
(114, 'Saquedeneu', 0, 0, 'M', 10, 0),
(115, 'Kangourex', 0, 0, 'M', 9, 0),
(116, 'Hypotrempe', 0, 0, 'M', 4, 0),
(117, 'Hypocean', 1, 0, 'M', 4, 0),
(118, 'Poissirene', 0, 0, 'M', 4, 0),
(119, 'Poissoroy', 1, 0, 'M', 4, 0),
(120, 'Stari', 0, 0, 'L', 4, 0),
(121, 'Staross', 1, 0, 'L', 4, 12),
(122, 'M. Mime', 0, 0, 'M', 12, 17),
(123, 'Insecateur', 0, 0, 'M', 8, 16),
(124, 'Lippoutou', 0, 0, 'M', 7, 12),
(125, 'Elektek', 0, 0, 'M', 5, 0),
(126, 'Magmar', 0, 0, 'M', 6, 0),
(127, 'Scarabrute', 0, 0, 'L', 8, 0),
(128, 'Tauros', 0, 0, 'L', 9, 0),
(129, 'Magicarpe', 0, 0, 'L', 4, 0),
(130, 'Leviator', 1, 0, 'L', 4, 16),
(131, 'Lokhlass', 0, 0, 'L', 4, 7),
(132, 'Metamorph', 0, 0, 'M', 9, 0),
(133, 'Evoli', 0, 0, 'M', 9, 0),
(134, 'Aquali', 1, 0, 'M', 4, 0),
(135, 'Voltali', 1, 0, 'M', 5, 0),
(136, 'Pyroli', 1, 0, 'M', 6, 0),
(137, 'Porygon', 0, 0, 'M', 9, 0),
(138, 'Amonita', 0, 0, 'M', 13, 4),
(139, 'Amonistar', 1, 0, 'M', 13, 4),
(140, 'Kabuto', 0, 0, 'M', 13, 4),
(141, 'Kabutops', 1, 0, 'M', 13, 4),
(142, 'Ptera', 0, 0, 'L', 13, 16),
(143, 'Ronflex', 0, 0, 'L', 9, 0),
(144, 'Artikodin', 0, 0, 'L', 7, 16),
(145, 'Electhor', 0, 0, 'L', 5, 16),
(146, 'Sulfura', 0, 0, 'L', 6, 16),
(147, 'Minidraco', 0, 0, 'L', 3, 0),
(148, 'Draco', 1, 0, 'L', 3, 0),
(149, 'Dracolosse', 1, 0, 'L', 3, 16),
(150, 'Mewtwo', 0, 0, 'L', 12, 0),
(151, 'Mew', 0, 0, 'P', 12, 0);
COMMIT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
