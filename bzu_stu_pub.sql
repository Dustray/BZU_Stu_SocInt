/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50525
Source Host           : localhost:3306
Source Database       : bzu_stu_pub

Target Server Type    : MYSQL
Target Server Version : 50525
File Encoding         : 65001

Date: 2015-12-20 10:19:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admininfo`
-- ----------------------------
DROP TABLE IF EXISTS `admininfo`;
CREATE TABLE `admininfo` (
  `adminID` int(11) NOT NULL DEFAULT '0',
  `adminName` varchar(50) DEFAULT '',
  `adminRealName` varchar(20) DEFAULT '',
  `adminPass` varchar(50) DEFAULT NULL,
  `adminAnno` varchar(150) DEFAULT '',
  PRIMARY KEY (`adminID`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of admininfo
-- ----------------------------
INSERT INTO `admininfo` VALUES ('1001', 'administrator', '尹越', '199558', 'aaaaaaaaaaa');

-- ----------------------------
-- Table structure for `comminfo`
-- ----------------------------
DROP TABLE IF EXISTS `comminfo`;
CREATE TABLE `comminfo` (
  `commID` int(11) NOT NULL AUTO_INCREMENT,
  `newsID` int(11) NOT NULL,
  `commuserName` varchar(20) CHARACTER SET utf8 NOT NULL,
  `commBody` varchar(140) CHARACTER SET utf8 NOT NULL,
  `commTime` datetime NOT NULL,
  PRIMARY KEY (`commID`),
  KEY `CommnewsID` (`newsID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of comminfo
-- ----------------------------
INSERT INTO `comminfo` VALUES ('1', '65', '张三', '真棒！', '2015-12-10 22:17:35');
INSERT INTO `comminfo` VALUES ('2', '65', '李四', '好', '2015-12-23 22:18:00');
INSERT INTO `comminfo` VALUES ('3', '66', 'dustray', '哈哈哈哈', '2015-12-10 22:18:33');
INSERT INTO `comminfo` VALUES ('4', '65', '李四', '嗯', '2015-12-19 22:18:54');
INSERT INTO `comminfo` VALUES ('5', '67', 'yxy', '还行', '2015-12-11 22:19:16');
INSERT INTO `comminfo` VALUES ('6', '67', '张三', '66666666', '2015-12-20 07:59:41');
INSERT INTO `comminfo` VALUES ('7', '64', 'dustray', '没你黑。。。。。。。', '2015-12-20 08:20:01');
INSERT INTO `comminfo` VALUES ('8', '73', 'yxy', '那么问题来了。。。BMG是谁。。。。。。。', '2015-12-20 08:27:15');
INSERT INTO `comminfo` VALUES ('9', '72', '王五', '根本不忍直视', '2015-12-20 08:31:49');
INSERT INTO `comminfo` VALUES ('10', '67', 'administrator', '（管理员）禁止水。。', '2015-12-20 08:33:21');
INSERT INTO `comminfo` VALUES ('12', '78', 'yxy', '闭嘴（zei）...', '2015-12-20 08:53:40');
INSERT INTO `comminfo` VALUES ('13', '73', '李四', '我不说话。。。', '2015-12-20 08:57:17');
INSERT INTO `comminfo` VALUES ('14', '80', '李四', '阿姨太敬业。。', '2015-12-20 08:58:01');
INSERT INTO `comminfo` VALUES ('15', '78', '李四', '虽然丑，，，，，，确实挺丑。。。。', '2015-12-20 08:59:40');
INSERT INTO `comminfo` VALUES ('16', '76', '李四', '不客气', '2015-12-20 08:59:58');
INSERT INTO `comminfo` VALUES ('17', '82', 'zhangsan', '发发发', '2015-12-20 10:09:51');
INSERT INTO `comminfo` VALUES ('18', '81', 'zhangsan', '呃呃呃', '2015-12-20 10:09:55');
INSERT INTO `comminfo` VALUES ('19', '80', 'administrator', '（管理员）ddd ', '2015-12-20 10:11:50');

