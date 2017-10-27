/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50530
Source Host           : localhost:3306
Source Database       : dnow

Target Server Type    : MYSQL
Target Server Version : 50530
File Encoding         : 65001

Date: 2013-08-29 09:11:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `address`
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `AID` int(11) NOT NULL AUTO_INCREMENT,
  `UID` int(11) NOT NULL,
  `ADDRESS_NAME` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`AID`),
  KEY `UID` (`UID`),
  CONSTRAINT `address_ibfk_1` FOREIGN KEY (`UID`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES ('1', '4', '天津市南开区卫津路94号南开大学');
INSERT INTO `address` VALUES ('3', '8', '天津市南开区卫津路94号南开大学');
INSERT INTO `address` VALUES ('4', '8', '辽宁省鞍山市海城县');
INSERT INTO `address` VALUES ('5', '9', '天津市和平区滨江道208号');
INSERT INTO `address` VALUES ('6', '10', '天津市开发区第三大街32号');
INSERT INTO `address` VALUES ('7', '11', '天津市河西区友谊北路60号金河购物广场');
INSERT INTO `address` VALUES ('8', '12', '天津市丁字沽一号路凯莱赛商厦1层');
INSERT INTO `address` VALUES ('9', '13', '天津市红桥区大胡同38号');
INSERT INTO `address` VALUES ('10', '14', '天津市南京路108号');
INSERT INTO `address` VALUES ('11', '15', '天津市东马路55号');
INSERT INTO `address` VALUES ('12', '5', '天津市河东区中山门新村口1号路19号');
INSERT INTO `address` VALUES ('13', '6', '天津市河西区大沽南路501号');
INSERT INTO `address` VALUES ('14', '7', '天津市南开区红旗路242号华润万家天环店旁');
INSERT INTO `address` VALUES ('16', '4', '浙江省慈溪市附海镇');
INSERT INTO `address` VALUES ('17', '10', '天津市塘沽区滨海公寓');

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `adminid` int(11) NOT NULL AUTO_INCREMENT,
  `adminname` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`adminid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', '刘艾伦', 'lal');
INSERT INTO `admin` VALUES ('2', '张宝乐', 'zbl');
INSERT INTO `admin` VALUES ('3', '史慧珂', 'shhk');
INSERT INTO `admin` VALUES ('4', '鲁延嗣', 'lys');
INSERT INTO `admin` VALUES ('5', 'swike', 'shi');

-- ----------------------------
-- Table structure for `brand`
-- ----------------------------
DROP TABLE IF EXISTS `brand`;
CREATE TABLE `brand` (
  `BID` int(11) NOT NULL AUTO_INCREMENT,
  `BRAND` varchar(50) NOT NULL,
  `picture` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`BID`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brand
-- ----------------------------
INSERT INTO `brand` VALUES ('1', '联想（Lenovo）', 'Lenovo.jpg');
INSERT INTO `brand` VALUES ('2', '华硕（ASUS）', 'ASUS.jpg');
INSERT INTO `brand` VALUES ('3', '惠普（HP）', 'HP.jpg');
INSERT INTO `brand` VALUES ('4', '宏基（Aser）', 'Aser.jpg');
INSERT INTO `brand` VALUES ('5', 'ThinkPad', 'Thinkpad.jpg');
INSERT INTO `brand` VALUES ('6', '神州（HASEE）', 'HASEE.jpg');
INSERT INTO `brand` VALUES ('7', '索尼（SONY）', 'SONY.jpg');
INSERT INTO `brand` VALUES ('8', '戴尔（DELL）', 'DELL.jpg');
INSERT INTO `brand` VALUES ('9', '东芝（TOSHIBA）', 'TOSHIBA.jpg');
INSERT INTO `brand` VALUES ('10', '英特尔（Intel）', 'Intel.jpg');
INSERT INTO `brand` VALUES ('11', 'AMD', 'AMD.jpg');
INSERT INTO `brand` VALUES ('13', '微星（msi）', 'msi.jpg');
INSERT INTO `brand` VALUES ('14', '技嘉（GIGABYTE）', 'GIGABYTE.jpg');
INSERT INTO `brand` VALUES ('15', '华擎（ASRock）', 'ASRock.jpg');
INSERT INTO `brand` VALUES ('18', '七彩虹（Colorful）', 'Colorful.jpg');
INSERT INTO `brand` VALUES ('20', '映泰（BIOSTAR）', 'BIOSTAR.jpg');
INSERT INTO `brand` VALUES ('21', '蓝宝石（Sapphire）', 'Sapphire.jpg');
INSERT INTO `brand` VALUES ('31', '西部数据（WD）', 'WD.jpg');
INSERT INTO `brand` VALUES ('35', '麦克赛尔（Maxell）', 'Maxell.jpg');
INSERT INTO `brand` VALUES ('39', '闪迪（SanDisk）', 'SanDisk.jpg');
INSERT INTO `brand` VALUES ('40', '金士顿（Kingston）', 'Kingston.jpg');
INSERT INTO `brand` VALUES ('47', '三星（SAMSUNG）', 'SAMSUNG.jpg');
INSERT INTO `brand` VALUES ('48', '苹果（Apple）', 'Apple.jpg');
INSERT INTO `brand` VALUES ('49', '微软（microsoft）', 'microsoft.jpg');
INSERT INTO `brand` VALUES ('50', '芝奇（G.SKILL）', 'G.SKILL.jpg');
INSERT INTO `brand` VALUES ('51', '海盗船（CORSAIR）', 'CORSAIR.jpg');
INSERT INTO `brand` VALUES ('52', '爱国者（aigo）', 'aigo.jpg');
INSERT INTO `brand` VALUES ('53', '至睿（vision）', 'vision.jpg');
INSERT INTO `brand` VALUES ('54', '酷冷至尊（CoolerMaster）', 'CoolerMaster.jpg');
INSERT INTO `brand` VALUES ('55', '创新（Creative）', 'Creative.jpg');
INSERT INTO `brand` VALUES ('56', '飚王（SSK）', 'SSK.jpg');
INSERT INTO `brand` VALUES ('57', '奥睿科（ORICO）', 'ORICO.jpg');
INSERT INTO `brand` VALUES ('58', '赛睿（SteelSeries）', 'SteelSeries.jpg');
INSERT INTO `brand` VALUES ('59', '北通（Betop）', 'Betop.jpg');
INSERT INTO `brand` VALUES ('60', '宜客莱（ECOLA）', 'ECOLA.jpg');

-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(50) NOT NULL,
  `parentid` int(11) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '电脑整机', '0');
INSERT INTO `category` VALUES ('2', '电脑配件', '0');
INSERT INTO `category` VALUES ('3', '外设产品', '0');
INSERT INTO `category` VALUES ('4', '笔记本', '1');
INSERT INTO `category` VALUES ('5', '超级本', '1');
INSERT INTO `category` VALUES ('6', '上网本', '1');
INSERT INTO `category` VALUES ('7', '平板电脑', '1');
INSERT INTO `category` VALUES ('8', '台式机', '1');
INSERT INTO `category` VALUES ('9', '服务器', '1');
INSERT INTO `category` VALUES ('10', 'CPU', '2');
INSERT INTO `category` VALUES ('11', '主板', '2');
INSERT INTO `category` VALUES ('12', '显卡', '2');
INSERT INTO `category` VALUES ('13', '硬盘', '2');
INSERT INTO `category` VALUES ('14', '内存', '2');
INSERT INTO `category` VALUES ('15', '机箱', '2');
INSERT INTO `category` VALUES ('16', '电源', '2');
INSERT INTO `category` VALUES ('17', '显示器', '2');
INSERT INTO `category` VALUES ('18', '刻录机/光驱', '2');
INSERT INTO `category` VALUES ('19', '散热器', '2');
INSERT INTO `category` VALUES ('20', '声卡', '2');
INSERT INTO `category` VALUES ('21', '鼠标', '3');
INSERT INTO `category` VALUES ('22', '键盘', '3');
INSERT INTO `category` VALUES ('23', '移动硬盘', '3');
INSERT INTO `category` VALUES ('24', 'U盘', '3');
INSERT INTO `category` VALUES ('25', '摄像头', '3');
INSERT INTO `category` VALUES ('26', '外置盒', '3');
INSERT INTO `category` VALUES ('27', '游戏设备', '3');
INSERT INTO `category` VALUES ('28', '鼠标垫', '3');
INSERT INTO `category` VALUES ('29', '电脑清洁', '3');

-- ----------------------------
-- Table structure for `collection`
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PID` int(11) NOT NULL,
  `UID` int(11) NOT NULL,
  `TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `PID` (`PID`),
  KEY `UID` (`UID`),
  CONSTRAINT `collection_ibfk_1` FOREIGN KEY (`PID`) REFERENCES `product` (`PID`),
  CONSTRAINT `collection_ibfk_2` FOREIGN KEY (`UID`) REFERENCES `user` (`UID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of collection
-- ----------------------------
INSERT INTO `collection` VALUES ('1', '1', '4', '2013-08-22 20:32:34');
INSERT INTO `collection` VALUES ('2', '18', '4', '2013-08-22 20:33:18');
INSERT INTO `collection` VALUES ('3', '33', '4', '2013-08-22 20:33:38');
INSERT INTO `collection` VALUES ('4', '78', '4', '2013-08-22 20:33:47');
INSERT INTO `collection` VALUES ('5', '111', '4', '2013-08-22 20:33:55');
INSERT INTO `collection` VALUES ('6', '2', '8', '2013-08-22 20:34:14');
INSERT INTO `collection` VALUES ('7', '27', '8', '2013-08-22 20:34:24');
INSERT INTO `collection` VALUES ('8', '56', '8', '2013-08-22 20:34:33');
INSERT INTO `collection` VALUES ('9', '120', '8', '2013-08-22 20:34:53');

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `ID` int(25) NOT NULL AUTO_INCREMENT,
  `PID` int(25) NOT NULL,
  `UID` int(25) NOT NULL,
  `DETAIL` varchar(300) NOT NULL,
  `SCORE` int(10) NOT NULL,
  `TIME` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `PID` (`PID`),
  KEY `UID` (`UID`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`PID`) REFERENCES `product` (`pid`),
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`UID`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '1', '5', '总体感觉不错，运行速度挺快的。发货速度也相当快，上午下的单，中午就到自提点了。价格相对i5的机子来说也是比较便宜的。用来快一个月了，还没发现什么问题。就是win8系统用起来不顺手，而且一些应用软件在win8平台上还不能用，所以自己改装win7系统了，当然这与机器的品质无关。谢谢京东', '5', '2013-08-23 14:28:28');
INSERT INTO `comment` VALUES ('2', '1', '7', '一直支持联想，国产的骄傲~~硬件给力', '4', '2013-08-23 14:28:30');
INSERT INTO `comment` VALUES ('3', '1', '8', '送货速度超级快，2个小时就送到了！用着也舒服！', '5', '2013-08-23 14:28:33');
INSERT INTO `comment` VALUES ('4', '1', '9', '其他的有些问题确实有，比如音量键的问题。。。总体说来还是正版货', '3', '2013-08-23 14:28:35');
INSERT INTO `comment` VALUES ('5', '2', '5', '超级给力的价格。比别的网便宜两百多！性价比高', '5', '2013-08-23 14:23:14');
INSERT INTO `comment` VALUES ('6', '2', '6', '支持D_Now，这么给力的价格买到这机子！', '4', '2013-08-23 14:23:59');
INSERT INTO `comment` VALUES ('7', '2', '7', '没有红色的款只能选这个色。没有装系统，裸机一个连鼠标都没有其它方面暂时还行。就是电池好像不是很耐用。', '3', '2013-08-23 14:24:39');
INSERT INTO `comment` VALUES ('8', '2', '10', '整体不错，就是键盘有点瑕疵，有高有低的不一致', '3', '2013-08-23 14:30:26');
INSERT INTO `comment` VALUES ('9', '16', '8', '使用当中，最深的感受就是电脑非常的卡。', '2', '2013-08-23 15:06:54');
INSERT INTO `comment` VALUES ('10', '16', '9', '没想到屏幕那么小，早知道买大点的屏了。装系统费了不少劲啊。还好现在装上了。用U盘装的系统。现在学会了。装的WIN7 。还在使用中。。。', '3', '2013-08-23 15:06:56');
INSERT INTO `comment` VALUES ('11', '16', '13', '电脑用上四五个小时后，手碰到前端的边缘有触电感觉，我要换货', '1', '2013-08-23 15:07:00');
INSERT INTO `comment` VALUES ('12', '16', '14', '拿到笔记本有点失望，做工有点粗糙，显示屏幕没有贴膜保护，触摸板没装好，倾斜了，上边凸起。下面鼠标键地方的空隙比较大，感觉就像伪劣产品......', '2', '2013-08-23 15:07:03');
INSERT INTO `comment` VALUES ('13', '18', '7', '显卡有点垃圾！播放视频快进时图像直哆嗦！', '2', '2013-08-23 14:34:44');
INSERT INTO `comment` VALUES ('14', '18', '8', '发货速度好快，电脑目前很好用。', '4', '2013-08-23 14:36:19');
INSERT INTO `comment` VALUES ('15', '18', '10', '这个配置还可以了，价格也很便宜的，比较实用', '5', '2013-08-23 14:36:58');
INSERT INTO `comment` VALUES ('16', '18', '12', '性价比还可以，就是外观比较一般，还好是不锈钢拉丝的可以', '4', '2013-08-23 14:37:28');
INSERT INTO `comment` VALUES ('17', '50', '5', '给公司买的，日常使用应该够了', '5', '2013-08-23 14:38:15');
INSERT INTO `comment` VALUES ('18', '50', '6', '喜欢这个品牌，多年用户。', '5', '2013-08-23 15:09:28');
INSERT INTO `comment` VALUES ('19', '50', '7', '帮朋友买的，说速度很快！', '4', '2013-08-23 15:09:41');
INSERT INTO `comment` VALUES ('20', '50', '8', '接近2K的U，不说话，效果太好了', '8', '2013-08-25 13:58:39');
INSERT INTO `comment` VALUES ('21', '55', '4', '喜欢这个品牌，多年用户。', '4', '2013-08-23 15:17:20');
INSERT INTO `comment` VALUES ('22', '55', '5', '很给力', '5', '2013-08-23 15:17:42');
INSERT INTO `comment` VALUES ('23', '55', '6', '很不错', '5', '2013-08-23 15:20:25');
INSERT INTO `comment` VALUES ('24', '55', '9', '不赖哦', '5', '2013-08-23 15:20:28');
INSERT INTO `comment` VALUES ('25', '104', '5', '大品牌，价格合理。', '4', '2013-08-23 15:20:18');
INSERT INTO `comment` VALUES ('26', '104', '7', '对得起这个价格了 说实话', '5', '2013-08-23 15:20:40');
INSERT INTO `comment` VALUES ('27', '104', '9', '做工没得说', '3', '2013-08-23 15:22:03');
INSERT INTO `comment` VALUES ('28', '104', '13', '给同事购买，还不错。', '5', '2013-08-23 15:22:31');
INSERT INTO `comment` VALUES ('29', '109', '4', '价格便宜· ·····', '5', '2013-08-23 15:23:52');
INSERT INTO `comment` VALUES ('30', '109', '5', '还可以的,送货比较快', '4', '2013-08-23 15:24:25');
INSERT INTO `comment` VALUES ('31', '109', '4', '一次愉快的购物。', '5', '2013-08-23 15:25:13');
INSERT INTO `comment` VALUES ('32', '109', '11', '一般般吧', '3', '2013-08-23 15:26:09');

