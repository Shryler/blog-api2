-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 23 sep. 2022 à 08:47
-- Version du serveur : 5.7.36
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `db_blog`
--

-- --------------------------------------------------------

--
-- Structure de la table `account`
--

DROP TABLE IF EXISTS `account`;
CREATE TABLE IF NOT EXISTS `account` (
  `Id_account` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `Id_appUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id_account`),
  UNIQUE KEY `Id_appUser` (`Id_appUser`),
  UNIQUE KEY `login` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `account`
--

INSERT INTO `account` (`Id_account`, `login`, `password`, `is_deleted`, `Id_appUser`) VALUES
(1, 'richarda@gmail.com', 'Cacatoes', 0, 1),
(2, 'Boulgour2@gmail.com', 'Biberon69', 0, 3),
(3, 'BerangerC@gmail.com', 'cochonnaille59', 0, 2),
(4, 'Administrateur', 'admin@live.fr', 0, 4);

-- --------------------------------------------------------

--
-- Structure de la table `appuser`
--

DROP TABLE IF EXISTS `appuser`;
CREATE TABLE IF NOT EXISTS `appuser` (
  `Id_appUser` int(11) NOT NULL AUTO_INCREMENT,
  `pseudo` varchar(50) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `Id_role` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id_appUser`),
  UNIQUE KEY `pseudo` (`pseudo`),
  KEY `Id_role` (`Id_role`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `appuser`
--

INSERT INTO `appuser` (`Id_appUser`, `pseudo`, `is_deleted`, `Id_role`) VALUES
(1, 'Richard', 0, 1),
(2, 'Béranger', 0, 2),
(3, 'Bourgoul', 0, 2),
(4, 'Admin2', 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

DROP TABLE IF EXISTS `article`;
CREATE TABLE IF NOT EXISTS `article` (
  `Id_article` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `content` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `Id_appUser` int(11) DEFAULT NULL,
  `Id_theme` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id_article`),
  KEY `Id_appUser` (`Id_appUser`),
  KEY `Id_theme` (`Id_theme`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`Id_article`, `title`, `content`, `created_at`, `updated_at`, `is_deleted`, `Id_appUser`, `Id_theme`) VALUES