-- ----------------------------
-- Table structure for `newsinfo`
-- ----------------------------
DROP TABLE IF EXISTS `newsinfo`;
CREATE TABLE `newsinfo` (
  `newsID` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) CHARACTER SET utf8 NOT NULL,
  `newsBody` varchar(140) CHARACTER SET utf8 NOT NULL,
  `newsGood` int(20) DEFAULT '0',
  `newsTime` datetime DEFAULT NULL,
  PRIMARY KEY (`newsID`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of newsinfo
-- ----------------------------
INSERT INTO `newsinfo` VALUES ('63', '飞碟说', '到底是道德的沦丧还是人性的扭曲。。。。。。。。。。', '0', '2015-12-10 08:13:49');
INSERT INTO `newsinfo` VALUES ('64', '悲催的非洲人', '人类好黑。。。', '0', '2015-12-16 08:12:48');
INSERT INTO `newsinfo` VALUES ('65', 'yxy', '第一个帖子', '21', '2015-12-15 21:52:41');
INSERT INTO `newsinfo` VALUES ('66', '张三', '第二条消息', '10', '2015-12-15 21:54:51');
INSERT INTO `newsinfo` VALUES ('67', '张三', '222222\r\n', '8', '2015-12-15 21:55:51');
INSERT INTO `newsinfo` VALUES ('68', 'dustray', '课程设计。。', '0', '2015-12-20 08:11:51');
INSERT INTO `newsinfo` VALUES ('69', '劳资员', '人在河边走哪有不湿鞋', '0', '2015-12-09 08:14:37');
INSERT INTO `newsinfo` VALUES ('70', '韬奋男孩', '对你爱爱爱不完。。', '0', '2015-12-01 08:15:17');
INSERT INTO `newsinfo` VALUES ('71', '飞碟说', '只是从未如此性感', '0', '2015-12-01 08:15:52');
INSERT INTO `newsinfo` VALUES ('72', 'dustray', '【 发改委不能带头颠覆契约精神 】 不到半个月时间，北京两次雾霾红色预警，比限行和拍号之前严重得多。单双号并没使雾霾有任何改善，最后还得靠风吹。发改委以油价下调会加重雾霾为借口，不经任何程序就改变油价定价规则，真是滑天下之大稽。号称小国务院的发改委如此失信，中国的契约社会如何建立', '0', '2015-12-20 08:20:46');
INSERT INTO `newsinfo` VALUES ('73', 'dustray', '20年前的今天，BMG唱片發行了這張專輯。從此以後，人生就不一樣了...', '0', '2015-12-20 08:21:21');
INSERT INTO `newsinfo` VALUES ('74', 'yxy', '黄秋生因迫于生计，急于澄清他并没有支持占中，不惜以某剧团的名义发表声明，声称要对我保留法律追诉权…我告诉你吧黄兄，千万不要保留法律追诉权，我要求立刻去告我！只有这样才能逼出真相，真相是你支持占中！许多材料我是给律师看的，不会给你看。王晶与你绝交、你绝食抗议、你摆手势…你反对占中？', '0', '2015-12-20 08:23:47');
INSERT INTO `newsinfo` VALUES ('78', '尼古拉斯·赵四', '初来乍到，这系统不忍直视。。', '0', '2015-12-20 08:37:10');
INSERT INTO `newsinfo` VALUES ('79', 'yxy', '“我的梦想是，希望中国人的下一代可以在任何一个晚上站在任何一个地方说出心里想说的话，而心中没有任何恐惧。我们这一代人所做的种种努力也不过是希望我们的下一代将来会有免于恐惧的自由。”', '0', '2015-12-20 08:53:00');

-- ----------------------------
-- Table structure for `safeinfo`
-- ----------------------------
DROP TABLE IF EXISTS `safeinfo`;
CREATE TABLE `safeinfo` (
  `userName` varchar(255) NOT NULL,
  `ques1` varchar(255) DEFAULT NULL,
  `answ1` varchar(255) DEFAULT NULL,
  `ques2` varchar(255) DEFAULT NULL,
  `answ2` varchar(255) DEFAULT NULL,
  `ques3` varchar(255) DEFAULT NULL,
  `answ3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userName`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of safeinfo
-- ----------------------------
INSERT INTO `safeinfo` VALUES ('yxy', '您初一班主任是谁？', '啊', '您最喜欢的一本书是什么？', '啊啊', '您母亲的名字？', '啊啊啊');
INSERT INTO `safeinfo` VALUES ('zhangsan', '您手机后四位是多少？', '1', '您的第一部手机是什么牌子的？', '2', '您就读于哪所小学？', '3');
INSERT INTO `safeinfo` VALUES ('张三', '您初一班主任是谁？', '1', '您最喜欢的一本书是什么？', '2', '您母亲的名字？', '3');

-- ----------------------------
-- Table structure for `userinfo`
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `userSige` varchar(140) DEFAULT NULL,
  `userAge` int(11) DEFAULT NULL,
  `userSex` char(10) CHARACTER SET utf8 DEFAULT NULL,
  `userQQ` bigint(12) DEFAULT NULL,
  `userAdd` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `userEmail` varchar(50) CHARACTER SET utf8 NOT NULL,
  `userInteg` int(11) NOT NULL DEFAULT '0',
  `userLevel` int(11) NOT NULL DEFAULT '1',
  `userPass` varchar(25) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=10000009 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('10000001', '张三', '失败是成功之母啊', '20', '男', '14658236', '山东德州', '14658236@qq.com', '149', '5', '111111');
INSERT INTO `userinfo` VALUES ('10000002', '李四', '我的剑就是你的剑', '19', '男', '64648897', '北京朝阳区', '64648897@qq.com', '265', '7', '111111');
INSERT INTO `userinfo` VALUES ('10000003', '王五', '心好累。。。。。。', '21', '男', '465665566', '山东临沂', '465665566@qq.com', '16', '1', '111111');
INSERT INTO `userinfo` VALUES ('10000004', 'Dustray', '课程设计', '20', '男', '3253425', null, '3253425@qq.com', '32', '2', '111111');
INSERT INTO `userinfo` VALUES ('10000005', '非洲娃娃', '我好黑。。。', '20', '男', null, null, 'hhghg@126.com', '0', '1', '111111');
INSERT INTO `userinfo` VALUES ('10000006', 'yxy', null, '21', '男', null, '山东青岛', '1360741742@qq.com', '64', '3', '111111');
INSERT INTO `userinfo` VALUES ('10000007', '尼古拉斯·赵四', null, '66', '男', null, '东北大嘴巴子乡', '741742@wwww.com', '16', '1', '111111');
INSERT INTO `userinfo` VALUES ('10000008', 'zhangsan', null, '11', '男', null, '啊啊', 'ss@s.s', '24', '2', '222222');