-- ----------------------------
-- Table structure for `order_form`
-- ----------------------------
DROP TABLE IF EXISTS `order_form`;
CREATE TABLE `order_form` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` varchar(16) NOT NULL,
  `uid` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `time` datetime NOT NULL,
  `address` varchar(50) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `count` int(11) NOT NULL,
  `total` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `UID` (`uid`),
  KEY `address` (`address`),
  CONSTRAINT `order_form_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_form
-- ----------------------------
INSERT INTO `order_form` VALUES ('1', 'hfjdaosieH371280', '4', '4', '2013-08-23 10:02:04', '天津市南开区卫津路94号南开大学', '15141245436', '张三', '5', '22995');
INSERT INTO `order_form` VALUES ('2', 'jas3k1lsdG290388', '4', '4', '2013-08-23 10:03:04', '天津市南开区卫津路94号南开大学', '15141245436', '张三', '11', '29619');
INSERT INTO `order_form` VALUES ('3', 'hdGJklIDL9018271', '8', '1', '2013-08-23 10:05:43', '天津市南开区卫津路94号南开大学', '15504126632', '孙金', '8', '2928');
INSERT INTO `order_form` VALUES ('4', 'HFuaisnhkl290831', '8', '4', '2013-08-23 10:06:25', '天津市南开区卫津路94号南开大学', '15504126632', '孙金', '2', '10798');
INSERT INTO `order_form` VALUES ('5', 'hdajui89mk908139', '9', '2', '2013-08-23 10:08:17', '天津市和平区滨江道208号', '15998073762', '刘伟', '2', '14598');
INSERT INTO `order_form` VALUES ('6', 'huiklosnum908617', '9', '4', '2013-08-23 10:09:04', '天津市和平区滨江道208号', '15998073762', '刘伟', '4', '14796');
INSERT INTO `order_form` VALUES ('7', 'hud89Gkjio098753', '10', '1', '2013-08-23 10:11:06', '天津市开发区第三大街32号', '13842227629', '杜长林', '2', '1178');
INSERT INTO `order_form` VALUES ('8', 'hhdTYul9ni098720', '10', '3', '2013-08-23 10:11:52', '天津市开发区第三大街32号', '13842227629', '杜长林', '3', '837');
INSERT INTO `order_form` VALUES ('9', 'hdasoiun9J098715', '4', '4', '2013-08-23 11:19:44', '天津市南开区卫津路94号南开大学', '15141245436', '张三', '7', '3928');
INSERT INTO `order_form` VALUES ('10', 'hansduI0ko098730', '4', '3', '2013-08-23 11:21:06', '天津市南开区卫津路94号南开大学', '15141245436', '张三', '4', '1094');
INSERT INTO `order_form` VALUES ('11', 'hduasj89nI908216', '4', '1', '2013-08-23 11:21:42', '浙江省宁波市慈溪县', '15141245436', '张三', '5', '38988');
INSERT INTO `order_form` VALUES ('12', 'usyhNYa78z091825', '4', '3', '2013-08-23 11:22:42', '浙江省宁波市慈溪县', '15141245436', '张三', '5', '12915');
INSERT INTO `order_form` VALUES ('13', 'dhuasnxyio091276', '4', '4', '2013-08-23 11:23:11', '天津市南开区卫津路94号南开大学', '15141245436', '张三', '5', '17973');
INSERT INTO `order_form` VALUES ('14', 'duaQ89Bnua827315', '4', '3', '2013-08-23 11:23:29', '浙江省宁波市慈溪县', '15141245436', '张三', '14', '49186');
INSERT INTO `order_form` VALUES ('15', 'dyasxnuay1890765', '4', '3', '2013-08-23 11:24:02', '天津市南开区卫津路94号南开大学', '15141245436', '张三', '11', '35390');
INSERT INTO `order_form` VALUES ('16', 'dhasxunays890127', '4', '3', '2013-08-23 11:24:35', '浙江省宁波市慈溪县', '15141245436', '张三', '1', '4599');
INSERT INTO `order_form` VALUES ('17', 'dasxughASi901872', '4', '3', '2013-08-23 11:24:54', '浙江省宁波市慈溪县', '15141245436', '张三', '7', '7923');
INSERT INTO `order_form` VALUES ('18', 'dasxualqsI901273', '4', '3', '2013-08-23 11:25:15', '天津市南开区卫津路94号南开大学', '15141245436', '张三', '6', '1384');
INSERT INTO `order_form` VALUES ('21', 'dkaxoaisxm718203', '4', '4', '2013-08-23 11:25:41', '浙江省宁波市慈溪县', '15141245436', '张三', '17', '3337');
INSERT INTO `order_form` VALUES ('22', 'daJJ89bnas891367', '5', '3', '2013-08-23 11:26:31', '天津市河东区中山门新村口1号路19号', '18842677606', '李四', '17', '76983');
INSERT INTO `order_form` VALUES ('23', 'dajxusolas278901', '5', '3', '2013-08-23 11:28:15', '天津市河东区中山门新村口1号路19号', '18842677606', '李四', '5', '5412');
INSERT INTO `order_form` VALUES ('24', 'dajxsiomas782910', '5', '4', '2013-08-23 11:28:42', '天津市河东区中山门新村口1号路19号', '18842677606', '李四', '17', '4223');
INSERT INTO `order_form` VALUES ('25', 'dkaxjsuxnj276830', '5', '2', '2013-08-23 11:28:56', '天津市河东区中山门新村口1号路19号', '18842677606', '李四', '20', '72980');
INSERT INTO `order_form` VALUES ('26', 'dkasxjhazu278910', '5', '3', '2013-08-23 11:29:15', '天津市河东区中山门新村口1号路19号', '18842677606', '李四', '10', '128900');
INSERT INTO `order_form` VALUES ('27', 'djaxxsheui892013', '5', '3', '2013-08-23 11:29:30', '天津市河东区中山门新村口1号路19号', '18842677606', '李四', '10', '7890');
INSERT INTO `order_form` VALUES ('28', 'jcajxuasUI901273', '5', '3', '2013-08-23 11:29:44', '天津市河东区中山门新村口1号路19号', '18842677606', '李四', '7', '1033');
INSERT INTO `order_form` VALUES ('29', 'djxyaHA79j937138', '5', '4', '2013-08-23 11:30:01', '天津市河东区中山门新村口1号路19号', '18842677606', '李四', '9', '75591');
INSERT INTO `order_form` VALUES ('30', 'daxnyNJys8827389', '5', '4', '2013-08-23 11:30:22', '天津市河东区中山门新村口1号路19号', '18842677606', '李四', '14', '63086');
INSERT INTO `order_form` VALUES ('31', 'djanxhanid891729', '5', '1', '2013-08-23 11:30:44', '天津市河东区中山门新村口1号路19号', '18842677606', '李四', '18', '136205');
INSERT INTO `order_form` VALUES ('32', 'hsudakyuyG781263', '5', '2', '2013-08-23 11:31:10', '天津市河东区中山门新村口1号路19号', '18842677606', '李四', '11', '2149');
INSERT INTO `order_form` VALUES ('33', 'hausGGshja908131', '6', '2', '2013-08-23 11:49:38', '天津市河西区大沽南路501号', '18241891085', '王五', '19', '85981');
INSERT INTO `order_form` VALUES ('34', 'djahsuakbm789273', '6', '3', '2013-08-23 11:51:12', '天津市河西区大沽南路501号', '18241891085', '王五', '30', '92870');
INSERT INTO `order_form` VALUES ('35', 'hdasjxuhJk908123', '6', '3', '2013-08-23 11:51:27', '天津市河西区大沽南路501号', '18241891085', '王五', '20', '9520');
INSERT INTO `order_form` VALUES ('36', 'HGuasnxhas908312', '6', '4', '2013-08-23 11:52:31', '天津市河西区大沽南路501号', '18241891085', '王五', '10', '3490');
INSERT INTO `order_form` VALUES ('37', 'hsuxnaisua889131', '6', '3', '2013-08-23 11:52:51', '天津市河西区大沽南路501号', '18817323261', '张雷', '20', '3180');
INSERT INTO `order_form` VALUES ('38', 'fasJ8ajUii831283', '6', '4', '2013-08-23 11:53:09', '天津市河西区大沽南路501号', '18817323261', '张雷', '1', '2399');
INSERT INTO `order_form` VALUES ('39', 'vzxisasiua908138', '6', '4', '2013-08-23 11:53:25', '天津市河西区大沽南路501号', '18817323261', '张雷', '2', '5998');
INSERT INTO `order_form` VALUES ('40', 'jfasxaiuUY831283', '6', '3', '2013-08-23 11:53:54', '天津市河西区大沽南路501号', '18817323261', '张雷', '3', '8997');
INSERT INTO `order_form` VALUES ('41', 'faskxiHAhs882618', '6', '3', '2013-08-23 11:54:22', '天津市河西区大沽南路501号', '18817323261', '张雷', '2', '5798');
INSERT INTO `order_form` VALUES ('42', 'djanxjsuxi781820', '6', '3', '2013-08-23 11:54:42', '天津市河西区大沽南路501号', '18817323261', '张雷', '4', '3196');
INSERT INTO `order_form` VALUES ('43', 'jfasjJAXUo190273', '7', '3', '2013-08-23 11:56:16', '天津市南开区红旗路242号华润万家天环店旁', '18607103136', '李伟', '7', '27993');
INSERT INTO `order_form` VALUES ('44', 'fjakxiajsj891738', '7', '3', '2013-08-23 11:57:14', '天津市南开区红旗路242号华润万家天环店旁', '18607103136', '李伟', '7', '34993');
INSERT INTO `order_form` VALUES ('45', 'fjsjxloiqe789203', '7', '4', '2013-08-23 11:57:38', '天津市南开区红旗路242号华润万家天环店旁', '18607103136', '李伟', '15', '54185');
INSERT INTO `order_form` VALUES ('46', 'JGusiaosnx671920', '7', '3', '2013-08-23 11:57:57', '天津市南开区红旗路242号华润万家天环店旁', '18607103136', '李伟', '11', '9791');
INSERT INTO `order_form` VALUES ('47', 'khhJhfUAj7816319', '7', '4', '2013-08-23 11:59:35', '天津市南开区红旗路242号华润万家天环店旁', '18607103136', '李伟', '11', '3269');
INSERT INTO `order_form` VALUES ('48', 'fksuxnuiqe183729', '7', '2', '2013-08-23 11:59:46', '天津市南开区红旗路242号华润万家天环店旁', '18842683382', '赵小楠', '6', '39861');
INSERT INTO `order_form` VALUES ('49', 'fsuxnaYtan712839', '7', '3', '2013-08-23 12:00:02', '天津市南开区红旗路242号华润万家天环店旁', '18842683382', '赵小楠', '10', '31440');
INSERT INTO `order_form` VALUES ('50', 'gaYAAhajuG817392', '7', '4', '2013-08-23 12:00:15', '天津市南开区红旗路242号华润万家天环店旁', '18842683382', '赵小楠', '16', '11024');
INSERT INTO `order_form` VALUES ('51', 'jshYYhhYYY162789', '7', '4', '2013-08-23 12:00:34', '天津市南开区红旗路242号华润万家天环店旁', '18842683382', '赵小楠', '1', '139');
INSERT INTO `order_form` VALUES ('52', 'DHAuuHgays276189', '7', '3', '2013-08-23 12:00:56', '天津市南开区红旗路242号华润万家天环店旁', '18842683382', '赵小楠', '1', '279');
INSERT INTO `order_form` VALUES ('53', 'jfasUUIAnU176302', '8', '3', '2013-08-23 12:02:33', '天津市南开区卫津路94号南开大学', '18221050488', '韩梅梅', '14', '63986');
INSERT INTO `order_form` VALUES ('54', 'AJuaydHSUi182739', '8', '3', '2013-08-23 12:02:42', '天津市南开区卫津路94号南开大学', '18221050488', '韩梅梅', '15', '53085');
INSERT INTO `order_form` VALUES ('55', 'djsUAjauIO183629', '8', '3', '2013-08-23 12:02:52', '天津市南开区卫津路94号南开大学', '18221050488', '韩梅梅', '14', '15758');
INSERT INTO `order_form` VALUES ('56', 'SJuyxmzIAU817312', '8', '3', '2013-08-23 12:03:04', '天津市南开区卫津路94号南开大学', '18221050488', '韩梅梅', '6', '2094');
INSERT INTO `order_form` VALUES ('57', 'faskNAUSia128310', '8', '4', '2013-08-23 12:03:15', '天津市南开区卫津路94号南开大学', '18810719454', '黄玲', '7', '1113');
INSERT INTO `order_form` VALUES ('58', 'fsaUASAqwa371431', '8', '4', '2013-08-23 12:03:33', '天津市南开区卫津路94号南开大学', '18810719454', '黄玲', '5', '1395');
INSERT INTO `order_form` VALUES ('59', 'dqeyNAUZka178312', '8', '4', '2013-08-23 12:03:44', '天津市南开区卫津路94号南开大学', '18810719454', '黄玲', '6', '5256');
INSERT INTO `order_form` VALUES ('60', 'fdaxnuZUNU378129', '8', '2', '2013-08-23 12:03:54', '天津市南开区卫津路94号南开大学', '18810719454', '黄玲', '8', '27992');
INSERT INTO `order_form` VALUES ('61', 'FDusnxUZSI312738', '8', '3', '2013-08-23 12:04:10', '天津市南开区卫津路94号南开大学', '18842686402', '李雷', '17', '10243');
INSERT INTO `order_form` VALUES ('62', 'FDXnuxaAUS213829', '8', '2', '2013-08-23 12:04:24', '天津市南开区卫津路94号南开大学', '18842686402', '李雷', '6', '1194');
INSERT INTO `order_form` VALUES ('63', 'FSXNzushAY281328', '8', '1', '2013-08-23 12:04:43', '天津市南开区卫津路94号南开大学', '18842686402', '李雷', '6', '834');
INSERT INTO `order_form` VALUES ('64', 'qwztysYATS731829', '9', '3', '2013-08-23 12:05:56', '天津市和平区滨江道208号', '15998073762', '刘伟', '8', '31992');
INSERT INTO `order_form` VALUES ('65', 'sjsUbYbNiV336128', '9', '3', '2013-08-23 12:06:05', '天津市和平区滨江道208号', '15998073762', '刘伟', '8', '39992');
INSERT INTO `order_form` VALUES ('66', 'FSnzDAdaZU361283', '9', '3', '2013-08-23 12:06:30', '天津市和平区滨江道208号', '15998073762', '刘伟', '13', '15280');
INSERT INTO `order_form` VALUES ('67', 'SDjsiSJAOu182931', '9', '2', '2013-08-23 12:06:39', '天津市和平区滨江道208号', '15998073762', '刘伟', '19', '2591');
INSERT INTO `order_form` VALUES ('68', 'asdZNUSdas283193', '9', '1', '2013-08-23 12:06:51', '天津市和平区滨江道208号', '13332453712', '孔亮', '3', '26874');
INSERT INTO `order_form` VALUES ('69', 'daxIZsazZI123298', '9', '4', '2013-08-23 12:07:04', '天津市和平区滨江道208号', '13332453712', '孔亮', '5', '19495');
INSERT INTO `order_form` VALUES ('70', 'FJSHX21nda123480', '9', '4', '2013-08-23 12:07:20', '天津市和平区滨江道208号', '13332453712', '孔亮', '12', '55988');
INSERT INTO `order_form` VALUES ('71', 'jsxUASz321738129', '9', '2', '2013-08-23 12:07:31', '天津市和平区滨江道208号', '13332453712', '孔亮', '8', '19192');
INSERT INTO `order_form` VALUES ('72', 'faxasuiaso362719', '9', '1', '2013-08-23 12:07:41', '天津市和平区滨江道208号', '13332453712', '孔亮', '9', '19791');
INSERT INTO `order_form` VALUES ('73', 'daYDAS13ZX312398', '10', '3', '2013-08-23 12:08:40', '天津市开发区第三大街32号', '13842227629', '杜长林', '21', '117569');
INSERT INTO `order_form` VALUES ('74', 'fdxSYU21BS731221', '10', '5', '2013-08-23 12:08:48', '天津市开发区第三大街32号', '13842227629', '杜长林', '24', '105676');
INSERT INTO `order_form` VALUES ('75', 'FSDsjan67U183298', '10', '3', '2013-08-23 12:09:04', '天津市开发区第三大街32号', '13842227629', '杜长林', '5', '5412');
INSERT INTO `order_form` VALUES ('76', 'SHay76daBy172839', '10', '4', '2013-08-23 12:09:16', '天津市开发区第三大街32号', '13842227629', '杜长林', '15', '3715');
INSERT INTO `order_form` VALUES ('77', 'fasdaYHA78172839', '10', '3', '2013-08-23 12:09:30', '天津市开发区第三大街32号', '13234284728', '欧阳镇东', '7', '55993');
INSERT INTO `order_form` VALUES ('78', 'FShsuNXI78129373', '10', '2', '2013-08-23 12:09:41', '天津市开发区第三大街32号', '13234284728', '欧阳镇东', '8', '30392');
INSERT INTO `order_form` VALUES ('79', 'vzxnhfsnua123131', '10', '4', '2013-08-23 12:09:54', '天津市开发区第三大街32号', '13234284728', '欧阳镇东', '2', '4798');
INSERT INTO `order_form` VALUES ('80', 'HUAhus61sh371290', '10', '4', '2013-08-23 12:10:05', '天津市开发区第三大街32号', '13234284728', '欧阳镇东', '7', '15393');
INSERT INTO `order_form` VALUES ('81', 'zcbysn78UO190238', '10', '4', '2013-08-23 12:10:19', '天津市开发区第三大街32号', '13234284728', '欧阳镇东', '1', '2999');
INSERT INTO `order_form` VALUES ('82', 'FDAbnxa21y381931', '10', '3', '2013-08-23 12:10:32', '天津市开发区第三大街32号', '13234284728', '欧阳镇东', '9', '23491');
INSERT INTO `order_form` VALUES ('83', 'danjxzuyas183201', '11', '3', '2013-08-23 12:11:21', '天津市河西区友谊北路60号金河购物广场', '15273137829', '李小凡', '3', '11997');
INSERT INTO `order_form` VALUES ('84', 'NAUaxa78ZB173312', '11', '4', '2013-08-23 12:11:32', '天津市河西区友谊北路60号金河购物广场', '15273137829', '李小凡', '8', '39992');
INSERT INTO `order_form` VALUES ('85', 'DSAzuxZU7h172319', '11', '4', '2013-08-23 12:11:40', '天津市河西区友谊北路60号金河购物广场', '15273137829', '李小凡', '3', '9297');
INSERT INTO `order_form` VALUES ('86', 'DAZZuasz6a127312', '11', '2', '2013-08-23 12:11:56', '天津市河西区友谊北路60号金河购物广场', '15273137829', '李小凡', '3', '12597');
INSERT INTO `order_form` VALUES ('87', 'dsaxnZUi8b173299', '11', '4', '2013-08-23 12:12:06', '天津市河西区友谊北路60号金河购物广场', '15042208783', '李东泽', '12', '11780');
INSERT INTO `order_form` VALUES ('88', 'faxiZNSua8173290', '11', '2', '2013-08-23 12:12:15', '天津市河西区友谊北路60号金河购物广场', '15042208783', '李东泽', '3', '1047');
INSERT INTO `order_form` VALUES ('89', 'dsaxnuZUA7126312', '11', '1', '2013-08-23 12:12:27', '天津市河西区友谊北路60号金河购物广场', '15042208783', '李东泽', '3', '477');
INSERT INTO `order_form` VALUES ('90', 'daxnuaZU7183178d', '11', '3', '2013-08-23 12:12:36', '天津市河西区友谊北路60号金河购物广场', '15042208783', '李东泽', '4', '1152');
INSERT INTO `order_form` VALUES ('91', 'fasxua7YNI128329', '11', '2', '2013-08-23 12:12:49', '天津市河西区友谊北路60号金河购物广场', '15042208783', '李东泽', '6', '2514');
INSERT INTO `order_form` VALUES ('92', 'DAzu31BBys812373', '12', '4', '2013-08-23 12:13:34', '天津市丁字沽一号路凯莱赛商厦1层', '18240127945', '王芳', '9', '40991');
INSERT INTO `order_form` VALUES ('93', 'sdxnu132Ub172379', '12', '4', '2013-08-23 12:13:46', '天津市丁字沽一号路凯莱赛商厦1层', '18240127945', '王芳', '3', '9297');
INSERT INTO `order_form` VALUES ('94', 'dsxnuasYUk133232', '12', '1', '2013-08-23 12:13:57', '天津市丁字沽一号路凯莱赛商厦1层', '18240127945', '王芳', '6', '18564');
INSERT INTO `order_form` VALUES ('95', 'daUM78auyb183139', '12', '3', '2013-08-23 12:14:07', '天津市丁字沽一号路凯莱赛商厦1层', '18240127945', '王芳', '8', '2670');
INSERT INTO `order_form` VALUES ('96', 'fhjasbyszi716329', '12', '3', '2013-08-23 12:14:18', '天津市丁字沽一号路凯莱赛商厦1层', '18240127945', '王芳', '3', '387');
INSERT INTO `order_form` VALUES ('97', 'huasDAS67Z127893', '12', '4', '2013-08-23 12:14:40', '天津市丁字沽一号路凯莱赛商厦1层', '18810690513', '张力', '4', '996');
INSERT INTO `order_form` VALUES ('98', 'fsdjHASIua128313', '12', '4', '2013-08-23 12:14:49', '天津市丁字沽一号路凯莱赛商厦1层', '18810690513', '张力', '7', '2093');
INSERT INTO `order_form` VALUES ('99', 'fhuszbydas132849', '12', '1', '2013-08-23 12:14:57', '天津市丁字沽一号路凯莱赛商厦1层', '18810690513', '张力', '8', '312');
INSERT INTO `order_form` VALUES ('100', 'DAuasbYSNz123290', '12', '4', '2013-08-23 12:15:09', '天津市丁字沽一号路凯莱赛商厦1层', '18810690513', '张力', '19', '3251');
INSERT INTO `order_form` VALUES ('101', 'fasxnzu78Y127890', '13', '2', '2013-08-23 12:16:41', '天津市红桥区大胡同38号', '13889756199', '范永鸿', '20', '89980');
INSERT INTO `order_form` VALUES ('102', 'DFXBUsyu21371290', '13', '1', '2013-08-23 12:16:48', '天津市红桥区大胡同38号', '13889756199', '范永鸿', '20', '61980');
INSERT INTO `order_form` VALUES ('103', 'dsfZBUsa7z132879', '13', '4', '2013-08-23 12:17:00', '天津市红桥区大胡同38号', '13889756199', '范永鸿', '20', '83980');
INSERT INTO `order_form` VALUES ('104', 'faxbuaZUS1137298', '13', '3', '2013-08-23 12:17:19', '天津市红桥区大胡同38号', '13889756199', '范永鸿', '16', '8681');
INSERT INTO `order_form` VALUES ('105', 'FHDSQYEYui127313', '13', '4', '2013-08-23 12:17:31', '天津市红桥区大胡同38号', '18941632890', '刘彤', '8', '1992');
INSERT INTO `order_form` VALUES ('106', 'fasYSUysaq213780', '13', '4', '2013-08-23 12:17:42', '天津市红桥区大胡同38号', '18941632890', '刘彤', '8', '2392');
INSERT INTO `order_form` VALUES ('107', 'dsaXUysnqo128329', '13', '3', '2013-08-23 12:17:51', '天津市红桥区大胡同38号', '18941632890', '刘彤', '3', '387');
INSERT INTO `order_form` VALUES ('108', 'fdsXUzny1h128329', '13', '3', '2013-08-23 12:18:05', '天津市红桥区大胡同38号', '18941632890', '刘彤', '7', '2443');
INSERT INTO `order_form` VALUES ('109', 'fdxusn789u162328', '13', '1', '2013-08-23 12:18:17', '天津市红桥区大胡同38号', '18941632890', '刘彤', '4', '1116');
INSERT INTO `order_form` VALUES ('110', 'fdsx67tYU6127328', '14', '3', '2013-08-23 12:18:50', '天津市南京路108号', '13942214688', '齐冬', '12', '55988');
INSERT INTO `order_form` VALUES ('111', 'shaYUOMI9B183200', '14', '1', '2013-08-23 12:19:02', '天津市南京路108号', '13942214688', '齐冬', '8', '19520');
INSERT INTO `order_form` VALUES ('112', 'FFAjjsaznx317290', '14', '3', '2013-08-23 12:19:10', '天津市南京路108号', '13942214688', '齐冬', '9', '1811');
INSERT INTO `order_form` VALUES ('113', 'fsdjxYSUZ8173296', '14', '4', '2013-08-23 12:19:24', '天津市南京路108号', '13942214688', '齐冬', '8', '1032');
INSERT INTO `order_form` VALUES ('114', 'FASXYUBYtd371328', '14', '1', '2013-08-23 12:19:35', '天津市南京路108号', '13942214688', '齐冬', '17', '10402');
INSERT INTO `order_form` VALUES ('115', 'faJDAxa681316238', '14', '4', '2013-08-23 12:19:43', '天津市南京路108号', '15801032720', '马玉莹', '10', '23990');
INSERT INTO `order_form` VALUES ('116', 'sjhsXUAza2138412', '14', '1', '2013-08-23 12:19:52', '天津市南京路108号', '15801032720', '马玉莹', '20', '59980');
INSERT INTO `order_form` VALUES ('117', 'faxu831xau128298', '14', '4', '2013-08-23 12:20:00', '天津市南京路108号', '15801032720', '马玉莹', '17', '65383');
INSERT INTO `order_form` VALUES ('118', 'dasxYYn7Z6131295', '15', '4', '2013-08-23 12:20:48', '天津市东马路55号', '18627922634', '林雨轩', '16', '69884');
INSERT INTO `order_form` VALUES ('119', 'fsdxytbDAS631729', '15', '4', '2013-08-23 12:20:57', '天津市东马路55号', '18627922634', '林雨轩', '5', '5412');
INSERT INTO `order_form` VALUES ('120', 'FSDAdasd6h133288', '15', '4', '2013-08-23 12:21:05', '天津市东马路55号', '18627922634', '林雨轩', '6', '1334');
INSERT INTO `order_form` VALUES ('121', 'queisyuYA6312836', '15', '1', '2013-08-23 12:21:13', '天津市东马路55号', '18627922634', '林雨轩', '7', '763');
INSERT INTO `order_form` VALUES ('122', 'FANXtyaopm861936', '15', '4', '2013-08-23 12:21:21', '天津市东马路55号', '18041153729', '苏梦枚', '3', '747');
INSERT INTO `order_form` VALUES ('123', 'danxyYUAMg138733', '15', '4', '2013-08-23 12:21:29', '天津市东马路55号', '18041153729', '苏梦枚', '8', '71664');
INSERT INTO `order_form` VALUES ('124', 'faksxuanxY716391', '15', '1', '2013-08-23 12:21:41', '天津市东马路55号', '18041153729', '苏梦枚', '9', '26991');
INSERT INTO `order_form` VALUES ('125', 'AXnxuaYWSU716328', '15', '4', '2013-08-23 12:21:50', '天津市东马路55号', '18041153729', '苏梦枚', '11', '42989');
INSERT INTO `order_form` VALUES ('126', 'DAXJAtyaxu716299', '4', '1', '2013-08-26 02:15:31', '天津市南开区卫津路94号南开大学', '15620935845', '史慧珂', '6', '53667');
INSERT INTO `order_form` VALUES ('127', 'fdajjUSH67177829', '4', '2', '2013-08-26 02:39:14', '天津市南开区卫津路94号南开大学', '15620935845', '史慧珂', '8', '47992');
INSERT INTO `order_form` VALUES ('128', 'CtyXePCDHQ182916', '4', '4', '2013-08-26 08:49:42', '天津市南开区卫津路94号南开大学', '15620935845', '史慧珂', '21', '44079');
INSERT INTO `order_form` VALUES ('129', 'ceFkcY1O9T327296', '4', '1', '2013-08-26 09:08:47', '天津市南开区卫津路94号南开大学', '15620935845', '史慧珂', '2', '558');
INSERT INTO `order_form` VALUES ('130', 'ceFkcY19OT327296', '4', '5', '2013-08-26 09:08:47', '天津市南开区卫津路94号南开大学', '15620935845', '史慧珂', '10', '24287');
INSERT INTO `order_form` VALUES ('131', '1geFuEa9Oo904454', '18', '4', '2013-08-28 17:25:10', '浙江省慈溪市附海镇', '15620900542', '史慧波', '4', '7956');
INSERT INTO `order_form` VALUES ('132', 'DxG4RdbnJl979805', '4', '4', '2013-08-28 17:26:24', '天津市南开区卫津路94号南开大学', '17280929032', '张宝乐', '2', '25780');
INSERT INTO `order_form` VALUES ('133', 'HluIe4sMDl415610', '4', '4', '2013-08-28 17:33:39', '天津市南开区卫津路94号南开大学', '17829372281', '刘艾伦', '10', '1290');
INSERT INTO `order_form` VALUES ('134', 'p5dJuBDnwp358744', '4', '4', '2013-08-28 18:22:41', '天津市南开区卫津路94号南开大学', '14729304432', '史慧珂', '3', '387');
INSERT INTO `order_form` VALUES ('135', 'MhD7f5I0HW940965', '4', '4', '2013-08-28 19:05:55', '天津市南开区卫津路94号南开大学', '15620935845', '史慧珂', '3', '717');
INSERT INTO `order_form` VALUES ('136', 'oDXcY6ybbF182051', '20', '2', '2013-08-28 19:43:04', '南开大学', '16728394472', 'John', '3', '7197');
INSERT INTO `order_form` VALUES ('137', '7h7NKBFlLF499739', '10', '2', '2013-08-28 19:48:23', '天津市塘沽区滨海公寓', '17829393020', '史慧珂', '1', '1989');
INSERT INTO `order_form` VALUES ('138', 'sIKyjvGiFq617678', '10', '2', '2013-08-28 19:50:21', '天津市开发区第三大街32号', '15628382917', '刘殊畅', '5', '1735');
INSERT INTO `order_form` VALUES ('139', 'K4pvzV921W989711', '4', '2', '2013-08-28 19:56:32', '浙江省慈溪市附海镇', '15620935845', '史慧珂', '2', '9998');
INSERT INTO `order_form` VALUES ('140', '8sDTo8ctB447229', '4', '2', '2013-08-28 19:57:28', '浙江省慈溪市附海镇', '17829393020', '张宝乐', '31', '4929');

