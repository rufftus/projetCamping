
SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `ProjetCerisaie`
--

-- --------------------------------------------------------

--
-- Structure de la table `activite`
--
drop database if exists  `camping`;
create database if not exists  `camping`;
use `camping`;

CREATE TABLE `utilisateur` (
  `NumUtil` int(11) NOT NULL,
  `NomUtil` varchar(100) COLLATE utf8_bin NOT NULL,
  `MotPasse` varchar(100) COLLATE utf8_bin NOT NULL,
  `role` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`NumUtil`)
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`NumUtil`, `NomUtil`, `MotPasse`,`role` ) VALUES
(1, 'Merlot', 'pwda', 'admin'),
(2, 'Lalande', 'secret','visiteur'),
(3, 'Pinot', 'secret','visiteur');

CREATE TABLE IF NOT EXISTS `activite` (
  `CodeSport` int(11) NOT NULL,
  `LibelleSport` char(10) NOT NULL,
  `DateJour` date NOT NULL DEFAULT '0000-00-00',
  `NumSej` int(11) NOT NULL,
  `NBLOC` int(11) DEFAULT NULL,
  PRIMARY KEY (`CodeSport`,`LibelleSport`,`NumSej`),
  KEY `FK_activite3` (`NumSej`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `activite`
--

INSERT INTO `activite` (`CodeSport`, `LibelleSport`, `DateJour`, `NumSej`, `NBLOC`) VALUES
(1, 'Tennis', '2017-07-20', 13, 1),
(1, 'VTT', '2017-07-05', 3, 1),
(2, 'Cannoe', '2017-07-15', 7, 2),
(2, 'Surf', '2017-07-10', 7, 1),
(2, 'Voile', '2017-07-05', 2, 1),
(3, 'course', '2017-07-14', 9, 3),
(3, 'ski', '2017-07-07', 4, 2),
(4, 'foot', '2017-07-09', 5, 2),
(5, 'basket', '2017-07-07', 6, 3),
(5, 'volley', '2017-07-12', 8, 2);

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE IF NOT EXISTS `client` (
  `NumCli` int(11) NOT NULL AUTO_INCREMENT,
  `NomCli` varchar(30) DEFAULT NULL,
  `AdrRueCli` varchar(40) DEFAULT NULL,
  `CpCli` char(5) DEFAULT NULL,
  `VilleCli` varchar(40) DEFAULT NULL,
  `PieceCli` varchar(10) DEFAULT NULL,
  `NumPieceCli` char(20) DEFAULT NULL,
  PRIMARY KEY (`NumCli`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Contenu de la table `client`
--

INSERT INTO `client` (`NumCli`, `NomCli`, `AdrRueCli`, `CpCli`, `VilleCli`, `PieceCli`, `NumPieceCli`) VALUES
(1, 'Merle', '3 rue des lilas', '69005', 'Lyon', 'CI', '2356786'),
(2, 'Poussin', 'rue des tulipes', '69007', 'Lyon', 'CI', '347835684'),
(3, 'Rossignol', '3 rue des glaieuls', '69002', 'Lyon', 'CI', '23556645'),
(4, 'Canari', '10 rue des acacias', '69005', 'Lyon', 'PS', '235667'),
(5, 'Piaf', '4 rue des pivoines', '69007', 'Lyon', 'PC', '347235684'),
(6, 'Dodo', '5 rue des marguerites', '69160', 'Tassin', 'CI', '56947341'),
(7, 'Poussin', '20 rue des iris', '69400', 'Villefranche', 'CI', '234511'),
(8, 'Geai', 'rue des pétunias', '69340', 'Francheville', 'CI', '347289'),
(9, 'Aigle', '3 rue des geraniums', '69290', 'Saint Consorce', 'CI', '234591'),
(10, 'Mesange', '10 rue des aubépines', '69290', 'Craponne', 'PS', '2398643'),
(11, 'Corneille', '4 rue des orchidés', '69500', 'Bron', 'PC', '34723896'),
(12, 'Buse', '5 rue des nénuphars', '69200', 'Venissieux', 'CI', '569475342');

-- --------------------------------------------------------

--
-- Structure de la table `emplacement`
--

CREATE TABLE IF NOT EXISTS `emplacement` (
  `NumEmpl` int(11) NOT NULL AUTO_INCREMENT,
  `CodeTypeE` int(11) NOT NULL,
  `SurfaceEmpl` float NOT NULL,
  `NbPersMaxEmpl` int(11) NOT NULL,
  PRIMARY KEY (`NumEmpl`),
  KEY `FK_APPARTIENT` (`CodeTypeE`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Contenu de la table `emplacement`
--

INSERT INTO `emplacement` (`NumEmpl`, `CodeTypeE`, `SurfaceEmpl`, `NbPersMaxEmpl`) VALUES
(1, 1, 4, 4),
(2, 1, 4, 4),
(3, 1, 6, 5),
(4, 1, 8, 8),
(5, 2, 8, 12),
(6, 2, 10, 14),
(7, 2, 12, 16),
(8, 3, 12, 12),
(9, 3, 10, 8),
(10, 4, 19, 15),
(11, 4, 18, 16),
(12, 4, 18, 16),
(13, 4, 20, 25);

-- --------------------------------------------------------

--
-- Structure de la table `facture`
--

CREATE TABLE IF NOT EXISTS `facture` (
  `CodeFacture` int(11) NOT NULL,
  `DateFacture` date NOT NULL DEFAULT '0000-00-00',
  `NumSej` int(11) NOT NULL,
  `NumEmpl` int(11) NOT NULL DEFAULT '0',
  `Prix` int(11) DEFAULT NULL,
  PRIMARY KEY (`CodeFacture`,`NumSej`,`NumEmpl`),
  KEY `FK_activite10` (`NumSej`),
  KEY `FK_activite11` (`NumEmpl`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `facture`
--

INSERT INTO `facture` (`CodeFacture`, `DateFacture`, `NumSej`, `NumEmpl`, `Prix`) VALUES
(1, '2017-07-05', 3, 1, 200),
(2, '2017-07-20', 13, 1, 305),
(3, '2017-07-05', 2, 1, 120),
(4, '2017-07-10', 7, 1, 156),
(5, '2017-07-15', 7, 2, 154),
(6, '2017-07-07', 4, 2, 148),
(7, '2017-07-14', 9, 3, 256),
(8, '2017-07-09', 5, 2, 296),
(9, '2017-07-07', 6, 3, 843),
(10, '2017-07-12', 8, 2, 472);

-- --------------------------------------------------------

--
-- Structure de la table `factureprestation`
--

CREATE TABLE IF NOT EXISTS `factureprestation` (
  `CodeFacture` int(11) NOT NULL,
  `DateFacture` date NOT NULL DEFAULT '0000-00-00',
  `LibelleSport` char(10) NOT NULL,
  `NumEmpl` int(11) NOT NULL DEFAULT '0',
  `Prix` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`CodeFacture`,`LibelleSport`,`NumEmpl`,`Prix`),
  KEY `FK_activite13` (`LibelleSport`),
  KEY `FK_activite12` (`NumEmpl`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `factureprestation`
--

INSERT INTO `factureprestation` (`CodeFacture`, `DateFacture`, `LibelleSport`, `NumEmpl`, `Prix`) VALUES
(100, '2017-07-05', 'VTT', 1, 200),
(101, '2017-07-12', 'SURF', 2, 472),
(200, '2017-07-20', 'CANOE', 1, 305),
(300, '2017-07-05', 'VOILE', 1, 120),
(400, '2017-07-10', 'COURSE', 1, 156),
(500, '2017-07-15', 'MARCHE', 2, 154),
(600, '2017-07-07', 'SKI', 2, 148),
(700, '2017-07-14', 'FOOT', 3, 256),
(800, '2017-07-09', 'BASKET', 2, 296),
(900, '2017-07-07', 'VOLLEY', 3, 843);

-- --------------------------------------------------------

--
-- Structure de la table `sejour`
--

CREATE TABLE IF NOT EXISTS `sejour` (
  `NumSej` int(11) NOT NULL AUTO_INCREMENT,
  `NumCli` int(11) NOT NULL,
  `NumEmpl` int(11) NOT NULL,
  `DateDebSej` date DEFAULT NULL,
  `DateFinSej` date DEFAULT NULL,
  `NbPersonnes` int(11) DEFAULT NULL,
  PRIMARY KEY (`NumSej`),
  KEY `FK_LOGE` (`NumEmpl`),
  KEY `FK_EST` (`NumCli`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Contenu de la table `sejour`
--

INSERT INTO `sejour` (`NumSej`, `NumCli`, `NumEmpl`, `DateDebSej`, `DateFinSej`, `NbPersonnes`) VALUES
(1, 1, 1, '2017-07-01', '2017-07-10', 4),
(2, 2, 3, '2017-07-02', '2017-07-13', 4),
(3, 3, 4, '2017-07-01', '2017-07-14', 4),
(4, 4, 2, '2017-07-05', '2017-07-15', 5),
(5, 5, 5, '2017-07-08', '2017-07-25', 8),
(6, 6, 13, '2017-07-09', '2017-07-23', 11),
(7, 7, 7, '2017-07-10', '2017-07-20', 6),
(8, 8, 8, '2017-07-11', '2017-07-26', 2),
(9, 9, 9, '2017-07-12', '2017-07-15', 3),
(10, 10, 10, '2017-07-13', '2017-07-17', 7),
(11, 11, 11, '2017-07-14', '2017-07-19', 6),
(12, 12, 12, '2017-07-15', '2017-07-21', 5),
(13, 2, 13, '2017-07-15', '2017-07-25', 14),
(14, 3, 3, '2017-07-16', '2017-07-23', 5),
(15, 4, 4, '2017-07-16', '2017-07-26', 4),
(16, 5, 5, '2017-07-17', '2017-07-28', 4);

-- --------------------------------------------------------

--
-- Structure de la table `sport`
--

CREATE TABLE IF NOT EXISTS `sport` (
  `CodeSport` int(11) NOT NULL AUTO_INCREMENT,
  `LibelleSport` char(10) NOT NULL,
  `UniteTpsSport` char(10) NOT NULL,
  `TarifUnite` float NOT NULL,
  PRIMARY KEY (`CodeSport`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `sport`
--

INSERT INTO `sport` (`CodeSport`, `LibelleSport`, `UniteTpsSport`, `TarifUnite`) VALUES
(1, 'Tennis', '1 heure', 9),
(2, 'VTT', '1/2 journÃ', 15),
(3, 'Planche-vo', '1 journÃ©e', 22),
(4, 'PÃ©dalo', '2 heures', 8),
(5, 'CanoÃ«', '1/2 journÃ', 10);

-- --------------------------------------------------------

--
-- Structure de la table `type_emplacement`
--

CREATE TABLE IF NOT EXISTS `type_emplacement` (
  `CodeTypeE` int(11) NOT NULL AUTO_INCREMENT,
  `LIBTYPEPL` char(30) NOT NULL,
  `TARIFTYPEPL` float NOT NULL,
  PRIMARY KEY (`CodeTypeE`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `type_emplacement`
--

INSERT INTO `type_emplacement` (`CodeTypeE`, `LIBTYPEPL`, `TARIFTYPEPL`) VALUES
(1, 'TENTE', 19),
(2, 'CARAVANE', 29),
(3, 'CAMPING-CAR', 32),
(4, 'BUNGALOW', 28);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `activite`
--
ALTER TABLE `activite`
  ADD CONSTRAINT `FK_activite` FOREIGN KEY (`CodeSport`) REFERENCES `sport` (`CodeSport`),
  ADD CONSTRAINT `FK_activite3` FOREIGN KEY (`NumSej`) REFERENCES `sejour` (`NumSej`);

--
-- Contraintes pour la table `emplacement`
--
ALTER TABLE `emplacement`
  ADD CONSTRAINT `FK_APPARTIENT` FOREIGN KEY (`CodeTypeE`) REFERENCES `type_emplacement` (`CodeTypeE`);

--
-- Contraintes pour la table `facture`
--
ALTER TABLE `facture`
  ADD CONSTRAINT `FK_activite10` FOREIGN KEY (`NumSej`) REFERENCES `sejour` (`NumSej`),
  ADD CONSTRAINT `FK_activite11` FOREIGN KEY (`NumEmpl`) REFERENCES `emplacement` (`NumEmpl`);

--
-- Contraintes pour la table `factureprestation`
--
ALTER TABLE `factureprestation`
  ADD CONSTRAINT `FK_activite12` FOREIGN KEY (`NumEmpl`) REFERENCES `emplacement` (`NumEmpl`);

--
-- Contraintes pour la table `sejour`
--
ALTER TABLE `sejour`
  ADD CONSTRAINT `FK_EST` FOREIGN KEY (`NumCli`) REFERENCES `client` (`NumCli`),
  ADD CONSTRAINT `FK_LOGE` FOREIGN KEY (`NumEmpl`) REFERENCES `emplacement` (`NumEmpl`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
