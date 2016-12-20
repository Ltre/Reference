/*
Navicat MySQL Data Transfer

Source Server         : 183.61.6.96(虎牙视频)
Source Server Version : 50509
Source Host           : 183.61.6.96:6301
Source Database       : video_dw

Target Server Type    : MYSQL
Target Server Version : 50509
File Encoding         : 65001

Date: 2015-04-07 15:24:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `v_video_record`
-- ----------------------------
DROP TABLE IF EXISTS `v_video_record`;
CREATE TABLE `v_video_record` (
  `record_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `vid` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL COMMENT '观看人',
  `last_time` int(11) DEFAULT NULL COMMENT '上次播放时间',
  `stop_time` int(11) DEFAULT NULL COMMENT '进度条停留时刻,-1未播放,0播放完',
  `duration` int(11) DEFAULT NULL COMMENT '观看时长(秒),-1未记录,0播放完',
  PRIMARY KEY (`record_id`),
  UNIQUE KEY `vu_uniq` (`vid`,`user_id`) USING BTREE,
  KEY `vid` (`vid`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `last_time` (`last_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v_video_record
-- ----------------------------
INSERT INTO `v_video_record` VALUES ('1', '104316', '50014545', '1428375682', '0', '0');
INSERT INTO `v_video_record` VALUES ('2', '103637', '50014545', '1428375734', '0', '0');
INSERT INTO `v_video_record` VALUES ('3', '104345', '50014545', '1428289268', '0', '0');
INSERT INTO `v_video_record` VALUES ('4', '104351', '50014545', '1428189312', '0', '0');
INSERT INTO `v_video_record` VALUES ('5', '104326', '50014545', '1428089363', '0', '0');
INSERT INTO `v_video_record` VALUES ('6', '104320', '50014545', '1427989379', '0', '0');
INSERT INTO `v_video_record` VALUES ('7', '104302', '50014545', '1427889415', '0', '0');
INSERT INTO `v_video_record` VALUES ('8', '104297', '50014545', '1427789430', '0', '0');
INSERT INTO `v_video_record` VALUES ('9', '104293', '50014545', '1427689448', '0', '0');
INSERT INTO `v_video_record` VALUES ('10', '104294', '50014545', '1427589563', '0', '0');
INSERT INTO `v_video_record` VALUES ('11', '104271', '50014545', '1427589575', '0', '0');
INSERT INTO `v_video_record` VALUES ('12', '104276', '50014545', '1427589659', '0', '0');
INSERT INTO `v_video_record` VALUES ('13', '104274', '50014545', '1427589585', '0', '0');
INSERT INTO `v_video_record` VALUES ('14', '104288', '50014545', '1427589588', '0', '0');
INSERT INTO `v_video_record` VALUES ('15', '104209', '50014545', '1426789681', '0', '0');
INSERT INTO `v_video_record` VALUES ('16', '104211', '50014545', '1426789684', '0', '0');
INSERT INTO `v_video_record` VALUES ('17', '104217', '50014545', '1426789685', '0', '0');
INSERT INTO `v_video_record` VALUES ('18', '104246', '50014545', '1426789687', '0', '0');
INSERT INTO `v_video_record` VALUES ('19', '104250', '50014545', '1426789688', '0', '0');
INSERT INTO `v_video_record` VALUES ('20', '104266', '50014545', '1426789690', '0', '0');
INSERT INTO `v_video_record` VALUES ('21', '104263', '50014545', '1426789691', '0', '0');
INSERT INTO `v_video_record` VALUES ('22', '104272', '50014545', '1426789693', '0', '0');
INSERT INTO `v_video_record` VALUES ('23', '104345', '50013551', '1428391304', '0', '0');
INSERT INTO `v_video_record` VALUES ('24', '104351', '50013551', '1428391307', '0', '0');
INSERT INTO `v_video_record` VALUES ('25', '104326', '50013551', '1428391309', '0', '0');
INSERT INTO `v_video_record` VALUES ('26', '104320', '50013551', '1428391311', '0', '0');
INSERT INTO `v_video_record` VALUES ('27', '104302', '50013551', '1428291321', '0', '0');
INSERT INTO `v_video_record` VALUES ('28', '104297', '50013551', '1428291323', '0', '0');
INSERT INTO `v_video_record` VALUES ('29', '104293', '50013551', '1428291325', '0', '0');
INSERT INTO `v_video_record` VALUES ('30', '104294', '50013551', '1428291328', '0', '0');
INSERT INTO `v_video_record` VALUES ('31', '104271', '50013551', '1428191370', '0', '0');
INSERT INTO `v_video_record` VALUES ('32', '104276', '50013551', '1428191376', '0', '0');
INSERT INTO `v_video_record` VALUES ('33', '104274', '50013551', '1428191374', '0', '0');
INSERT INTO `v_video_record` VALUES ('34', '104288', '50013551', '1428191381', '0', '0');
INSERT INTO `v_video_record` VALUES ('35', '104272', '50013551', '1428091409', '0', '0');
INSERT INTO `v_video_record` VALUES ('36', '104263', '50013551', '1428091399', '0', '0');
INSERT INTO `v_video_record` VALUES ('37', '104266', '50013551', '1428091401', '0', '0');
INSERT INTO `v_video_record` VALUES ('38', '104250', '50013551', '1428091402', '0', '0');
INSERT INTO `v_video_record` VALUES ('39', '104246', '50013551', '1427591429', '0', '0');
INSERT INTO `v_video_record` VALUES ('40', '104217', '50013551', '1427791418', '0', '0');
INSERT INTO `v_video_record` VALUES ('41', '104211', '50013551', '1427791420', '0', '0');
INSERT INTO `v_video_record` VALUES ('42', '104209', '50013551', '1427791421', '0', '0');
INSERT INTO `v_video_record` VALUES ('43', '104212', '50013551', '1427591449', '0', '0');
INSERT INTO `v_video_record` VALUES ('44', '104191', '50013551', '1427591443', '0', '0');
INSERT INTO `v_video_record` VALUES ('45', '104182', '50013551', '1427591445', '0', '0');
INSERT INTO `v_video_record` VALUES ('46', '104171', '50013551', '1427591447', '0', '0');
INSERT INTO `v_video_record` VALUES ('47', '104168', '50013551', '1427091460', '0', '0');
INSERT INTO `v_video_record` VALUES ('48', '104163', '50013551', '1427091461', '0', '0');
INSERT INTO `v_video_record` VALUES ('49', '104175', '50013551', '1427091463', '0', '0');
INSERT INTO `v_video_record` VALUES ('50', '104169', '50013551', '1426391490', '0', '0');
INSERT INTO `v_video_record` VALUES ('51', '104134', '50013551', '1426391476', '0', '0');
INSERT INTO `v_video_record` VALUES ('52', '104128', '50013551', '1426391478', '0', '0');
INSERT INTO `v_video_record` VALUES ('53', '104127', '50013551', '1426391483', '0', '0');
INSERT INTO `v_video_record` VALUES ('54', '104123', '50013551', '1426391485', '0', '0');
INSERT INTO `v_video_record` VALUES ('55', '104119', '50013551', '1426391488', '0', '0');
INSERT INTO `v_video_record` VALUES ('56', '104117', '50013551', '1426391489', '0', '0');
INSERT INTO `v_video_record` VALUES ('57', '104101', '50013551', '1426391491', '0', '0');
INSERT INTO `v_video_record` VALUES ('58', '104091', '50013551', '1426391493', '0', '0');
INSERT INTO `v_video_record` VALUES ('59', '104084', '50013551', '1426391497', '0', '0');
INSERT INTO `v_video_record` VALUES ('60', '104083', '50013551', '1425391503', '0', '0');
INSERT INTO `v_video_record` VALUES ('61', '104081', '50013551', '1425391505', '0', '0');
INSERT INTO `v_video_record` VALUES ('62', '104077', '50013551', '1425391507', '0', '0');
INSERT INTO `v_video_record` VALUES ('63', '104170', '50013551', '1424391516', '0', '0');
INSERT INTO `v_video_record` VALUES ('64', '104035', '50013551', '1424391518', '0', '0');
INSERT INTO `v_video_record` VALUES ('65', '104023', '50013551', '1424391520', '0', '0');