-- ----------------------------
-- Table structure for `order_item`
-- ----------------------------
DROP TABLE IF EXISTS `order_item`;
CREATE TABLE `order_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `oid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `oid` (`oid`),
  CONSTRAINT `order_item_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`),
  CONSTRAINT `order_item_ibfk_2` FOREIGN KEY (`oid`) REFERENCES `order_form` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=223 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_item
-- ----------------------------
INSERT INTO `order_item` VALUES ('1', '1', '2', '1');
INSERT INTO `order_item` VALUES ('2', '2', '3', '1');
INSERT INTO `order_item` VALUES ('3', '16', '1', '2');
INSERT INTO `order_item` VALUES ('4', '18', '3', '2');
INSERT INTO `order_item` VALUES ('5', '50', '7', '2');
INSERT INTO `order_item` VALUES ('6', '55', '4', '3');
INSERT INTO `order_item` VALUES ('7', '104', '2', '3');
INSERT INTO `order_item` VALUES ('8', '109', '2', '3');
INSERT INTO `order_item` VALUES ('9', '22', '2', '4');
INSERT INTO `order_item` VALUES ('10', '27', '2', '5');
INSERT INTO `order_item` VALUES ('11', '23', '4', '6');
INSERT INTO `order_item` VALUES ('12', '56', '2', '7');
INSERT INTO `order_item` VALUES ('13', '89', '3', '8');
INSERT INTO `order_item` VALUES ('14', '55', '5', '9');
INSERT INTO `order_item` VALUES ('15', '58', '2', '9');
INSERT INTO `order_item` VALUES ('16', '104', '3', '10');
INSERT INTO `order_item` VALUES ('17', '143', '1', '10');
INSERT INTO `order_item` VALUES ('18', '109', '2', '11');
INSERT INTO `order_item` VALUES ('19', '10', '3', '11');
INSERT INTO `order_item` VALUES ('20', '109', '2', '12');
INSERT INTO `order_item` VALUES ('21', '18', '3', '12');
INSERT INTO `order_item` VALUES ('22', '38', '2', '13');
INSERT INTO `order_item` VALUES ('23', '19', '3', '13');
INSERT INTO `order_item` VALUES ('24', '20', '6', '14');
INSERT INTO `order_item` VALUES ('25', '30', '8', '14');
INSERT INTO `order_item` VALUES ('26', '38', '9', '15');
INSERT INTO `order_item` VALUES ('27', '41', '2', '15');
INSERT INTO `order_item` VALUES ('28', '45', '1', '16');
INSERT INTO `order_item` VALUES ('29', '50', '2', '17');
INSERT INTO `order_item` VALUES ('30', '57', '2', '17');
INSERT INTO `order_item` VALUES ('31', '67', '3', '17');
INSERT INTO `order_item` VALUES ('32', '78', '2', '18');
INSERT INTO `order_item` VALUES ('33', '86', '1', '18');
INSERT INTO `order_item` VALUES ('34', '90', '3', '18');
INSERT INTO `order_item` VALUES ('36', '100', '8', '21');
INSERT INTO `order_item` VALUES ('37', '123', '9', '21');
INSERT INTO `order_item` VALUES ('38', '1', '8', '22');
INSERT INTO `order_item` VALUES ('39', '2', '9', '22');
INSERT INTO `order_item` VALUES ('40', '50', '2', '23');
INSERT INTO `order_item` VALUES ('41', '55', '3', '23');
INSERT INTO `order_item` VALUES ('42', '104', '8', '24');
INSERT INTO `order_item` VALUES ('43', '109', '9', '24');
INSERT INTO `order_item` VALUES ('44', '16', '10', '25');
INSERT INTO `order_item` VALUES ('45', '18', '10', '25');
INSERT INTO `order_item` VALUES ('46', '10', '10', '26');
INSERT INTO `order_item` VALUES ('47', '67', '10', '27');
INSERT INTO `order_item` VALUES ('48', '109', '2', '28');
INSERT INTO `order_item` VALUES ('49', '134', '2', '28');
INSERT INTO `order_item` VALUES ('50', '142', '3', '28');
INSERT INTO `order_item` VALUES ('51', '17', '4', '29');
INSERT INTO `order_item` VALUES ('52', '28', '5', '29');
INSERT INTO `order_item` VALUES ('53', '2', '8', '30');
INSERT INTO `order_item` VALUES ('54', '7', '3', '30');
INSERT INTO `order_item` VALUES ('55', '8', '3', '30');
INSERT INTO `order_item` VALUES ('56', '28', '3', '31');
INSERT INTO `order_item` VALUES ('57', '29', '7', '31');
INSERT INTO `order_item` VALUES ('58', '39', '8', '31');
INSERT INTO `order_item` VALUES ('59', '90', '3', '32');
INSERT INTO `order_item` VALUES ('60', '103', '8', '32');
INSERT INTO `order_item` VALUES ('61', '1', '9', '33');
INSERT INTO `order_item` VALUES ('62', '2', '10', '33');
INSERT INTO `order_item` VALUES ('63', '16', '10', '34');
INSERT INTO `order_item` VALUES ('64', '18', '10', '34');
INSERT INTO `order_item` VALUES ('65', '50', '10', '34');
INSERT INTO `order_item` VALUES ('66', '55', '20', '35');
INSERT INTO `order_item` VALUES ('67', '104', '10', '36');
INSERT INTO `order_item` VALUES ('68', '109', '20', '37');
INSERT INTO `order_item` VALUES ('69', '30', '1', '38');
INSERT INTO `order_item` VALUES ('70', '39', '2', '39');
INSERT INTO `order_item` VALUES ('71', '40', '3', '40');
INSERT INTO `order_item` VALUES ('72', '41', '2', '41');
INSERT INTO `order_item` VALUES ('73', '88', '4', '42');
INSERT INTO `order_item` VALUES ('74', '1', '7', '43');
INSERT INTO `order_item` VALUES ('75', '2', '7', '44');
INSERT INTO `order_item` VALUES ('76', '16', '8', '45');
INSERT INTO `order_item` VALUES ('77', '18', '7', '45');
INSERT INTO `order_item` VALUES ('78', '50', '3', '46');
INSERT INTO `order_item` VALUES ('79', '55', '8', '46');
INSERT INTO `order_item` VALUES ('80', '104', '8', '47');
INSERT INTO `order_item` VALUES ('81', '109', '3', '47');
INSERT INTO `order_item` VALUES ('82', '29', '3', '48');
INSERT INTO `order_item` VALUES ('83', '30', '3', '48');
INSERT INTO `order_item` VALUES ('84', '49', '5', '49');
INSERT INTO `order_item` VALUES ('85', '50', '5', '49');
INSERT INTO `order_item` VALUES ('86', '56', '8', '50');
INSERT INTO `order_item` VALUES ('87', '57', '8', '50');
INSERT INTO `order_item` VALUES ('88', '78', '1', '51');
INSERT INTO `order_item` VALUES ('89', '89', '1', '52');
INSERT INTO `order_item` VALUES ('90', '1', '6', '53');
INSERT INTO `order_item` VALUES ('91', '2', '8', '53');
INSERT INTO `order_item` VALUES ('92', '16', '9', '54');
INSERT INTO `order_item` VALUES ('93', '18', '6', '54');
INSERT INTO `order_item` VALUES ('94', '50', '6', '55');
INSERT INTO `order_item` VALUES ('95', '55', '8', '55');
INSERT INTO `order_item` VALUES ('96', '104', '6', '56');
INSERT INTO `order_item` VALUES ('97', '109', '7', '57');
INSERT INTO `order_item` VALUES ('98', '89', '5', '58');
INSERT INTO `order_item` VALUES ('99', '39', '6', '59');
INSERT INTO `order_item` VALUES ('100', '44', '8', '60');
INSERT INTO `order_item` VALUES ('101', '67', '4', '61');
INSERT INTO `order_item` VALUES ('102', '68', '6', '61');
INSERT INTO `order_item` VALUES ('103', '69', '7', '61');
INSERT INTO `order_item` VALUES ('104', '70', '6', '62');
INSERT INTO `order_item` VALUES ('105', '78', '6', '63');
INSERT INTO `order_item` VALUES ('106', '1', '8', '64');
INSERT INTO `order_item` VALUES ('107', '2', '8', '65');
INSERT INTO `order_item` VALUES ('108', '50', '6', '66');
INSERT INTO `order_item` VALUES ('109', '55', '7', '66');
INSERT INTO `order_item` VALUES ('110', '104', '5', '67');
INSERT INTO `order_item` VALUES ('111', '109', '3', '67');
INSERT INTO `order_item` VALUES ('112', '140', '6', '67');
INSERT INTO `order_item` VALUES ('113', '141', '5', '67');
INSERT INTO `order_item` VALUES ('114', '13', '3', '68');
INSERT INTO `order_item` VALUES ('115', '17', '5', '69');
INSERT INTO `order_item` VALUES ('116', '18', '5', '70');
INSERT INTO `order_item` VALUES ('117', '20', '7', '70');
INSERT INTO `order_item` VALUES ('118', '32', '8', '71');
INSERT INTO `order_item` VALUES ('119', '33', '9', '72');
INSERT INTO `order_item` VALUES ('120', '37', '10', '73');
INSERT INTO `order_item` VALUES ('121', '47', '11', '73');
INSERT INTO `order_item` VALUES ('122', '1', '10', '74');
INSERT INTO `order_item` VALUES ('123', '2', '10', '74');
INSERT INTO `order_item` VALUES ('124', '16', '1', '74');
INSERT INTO `order_item` VALUES ('125', '18', '3', '74');
INSERT INTO `order_item` VALUES ('126', '50', '2', '75');
INSERT INTO `order_item` VALUES ('127', '55', '3', '75');
INSERT INTO `order_item` VALUES ('128', '104', '7', '76');
INSERT INTO `order_item` VALUES ('129', '109', '8', '76');
INSERT INTO `order_item` VALUES ('130', '12', '7', '77');
INSERT INTO `order_item` VALUES ('131', '19', '8', '78');
INSERT INTO `order_item` VALUES ('132', '32', '2', '79');
INSERT INTO `order_item` VALUES ('133', '33', '7', '80');
INSERT INTO `order_item` VALUES ('134', '39', '1', '81');
INSERT INTO `order_item` VALUES ('135', '40', '2', '82');
INSERT INTO `order_item` VALUES ('136', '42', '7', '82');
INSERT INTO `order_item` VALUES ('137', '1', '3', '83');
INSERT INTO `order_item` VALUES ('138', '2', '8', '84');
INSERT INTO `order_item` VALUES ('139', '16', '3', '85');
INSERT INTO `order_item` VALUES ('140', '18', '3', '86');
INSERT INTO `order_item` VALUES ('141', '50', '4', '87');
INSERT INTO `order_item` VALUES ('142', '55', '8', '87');
INSERT INTO `order_item` VALUES ('143', '104', '3', '88');
INSERT INTO `order_item` VALUES ('144', '109', '3', '89');
INSERT INTO `order_item` VALUES ('145', '130', '4', '90');
INSERT INTO `order_item` VALUES ('146', '132', '4', '91');
INSERT INTO `order_item` VALUES ('147', '138', '2', '91');
INSERT INTO `order_item` VALUES ('148', '1', '4', '92');
INSERT INTO `order_item` VALUES ('149', '2', '5', '92');
INSERT INTO `order_item` VALUES ('150', '16', '3', '93');
INSERT INTO `order_item` VALUES ('151', '18', '3', '94');
INSERT INTO `order_item` VALUES ('152', '50', '3', '94');
INSERT INTO `order_item` VALUES ('153', '55', '2', '95');
INSERT INTO `order_item` VALUES ('154', '104', '4', '95');
INSERT INTO `order_item` VALUES ('155', '109', '2', '95');
INSERT INTO `order_item` VALUES ('156', '110', '3', '96');
INSERT INTO `order_item` VALUES ('157', '123', '4', '97');
INSERT INTO `order_item` VALUES ('158', '134', '7', '98');
INSERT INTO `order_item` VALUES ('159', '142', '8', '99');
INSERT INTO `order_item` VALUES ('160', '124', '9', '100');
INSERT INTO `order_item` VALUES ('161', '143', '10', '100');
INSERT INTO `order_item` VALUES ('162', '1', '10', '101');
INSERT INTO `order_item` VALUES ('163', '2', '10', '101');
INSERT INTO `order_item` VALUES ('164', '16', '20', '102');
INSERT INTO `order_item` VALUES ('165', '18', '20', '103');
INSERT INTO `order_item` VALUES ('166', '50', '2', '104');
INSERT INTO `order_item` VALUES ('167', '55', '3', '104');
INSERT INTO `order_item` VALUES ('168', '104', '8', '104');
INSERT INTO `order_item` VALUES ('169', '109', '3', '104');
INSERT INTO `order_item` VALUES ('170', '123', '8', '105');
INSERT INTO `order_item` VALUES ('171', '134', '8', '106');
INSERT INTO `order_item` VALUES ('172', '107', '3', '107');
INSERT INTO `order_item` VALUES ('173', '129', '7', '108');
INSERT INTO `order_item` VALUES ('174', '12', '1', '109');
INSERT INTO `order_item` VALUES ('175', '89', '4', '109');
INSERT INTO `order_item` VALUES ('176', '1', '4', '110');
INSERT INTO `order_item` VALUES ('177', '2', '8', '110');
INSERT INTO `order_item` VALUES ('178', '16', '3', '110');
INSERT INTO `order_item` VALUES ('179', '18', '3', '111');
INSERT INTO `order_item` VALUES ('180', '50', '3', '111');
INSERT INTO `order_item` VALUES ('181', '55', '2', '111');
INSERT INTO `order_item` VALUES ('182', '104', '2', '112');
INSERT INTO `order_item` VALUES ('183', '109', '7', '112');
INSERT INTO `order_item` VALUES ('184', '110', '8', '113');
INSERT INTO `order_item` VALUES ('185', '113', '8', '114');
INSERT INTO `order_item` VALUES ('186', '118', '9', '114');
INSERT INTO `order_item` VALUES ('187', '30', '10', '115');
INSERT INTO `order_item` VALUES ('188', '39', '20', '116');
INSERT INTO `order_item` VALUES ('189', '40', '8', '117');
INSERT INTO `order_item` VALUES ('190', '45', '9', '117');
INSERT INTO `order_item` VALUES ('191', '1', '2', '118');
INSERT INTO `order_item` VALUES ('192', '2', '8', '118');
INSERT INTO `order_item` VALUES ('193', '16', '3', '118');
INSERT INTO `order_item` VALUES ('194', '18', '3', '118');
INSERT INTO `order_item` VALUES ('195', '50', '2', '119');
INSERT INTO `order_item` VALUES ('196', '55', '3', '119');
INSERT INTO `order_item` VALUES ('197', '104', '2', '120');
INSERT INTO `order_item` VALUES ('198', '109', '4', '120');
INSERT INTO `order_item` VALUES ('199', '120', '7', '121');
INSERT INTO `order_item` VALUES ('200', '123', '3', '122');
INSERT INTO `order_item` VALUES ('201', '13', '8', '123');
INSERT INTO `order_item` VALUES ('202', '14', '9', '124');
INSERT INTO `order_item` VALUES ('203', '19', '10', '125');
INSERT INTO `order_item` VALUES ('204', '20', '1', '125');
INSERT INTO `order_item` VALUES ('205', '10', '3', '126');
INSERT INTO `order_item` VALUES ('206', '2', '3', '126');
INSERT INTO `order_item` VALUES ('207', '4', '8', '127');
INSERT INTO `order_item` VALUES ('208', '34', '21', '128');
INSERT INTO `order_item` VALUES ('209', '89', '2', '129');
INSERT INTO `order_item` VALUES ('210', '35', '3', '130');
INSERT INTO `order_item` VALUES ('211', '32', '7', '130');
INSERT INTO `order_item` VALUES ('212', '50', '4', '131');
INSERT INTO `order_item` VALUES ('213', '10', '2', '132');
INSERT INTO `order_item` VALUES ('214', '107', '10', '133');
INSERT INTO `order_item` VALUES ('215', '107', '3', '134');
INSERT INTO `order_item` VALUES ('216', '90', '3', '135');
INSERT INTO `order_item` VALUES ('217', '32', '3', '136');
INSERT INTO `order_item` VALUES ('218', '50', '1', '137');
INSERT INTO `order_item` VALUES ('219', '91', '3', '138');
INSERT INTO `order_item` VALUES ('220', '113', '2', '138');
INSERT INTO `order_item` VALUES ('221', '2', '2', '139');
INSERT INTO `order_item` VALUES ('222', '109', '31', '140');

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(50) NOT NULL,
  `description` varchar(200) NOT NULL,
  `category_id` int(11) NOT NULL,
  `price` float NOT NULL,
  `discount` float NOT NULL DEFAULT '1',
  `storage` int(11) NOT NULL,
  `bid` int(11) NOT NULL,
  `addtime` datetime NOT NULL,
  `has_deleted` int(11) NOT NULL,
  `picture` varchar(50) NOT NULL,
  PRIMARY KEY (`pid`),
  KEY `CATEGORY_ID` (`category_id`),
  KEY `BID` (`bid`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`cid`),
  CONSTRAINT `product_ibfk_2` FOREIGN KEY (`bid`) REFERENCES `brand` (`BID`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '联想Y400M ', '联想（Lenovo） Y400M 14.0英寸笔记本电脑（i5-3230M 4G 1T 2G独显 摄像头 DVD刻录 Win8）', '4', '3999', '1', '254', '1', '2013-08-24 13:52:07', '0', '1.jpg');
