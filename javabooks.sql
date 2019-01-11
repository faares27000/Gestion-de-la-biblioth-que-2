-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Dim 10 Février 2013 à 11:57
-- Version du serveur: 5.5.24-log
-- Version de PHP: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `javabooks`
--

-- --------------------------------------------------------

--
-- Structure de la table `achat`
--

CREATE TABLE IF NOT EXISTS `achat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_personne` int(11) NOT NULL,
  `id_livre` int(11) NOT NULL,
  `date_achat` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_personne` (`id_personne`,`id_livre`),
  KEY `id_livre` (`id_livre`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Contenu de la table `achat`
--

INSERT INTO `achat` (`id`, `id_personne`, `id_livre`, `date_achat`) VALUES
(18, 34, 24, '2013-02-10'),
(19, 34, 31, '2013-02-10');

-- --------------------------------------------------------

--
-- Structure de la table `auteur`
--

CREATE TABLE IF NOT EXISTS `auteur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) NOT NULL,
  `date_naissance` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Contenu de la table `auteur`
--

INSERT INTO `auteur` (`id`, `nom`, `date_naissance`) VALUES
(11, 'Honoré de Balzac', '1864-01-29'),
(12, 'Czeslaw Milosz', '1990-04-01'),
(13, 'George Bernard Shaw', '1789-11-01'),
(14, 'Wallace Stevens', '1864-12-03'),
(15, 'W.G. Sebald', '1992-04-03'),
(16, 'Robert Hayden', '1892-12-25'),
(17, 'Henry Miller', '1903-12-12'),
(18, 'Joseph Conrad', '1990-04-01'),
(19, 'Robert Heinlein', '1898-12-15'),
(20, 'Lorine Niedecker', '1905-12-28'),
(21, 'David Mamet', '1914-12-24'),
(22, 'Joyce Cary', '1914-12-02'),
(23, 'Flann O Brien', '1922-12-21'),
(24, 'Jonathan Swift', '1788-08-13');

-- --------------------------------------------------------

--
-- Structure de la table `compte`
--

CREATE TABLE IF NOT EXISTS `compte` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `role` varchar(45) NOT NULL DEFAULT 'user',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Contenu de la table `compte`
--

INSERT INTO `compte` (`id`, `username`, `password`, `role`) VALUES
(1, 'admin', 'admin', 'admin'),
(11, 'soumia', '123456', 'user'),
(18, 'informatique', '123456', 'user');

-- --------------------------------------------------------

--
-- Structure de la table `emprunt`
--

CREATE TABLE IF NOT EXISTS `emprunt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_livre` int(11) NOT NULL,
  `id_personne` int(11) NOT NULL,
  `date_emprunt` date NOT NULL,
  `date_retoure` date NOT NULL,
  `retard` int(11) NOT NULL DEFAULT '0',
  `etat` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_livre` (`id_livre`),
  KEY `id_personne` (`id_personne`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=60 ;

--
-- Contenu de la table `emprunt`
--

INSERT INTO `emprunt` (`id`, `id_livre`, `id_personne`, `date_emprunt`, `date_retoure`, `retard`, `etat`) VALUES
(8, 13, 34, '2012-01-01', '2013-01-06', 67, 1),
(55, 31, 34, '2013-02-10', '2013-03-12', 0, 0),
(56, 26, 34, '2013-02-10', '2013-03-12', 0, 0),
(57, 24, 34, '2013-02-10', '2013-03-12', 0, 0),
(58, 22, 34, '2013-02-10', '2013-03-12', 0, 0),
(59, 32, 34, '2013-02-10', '2013-03-12', 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `livre`
--

CREATE TABLE IF NOT EXISTS `livre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(40) NOT NULL,
  `prix` float NOT NULL,
  `nbr_exemplaire` int(11) NOT NULL,
  `date_edition` date NOT NULL,
  `disponible` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=38 ;

--
-- Contenu de la table `livre`
--

