/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.5.58 : Database - db_shopmaster
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_shopmaster` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `db_shopmaster`;

/*Table structure for table `activity` */

DROP TABLE IF EXISTS `activity`;

CREATE TABLE `activity` (
  `activityId` int(12) NOT NULL AUTO_INCREMENT,
  `activityName` varchar(50) NOT NULL,
  `activityDes` varchar(500) NOT NULL,
  `discount` float DEFAULT '1',
  `fullPrice` int(12) DEFAULT NULL,
  `reducePrice` int(12) DEFAULT NULL,
  `fullNum` int(12) DEFAULT NULL,
  `reduceNum` int(12) DEFAULT NULL,
  PRIMARY KEY (`activityId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `activity` */

insert  into `activity`(`activityId`,`activityName`,`activityDes`,`discount`,`fullPrice`,`reducePrice`,`fullNum`,`reduceNum`) values (1,'测试活动','1231',1,123,123,1231,12),(2,'开业大酬宾','开业大酬宾，全场9折。',9.2,100,8,200,20);

/*Table structure for table `address` */

DROP TABLE IF EXISTS `address`;

CREATE TABLE `address` (
  `addressID` int(12) NOT NULL AUTO_INCREMENT,
  `userId` int(12) NOT NULL,
  `province` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `county` varchar(50) NOT NULL,
  `detailAddr` varchar(50) NOT NULL,
  `conName` varchar(50) NOT NULL,
  `conTel` varchar(50) NOT NULL,
  PRIMARY KEY (`addressID`),
  KEY `addressID` (`addressID`),
  KEY `userId` (`userId`),
  CONSTRAINT `address_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `address` */

insert  into `address`(`addressID`,`userId`,`province`,`city`,`county`,`detailAddr`,`conName`,`conTel`) values (7,1,'北京市','北京市市辖区','东城区','12312','123123','2131231321'),(8,3,'湖北省','武汉市','武昌区','武汉理工大学','解书贵','15927247484'),(9,2,'湖北省','武汉市','武昌区','武汉理工大学南湖新校区越苑511','解书贵','15927247484');

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `adminId` int(12) NOT NULL AUTO_INCREMENT,
  `adminName` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`adminId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `admin` */

insert  into `admin`(`adminId`,`adminName`,`password`) values (1,'admin','25d55ad283aa400af464c76d713c07ad');

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `cateId` int(12) NOT NULL AUTO_INCREMENT,
  `cateName` varchar(50) NOT NULL,
  PRIMARY KEY (`cateId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `category` */

insert  into `category`(`cateId`,`cateName`) values (1,'数码'),(2,'服饰'),(3,'家电'),(4,'书籍'),(5,'其他');

/*Table structure for table `collection` */

DROP TABLE IF EXISTS `collection`;

CREATE TABLE `collection` (
  `userId` int(12) NOT NULL,
  `goodsId` int(12) NOT NULL,
  `collectTime` datetime NOT NULL,
  PRIMARY KEY (`userId`,`goodsId`),
  KEY `collection_ibfk_2` (`goodsId`),
  CONSTRAINT `collection_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `collection_ibfk_2` FOREIGN KEY (`goodsId`) REFERENCES `goods` (`goodsId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `collection` */

insert  into `collection`(`userId`,`goodsId`,`collectTime`) values (2,99,'2021-07-07 13:18:48'),(2,107,'2021-07-07 12:59:05'),(2,108,'2021-07-07 12:59:03');

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `commentId` int(12) NOT NULL AUTO_INCREMENT,
  `userId` int(12) NOT NULL,
  `goodsId` int(12) NOT NULL,
  `point` int(8) NOT NULL,
  `content` varchar(255) NOT NULL,
  `commentTime` datetime NOT NULL,
  PRIMARY KEY (`commentId`),
  KEY `userId` (`userId`),
  KEY `goodsId` (`goodsId`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`goodsId`) REFERENCES `goods` (`goodsId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `comment` */

insert  into `comment`(`commentId`,`userId`,`goodsId`,`point`,`content`,`commentTime`) values (3,2,99,5,'显示器很好用，很不错','2021-07-07 13:46:53');

/*Table structure for table `deliver` */

DROP TABLE IF EXISTS `deliver`;

CREATE TABLE `deliver` (
  `deliverId` int(12) NOT NULL AUTO_INCREMENT,
  `orderId` int(12) NOT NULL,
  `sendId` int(12) NOT NULL,
  PRIMARY KEY (`deliverId`),
  KEY `orderId` (`orderId`),
  CONSTRAINT `deliver_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `indent` (`orderId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `deliver` */

/*Table structure for table `goods` */

DROP TABLE IF EXISTS `goods`;

CREATE TABLE `goods` (
  `goodsId` int(12) NOT NULL AUTO_INCREMENT,
  `goodsName` varchar(50) NOT NULL,
  `price` int(12) NOT NULL,
  `num` int(12) NOT NULL,
  `upTime` datetime NOT NULL,
  `category` int(12) NOT NULL,
  `detailCate` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `activityId` int(12) NOT NULL DEFAULT '1',
  PRIMARY KEY (`goodsId`),
  KEY `activityId` (`activityId`),
  KEY `category` (`category`),
  CONSTRAINT `goods_ibfk_1` FOREIGN KEY (`activityId`) REFERENCES `activity` (`activityId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `goods_ibfk_2` FOREIGN KEY (`category`) REFERENCES `category` (`cateId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;

/*Data for the table `goods` */

insert  into `goods`(`goodsId`,`goodsName`,`price`,`num`,`upTime`,`category`,`detailCate`,`description`,`activityId`) values (98,'三星显示器',1099,50,'2021-07-07 11:40:00',1,'显示屏','三星2k显示器',1),(99,'戴尔显示器',1299,80,'2021-07-07 11:46:42',1,'显示屏','戴尔24寸显示器',1),(100,'安踏短袖',80,80,'2021-07-07 11:48:11',2,'上衣','安踏夏季短袖',1),(101,'美特斯邦威短袖',119,70,'2021-07-07 11:49:10',2,'上衣','美特斯邦威夏季短袖',1),(102,'呼啸山庄',10,5,'2021-07-07 11:54:12',4,'书本','《呼啸山庄》',1),(103,'简爱',10,40,'2021-07-07 11:54:41',4,'书本','《简爱》',1),(104,'洗衣机',689,80,'2021-07-07 12:24:06',3,'洗衣机','洗衣机全自动',1),(105,'冰箱',2080,50,'2021-07-07 12:24:39',3,'','冰箱双开门',1),(106,'足球',50,50,'2021-07-07 12:25:07',5,'足球','世达足球',1),(107,'苹果显示器',2500,5,'2021-07-07 12:33:32',1,'显示屏','苹果mac显示器',1),(108,'小米显示器',699,12,'2021-07-07 12:33:59',1,'显示屏','小米显示器23寸',1),(109,'AOC显示器',899,12,'2021-07-07 12:35:20',1,'显示屏','AOC显示器2看、',1),(110,'三星显示器',1599,12,'2021-07-07 12:38:20',1,'显示屏','三星显示器23寸',1);

/*Table structure for table `imagepath` */

DROP TABLE IF EXISTS `imagepath`;

CREATE TABLE `imagepath` (
  `pathId` int(12) NOT NULL AUTO_INCREMENT,
  `goodId` int(12) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`pathId`),
  KEY `goodid` (`goodId`),
  CONSTRAINT `imagepath_ibfk_1` FOREIGN KEY (`goodId`) REFERENCES `goods` (`goodsId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8;

/*Data for the table `imagepath` */

insert  into `imagepath`(`pathId`,`goodId`,`path`) values (129,98,'c519三星显示器显示器1.JPG'),(130,99,'d69b戴尔显示器显示器2.JPG'),(131,100,'87ab安踏短袖服饰2.JPG'),(132,101,'03f2美特斯邦威短袖服饰1.JPG'),(133,102,'55af呼啸山庄书本1.JPG'),(134,103,'54e8简爱书本2.JPG'),(135,104,'7537洗衣机洗衣机1.JPG'),(136,105,'f919冰箱冰箱1.JPG'),(137,106,'5783足球足球1.JPG'),(138,107,'675b苹果显示器显示器5.JPG'),(139,108,'a4ae小米显示器显示器4.JPG'),(140,109,'1377AOC显示器显示器3.JPG'),(141,110,'2509三星显示器显示器6.jpg');

/*Table structure for table `indent` */

DROP TABLE IF EXISTS `indent`;

CREATE TABLE `indent` (
  `orderId` int(12) NOT NULL AUTO_INCREMENT,
  `userId` int(12) NOT NULL,
  `orderTime` datetime NOT NULL,
  `oldPrice` float NOT NULL,
  `newPrice` float NOT NULL,
  `isPay` tinyint(1) NOT NULL,
  `isSend` tinyint(1) NOT NULL,
  `isReceive` tinyint(1) NOT NULL,
  `isComplete` tinyint(1) NOT NULL,
  `addressId` int(12) NOT NULL,
  PRIMARY KEY (`orderId`),
  KEY `userId` (`userId`),
  KEY `orderGoods` (`orderTime`),
  KEY `addressId` (`addressId`),
  CONSTRAINT `indent_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `indent_ibfk_2` FOREIGN KEY (`addressId`) REFERENCES `address` (`addressID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

/*Data for the table `indent` */

insert  into `indent`(`orderId`,`userId`,`orderTime`,`oldPrice`,`newPrice`,`isPay`,`isSend`,`isReceive`,`isComplete`,`addressId`) values (28,3,'2019-05-11 11:33:10',10,10,1,1,1,1,8),(29,3,'2019-05-11 11:39:39',125,125,1,1,1,1,8),(30,3,'2019-05-13 10:16:19',109,109,1,1,1,1,8),(31,3,'2019-05-13 10:37:59',10,10,0,1,1,1,8),(32,3,'2019-05-13 10:43:05',10,10,1,1,0,0,8),(33,3,'2019-05-13 10:47:42',40,40,1,1,1,1,8),(34,2,'2021-07-07 13:19:02',2598,2598,1,1,1,1,9),(35,2,'2021-07-07 19:55:35',5495,5495,1,0,0,0,9);

/*Table structure for table `orderitem` */

DROP TABLE IF EXISTS `orderitem`;

CREATE TABLE `orderitem` (
  `itemId` int(12) NOT NULL AUTO_INCREMENT,
  `orderId` int(12) NOT NULL,
  `goodsId` int(12) NOT NULL,
  `num` int(12) NOT NULL,
  PRIMARY KEY (`itemId`),
  KEY `orderId` (`orderId`),
  KEY `goodsId` (`goodsId`),
  CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `indent` (`orderId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orderitem_ibfk_2` FOREIGN KEY (`goodsId`) REFERENCES `goods` (`goodsId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

/*Data for the table `orderitem` */

insert  into `orderitem`(`itemId`,`orderId`,`goodsId`,`num`) values (22,34,99,2),(23,35,98,5);

/*Table structure for table `shopcart` */

DROP TABLE IF EXISTS `shopcart`;

CREATE TABLE `shopcart` (
  `userId` int(12) NOT NULL,
  `goodsid` int(12) NOT NULL,
  `cateDate` datetime NOT NULL,
  `goodsNum` int(12) NOT NULL,
  PRIMARY KEY (`userId`,`goodsid`),
  KEY `userId` (`userId`),
  KEY `goodsid` (`goodsid`),
  CONSTRAINT `shopcart_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `shopcart_ibfk_2` FOREIGN KEY (`goodsid`) REFERENCES `goods` (`goodsId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `shopcart` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `userId` int(12) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `regTime` datetime NOT NULL,
  `email` varchar(50) NOT NULL,
  `telephone` varchar(50) NOT NULL,
  PRIMARY KEY (`userId`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`userId`,`username`,`password`,`regTime`,`email`,`telephone`) values (1,'root','12345678','2019-04-18 17:16:34','12345678@qq.com','13921221826'),(2,'xieshugui','19402600297a305197962a5633e7711e','2019-04-22 15:29:12','384322163@qq.com','15927247484'),(3,'admin','25d55ad283aa400af464c76d713c07ad','2019-05-16 10:46:46','123123','1231321'),(6,'小轻贵','87433299d3ba8706cdd0e2585104261d','2021-07-07 13:42:33','384322163@qq.com','15927247484');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
