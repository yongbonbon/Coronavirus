/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50620
 Source Host           : localhost:3306
 Source Schema         : coronavirus

 Target Server Type    : MySQL
 Target Server Version : 50620
 File Encoding         : 65001

 Date: 08/10/2020 20:52:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for authentication
-- ----------------------------
DROP TABLE IF EXISTS `authentication`;
CREATE TABLE `authentication`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of authentication
-- ----------------------------
INSERT INTO `authentication` VALUES (1, '管理员', 'Admin');
INSERT INTO `authentication` VALUES (2, '用户', 'User');

-- ----------------------------
-- Table structure for base
-- ----------------------------
DROP TABLE IF EXISTS `base`;
CREATE TABLE `base`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idCard` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `age` int(11) NULL DEFAULT NULL,
  `gender` enum('男','女') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` bigint(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idCard`(`idCard`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 86 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of base
-- ----------------------------
INSERT INTO `base` VALUES (78, '513030199411234123', '王曦彤', 23, '女', '四川成都红星路', 13508123423);
INSERT INTO `base` VALUES (79, '513042198810241234', '张霞', 38, '女', '四川成都火车北站', 13508018342);
INSERT INTO `base` VALUES (80, '513012199011234233', '王佳', 23, '女', '四川成都市新都区', 13508302342);
INSERT INTO `base` VALUES (81, '513031197212015234', '黄雅莉', 52, '女', '四川南充市', 15308410834);
INSERT INTO `base` VALUES (82, '513030199411234234', '李明涛', 52, '男', '四川成都锦江区', 13580293523);
INSERT INTO `base` VALUES (83, '510302199611051234', '张夏婷', 23, '女', '成都红星路', 15083029342);
INSERT INTO `base` VALUES (84, '513001199103221234', '张天昊', 27, '男', '四川成都红星路', 15082308123);
INSERT INTO `base` VALUES (85, '510381198502123421', '黄小龙', 38, '男', '四川达州', 15083013942);

-- ----------------------------
-- Table structure for cure
-- ----------------------------
DROP TABLE IF EXISTS `cure`;
CREATE TABLE `cure`  (
  `baseId` int(11) NOT NULL,
  `dischargeDate` date NULL DEFAULT NULL,
  `current` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`baseId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of cure
-- ----------------------------
INSERT INTO `cure` VALUES (78, '2020-10-01', '良好');
INSERT INTO `cure` VALUES (80, '2020-10-08', '治愈了');

-- ----------------------------
-- Table structure for dead
-- ----------------------------
DROP TABLE IF EXISTS `dead`;
CREATE TABLE `dead`  (
  `baseId` int(11) NOT NULL,
  `deadTime` date NULL DEFAULT NULL,
  PRIMARY KEY (`baseId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of dead
-- ----------------------------
INSERT INTO `dead` VALUES (79, '2020-10-08');

-- ----------------------------
-- Table structure for inspect
-- ----------------------------
DROP TABLE IF EXISTS `inspect`;
CREATE TABLE `inspect`  (
  `testId` int(11) NOT NULL AUTO_INCREMENT,
  `baseId` int(11) NOT NULL,
  `testDate` date NULL DEFAULT NULL,
  `ctTest` enum('病变','正常') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nuTest` enum('阴性','阳性') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`testId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of inspect
-- ----------------------------
INSERT INTO `inspect` VALUES (1, 84, '2020-10-05', '正常', '阳性');

-- ----------------------------
-- Table structure for patient
-- ----------------------------
DROP TABLE IF EXISTS `patient`;
CREATE TABLE `patient`  (
  `baseId` int(11) NOT NULL,
  `infectionSource` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `onsetDate` date NULL DEFAULT NULL,
  `symptoms` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hospital` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `critical` enum('是','否') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`baseId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of patient
-- ----------------------------
INSERT INTO `patient` VALUES (78, '华南海鲜市场', '2020-10-01', '发烧', '华西医院', '否', '测试');
INSERT INTO `patient` VALUES (79, '海鲜市场', '2020-10-03', '咳嗽', '人民医院', '否', '阳性');
INSERT INTO `patient` VALUES (80, '华南海鲜', '2020-10-08', '咳嗽发烧', '华西医院', '否', '确诊了哦');
INSERT INTO `patient` VALUES (82, '武汉列车', '2020-10-01', '发热', '传染病医院', '否', '测试');
INSERT INTO `patient` VALUES (83, '武汉', '2020-10-01', '发绕', '32', '否', '测试');
INSERT INTO `patient` VALUES (84, '武汉航班', '2020-10-02', '咳嗽', '27', '否', '测试患者');

-- ----------------------------
-- Table structure for touch
-- ----------------------------
DROP TABLE IF EXISTS `touch`;
CREATE TABLE `touch`  (
  `baseId` int(11) NULL DEFAULT NULL,
  `comeFrom` varchar(56) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isoAddress` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `startDate` date NULL DEFAULT NULL,
  `finished` enum('是','否') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of touch
-- ----------------------------
INSERT INTO `touch` VALUES (79, '境外航班', '传染病医院', '2020-10-02', '是');
INSERT INTO `touch` VALUES (80, '华南海鲜', '传染病医院', '2020-10-07', '是');
INSERT INTO `touch` VALUES (81, '去过武汉', '传染病医院', '2020-10-05', '否');
INSERT INTO `touch` VALUES (85, '武汉动车', '酒店集中隔离', '2020-10-04', '否');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `unit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (5, 'admin', '$2a$10$aPrK74n69ew4Sj4rMACgXeEJOCK7ZbGLhg9l8NE7U1FtMii/xu8GG', '13508130824', '软件公司ceo', '汪大神');
INSERT INTO `user` VALUES (6, 'user', '$2a$10$C/HMc3GghJ6bGym.qdxZc.4tR.N3kZjgduyDiYrzck2UOJPInM3yC', '13508108103', '录入员', '李雅婷');

-- ----------------------------
-- Table structure for user_authorities
-- ----------------------------
DROP TABLE IF EXISTS `user_authorities`;
CREATE TABLE `user_authorities`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authentication_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_authorities
-- ----------------------------
INSERT INTO `user_authorities` VALUES (11, 2, 5);
INSERT INTO `user_authorities` VALUES (12, 1, 5);
INSERT INTO `user_authorities` VALUES (13, 2, 6);

SET FOREIGN_KEY_CHECKS = 1;
