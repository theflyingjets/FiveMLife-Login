/*
 Navicat MySQL Data Transfer

 Source Server         : main
 Source Server Type    : MySQL
 Source Server Version : 100139
 Source Host           : localhost:3306
 Source Schema         : jetsnnix

 Target Server Type    : MySQL
 Target Server Version : 100139
 File Encoding         : 65001

 Date: 21/05/2019 18:21:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for main
-- ----------------------------
DROP TABLE IF EXISTS `main`;
CREATE TABLE `main`  (
  `id` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `args` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for playername
-- ----------------------------
DROP TABLE IF EXISTS `playername`;
CREATE TABLE `playername`  (
  `id` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT 'This is a key yaaaaaaaaaaaa',
  `firstName` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT 'This holds the firstname of a sad player',
  `lastName` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT 'Oh wow a last name, what!',
  PRIMARY KEY (`id`) USING BTREE,
  FULLTEXT INDEX `inLastName`(`lastName`),
  CONSTRAINT `playernametoplayers` FOREIGN KEY (`id`) REFERENCES `players` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for players
-- ----------------------------
DROP TABLE IF EXISTS `players`;
CREATE TABLE `players`  (
  `id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `isbanned` bit(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for playersexndob
-- ----------------------------
DROP TABLE IF EXISTS `playersexndob`;
CREATE TABLE `playersexndob`  (
  `id` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT 'Ahhhhhhhhhhhhh it\'s a key',
  `sex` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT 'M or F you say!',
  `dob` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT 'Date your brith',
  PRIMARY KEY (`id`) USING BTREE,
  CONSTRAINT `playerSexnDOBtoplayers` FOREIGN KEY (`id`) REFERENCES `players` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- View structure for idtabel
-- ----------------------------
DROP VIEW IF EXISTS `idtabel`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `idtabel` AS SELECT
players.id,
playersexndob.sex,
playersexndob.dob,
playername.firstName,
playername.lastName
FROM
players
INNER JOIN playersexndob ON playersexndob.id = players.id
INNER JOIN playername ON playername.id = players.id ;

-- ----------------------------
-- View structure for playerdatayaaa
-- ----------------------------
DROP VIEW IF EXISTS `playerdatayaaa`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `playerdatayaaa` AS SELECT
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

SET FOREIGN_KEY_CHECKS = 1;
