-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le :  Dim 28 mars 2021 à 15:17
-- Version du serveur :  8.0.18
-- Version de PHP :  7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `magasin`
--

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `numcommande` int(11) NOT NULL,
  `article` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `numclient` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`numcommande`, `article`, `numclient`) VALUES
(3, 'Disque CD - Patrick Bruel', 1),
(4, 'Disque CD - Dick Anglas', 1),
(5, 'Disque CD - Los Mayas', 1),
(6, 'Disque CD - Dick Anglas', 1),
(7, 'Disque CD - Los Mayas', 1),
(8, 'Disque CD - Dick Anglas', 1),
(9, 'Disque CD - Patrick Bruel', 2),
(10, 'Disque CD - Los Mayas', 2),
(11, 'Disque CD - Los Mayas', 2);

-- --------------------------------------------------------

--
-- Structure de la table `personel`
--

CREATE TABLE `personel` (
  `numero` int(11) NOT NULL,
  `nom` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `motdepasse` varchar(40) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `personel`
--

INSERT INTO `personel` (`numero`, `nom`, `motdepasse`) VALUES
(1, 'ayrton', 'ma'),
(2, 'mathieu', 'ma');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`numcommande`),
  ADD KEY `fk1` (`numclient`);

--
-- Index pour la table `personel`
--
ALTER TABLE `personel`
  ADD PRIMARY KEY (`numero`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `numcommande` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `personel`
--
ALTER TABLE `personel`
  MODIFY `numero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `fk1` FOREIGN KEY (`numclient`) REFERENCES `personel` (`numero`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
