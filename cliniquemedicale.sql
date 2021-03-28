-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le :  Dim 28 mars 2021 à 18:41
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
-- Base de données :  `cliniquemedicale`
--

-- --------------------------------------------------------

--
-- Structure de la table `medecin`
--

CREATE TABLE `medecin` (
  `numId` int(11) NOT NULL,
  `nom` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `prenom` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `spécialité` varchar(40) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `medecin`
--

INSERT INTO `medecin` (`numId`, `nom`, `prenom`, `spécialité`) VALUES
(1, 'Kostic', 'Filip', 'Radiologie'),
(2, 'Jovovic', 'Luka', 'Oncologie'),
(3, 'Assero', 'Martin', 'Pediatrie'),
(4, 'Badelj', 'Milan', 'gynecologie'),
(5, 'Romanov', 'Kostar', 'neurologie'),
(6, 'Glake', 'Tommy-lee-jones', 'Psychiatrie'),
(7, 'Wayne', 'Thommas', 'Radiologie'),
(8, 'Wayne', 'Martha', 'Radiologie'),
(9, 'Jones', 'Jessica', 'Radiologie'),
(10, 'Lazaro', 'Vinicius', 'Pediatrie');

-- --------------------------------------------------------

--
-- Structure de la table `patient`
--

CREATE TABLE `patient` (
  `numId` int(11) NOT NULL,
  `nom` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `numTel` bigint(20) NOT NULL,
  `probleme` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `description` text COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `patient`
--

INSERT INTO `patient` (`numId`, `nom`, `numTel`, `probleme`, `description`) VALUES
(1, 'Allen', 673233223, 'Radiologie', 'une entorse au ménisque droit'),
(2, 'Mathews', 622332223, 'Pediatrie', 'des oreillons'),
(3, 'Gerradini', 634233223, 'Oncologie', 'un cancer en phase terminale'),
(4, 'Groves', 672233223, 'gynecologie', 'enceinte de trois mois'),
(5, 'James', 113323232, 'neurologie', 'vertige,nausées'),
(6, 'Murdock', 76262732, 'Psychiatrie', 'Troubles de la personalité');

-- --------------------------------------------------------

--
-- Structure de la table `rendezvous`
--

CREATE TABLE `rendezvous` (
  `numId` int(11) NOT NULL,
  `numPatient` int(11) NOT NULL,
  `numMedecin` int(11) NOT NULL,
  `date` date NOT NULL,
  `heure` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `rendezvous`
--

INSERT INTO `rendezvous` (`numId`, `numPatient`, `numMedecin`, `date`, `heure`) VALUES
(1, 1, 1, '2021-03-27', '08:00:00'),
(2, 1, 5, '2021-05-22', '04:00:30'),
(3, 2, 4, '2021-04-21', '07:00:30'),
(4, 2, 1, '2021-03-17', '10:30:00'),
(5, 4, 2, '2021-06-27', '08:30:00'),
(6, 3, 1, '2021-04-27', '08:30:00'),
(7, 4, 7, '2021-04-17', '09:00:00'),
(8, 3, 6, '2021-05-10', '18:00:00');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `medecin`
--
ALTER TABLE `medecin`
  ADD PRIMARY KEY (`numId`);

--
-- Index pour la table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`numId`);

--
-- Index pour la table `rendezvous`
--
ALTER TABLE `rendezvous`
  ADD PRIMARY KEY (`numId`),
  ADD KEY `fk1` (`numMedecin`),
  ADD KEY `fk2` (`numPatient`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `medecin`
--
ALTER TABLE `medecin`
  MODIFY `numId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `patient`
--
ALTER TABLE `patient`
  MODIFY `numId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `rendezvous`
--
ALTER TABLE `rendezvous`
  MODIFY `numId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `rendezvous`
--
ALTER TABLE `rendezvous`
  ADD CONSTRAINT `fk1` FOREIGN KEY (`numMedecin`) REFERENCES `medecin` (`numId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk2` FOREIGN KEY (`numPatient`) REFERENCES `patient` (`numId`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