INSERT INTO `product` VALUES ('2', '华硕K45EI323VD-SL ', '华硕（ASUS） K45EI323VD 14英寸笔记本电脑（i5-3230M 4G 750G 2G独显 D刻 冷金色） ', '4', '4999', '1', '3651', '2', '2013-08-24 13:52:09', '0', '2.jpg');
INSERT INTO `product` VALUES ('4', '惠普CQ45-m02TX ', '惠普（HP） CQ45-m02TX 14.0英寸笔记本电脑 （i5-3230M 4G 750G HD7450 1G独显 DOS 黑色）', '4', '5999', '1', '435', '3', '2013-08-24 13:52:11', '0', '4.jpg');
INSERT INTO `product` VALUES ('5', '宏碁E1-571G-53234G50Mnks ', '宏碁（acer） E1-571G-53234G50Mnks 15.6英寸笔记本电脑 （i5-3230M 4G 500G GT710M 2G独显 Linux）黑色', '4', '5899', '1', '64', '4', '2013-08-24 13:52:13', '0', '5.jpg');
INSERT INTO `product` VALUES ('6', 'ThinkPadX230I(2306-6QC)', 'ThinkPad X230i(2306-6QC） 12.5英寸笔记本电脑（i3-3120M 2GB 500GB 7200转 蓝牙 摄像头 Win8）', '4', '5439', '1', '264', '5', '2013-08-24 13:52:15', '0', '6.jpg');
INSERT INTO `product` VALUES ('7', ' 神舟精盾K580S-i7D3', '神舟（HASEE） 精盾K580S-i7D3 15.6英寸笔记本（i7-3610QM 4G 500G GT650M 2G独显+HD4000 D刻)深蓝色', '4', '3799', '1', '453', '6', '2013-08-24 13:52:16', '0', '7.jpg');
INSERT INTO `product` VALUES ('8', '索尼SVF1421AYCW', '索尼（SONY） SVF1421AYCW 14.0英寸笔记本电脑 （i5-3337U 4G 500G GT740 2G独显 D刻 Linux 白）', '4', '3899', '1', '234', '7', '2013-08-24 13:52:16', '0', '8.jpg');
INSERT INTO `product` VALUES ('9', '戴尔Ins14zR-2318 ', '戴尔（DELL） Ins14zR-2318S 14英寸笔记本电脑（双核i3-3227U 2G 500G HD7570M 1G独显 蓝牙 Win8）银', '4', '8900', '1', '46', '8', '2013-08-24 13:52:18', '0', '9.jpg');
INSERT INTO `product` VALUES ('10', '东芝L800-C55W ', '东芝（TOSHIBA） L800-C55W 14英寸笔记本电脑 （i5-3230M 4G 500G HD7670 1G独显 2*USB3.0 WIN7 ）白色', '4', '12890', '1', '343', '9', '2013-08-24 13:52:19', '0', '10.jpg');
INSERT INTO `product` VALUES ('11', '惠普CQ45-m01TX', '惠普（HP） CQ45-m01TX 14.0英寸笔记本电脑 （i5-3230 4G 500G HD7450M 1G独显 黑色）', '4', '3099', '1', '5463', '3', '2013-08-24 13:52:20', '0', '11.jpg');
INSERT INTO `product` VALUES ('12', '惠普Pavilion m4-1016TX', '惠普（HP） Pavilion m4-1016TX 14.0英寸笔记本 （i7-3632 4G 500G 730M 2G独显 黑色）', '4', '7999', '1', '432', '3', '2013-08-24 13:52:21', '0', '12.jpg');
INSERT INTO `product` VALUES ('13', 'ThinkPadE430C（33651E8）', 'ThinkPad E430C（33651E8）14英寸笔记本电脑 （i3-3110M 2G 500G GT610M 1G独显 蓝牙 摄像头）', '4', '8958', '1', '3245', '5', '2013-08-24 13:52:22', '0', '13.jpg');
INSERT INTO `product` VALUES ('14', '宏碁（acer） EC-471G-32342G50Mnks', '宏碁（acer） EC-471G-32342G50Mnks 14.0英寸笔记本电脑 4', '4', '2999', '1', '97', '4', '2013-08-24 13:52:24', '0', '14.jpg');
INSERT INTO `product` VALUES ('15', '联想扬天V480s', '联想（Lenovo）扬天V480s 14.0英寸笔记本电脑 （i5-3230M 4G 1T 2G独显 摄像头 Win8)', '4', '4699', '1', '61', '1', '2013-08-24 13:52:25', '0', '15.jpg');
INSERT INTO `product` VALUES ('16', '惠普Envy 4-1220TX', '惠普（HP） Envy 4-1220TX 14.0英寸超极本 （i5-3337U 4G 500G+32GSSD HD8750M 2G独显 黑红 Win8）', '5', '3099', '1', '435', '3', '2013-08-24 13:52:28', '0', '16.jpg');
INSERT INTO `product` VALUES ('17', '联想U310-ITH', '联想（Lenovo） U310-ITH 13.3英寸超极本（i3-3227U 4G 500G 24G固态硬盘 摄像头 蓝牙 Win8）暮光灰', '5', '3899', '1', '34', '1', '2013-08-24 13:52:27', '0', '17.jpg');
INSERT INTO `product` VALUES ('18', '宏碁S3-391-33224G52add', '宏碁（acer） S3-391-33224G52add 13.3英寸超极本 （i3-3227U 4G 20GB固态硬盘+500GB Win7 铝合金顶盖)', '5', '4199', '1', '23', '4', '2013-08-24 13:52:30', '0', '18.jpg');
INSERT INTO `product` VALUES ('19', '三星NP530U3C-AA1CN', '三星（SAMSUNG） NP530U3C-AA1CN 13.3英寸超极本 (i3-3217U 2G 500G+24G SSD 核芯显卡 win8 蓝牙)泰坦银', '5', '3799', '1', '454', '47', '2013-08-24 13:52:31', '0', '19.jpg');
INSERT INTO `product` VALUES ('20', '联想U410-IFI', '联想（Lenovo） U410-IFI 14英寸超极本（i5-3337U 4G 500G 24G固态硬盘 2G独显 蓝牙 Win8）烈焰红', '5', '4999', '1', '32', '1', '2013-08-24 13:52:32', '0', '20.jpg');
INSERT INTO `product` VALUES ('21', 'ThinkpadX230S-20AHS00000', 'ThinkPad X230S (20AHS00000) 12.5英寸超极本 （i5-3337U 8G 1TB +24GBNGFF 蓝牙 WIN8 64位）', '5', '7999', '1', '43', '5', '2013-08-24 13:52:32', '0', '21.jpg');
INSERT INTO `product` VALUES ('22', '索尼SVT11138CC', '索尼（SONY） SVT11138CC 11.6英寸超极本（i5-3337U 4G 500G 24G固态硬盘 蓝牙 Win8 银）', '5', '5399', '1', '34', '7', '2013-08-24 13:52:35', '0', '22.jpg');
INSERT INTO `product` VALUES ('23', '华硕S56X3217CA-SL', '华硕（ASUS） S56X3217CA 15.6英寸超薄本(i3-3217U 4G 500G+24G SSD 新核芯显卡 D刻 黑色)', '5', '3699', '1', '545', '2', '2013-08-24 13:52:34', '0', '23.jpg');
INSERT INTO `product` VALUES ('24', '戴尔XPS13R-6508', '戴尔（DELL） XPS13R-6508 13英寸超极本（双核i5-3337U 4G 128G 固态硬盘 蓝牙 关机充电 Win8）银', '5', '7999', '1', '23', '8', '2013-08-24 13:52:37', '0', '24.jpg');
INSERT INTO `product` VALUES ('25', '神舟飞天UT43D1', '神舟（HASEE） 飞天UT43D1 14英寸超极本(i3-3217U 4G 128GSSD Intel核显HD4000 触摸+Win8 金属机身)银色', '5', '3999', '1', '43', '6', '2013-08-24 13:52:38', '0', '25.jpg');
INSERT INTO `product` VALUES ('26', '东芝Z930-K01S', '东芝（TOSHIBA） Z930-K01S 13.3英寸超极本（i7-3687U 4G+2G 256GSSD 核芯显卡4000 USB3.0 WIN7)银色', '5', '4999', '1', '54', '9', '2013-08-24 13:52:39', '0', '26.jpg');
INSERT INTO `product` VALUES ('27', '惠普Spectre XT 13-2207TU', '惠普（HP） Spectre XT 13-2207TU 13.3英寸超极本 （i5-3337U 4G 128G固态硬盘 集显 Win8 天然银）', '5', '7299', '1', '23', '3', '2013-08-24 13:52:40', '0', '27.jpg');
INSERT INTO `product` VALUES ('28', ' 戴尔XPS13R-5708', '戴尔（DELL） XPS13R-5708 13英寸超极本（双核 i7-3537U 8G 256G 固态硬盘 蓝牙 关机充电 Win8）银', '5', '11999', '1', '54', '8', '2013-08-24 13:52:41', '0', '28.jpg');
INSERT INTO `product` VALUES ('29', '华硕TAICHI', '华硕（ASUS） TAICHI 11.6英寸超极本 （i5-3337U 4G 256G SSD 双面高分屏 双摄像头 可触控 Win8 黑色）', '5', '10888', '1', '87', '2', '2013-08-24 13:52:42', '0', '29.jpg');
INSERT INTO `product` VALUES ('30', 'ThinkPadE135(3359-1C8)', 'ThinkPad E135(3359-1C8) 11.6英寸笔记本 （AMD E1-1200M 2G 500G HD7310显卡 Linux 一年质保）魅力红', '6', '2399', '1', '98', '5', '2013-08-24 13:52:43', '0', '30.jpg');
INSERT INTO `product` VALUES ('31', '宏碁V5-131-10074G32nkk', '宏碁（acer） V5-131-10074G32nkk 11.6英寸超薄本 （双核1007 4G 320G 六芯电池 Linux)黑色', '6', '1999', '1', '28', '4', '2013-08-24 13:52:44', '0', '31.jpg');
INSERT INTO `product` VALUES ('32', 'ThinkPadE135(3359-1C7)', 'ThinkPad E135(3359-1C7) 11.6英寸笔记本 （AMD E1-1200M 2G 500G HD7310显卡 Linux 一年质保）神秘黑', '6', '2399', '1', '539', '4', '2013-08-24 13:52:46', '0', '32.jpg');
INSERT INTO `product` VALUES ('33', '宏碁AO756-1007Ckk', '宏碁（acer） AO756-1007Ckk 11.6英寸超薄本 （双核1007 2G 500G 四芯电池 Linux)黑色', '6', '2199', '1', '74', '4', '2013-08-24 13:52:48', '0', '33.jpg');
INSERT INTO `product` VALUES ('34', '宏碁V5-131-987B4G50nss宏碁（acer） V5-131-987B4G50nss', '宏碁（acer） V5-131-987B4G50nss 11.6英寸超薄本 （奔腾987 4G 500G 集成显卡 Linux 四芯电池) 银色', '6', '2099', '1', '82', '4', '2013-08-24 13:52:49', '0', '34.jpg');
INSERT INTO `product` VALUES ('35', ' 苹果（3C）MD531CH/A', '苹果（Apple） iPad mini MD531CH/A 7.9英寸平板电脑 （16G WIFI版）白色', '7', '2498', '1', '26', '48', '2013-08-24 13:52:50', '0', '35.jpg');
INSERT INTO `product` VALUES ('36', '苹果iPad 2', '苹果（Apple）iPad 2 MC979CH/A 9.7英寸平板电脑 （16G WIFI版）白色', '7', '2850', '1', '84', '48', '2013-08-24 13:52:51', '0', '36.jpg');
INSERT INTO `product` VALUES ('37', '微软中文版 Surface 128G(包括Office 2013家庭和学生版）', '微软（Microsoft）中文版Surface Pro 128G（酷睿i5 4G内存 高清触屏 win8 触控笔 预装office2013）', '7', '6588', '1', '62', '49', '2013-08-24 13:52:52', '0', '37.jpg');
INSERT INTO `product` VALUES ('38', '微软Surface RT 32G (含黑色触控式键盘保护套)', '微软（Microsoft） Surface RT 32G (含黑色触控式键盘保护套)', '7', '3288', '1', '856', '49', '2013-08-24 13:52:53', '0', '38.jpg');
INSERT INTO `product` VALUES ('39', '华硕Pad TF700T 标准版', '华硕（ASUS）Pad TF700T 标准版 10.1英寸平板（Tegra3四核 32GB IPS+ 1920*1200 800w像素 香槟金）', '7', '2999', '1', '876', '2', '2013-08-24 13:52:55', '0', '39.jpg');
INSERT INTO `product` VALUES ('40', '戴尔Vostro 270S-R326-JN', '戴尔（DELL） Vostro 270S-R326-JN 台式电脑 （双核G2030 2G内存 500G硬盘 DVD WIFI 三年上门服务）', '8', '2999', '1', '432', '8', '2013-08-24 13:52:56', '0', '40.jpg');
INSERT INTO `product` VALUES ('41', '惠普P6-1389CX', '惠普(HP) P6-1389CX 台式电脑(G645 4G 1T 1GB独显 DVD 键鼠 Linux)', '8', '2899', '1', '976', '3', '2013-08-24 13:52:57', '0', '41.jpg');
INSERT INTO `product` VALUES ('42', ' 宏碁A1602M', '宏碁（acer） A1602M 台式电脑 （G640 2G 500G 1G独显 DVD 键鼠 Linux）', '8', '2499', '1', '325', '4', '2013-08-24 13:52:58', '0', '42.jpg');
INSERT INTO `product` VALUES ('43', '苹果（3C）iMac', '苹果（Apple） iMac MD093CH/A 21.5英寸一体机', '8', '8888', '1', '876', '48', '2013-08-24 13:52:59', '0', '43.jpg');
INSERT INTO `product` VALUES ('44', ' 联想C340', '联想（Lenovo） C340 20英寸一体电脑 （G540T 2G内存 500G硬盘 1G独显 DVD刻录 Linux 节能机型） 黑色', '8', '3499', '1', '253', '1', '2013-08-24 13:53:00', '0', '44.jpg');
INSERT INTO `product` VALUES ('45', '惠普D3D36PA', '惠普(HP) Z220SFF D3D36PA工作站(i5-3470 4G 1TB DVD 键鼠 Linux 三年上门服务)', '9', '4599', '1', '26', '3', '2013-08-24 13:53:01', '0', '45.jpg');
INSERT INTO `product` VALUES ('46', '戴尔PowerEdge T410 服务器', '戴尔（DELL） PowerEdge T410 服务器 （E5606 4GB 300GB DVD 三年上门服务）', '9', '9499', '1', '437', '8', '2013-08-24 13:53:03', '0', '46.jpg');
INSERT INTO `product` VALUES ('47', '惠普D3D36PA', '惠普(HP) Z220SFF D3D36PA工作站(i5-3470 4G 1TB DVD 键鼠 Linux 三年上门服务)', '9', '4699', '1', '374', '3', '2013-08-24 13:53:04', '0', '47.jpg');
INSERT INTO `product` VALUES ('48', '戴尔PowerEdge T310 服务器', '戴尔（DELL） PowerEdge T310 服务器 （X3430 2G 1TGB DVD 三年上门服务 ）', '9', '6699', '1', '6584', '8', '2013-08-24 13:53:05', '0', '48.jpg');
INSERT INTO `product` VALUES ('49', '惠普D3D35PA', '惠普(HP) Z220SFF D3D35PA工作站(i3-3220 4G 1TB DVD 键鼠 Linux 三年上门服务)', '9', '4299', '1', '352', '3', '2013-08-24 13:53:06', '0', '49.jpg');
INSERT INTO `product` VALUES ('50', 'Inteli7 3770', '英特尔（Intel）酷睿i7-3770 22纳米盒装CPU（LGA1155/3.4GHz/四核/8M三级缓存）', '10', '1989', '1', '469', '10', '2013-08-24 13:53:07', '0', '50.jpg');
INSERT INTO `product` VALUES ('51', 'Intel3470', '英特尔（Intel）酷睿i5-3470 22纳米盒装CPU（LGA1155/3.2GHz/6M三级缓存）', '10', '1229', '1', '274', '10', '2013-08-24 13:53:08', '0', '51.jpg');
INSERT INTO `product` VALUES ('52', 'AMDA8-5600K', 'AMD APU系列四核 A8-5600K 盒装CPU（Socket FM2/3.6GHz/4M缓存/HD 7560D/32nm/100W）', '10', '559', '1', '546', '11', '2013-08-24 13:53:09', '0', '52.jpg');
INSERT INTO `product` VALUES ('53', 'AMDAPU系列 A10-6800K 盒装CPU', 'AMD APU系列四核 A10-6800K 盒装CPU（Socket FM2/4.1GHz/4M缓存/HD8670D/100W）', '10', '939', '1', '345', '11', '2013-08-24 13:53:10', '0', '53.jpg');
INSERT INTO `product` VALUES ('54', '英特尔G2020', '英特尔（Intel）奔腾G2020 22纳米盒装CPU（LGA1155/2.9GHz/双核/3M三级缓存）', '10', '1469', '1', '374', '10', '2013-08-24 13:53:11', '0', '54.jpg');
INSERT INTO `product` VALUES ('55', '技嘉B75M-D3V', '技嘉（GIGABYTE）GA-B75M-D3V 主板(Intel B75 /LGA 1155)', '11', '478', '1', '867', '14', '2013-08-24 13:53:12', '0', '55.jpg');
INSERT INTO `product` VALUES ('56', '华硕P8Z77-V LK', '华硕(ASUS)P8Z77-V LK主板(Intel Z77/LGA 1155)', '11', '589', '1', '97', '2', '2013-08-24 13:53:13', '0', '56.jpg');
INSERT INTO `product` VALUES ('57', '微星板卡 B75MA-P45', '微星（msi）B75MA-P45主板（Intel B75/LGA 1155）', '11', '789', '1', '254', '13', '2013-08-24 13:53:15', '0', '57.jpg');
INSERT INTO `product` VALUES ('58', '华擎B75 Pro3', '华擎（Asrock）B75 Pro3主板（Intel B75/LGA 1155）', '11', '769', '1', '567', '15', '2013-08-24 13:53:16', '0', '58.jpg');
INSERT INTO `product` VALUES ('59', '映泰TA75MH2', '映泰(BIOSTAR) TA75MH2主板(AMD A75/Socket FM2)', '11', '578', '1', '56', '20', '2013-08-24 13:53:17', '0', '59.jpg');
INSERT INTO `product` VALUES ('60', '蓝宝石HD7770 黑钻版 2G', '蓝宝石（Sapphire） HD7770 黑钻版 2G 1100/4500MHz 2GB/128bit GDDR5 PCI-E 显卡', '12', '1699', '1', '24353', '21', '2013-08-24 13:53:18', '0', '60.jpg');
INSERT INTO `product` VALUES ('61', '七彩虹iGame650', '七彩虹(Colorful) iGame650 烈焰战神U D5 1024M 1110/5000MHz 1024M/128位 DDR5 PCI-E 3.0显卡', '12', '1345', '1', '7544', '18', '2013-08-24 13:53:20', '0', '61.jpg');
INSERT INTO `product` VALUES ('62', '华硕GTX650-FMLII-2GD5', '华硕（ASUS） GTX650-FMLII-2GD5 1071MHz/5000MHz 2GB/128bit DDR5 PCI-E 3.0显卡', '12', '1239', '1', '24353', '2', '2013-08-24 13:53:21', '0', '62.jpg');
INSERT INTO `product` VALUES ('63', '微星R7850 HAWK 1G', '微星（MSI)R7850 Hawk 1G 980/4800MHz 1G/256bit DDR5 PCI-E显卡', '12', '1499', '1', '46', '13', '2013-08-24 13:53:23', '0', '63.jpg');
INSERT INTO `product` VALUES ('64', '技嘉GV-N650WF2-1GI', '技嘉(GIGABYTE) GV-N650WF2-1GI 1110 /5000 MHz 1024MB /128 bit GDDR5 PCI-E 显卡', '12', '779', '1', '756', '14', '2013-08-24 13:53:24', '0', '64.jpg');
INSERT INTO `product` VALUES ('65', '西部数据WD10EZEX', '西部数据(WD)蓝盘 1TB SATA6Gb/s 7200转64M 台式机硬盘(WD10EZEX)', '13', '357', '1', '978', '31', '2013-08-24 13:53:25', '0', '65.jpg');
INSERT INTO `product` VALUES ('66', '金士顿V300系列', '金士顿(Kingston)V300 120G SATA3 7MM固态硬盘', '13', '479', '1', '3456', '40', '2013-08-24 13:53:26', '0', '66.jpg');
INSERT INTO `product` VALUES ('67', '三星840系列 120G 2.5英寸 SATA-3固态硬盘', '三星(SAMSUNG) 840系列 120G 2.5英寸 SATA-3固态硬盘(MZ-7TD120BW)普及版简包装', '13', '789', '1', '867', '47', '2013-08-24 13:53:27', '0', '67.jpg');
INSERT INTO `product` VALUES ('68', 'SanDisk至尊高速系列', '闪迪(SanDisk)至尊高速系列 128GB SATA3 固态硬盘(SDSSDHP-128G-Z25)', '13', '389', '1', '45', '39', '2013-08-24 13:53:27', '0', '68.jpg');
INSERT INTO `product` VALUES ('69', '麦克赛尔X3000系列 120G 2.5英寸 SATA-3固态硬盘', '麦克赛尔(maxell) X3000系列 120G 2.5英寸 SATA-3固态硬盘（MX-SSD-X3000-120GB）', '13', '679', '1', '24', '35', '2013-08-24 13:53:28', '0', '69.jpg');
INSERT INTO `product` VALUES ('70', '金士顿DDR3 1600 4GB', '金士顿（Kingston）DDR3 1600 4GB 台式机内存', '14', '199', '1', '65', '40', '2013-08-24 13:53:29', '0', '70.jpg');
INSERT INTO `product` VALUES ('71', '芝奇F3-17000CL11D-8GBXL', 'G.SKILL（芝奇）RipjawsX DDR3 2133 8G(4G×2条)台式机内存(F3-17000CL11D-8GBXL)', '14', '689', '1', '364', '50', '2013-08-24 13:53:30', '0', '71.jpg');
INSERT INTO `product` VALUES ('72', '海盗船CMZ8GX3M2A1600C9R', '海盗船（CORSAIR）Vengeance DDR3 1600 8GB(2x4GB)台式机内存（CMZ8GX3M2A1600C9R）', '14', '589', '1', '55', '51', '2013-08-24 13:53:32', '0', '72.jpg');
INSERT INTO `product` VALUES ('73', '金士顿KHX1600C9D3K2/4GX', '金士顿(Kingston)骇客神条 Genesis系列 DDR3 1600 4GB(2Gx2条)台式机内存(KHX1600C9D3K2/4GX)', '14', '369', '1', '586', '40', '2013-08-24 13:53:33', '0', '73.jpg');
INSERT INTO `product` VALUES ('74', '芝奇F3-14900CL9D-8GBSR', 'G.SKILL（芝奇）SNIPER DDR3 1866 8G(4G×2条)台式机内存(F3-14900CL9D-8GBSR)', '14', '499', '1', '645', '50', '2013-08-24 13:53:34', '0', '74.jpg');
INSERT INTO `product` VALUES ('75', '爱国者简时尚 CA-E620A', '爱国者（aigo）嘉年华CA-E620A彩钢机箱（原生USB3.0 ）', '15', '169', '1', '5433', '52', '2013-08-24 13:53:35', '0', '75.jpg');
INSERT INTO `product` VALUES ('76', '爱国者开拓者T3中塔式机箱', '爱国者（aigo）开拓者T3中塔式机箱（USB3.0/电源下置/背板走线/支持SSD/黑化设计）', '15', '99', '1', '576', '52', '2013-08-24 13:53:36', '0', '76.jpg');
INSERT INTO `product` VALUES ('77', '至睿巫师A20', '至睿（vision） 巫师A20 机箱（热插拔+双原生USB3.0+双风扇+SSD专用托架+倒置38度架构）（黑色）', '15', '169', '1', '354', '53', '2013-08-24 13:53:37', '0', '77.jpg');
INSERT INTO `product` VALUES ('78', '至睿复仇者V6', '至睿（vision）复仇者V6 3.0版机箱（原生USB3.0+全黑化+游戏面板）蓝色', '15', '139', '1', '568', '53', '2013-08-24 13:53:38', '0', '78.jpg');
INSERT INTO `product` VALUES ('79', '至睿（Vision）红粉佳人', '至睿（Vision）红粉佳人 机箱（白色机箱/20厘米导风罩）白色', '15', '289', '1', '687', '53', '2013-08-24 13:53:39', '0', '79.jpg');
INSERT INTO `product` VALUES ('80', '爱国者黑暗骑士550DK', '爱国者（aigo）400W 电源 黑暗骑士550DK（宽幅170V-250V/温控电路）', '16', '109', '1', '576', '52', '2013-08-24 13:53:41', '0', '80.jpg');
INSERT INTO `product` VALUES ('81', '海盗船Gaming系列 GS600', '海盗船（CORSAIR）Gaming系列 GS600 高性能电源（额定600W/80PLUS铜牌认证）', '16', '399', '1', '670', '51', '2013-08-24 13:53:44', '0', '81.jpg');
INSERT INTO `product` VALUES ('82', '海盗船HX650', '海盗船（Corsair） HX650 电源 （80PLUS金牌/额定650W/主动式PFC）', '16', '399', '1', '978', '51', '2013-08-24 13:53:45', '0', '82.jpg');
INSERT INTO `product` VALUES ('83', '海盗船Enthusiast 系列 TX850M', '海盗船（CORSAIR）Enthusiast 系列 TX850M 电源（额定850W/80PLUS铜牌）', '16', '299', '1', '908', '51', '2013-08-24 13:53:47', '0', '83.jpg');
INSERT INTO `product` VALUES ('84', '三星S19C200NW', '三星(SAMSUNG) S19C200NW 19英寸LED宽屏背光液晶显示器', '17', '599', '1', '64', '47', '2013-08-24 13:53:48', '0', '84.jpg');
INSERT INTO `product` VALUES ('85', '宏碁G226', '宏碁（Acer）G226 21.5英寸超薄LED背光液晶显示器', '17', '467', '1', '34', '4', '2013-08-24 13:53:49', '0', '85.jpg');
INSERT INTO `product` VALUES ('86', '戴尔S2340M', '戴尔（DELL）S2340M 23英寸宽屏LED背光IPS液晶显示器', '17', '389', '1', '9780', '8', '2013-08-24 13:53:52', '0', '86.jpg');
INSERT INTO `product` VALUES ('87', '戴尔S2240M', '戴尔（DELL）S2240M 21.5英寸宽屏LED背光IPS液晶显示器', '17', '489', '1', '856', '8', '2013-08-24 13:53:53', '0', '87.jpg');
INSERT INTO `product` VALUES ('88', '三星S24B370H', '三星（SAMSUNG）S24B370H 24英寸宽屏LED液晶显示器', '17', '799', '1', '52', '47', '2013-08-24 13:53:54', '0', '88.jpg');
INSERT INTO `product` VALUES ('89', '华硕SDR-08B1-U', '华硕（ASUS）SDR-08B1-U 8速 外置超薄DVD光驱（黑色）', '18', '279', '1', '47', '2', '2013-08-24 13:53:56', '0', '89.jpg');
INSERT INTO `product` VALUES ('90', '三星SE-218CB', '三星（SAMSUNG） SE-218CB 8速 超级外置DVD刻录机（黑色）', '18', '239', '1', '0', '47', '2013-08-24 13:53:58', '1', '90.jpg');
INSERT INTO `product` VALUES ('91', '三星SH-224DB', '三星（SAMSUNG） SH-224DB 24速 串口 DVD刻录机 （黑色）', '18', '379', '1', '27', '47', '2013-08-24 13:54:00', '0', '91.jpg');
INSERT INTO `product` VALUES ('92', '三星SH-118BB', '三星（SAMSUNG） SH-118BB 18速 串口 DVD光驱 （黑色）', '18', '189', '1', '56', '47', '2013-08-24 13:54:02', '0', '92.jpg');
INSERT INTO `product` VALUES ('93', '华硕DRW-24D3ST', '华硕（ASUS） DRW-24D3ST DVD刻录机 黑色', '18', '209', '1', '2543', '2', '2013-08-24 13:54:03', '0', '93.jpg');
INSERT INTO `product` VALUES ('94', '海盗船Hydro系列 H90', '海盗船（CORSAIR） Hydro系列 H90 140mm 高性能 水冷CPU散热器', '19', '89', '1', '4563', '51', '2013-08-24 13:54:04', '0', '94.jpg');
INSERT INTO `product` VALUES ('95', '海盗船Hydro系列 H110', '海盗船（CORSAIR） Hydro系列 H110 280mm 极致性能 水冷CPU散热器', '19', '109', '1', '644', '51', '2013-08-24 13:54:06', '0', '95.jpg');
INSERT INTO `product` VALUES ('96', '海盗船Hydro系列 CWCH60', '海盗船（CORSAIR）Hydro系列 CWCH60高性能全平台CPU散热器（铜质水冷头和分流管/120mm风扇）', '19', '129', '1', '352', '51', '2013-08-24 13:54:07', '0', '96.jpg');
INSERT INTO `product` VALUES ('97', '酷冷至尊海神', '酷冷至尊（CoolerMaster）海神 CPU水冷散热器（全铜底座/加厚水排/长寿命静音风扇/支持多平台）黑色', '19', '129', '1', '7345', '54', '2013-08-24 13:54:08', '0', '97.jpg');
INSERT INTO `product` VALUES ('98', '酷冷至尊I300尊爵版', '酷冷至尊（CoolerMaster）I300尊爵版 笔记本散热垫 LED蓝光/可调速 支持9-17英寸笔记本（尊爵白）', '19', '179', '1', '856', '54', '2013-08-24 13:54:09', '0', '98.jpg');
INSERT INTO `product` VALUES ('99', '华硕Xonar Essence One MUSES Edition', '华硕（ASUS） Xonar Essence One MUSES Edition发烧友高端音频解码器', '20', '145', '1', '453', '2', '2013-08-24 13:54:10', '0', '99.jpg');
INSERT INTO `product` VALUES ('100', '华硕Xonar U7', '华硕（ASUS） Xonar U7 USB外置声卡', '20', '137', '1', '63', '2', '2013-08-24 13:54:11', '0', '100.jpg');
INSERT INTO `product` VALUES ('101', '华硕Xonar D2', '华硕（ASUS）Xonar D2 多声道游戏音乐声卡(PCI)', '20', '129', '1', '365', '2', '2013-08-24 13:54:13', '0', '101.jpg');
INSERT INTO `product` VALUES ('102', '创新Sound Blaster Audigy 4 II', '创新（Creative） Sound Blaster Audigy 4 II 声卡', '20', '139', '1', '624', '55', '2013-08-24 13:54:14', '0', '102.jpg');
INSERT INTO `product` VALUES ('103', '创新Digital Music Premium HD', '创新（Creative）Digital Music Premium HD USB高清外置声卡', '20', '179', '1', '475', '55', '2013-08-24 13:54:15', '0', '103.jpg');
INSERT INTO `product` VALUES ('104', '戴尔MS111', '戴尔(DELL) MS111 光电鼠标 12支装 FWCMD USB', '21', '349', '1', '5354', '8', '2013-08-24 13:54:16', '0', '104.jpg');
INSERT INTO `product` VALUES ('105', '联想（ThinkPad）0A36414', 'ThinkPad 0A36414 蓝牙无线激光鼠标', '21', '219', '1', '234', '1', '2013-08-24 13:54:18', '0', '105.jpg');
INSERT INTO `product` VALUES ('106', '微软Arc Touch', '微软（Microsoft）无线折叠鼠标 Arc Touch 黑色', '21', '219', '1', '673', '49', '2013-08-24 13:54:19', '0', '106.jpg');
INSERT INTO `product` VALUES ('107', 'Thinkpad57Y4635', 'Thinkpad 57Y4635 USB激光3键滚轮鼠标', '21', '129', '1', '533', '5', '2013-08-24 13:54:21', '0', '107.jpg');
INSERT INTO `product` VALUES ('108', '微软无线激光鼠标ARC', '微软（Microsoft）无线激光鼠标ARC 黑色', '21', '139', '1', '76868', '49', '2013-08-24 13:54:22', '0', '108.jpg');
INSERT INTO `product` VALUES ('109', '微软灵巧套装600', '微软（Microsoft）键鼠套装 灵巧套装600 黑色', '22', '159', '1', '845', '49', '2013-08-24 13:54:24', '0', '109.jpg');
INSERT INTO `product` VALUES ('110', '微软人体工学键盘4000', '微软（Microsoft）键盘 人体工学键盘4000', '22', '129', '1', '45654', '49', '2013-08-24 13:54:25', '0', '110.jpg');
INSERT INTO `product` VALUES ('111', '微软舒适曲线3000', '微软（Microsoft）舒适曲线键盘 3000', '22', '119', '1', '252', '49', '2013-08-24 13:54:26', '0', '111.jpg');
INSERT INTO `product` VALUES ('112', '戴尔KB212', '戴尔（DELL）KB212键盘', '22', '127', '1', '375', '8', '2013-08-24 13:54:27', '0', '112.jpg');
INSERT INTO `product` VALUES ('113', '戴尔KM-113', '戴尔（DELL） KM-113 无线键鼠套装 黑色', '22', '299', '1', '455', '8', '2013-08-24 13:54:28', '0', '113.jpg');
INSERT INTO `product` VALUES ('114', '西部数据Elements Portable 2.5英寸 USB3.0 移动硬盘 1TB', '西部数据（WD） Elements Portable 2.5英寸 USB3.0 移动硬盘 1TB（WDBUZG0010BBK）', '23', '459', '1', '64', '31', '2013-08-24 13:54:28', '0', '114.jpg');
INSERT INTO `product` VALUES ('115', '东芝2.5英寸', '东芝（TOSHIBA） 2.5英寸 黑甲虫系列移动硬盘（USB3.0）1TB', '23', '429', '1', '75', '9', '2013-08-24 13:54:28', '0', '115.jpg');
INSERT INTO `product` VALUES ('116', '东芝星礴系列', '东芝（TOSHIBA） 2.5英寸 星礴系列 移动硬盘（USB3.0） 1TB', '23', '539', '1', '75', '9', '2013-08-24 13:54:29', '0', '116.jpg');
INSERT INTO `product` VALUES ('117', '西部数据My Passport', '西部数据（WD）My Passport USB3.0 1TB 超便携移动硬盘（红色礼包装）WDBBEP0010BRD-PESN', '23', '649', '1', '7567', '31', '2013-08-24 13:54:30', '0', '117.jpg');
INSERT INTO `product` VALUES ('118', '东芝黑甲虫', '东芝（TOSHIBA） 2.5英寸 北极熊系列移动硬盘（USB3.0) 1TB', '23', '890', '1', '45675', '9', '2013-08-24 13:54:30', '0', '118.jpg');
INSERT INTO `product` VALUES ('119', '东芝隼系列THUHYBS', '东芝（TOSHIBA）隼系列（THUHYBS-016G）U盘 16G', '24', '56', '1', '84', '9', '2013-08-24 13:54:32', '0', '119.jpg');
INSERT INTO `product` VALUES ('120', '金士顿DT101G2/2GB', '金士顿（Kingston) DT101G2 32G U盘 紫色', '24', '109', '1', '7', '40', '2013-08-24 13:54:32', '0', '120.jpg');
INSERT INTO `product` VALUES ('121', '金士顿DataTraveler 100', '金士顿（Kingston）DT100G3 16GB USB 3.0 U盘 黑色', '24', '68', '1', '26', '40', '2013-08-24 13:54:33', '0', '121.jpg');
INSERT INTO `product` VALUES ('122', '闪迪CZ37', '闪迪（SanDisk）酷滑（CZ37） 8GB U盘', '24', '29', '1', '4', '39', '2013-08-24 13:54:34', '0', '122.jpg');
INSERT INTO `product` VALUES ('123', '闪迪CZ51', '闪迪（SanDisk）酷捷 (CZ51) 8GB U盘 黑红', '24', '249', '1', '86', '39', '2013-08-24 13:54:35', '0', '123.jpg');
INSERT INTO `product` VALUES ('124', '微软梦剧场精英版', '微软（Microsoft）LifeCam Studio 摄像头 梦剧场精英版 黑色', '25', '309', '1', '574', '49', '2013-08-24 13:54:36', '0', '124.jpg');
INSERT INTO `product` VALUES ('125', '微软HD-3000', '微软（Microsoft）高清网络摄像机 HD-3000', '25', '149', '1', '24523', '49', '2013-08-24 13:54:37', '0', '125.jpg');
INSERT INTO `product` VALUES ('126', '微软VX-800', '微软（Microsoft）摄像头 网络摄像机VX-800 （黑色）', '25', '348', '1', '43', '49', '2013-08-24 13:54:38', '0', '126.jpg');
INSERT INTO `product` VALUES ('127', '联想旗舰版', '联想（LENOVO） 旗舰版 联想无线视频云服务', '25', '389', '1', '64', '1', '2013-08-24 13:54:42', '0', '127.jpg');
INSERT INTO `product` VALUES ('128', '联想高级版', '联想（LENOVO） 高级版 联想无线视频云服务', '25', '489', '1', '23245', '1', '2013-08-24 13:54:46', '0', '128.jpg');
INSERT INTO `product` VALUES ('129', '飚王HE-G303', '飚王（SSK）HE-G303 天启USB 3.0硬盘盒 黑色', '26', '349', '1', '6345', '56', '2013-08-24 13:54:47', '0', '129.jpg');
INSERT INTO `product` VALUES ('130', '奥睿科8628sus3-c', '奥睿科（ORICO）8628sus3-c 2.5/3.5寸通用双串口硬盘座 黑', '26', '288', '1', '754', '57', '2013-08-24 13:54:48', '0', '130.jpg');
INSERT INTO `product` VALUES ('131', '奥睿科3529rus3', '奥睿科（ORICO）3529rus3 外置免工具全铝双硬盘盒磁盘阵列盒USB3.0+eSATA 黑', '26', '388', '1', '342', '57', '2013-08-24 13:54:49', '0', '131.jpg');
INSERT INTO `product` VALUES ('132', '飚王HE-T300', '飚王（SSK）HE-T300 黑鹰II USB 3.0硬盘盒 （黑色）', '26', '389', '1', '4636', '56', '2013-08-24 13:54:50', '0', '132.jpg');
INSERT INTO `product` VALUES ('133', '奥睿科3559susj3', '奥睿科（ORICO）3559susj3 全铝5盘位大容量磁盘存储系统 黑', '26', '469', '1', '8567', '57', '2013-08-24 13:54:51', '0', '133.jpg');
INSERT INTO `product` VALUES ('134', '赛睿西伯利亚v1 全尺寸耳机', '赛睿（SteelSeries）西伯利亚v1 全尺寸耳机 白色', '27', '299', '1', '957', '58', '2013-08-24 13:54:52', '0', '134.jpg');
INSERT INTO `product` VALUES ('135', '北通BTP－2175', '北通（BETOP）BTP-2175 阿修罗SE 有线震动版 游戏手柄 镜面黑', '27', '309', '1', '64', '59', '2013-08-24 13:54:54', '0', '135.jpg');
INSERT INTO `product` VALUES ('136', '北通振动手柄3', '北通（BETOP）振动3 手柄', '27', '208', '1', '24', '59', '2013-08-24 13:54:54', '0', '136.jpg');
INSERT INTO `product` VALUES ('137', '北通BTP-2185', '北通（BETOP）阿修罗TE BTP-2185 PC&PS3双平台 智能游戏手柄 镜面黑', '27', '309', '1', '357', '59', '2013-08-24 13:54:56', '0', '137.jpg');
INSERT INTO `product` VALUES ('138', '赛睿 西伯利亚v2', '赛睿（SteelSeries）西伯利亚v2 游戏耳机 霜冻之蓝版', '27', '479', '1', '84', '58', '2013-08-24 13:54:57', '0', '138.jpg');
INSERT INTO `product` VALUES ('139', '赛睿QCK heavy', '赛睿（SteelSeries）QcK Heavy 鼠标垫', '28', '19', '1', '243', '58', '2013-08-24 13:54:58', '0', '139.jpg');
INSERT INTO `product` VALUES ('140', '赛睿鼠标垫', '赛睿（SteelSeries）QcK+ 《Dota2》Logo版 鼠标垫', '28', '29', '1', '65765', '58', '2013-08-24 13:54:59', '0', '140.jpg');
INSERT INTO `product` VALUES ('141', '赛睿QCK+ EG', '赛睿（SteelSeries）QcK+ 鼠标垫 EG战队版', '28', '39', '1', '74', '58', '2013-08-24 13:55:00', '0', '141.jpg');
INSERT INTO `product` VALUES ('142', '宜客莱CD-EL180', '宜客莱（ECOLA）CD-EL180 全能型电脑清洁套装（清洁剂+伸缩静电刷+双面绒清洁布）', '29', '39', '1', '97', '60', '2013-08-24 13:55:02', '0', '142.jpg');
INSERT INTO `product` VALUES ('143', '宜客莱CD-WT502X', '宜客莱（ECOLA） CD-WT502X 双倍强效抗静电抗菌无醇专业级屏幕清洁湿巾 镜头清洁纸巾（50抽桶装）', '29', '47', '1', '675', '60', '2013-08-24 13:55:03', '0', '143.jpg');
INSERT INTO `product` VALUES ('144', '联想E50', 'CPU:4核 core-i7, winodws8系统', '5', '8899', '1', '188', '1', '2013-08-29 08:57:22', '1', '4.jpg');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `sex` int(2) DEFAULT '0',
  `introduction` varchar(200) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `qq` varchar(12) DEFAULT NULL,
  `job` varchar(50) DEFAULT NULL,
  `picture` varchar(50) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `regdate` date NOT NULL,
  `lastlogintime` datetime NOT NULL,
  PRIMARY KEY (`uid`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('4', 'icer', '1234', 'swikecc', '1', '其实，我是D-Now网管理员', 'shi123huike@126.com', '15620935845', '517741817', '学生', null, '1993-06-10', '2013-08-17', '2013-08-28 19:56:10');
INSERT INTO `user` VALUES ('5', 'shik', 'cier', 'shik', '1', '', '', '', '', '', null, null, '2013-08-17', '2013-08-17 10:26:56');
INSERT INTO `user` VALUES ('6', 'shike', '2345', 'shike', '1', null, null, null, null, null, null, null, '2013-08-17', '2013-08-17 11:02:24');
INSERT INTO `user` VALUES ('7', 'shiked', '2345', 'shiked', '1', null, null, null, null, null, null, null, '2013-08-18', '2013-08-18 19:48:01');
INSERT INTO `user` VALUES ('8', 'babjoy', '123', 'zbl', '1', '大家好，我是张宝乐，我喜欢D_Now这个网站', '799587045@qq.cm', '15202209051', '799587045', '学生', null, '1992-02-08', '2013-08-22', '2013-08-22 10:30:09');
INSERT INTO `user` VALUES ('9', 'xiaoke', '123', 'xiaoke', '1', null, null, null, null, null, null, null, '2013-08-24', '2013-08-24 14:00:49');
INSERT INTO `user` VALUES ('10', '小六子', 'shi', '小六子', '1', '小六子向大家致敬！！！', '123@123.com', '15678342299', '27839904', '老师', null, '2008-07-10', '2013-08-24', '2013-08-28 19:47:22');
INSERT INTO `user` VALUES ('11', 'abc', '123', 'abc', '1', null, null, null, null, null, null, null, '2013-08-24', '2013-08-24 14:00:55');
INSERT INTO `user` VALUES ('12', 'def', '123', 'def', '1', null, null, null, null, null, null, null, '2013-08-24', '2013-08-24 14:00:58');
INSERT INTO `user` VALUES ('13', 'ghi', '123', 'ghi', '1', null, null, null, null, null, null, null, '2013-08-24', '2013-08-24 14:01:01');
INSERT INTO `user` VALUES ('14', 'jkl', '123', 'jkl', '1', null, null, null, null, null, null, null, '2013-08-24', '2013-08-24 14:01:03');
INSERT INTO `user` VALUES ('15', 'xyz', '123', 'xyz', '1', null, null, null, null, null, null, null, '2013-08-24', '2013-08-24 14:01:06');
INSERT INTO `user` VALUES ('16', 'jsla', '12143', 'jsla', '1', null, null, null, null, null, null, null, '2013-08-24', '2013-08-24 15:21:37');
INSERT INTO `user` VALUES ('17', 'iceras', '1234', 'iceras', '1', null, null, null, null, null, null, null, '2013-08-25', '2013-08-25 12:16:21');
INSERT INTO `user` VALUES ('18', 'icershi', 'shiw', 'icershi', null, null, null, null, null, null, null, null, '2013-08-28', '2013-08-28 17:23:26');
INSERT INTO `user` VALUES ('19', 'acer', '1234', 'acer', null, null, null, null, null, null, null, null, '2013-08-28', '2013-08-28 18:57:21');
INSERT INTO `user` VALUES ('20', 'zhang', 'zhang', 'zhang', null, null, null, null, null, null, null, null, '2013-08-28', '2013-08-28 19:41:08');
