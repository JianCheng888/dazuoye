/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50723
Source Host           : localhost:3306
Source Database       : javawebshopdatabase

Target Server Type    : MYSQL
Target Server Version : 50723
File Encoding         : 65001

Date: 2019-11-11 14:01:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `address_ID` int(11) NOT NULL,
  `provincial` varchar(30) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `counties` varchar(30) DEFAULT NULL,
  `street` varchar(30) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `mailNum` varchar(50) DEFAULT NULL,
  `phoneNum` varchar(50) DEFAULT NULL,
  `user_id` int(8) NOT NULL,
  PRIMARY KEY (`address_ID`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `address_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admin_id` int(8) NOT NULL AUTO_INCREMENT,
  `admin_username` varchar(20) NOT NULL,
  `admin_passwd` varchar(20) NOT NULL,
  `admin_image` varchar(50) NOT NULL,
  `admin_email` varchar(30) NOT NULL,
  `telephone` varchar(30) DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `validateCode` varchar(50) DEFAULT NULL,
  `registerTime` datetime DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for food
-- ----------------------------
DROP TABLE IF EXISTS `food`;
CREATE TABLE `food` (
  `food_id` int(8) NOT NULL AUTO_INCREMENT,
  `food_name` varchar(20) NOT NULL,
  `food_price` double(30,2) NOT NULL,
  `food_description` varchar(200) NOT NULL,
  `food_imgurl` varchar(50) DEFAULT NULL,
  `Type_id` int(8) NOT NULL,
  `addFoodTime` datetime DEFAULT NULL,
  `buyCount` int(11) DEFAULT NULL,
  PRIMARY KEY (`food_id`),
  KEY `book_ibfk_1` (`Type_id`),
  CONSTRAINT `food_ibfk_1` FOREIGN KEY (`Type_id`) REFERENCES `food_type` (`type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for food_type
-- ----------------------------
DROP TABLE IF EXISTS `food_type`;
CREATE TABLE `food_type` (
  `type_id` int(8) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(20) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `order_id` int(8) NOT NULL AUTO_INCREMENT,
  `user_id` int(8) NOT NULL,
  `order_time` datetime NOT NULL,
  `order_state` varchar(5) NOT NULL,
  `address` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `orders_ibfk_1` (`user_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail` (
  `order_detail_id` int(8) NOT NULL AUTO_INCREMENT,
  `order_id` int(8) NOT NULL,
  `food_id` int(8) NOT NULL,
  `count` int(5) NOT NULL,
  PRIMARY KEY (`order_detail_id`),
  KEY `order_detail_ibfk_1` (`order_id`),
  KEY `order_detail_ibfk_2` (`food_id`),
  CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for person
-- ----------------------------
DROP TABLE IF EXISTS `person`;
CREATE TABLE `person` (
  `PERSON_ID` int(11) NOT NULL,
  `IDNumber` varchar(30) NOT NULL,
  `RealName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`PERSON_ID`),
  CONSTRAINT `person_ibfk_1` FOREIGN KEY (`PERSON_ID`) REFERENCES `admin` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` int(8) NOT NULL AUTO_INCREMENT,
  `user_username` varchar(20) DEFAULT NULL,
  `user_passwd` varchar(20) DEFAULT NULL,
  `user_email` varchar(20) DEFAULT NULL,
  `user_telephone` varchar(30) DEFAULT NULL,
  `user_address` varchar(50) DEFAULT NULL,
  `user_image` varchar(100) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `validateCode` varchar(50) DEFAULT NULL,
  `registerTime` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
