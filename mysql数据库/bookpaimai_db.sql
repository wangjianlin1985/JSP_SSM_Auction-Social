/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : bookpaimai_db

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2018-08-03 16:36:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `username` varchar(20) NOT NULL default '',
  `password` varchar(32) default NULL,
  PRIMARY KEY  (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('a', 'a');

-- ----------------------------
-- Table structure for `t_item`
-- ----------------------------
DROP TABLE IF EXISTS `t_item`;
CREATE TABLE `t_item` (
  `itemId` int(11) NOT NULL auto_increment COMMENT '商品id',
  `itemClassObj` int(11) NOT NULL COMMENT '商品分类',
  `pTitle` varchar(80) NOT NULL COMMENT '商品标题',
  `itemPhoto` varchar(60) NOT NULL COMMENT '商品图片',
  `itemDesc` varchar(5000) NOT NULL COMMENT '商品描述',
  `userObj` varchar(20) NOT NULL COMMENT '发布人',
  `startPrice` float NOT NULL COMMENT '起拍价',
  `startTime` varchar(20) default NULL COMMENT '起拍时间',
  `endTime` varchar(20) default NULL COMMENT '结束时间',
  PRIMARY KEY  (`itemId`),
  KEY `itemClassObj` (`itemClassObj`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_item_ibfk_1` FOREIGN KEY (`itemClassObj`) REFERENCES `t_itemclass` (`classId`),
  CONSTRAINT `t_item_ibfk_2` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_item
-- ----------------------------
INSERT INTO `t_item` VALUES ('1', '1', '东野圭吾作品:白夜行', 'upload/0a072663-1a3c-472f-a04a-c2e3a0608006.jpg', '产品名称：东野圭吾作品:白夜行（全...是否是套装: 否书名: 东野圭吾作品:白夜行（全新精装典藏版）定价: 59.60元出版社名称: 南海出版公司出版时间: 2013年01月作者: (日)东野圭吾作者地区: 日本译者: 刘姿君开本: 32开书名: 东野圭吾作品:白夜行（全新精装典藏版）ISBN编号: 9787544258609', 'user1', '30', '2018-03-01 17:38:16', '2018-03-14 17:38:05');
INSERT INTO `t_item` VALUES ('2', '1', '追风筝的人 胡塞尼著', 'upload/a75c0961-6cef-4760-a9df-ba0cdc30fcc8.jpg', '产品名称：*追风筝的人是否是套装: 否书名: *追风筝的人定价: 29.00元出版社名称: 上海人民出版社出版时间: 2013年06月作者: 卡勒德.胡赛尼作者地区: 美国译者: 李继宏编者: 无开本: 32开书名: *追风筝的人ISBN编号: 9787208061644', 'user1', '35', '2018-03-01 17:39:53', '2018-03-14 17:39:58');
INSERT INTO `t_item` VALUES ('3', '2', '中华上下五千年正版全套精装4册', 'upload/34c6516c-e13e-42c7-b6ca-f852d3a8ea58.jpg', '产品名称：中华上下五千年是否是套装: 否书名: 中华上下五千年定价: 280.00元出版社名称: 线装书局出版时间: 2017年6月作者: 无编者: 徐寒开本: 32开书名: 中华上下五千年ISBN编号: 9787512027572', 'user1', '30', '2018-03-01 17:41:39', '2018-03-14 17:41:43');
INSERT INTO `t_item` VALUES ('4', '1', '天然鸡油黄藏老蜜蜡原蜡手莲', 'upload/05690d7f-016d-47f5-8a1c-793bc92e7c0c.jpg', '产品名称：鲁迅文集是否是套装: 是书名: 鲁迅文集定价: 138.00元出版社名称: 中国华侨出版社作者: 鲁迅书名: 鲁迅文集ISBN编号: 9787511363961', 'user2', '18', '2018-03-01 17:43:07', '2018-03-14 17:43:13');

-- ----------------------------
-- Table structure for `t_itemclass`
-- ----------------------------
DROP TABLE IF EXISTS `t_itemclass`;
CREATE TABLE `t_itemclass` (
  `classId` int(11) NOT NULL auto_increment COMMENT '商品分类id',
  `className` varchar(50) NOT NULL COMMENT '商品类别名称',
  `classDesc` varchar(2000) NOT NULL COMMENT '类别描述',
  PRIMARY KEY  (`classId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_itemclass
-- ----------------------------
INSERT INTO `t_itemclass` VALUES ('1', '现代当代文学', '现代当代文学');
INSERT INTO `t_itemclass` VALUES ('2', '中国通史', '中国通史');
INSERT INTO `t_itemclass` VALUES ('3', '大学教材', '大学教材');
INSERT INTO `t_itemclass` VALUES ('4', '社会科学', '社会科学');
INSERT INTO `t_itemclass` VALUES ('5', '经济理论', '经济理论');

-- ----------------------------
-- Table structure for `t_postinfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_postinfo`;
CREATE TABLE `t_postinfo` (
  `postInfoId` int(11) NOT NULL auto_increment COMMENT '帖子id',
  `pTitle` varchar(80) NOT NULL COMMENT '帖子标题',
  `content` varchar(5000) NOT NULL COMMENT '帖子内容',
  `userObj` varchar(20) NOT NULL COMMENT '发帖人',
  `addTime` varchar(20) default NULL COMMENT '发帖时间',
  `hitNum` int(11) NOT NULL COMMENT '浏览量',
  PRIMARY KEY  (`postInfoId`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_postinfo_ibfk_1` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_postinfo
-- ----------------------------
INSERT INTO `t_postinfo` VALUES ('1', '大家好，我来拍拍宝贝', '我喜欢书画作品，来看看！', 'user1', '2018-03-10 15:16:36', '65');
INSERT INTO `t_postinfo` VALUES ('2', '2234', '2324', 'user2', '2018-03-10 16:32:32', '2');

-- ----------------------------
-- Table structure for `t_productbidding`
-- ----------------------------
DROP TABLE IF EXISTS `t_productbidding`;
CREATE TABLE `t_productbidding` (
  `biddingId` int(11) NOT NULL auto_increment COMMENT '订单编号',
  `itemObj` int(11) NOT NULL COMMENT '竞拍商品',
  `userObj` varchar(20) NOT NULL COMMENT '竞拍用户',
  `biddingTime` varchar(20) default NULL COMMENT '竞拍时间',
  `biddingPrice` float NOT NULL COMMENT '竞拍出价',
  PRIMARY KEY  (`biddingId`),
  KEY `itemObj` (`itemObj`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_productbidding_ibfk_1` FOREIGN KEY (`itemObj`) REFERENCES `t_item` (`itemId`),
  CONSTRAINT `t_productbidding_ibfk_2` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_productbidding
-- ----------------------------
INSERT INTO `t_productbidding` VALUES ('1', '1', 'user2', '2018-03-10 15:10:06', '31');
INSERT INTO `t_productbidding` VALUES ('3', '1', 'user2', '2018-03-10 15:11:45', '32');
INSERT INTO `t_productbidding` VALUES ('4', '1', 'user2', '2018-03-10 18:20:36', '33');
INSERT INTO `t_productbidding` VALUES ('5', '1', 'user2', '2018-03-10 18:21:20', '34');
INSERT INTO `t_productbidding` VALUES ('6', '2', 'user2', '2018-03-10 18:23:51', '36');
INSERT INTO `t_productbidding` VALUES ('7', '1', 'user2', '2018-03-11 18:07:01', '35');
INSERT INTO `t_productbidding` VALUES ('8', '1', 'user3', '2018-03-11 18:16:46', '36');

-- ----------------------------
-- Table structure for `t_reply`
-- ----------------------------
DROP TABLE IF EXISTS `t_reply`;
CREATE TABLE `t_reply` (
  `replyId` int(11) NOT NULL auto_increment COMMENT '回复id',
  `postInfoObj` int(11) NOT NULL COMMENT '被回帖子',
  `content` varchar(2000) NOT NULL COMMENT '回复内容',
  `userObj` varchar(20) NOT NULL COMMENT '回复人',
  `replyTime` varchar(20) default NULL COMMENT '回复时间',
  PRIMARY KEY  (`replyId`),
  KEY `postInfoObj` (`postInfoObj`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_reply_ibfk_1` FOREIGN KEY (`postInfoObj`) REFERENCES `t_postinfo` (`postInfoId`),
  CONSTRAINT `t_reply_ibfk_2` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_reply
-- ----------------------------
INSERT INTO `t_reply` VALUES ('1', '1', '大家多多捧场！', 'user2', '2017-12-14 15:16:45');
INSERT INTO `t_reply` VALUES ('2', '1', '嗯嗯 一起发展', 'user1', '2017-12-15 17:29:03');

-- ----------------------------
-- Table structure for `t_userfollow`
-- ----------------------------
DROP TABLE IF EXISTS `t_userfollow`;
CREATE TABLE `t_userfollow` (
  `followId` int(11) NOT NULL auto_increment COMMENT '记录id',
  `userObj1` varchar(20) NOT NULL COMMENT '被关注人',
  `userObj2` varchar(20) NOT NULL COMMENT '关注人',
  `followTime` varchar(20) default NULL COMMENT '关注时间',
  PRIMARY KEY  (`followId`),
  KEY `userObj1` (`userObj1`),
  KEY `userObj2` (`userObj2`),
  CONSTRAINT `t_userfollow_ibfk_1` FOREIGN KEY (`userObj1`) REFERENCES `t_userinfo` (`user_name`),
  CONSTRAINT `t_userfollow_ibfk_2` FOREIGN KEY (`userObj2`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_userfollow
-- ----------------------------
INSERT INTO `t_userfollow` VALUES ('7', 'user1', 'user2', '2018-03-10 18:06:33');
INSERT INTO `t_userfollow` VALUES ('8', 'user1', 'user3', '2018-03-10 18:17:06');

-- ----------------------------
-- Table structure for `t_userinfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_userinfo`;
CREATE TABLE `t_userinfo` (
  `user_name` varchar(20) NOT NULL COMMENT 'user_name',
  `password` varchar(20) NOT NULL COMMENT '登录密码',
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `gender` varchar(4) NOT NULL COMMENT '性别',
  `birthDate` varchar(20) default NULL COMMENT '生日',
  `userImage` varchar(60) NOT NULL COMMENT '用户照片',
  `telephone` varchar(20) NOT NULL COMMENT '联系电话',
  `city` varchar(20) NOT NULL COMMENT '所在城市',
  `address` varchar(80) NOT NULL COMMENT '家庭地址',
  `email` varchar(50) default NULL COMMENT '邮箱',
  `paypalAccount` varchar(20) NOT NULL COMMENT 'paypal账户名',
  `createTime` varchar(20) default NULL COMMENT '注册时间',
  PRIMARY KEY  (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_userinfo
-- ----------------------------
INSERT INTO `t_userinfo` VALUES ('user1', '123', '双鱼林', '男', '2017-12-06', 'upload/6f900dc9-0257-4fa2-bbd9-48fe6a4d3457.jpg', '13958342342', '成都', '成都红星路13号', 'dashen@163.com', '15141441@qq.com', '2018-03-10 15:04:12');
INSERT INTO `t_userinfo` VALUES ('user2', '123', '李玲', '女', '2017-12-07', 'upload/7cebdfd7-171d-4832-8be2-4eedaca7930b.jpg', '13573598343', '北京', '北京海定区', '15141561@qq.com', 'liling@163.com', '2018-03-10 15:12:33');
INSERT INTO `t_userinfo` VALUES ('user3', '123', '王晓曦', '女', '2017-12-01', 'upload/db6b85ce-7efa-46d1-9731-8bdc312426e7.jpg', '13939840834', '南京', '南京飞机场路10号', '315141414@qq.com', 'wangxiaoxi@163.com', '2018-03-10 18:16:20');