INSERT INTO `livre` (`id`, `titre`, `prix`, `nbr_exemplaire`, `date_edition`, `disponible`) VALUES
(13, 'A Tale of Two Cities', 300, 7, '1994-01-11', 1),
(16, 'The Lord of the Rings', 12, 6, '1954-01-14', 1),
(22, 'The Little Prince', 3, 4, '1988-07-20', 1),
(23, 'to be or not to be', 500, 8, '2008-01-14', 1),
(24, 'And Then There Were None', 1200, 5, '1999-01-14', 1),
(25, 'The Eagle Has Landed', 800, 0, '1997-01-15', 1),
(26, 'Watership Down', 899, 10, '1997-01-30', 1),
(27, 'champions leaugue guide', 720, 17, '1997-05-21', 1),
(28, 'petit chose', 50, 5, '2006-02-14', 1),
(29, 'Home', 800, 0, '1997-01-15', 1),
(31, 'Steps to Christ', 12, 8, '2012-01-09', 1),
(32, 'The Women s Room', 12, 9, '2012-01-09', 1),
(33, 'What to Expect When You are Expecting', 30, 10, '1935-01-25', 1),
(34, 'The Godfather', 22, 11, '1988-01-25', 1),
(36, 'Goodnight Moon', 15, 12, '1995-01-22', 1),
(37, 'A Brief History of Time', 150, 12, '1877-01-22', 1);

-- --------------------------------------------------------

--
-- Structure de la table `livre_auteur`
--

CREATE TABLE IF NOT EXISTS `livre_auteur` (
  `id_livre` int(11) NOT NULL,
  `id_auteur` int(11) NOT NULL,
  PRIMARY KEY (`id_livre`,`id_auteur`),
  KEY `id_auteur` (`id_auteur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `livre_auteur`
--

INSERT INTO `livre_auteur` (`id_livre`, `id_auteur`) VALUES
(13, 11),
(22, 11),
(24, 12),
(31, 12),
(32, 12),
(24, 14),
(25, 14),
(31, 14),
(32, 14),
(16, 15),
(22, 15),
(26, 15),
(31, 15),
(13, 16),
(22, 16),
(26, 16),
(28, 16),
(37, 17),
(34, 19),
(16, 21),
(33, 21),
(36, 21),
(37, 21);

-- --------------------------------------------------------

--
-- Structure de la table `personne`
--

CREATE TABLE IF NOT EXISTS `personne` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_compte` int(11) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `prenom` varchar(30) NOT NULL,
  `email` varchar(40) NOT NULL,
  `cin` varchar(10) NOT NULL,
  `etat` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_compte` (`id_compte`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=42 ;

--
-- Contenu de la table `personne`
--

INSERT INTO `personne` (`id`, `id_compte`, `nom`, `prenom`, `email`, `cin`, `etat`) VALUES
(1, 1, 'Aniq', 'Khadija', '584, Hassania I, Elalia , 1°ét. Mohammed', 'T243653', 1),
(34, 11, 'soumia', 'soumia', 'soumia@gmail.com', 'az5501', 1),
(41, 18, 'arigi', 'ari', 'ari@gi.com', 'ae60561', 0);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `achat`
--
ALTER TABLE `achat`
  ADD CONSTRAINT `achat_ibfk_1` FOREIGN KEY (`id_personne`) REFERENCES `personne` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `achat_ibfk_2` FOREIGN KEY (`id_livre`) REFERENCES `livre` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `emprunt`
--
ALTER TABLE `emprunt`
  ADD CONSTRAINT `emprunt_ibfk_1` FOREIGN KEY (`id_livre`) REFERENCES `livre` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `emprunt_ibfk_2` FOREIGN KEY (`id_personne`) REFERENCES `personne` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `livre_auteur`
--
ALTER TABLE `livre_auteur`
  ADD CONSTRAINT `livre_auteur_ibfk_1` FOREIGN KEY (`id_livre`) REFERENCES `livre` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `livre_auteur_ibfk_2` FOREIGN KEY (`id_auteur`) REFERENCES `auteur` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `personne`
--
ALTER TABLE `personne`
  ADD CONSTRAINT `personne_ibfk_1` FOREIGN KEY (`id_compte`) REFERENCES `compte` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
