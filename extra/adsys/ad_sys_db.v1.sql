<pre>

/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50711
Source Host           : localhost:3306
Source Database       : adsys

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2017-01-12 13:29:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `ad`
-- ----------------------------
DROP TABLE IF EXISTS `ad`;
CREATE TABLE `ad` (
  `ad_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ad_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '广告名',
  `budget_day` double(10,2) NOT NULL DEFAULT '0.00' COMMENT '每日预算（元）',
  `pos_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '广告位ID',
  `src` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '素材地址',
  `link` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '广告链接',
  `charge_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '计费类型：如cpm, cpc, cpa',
  `charge` double(10,2) NOT NULL DEFAULT '0.00' COMMENT '出价(元/一单位计费类型)',
  `start_date` varchar(8) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '投放开始日期',
  `end_date` varchar(8) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '投放结束日期',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间戳',
  `check_time` int(11) NOT NULL DEFAULT '0' COMMENT '审核时间',
  `check_admin` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '审核人账号',
  `check_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '审核状态：0待审核，1已通过，2已拒绝',
  PRIMARY KEY (`ad_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='推广计划（广告）';

-- ----------------------------
-- Records of ad
-- ----------------------------


-- ----------------------------
-- Table structure for `ad_stats`
-- ----------------------------
DROP TABLE IF EXISTS `ad_stats`;
CREATE TABLE `ad_stats` (
  `stats_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ad_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '对应的推广计划（广告）',
  `stats_time` int(11) NOT NULL DEFAULT '0' COMMENT '统计时间戳',
  PRIMARY KEY (`stats_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='广告量记录（前台只写，或用logstash）';

-- ----------------------------
-- Records of ad_stats
-- ----------------------------

-- ----------------------------
-- Table structure for `ad_stats_sum`
-- ----------------------------
DROP TABLE IF EXISTS `ad_stats_sum`;
CREATE TABLE `ad_stats_sum` (
  `sum_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ad_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '对应的推广计划（广告）',
  `cpm_num` bigint(20) NOT NULL DEFAULT '0' COMMENT '展现量',
  `cpc_num` bigint(20) NOT NULL DEFAULT '0' COMMENT '点击量',
  `stats_hour` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '统计小时，如2017011213表示20170112的13时',
  `stats_date` varchar(8) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '统计日期',
  `stats_month` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '统计月份',
  PRIMARY KEY (`sum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='广告量统计-汇总';

-- ----------------------------
-- Records of ad_stats_sum
-- ----------------------------

-- ----------------------------
-- Table structure for `ad_user`
-- ----------------------------
DROP TABLE IF EXISTS `ad_user`;
CREATE TABLE `ad_user` (
  `uid` bigint(20) NOT NULL,
  `username` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '登录账号',
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '密码不可逆值',
  `license_img` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '营业执照图',
  `balance` double(10,2) NOT NULL DEFAULT '0.00' COMMENT '余额',
  `reg_time` int(11) NOT NULL DEFAULT '0' COMMENT '注册时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `company` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '公司名',
  `address` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '地址',
  `contact` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '联系人（名）',
  `phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '手机或电话',
  `email` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'QQ',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='广告商用户';

-- ----------------------------
-- Records of ad_user
-- ----------------------------

-- ----------------------------
-- Table structure for `invoice_record`
-- ----------------------------
DROP TABLE IF EXISTS `invoice_record`;
CREATE TABLE `invoice_record` (
  `record_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `apply_time` int(11) NOT NULL DEFAULT '0' COMMENT '申请时间',
  `money` int(11) NOT NULL DEFAULT '0' COMMENT '申请金额（正数）',
  `invoice_header` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '发票抬头',
  `invoice_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '发票项目（即类型），0默认类型',
  `charge_month` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '充值月份',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态：0申请中，1已通过，2被拒绝，3已快递',
  `express_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '快递公司',
  `express_code` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '快递单号',
  `address` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '收货地址',
  `phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '收货电话',
  `email` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '收货通知邮件',
  `contact` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '收货联系人',
  `note` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='发票开具记录';

-- ----------------------------
-- Records of invoice_record
-- ----------------------------

-- ----------------------------
-- Table structure for `money_daysum`
-- ----------------------------
DROP TABLE IF EXISTS `money_daysum`;
CREATE TABLE `money_daysum` (
  `sum_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) NOT NULL,
  `expend` double(10,2) NOT NULL DEFAULT '0.00' COMMENT '支出',
  `income` double(10,2) NOT NULL DEFAULT '0.00' COMMENT '存入',
  `note` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  `stats_date` varchar(8) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '汇总日期',
  PRIMARY KEY (`sum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='资金变动汇总（日）';

-- ----------------------------
-- Records of money_daysum
-- ----------------------------

-- ----------------------------
-- Table structure for `money_monthsum`
-- ----------------------------
DROP TABLE IF EXISTS `money_monthsum`;
CREATE TABLE `money_monthsum` (
  `sum_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) NOT NULL,
  `expend` double(10,2) NOT NULL DEFAULT '0.00' COMMENT '支出',
  `income` double(10,2) NOT NULL DEFAULT '0.00' COMMENT '存入',
  `note` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  `stats_month` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '汇总月份',
  PRIMARY KEY (`sum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='资金变动汇总（月）';

-- ----------------------------
-- Records of money_monthsum
-- ----------------------------

-- ----------------------------
-- Table structure for `money_record`
-- ----------------------------
DROP TABLE IF EXISTS `money_record`;
CREATE TABLE `money_record` (
  `record_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) NOT NULL,
  `money` double(10,2) NOT NULL DEFAULT '0.00' COMMENT '资金变动正负值',
  `money_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '资金变动类型：0未定义，正数为增类型，负数为减类型',
  `note` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  `stats_date` varchar(8) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '统计日期（冗余存储）',
  `stats_month` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '统计月份（冗余存储）',
  `stats_time` int(11) NOT NULL DEFAULT '0' COMMENT '统计时间戳',
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='资金变动记录（精确到次）';

-- ----------------------------
-- Records of money_record
-- ----------------------------

</pre>