(1, 'Un petit indien', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2022-08-02 08:34:32', '2022-08-02 08:34:32', 0, 4, 1),
(2, 'Il était une fois', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', '2022-09-21 06:34:32', '2022-09-21 06:34:32', 0, 1, 3),
(3, 'Les baskets c\'est chouette !', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.', '2022-06-14 08:35:42', '2022-06-14 08:35:42', 0, 4, 2),
(4, 'Tirlipinpom sur le chihuahua', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.', '2022-09-30 16:35:42', '2022-09-30 16:35:42', 0, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `article_tag`
--

DROP TABLE IF EXISTS `article_tag`;
CREATE TABLE IF NOT EXISTS `article_tag` (
  `Id_article` int(11) NOT NULL,
  `Id_tag` int(11) NOT NULL,
  PRIMARY KEY (`Id_article`,`Id_tag`),
  KEY `Id_tag` (`Id_tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `article_tag`
--

INSERT INTO `article_tag` (`Id_article`, `Id_tag`) VALUES
(1, 20),
(2, 20),
(4, 20),
(2, 21),
(3, 21),
(4, 21),
(1, 22),
(3, 22);

-- --------------------------------------------------------

--
-- Structure de la table `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `Id_comment` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `content` text,
  `created_at` datetime DEFAULT NULL,
  `is_approved` tinyint(1) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `Id_appUser` int(11) DEFAULT NULL,
  `Id_article` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id_comment`),
  KEY `Id_appUser` (`Id_appUser`),
  KEY `Id_article` (`Id_article`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `comment`
--

INSERT INTO `comment` (`Id_comment`, `title`, `content`, `created_at`, `is_approved`, `is_deleted`, `Id_appUser`, `Id_article`) VALUES
(1, 'Nul', 'C\'est nul à faire popo', '2022-09-21 10:22:01', 1, 0, 3, 1),
(2, 'Bidon', 'C\'est bidon', '2022-09-08 12:22:01', 1, 0, 2, 2),
(3, 'Aucun commentaire', 'Tout est dans le titre', '2022-09-06 12:23:10', 1, 0, 2, 2),
(4, 'Aucun problème', 'Miaou le chat', '2022-09-23 12:23:10', 1, 0, 3, 3),
(5, 'Cochon', 'Cochonou le bon saucisson de chez nous', '2022-09-25 12:23:49', 1, 0, 3, 4);

-- --------------------------------------------------------

--
-- Structure de la table `image`
--

DROP TABLE IF EXISTS `image`;
CREATE TABLE IF NOT EXISTS `image` (
  `Id_image` int(11) NOT NULL AUTO_INCREMENT,
  `src` varchar(50) DEFAULT NULL,
  `alt` varchar(50) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `Id_article` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id_image`),
  KEY `Id_article` (`Id_article`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `image`
--

INSERT INTO `image` (`Id_image`, `src`, `alt`, `is_deleted`, `Id_article`) VALUES
(1, 'https://picsum.photos/id/0/367/267', 'image', 0, 1),
(2, 'https://picsum.photos/200/300', 'art2', 0, 2),
(3, 'https://picsum.photos/200/300', 'art3', 0, 3),
(4, 'https://picsum.photos/200/300', 'art4', 0, 4);

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `Id_role` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id_role`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`Id_role`, `title`, `is_deleted`) VALUES
(1, 'Admin', 0),
(2, 'Members', 0);

-- --------------------------------------------------------

--
-- Structure de la table `tag`
--

DROP TABLE IF EXISTS `tag`;
CREATE TABLE IF NOT EXISTS `tag` (
  `Id_tag` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id_tag`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `tag`
--

INSERT INTO `tag` (`Id_tag`, `title`, `is_deleted`) VALUES
(20, 'Exemple n°1', 0),
(21, 'Exemple n°2 mais modifié !', 0),
(22, 'Cochonou le bon saucisson de chez nous !', 0);

-- --------------------------------------------------------

--
-- Structure de la table `theme`
--

DROP TABLE IF EXISTS `theme`;
CREATE TABLE IF NOT EXISTS `theme` (
  `Id_theme` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `img_src` varchar(50) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id_theme`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `theme`
--

INSERT INTO `theme` (`Id_theme`, `title`, `img_src`, `is_deleted`) VALUES
(1, 'Theme1', 'https://picsum.photos/200/300', 0),
(2, 'Theme2', 'https://picsum.photos/200/300', 0),
(3, 'Theme3', 'https://picsum.photos/200/300', 0);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `account_ibfk_1` FOREIGN KEY (`Id_appUser`) REFERENCES `appuser` (`Id_appUser`);

--
-- Contraintes pour la table `appuser`
--
ALTER TABLE `appuser`
  ADD CONSTRAINT `appuser_ibfk_1` FOREIGN KEY (`Id_role`) REFERENCES `role` (`Id_role`);

--
-- Contraintes pour la table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `article_ibfk_1` FOREIGN KEY (`Id_appUser`) REFERENCES `appuser` (`Id_appUser`),
  ADD CONSTRAINT `article_ibfk_2` FOREIGN KEY (`Id_theme`) REFERENCES `theme` (`Id_theme`);

--
-- Contraintes pour la table `article_tag`
--
ALTER TABLE `article_tag`
  ADD CONSTRAINT `article_tag_ibfk_1` FOREIGN KEY (`Id_article`) REFERENCES `article` (`Id_article`),
  ADD CONSTRAINT `article_tag_ibfk_2` FOREIGN KEY (`Id_tag`) REFERENCES `tag` (`Id_tag`);

--
-- Contraintes pour la table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`Id_appUser`) REFERENCES `appuser` (`Id_appUser`),
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`Id_article`) REFERENCES `article` (`Id_article`);

--
-- Contraintes pour la table `image`
--
ALTER TABLE `image`
  ADD CONSTRAINT `image_ibfk_1` FOREIGN KEY (`Id_article`) REFERENCES `article` (`Id_article`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
