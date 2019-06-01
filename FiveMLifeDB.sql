-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.39-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for jetsnnix
DROP DATABASE IF EXISTS `jetsnnix`;
CREATE DATABASE IF NOT EXISTS `jetsnnix` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `jetsnnix`;

-- Dumping structure for view jetsnnix.banktabel
DROP VIEW IF EXISTS `banktabel`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `banktabel` (
	`UID` INT(255) NOT NULL,
	`id` VARCHAR(255) NOT NULL COLLATE 'utf8_bin',
	`balance` INT(11) NOT NULL,
	`accountNumber` INT(10) NOT NULL,
	`firstName` VARCHAR(50) NOT NULL COMMENT 'This holds the firstname of a sad player' COLLATE 'latin1_swedish_ci',
	`lastName` VARCHAR(50) NOT NULL COMMENT 'Oh wow a last name, what!' COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;

-- Dumping structure for table jetsnnix.height
DROP TABLE IF EXISTS `height`;
CREATE TABLE IF NOT EXISTS `height` (
  `id` varchar(255) NOT NULL,
  `height` int(3) NOT NULL,
  `UID` int(255) NOT NULL,
  PRIMARY KEY (`id`,`UID`) USING BTREE,
  KEY `inheight` (`height`) USING HASH,
  CONSTRAINT `idheight` FOREIGN KEY (`id`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for view jetsnnix.idtabel
DROP VIEW IF EXISTS `idtabel`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `idtabel` (
	`id` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`sex` VARCHAR(1) NOT NULL COMMENT 'M or F you say!' COLLATE 'latin1_swedish_ci',
	`dob` VARCHAR(255) NOT NULL COMMENT 'Date your brith' COLLATE 'latin1_swedish_ci',
	`firstName` VARCHAR(50) NOT NULL COMMENT 'This holds the firstname of a sad player' COLLATE 'latin1_swedish_ci',
	`lastName` VARCHAR(50) NOT NULL COMMENT 'Oh wow a last name, what!' COLLATE 'latin1_swedish_ci',
	`height` INT(3) NOT NULL,
	`UID` INT(255) NOT NULL
) ENGINE=MyISAM;

-- Dumping structure for table jetsnnix.playerbank
DROP TABLE IF EXISTS `playerbank`;
CREATE TABLE IF NOT EXISTS `playerbank` (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `balance` int(11) NOT NULL,
  `accountNumber` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `inbank` (`accountNumber`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for view jetsnnix.playerdatayaaa
DROP VIEW IF EXISTS `playerdatayaaa`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `playerdatayaaa` (
	`id` VARCHAR(255) NOT NULL COMMENT 'This is a key yaaaaaaaaaaaa' COLLATE 'latin1_swedish_ci',
	`firstName` VARCHAR(50) NOT NULL COMMENT 'This holds the firstname of a sad player' COLLATE 'latin1_swedish_ci',
	`lastName` VARCHAR(50) NOT NULL COMMENT 'Oh wow a last name, what!' COLLATE 'latin1_swedish_ci',
	`name` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`isbanned` BIT(1) NOT NULL,
	`sex` VARCHAR(1) NOT NULL COMMENT 'M or F you say!' COLLATE 'latin1_swedish_ci',
	`dob` VARCHAR(255) NOT NULL COMMENT 'Date your brith' COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;

-- Dumping structure for table jetsnnix.playername
DROP TABLE IF EXISTS `playername`;
CREATE TABLE IF NOT EXISTS `playername` (
  `id` varchar(255) NOT NULL COMMENT 'This is a key yaaaaaaaaaaaa',
  `firstName` varchar(50) NOT NULL COMMENT 'This holds the firstname of a sad player',
  `lastName` varchar(50) NOT NULL COMMENT 'Oh wow a last name, what!',
  PRIMARY KEY (`id`) USING BTREE,
  FULLTEXT KEY `inLastName` (`lastName`),
  FULLTEXT KEY `inFirstName` (`firstName`),
  CONSTRAINT `IDName` FOREIGN KEY (`id`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table jetsnnix.players
DROP TABLE IF EXISTS `players`;
CREATE TABLE IF NOT EXISTS `players` (
  `id` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `isbanned` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `inName` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table jetsnnix.playersexndob
DROP TABLE IF EXISTS `playersexndob`;
CREATE TABLE IF NOT EXISTS `playersexndob` (
  `id` varchar(255) NOT NULL COMMENT 'Ahhhhhhhhhhhhh it''s a key',
  `sex` varchar(1) NOT NULL COMMENT 'M or F you say!',
  `dob` varchar(255) NOT NULL COMMENT 'Date your brith',
  PRIMARY KEY (`id`) USING BTREE,
  CONSTRAINT `IDSex` FOREIGN KEY (`id`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for view jetsnnix.banktabel
DROP VIEW IF EXISTS `banktabel`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `banktabel`;
CREATE ALGORITHM=UNDEFINED DEFINER=`server`@`localhost` SQL SECURITY DEFINER VIEW `banktabel` AS SELECT
height.UID,
playerbank.id,
playerbank.balance,
playerbank.accountNumber,
playername.firstName,
playername.lastName
FROM
height ,
playerbank ,
playername ;

-- Dumping structure for view jetsnnix.idtabel
DROP VIEW IF EXISTS `idtabel`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `idtabel`;
CREATE ALGORITHM=UNDEFINED DEFINER=`server`@`localhost` SQL SECURITY DEFINER VIEW `idtabel` AS SELECT
players.id,
playersexndob.sex,
playersexndob.dob,
playername.firstName,
playername.lastName,
height.height,
height.UID
FROM
players
INNER JOIN playersexndob ON playersexndob.id = players.id
INNER JOIN playername ON playername.id = players.id
INNER JOIN height ON height.id = players.id ;

-- Dumping structure for view jetsnnix.playerdatayaaa
DROP VIEW IF EXISTS `playerdatayaaa`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `playerdatayaaa`;
CREATE ALGORITHM=UNDEFINED DEFINER=`server`@`localhost` SQL SECURITY DEFINER VIEW `playerdatayaaa` AS SELECT
	playername.id,
	playername.firstName,
	playername.lastName,
	players.`name`,
	players.isbanned,
	playersexndob.sex,
	playersexndob.dob 
FROM
	playername
	INNER JOIN players ON playername.id = players.id
	INNER JOIN playersexndob ON playersexndob.id = players.id ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
