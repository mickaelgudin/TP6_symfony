-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mer. 17 juin 2020 à 21:44
-- Version du serveur :  5.7.26
-- Version de PHP :  7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `pokegame`
--

-- --------------------------------------------------------

--
-- Structure de la table `dresseur`
--

DROP TABLE IF EXISTS `dresseur`;
CREATE TABLE IF NOT EXISTS `dresseur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:simple_array)',
  `pieces` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649F85E0677` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `dresseur`
--

INSERT INTO `dresseur` (`id`, `nom`, `username`, `password`, `roles`, `pieces`) VALUES
(1, 'Julien', 'Julien', 'fb2f85c88567f3c8ce9b799c7c54642d0c7b41f6', 'Apprenti dresseur', 200),
(2, 'Mickael', 'Micky', '8cb2237d0679ca88db6464eac60da96345513964', 'Eleveur et Dresseur', 2400);

-- --------------------------------------------------------

--
-- Structure de la table `migration_versions`
--

DROP TABLE IF EXISTS `migration_versions`;
CREATE TABLE IF NOT EXISTS `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `pokemon`
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
  `date_action` datetime DEFAULT NULL,
  PRIMARY KEY (`idP`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `pokemon`
--

INSERT INTO `pokemon` (`idP`, `sexe`, `xp`, `niveau`, `prix_vente`, `pokemonTypeId`, `dresseurId`, `status`, `date_action`) VALUES
(1, 'M', 0, 3, 800, 1, 1, 'v', NULL),
(2, 'F', 30, 3, 700, 10, 1, 'e', '2020-06-17 21:17:17'),
(3, 'M', 364, 7, 500, 40, 2, '', '2020-06-14 18:28:14'),
(4, 'M', 69, 3, 0, 147, 2, '', '2020-06-13 04:28:15'),
(5, 'M', 5000, 1, 800, 87, 1, 'h', '2020-06-17 21:30:37'),
(7, 'M', 53, 4, 800, 35, 1, '', '2020-06-09 23:15:07'),
(9, 'F', 40, 2, 500, 6, 2, '', '2020-06-14 18:28:31'),
(10, 'F', 47, 3, 500, 42, 2, '', '2020-06-12 01:29:30'),
(11, 'F', 21, 2, 500, 58, 2, '', '2020-06-13 19:36:40'),
(12, 'M', 18, 2, 500, 42, 2, '', '2020-06-09 23:20:40'),
(13, 'F', 0, 1, 500, 16, 2, '', NULL),
(14, 'F', 0, 1, 500, 17, 2, '', NULL),
(15, 'F', 0, 1, 500, 123, 2, 'v', NULL),
(16, 'M', 0, 1, 500, 92, 2, '', NULL),
(17, 'M', 0, 1, 500, 119, 1, '', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `ref_elementary_type`
--

DROP TABLE IF EXISTS `ref_elementary_type`;
CREATE TABLE IF NOT EXISTS `ref_elementary_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `montagne` tinyint(1) NOT NULL,
  `prairie` tinyint(1) NOT NULL,
  `ville` tinyint(1) NOT NULL,
  `foret` tinyint(1) NOT NULL,
  `plage` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `ref_elementary_type`
--

INSERT INTO `ref_elementary_type` (`id`, `libelle`, `montagne`, `prairie`, `ville`, `foret`, `plage`) VALUES
(1, 'ACIER', 1, 0, 0, 0, 0),
(2, 'COMBAT', 0, 0, 1, 0, 0),
(3, 'DRAGON', 1, 0, 0, 0, 1),
(4, 'EAU', 0, 0, 0, 0, 1),
(5, 'ELECTRIK', 0, 0, 1, 0, 0),
(6, 'FEU', 0, 1, 0, 0, 0),
(7, 'GLACE', 1, 0, 0, 0, 0),
(8, 'INSECTE', 0, 0, 0, 1, 0),
(9, 'NORMAL', 1, 1, 1, 1, 1),
(10, 'PLANTE', 0, 1, 0, 0, 0),
(11, 'POISON', 0, 0, 0, 0, 1),
(12, 'PSY', 0, 0, 1, 0, 0),
(13, 'ROCHE', 1, 0, 0, 0, 0),
(14, 'SOL', 0, 1, 0, 0, 0),
(15, 'SPECTRE', 0, 0, 0, 1, 0),
(16, 'VOL', 0, 1, 0, 1, 0),
(17, 'FEE', 0, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `ref_pokemon`
--

DROP TABLE IF EXISTS `ref_pokemon`;
CREATE TABLE IF NOT EXISTS `ref_pokemon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
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
(100, 'Voltorbe', 0, 0, 'M', 5, 0),
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
