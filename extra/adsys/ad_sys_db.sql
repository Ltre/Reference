/*
Navicat MySQL Data Transfer

Source Server         : 61.160.36.225
Source Server Version : 50546
Source Host           : 61.160.36.225:3306
Source Database       : adsystem

Target Server Type    : MYSQL
Target Server Version : 50546
File Encoding         : 65001

Date: 2017-01-13 12:28:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `ad_channel`
-- ----------------------------
DROP TABLE IF EXISTS `ad_channel`;
CREATE TABLE `ad_channel` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '频道ID',
  `name` varchar(50) NOT NULL COMMENT '频道名称',
  `platform_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '所属平台id',
  `desc` varchar(200) DEFAULT NULL COMMENT '描述',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态（0失效，1有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='频道';

-- ----------------------------
-- Records of ad_channel
-- ----------------------------

-- ----------------------------
-- Table structure for `ad_js`
-- ----------------------------
DROP TABLE IF EXISTS `ad_js`;
CREATE TABLE `ad_js` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板名称',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板代码',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '类型（0普通，1默认',
  `desc` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '说明',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `creator` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建者',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后更新时间',
  `changer` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '修改者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='模板JS代码';

-- ----------------------------
-- Records of ad_js
-- ----------------------------

-- ----------------------------
-- Table structure for `ad_loc`
-- ----------------------------
DROP TABLE IF EXISTS `ad_loc`;
CREATE TABLE `ad_loc` (
  `loc_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '广告位id',
  `name` varchar(50) CHARACTER SET utf8mb4 NOT NULL COMMENT '广告位名称',
  `sn` varchar(50) CHARACTER SET utf8mb4 NOT NULL COMMENT '广告位编号',
  `platform_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '所属平台',
  `channel_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '频道id',
  `js_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '模板代码id',
  `default_js_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '打底物料',
  `spec_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '规格ID',
  `sketch_url` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '广告位示意图',
  `remark` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '备注',
  `sell_price` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '底价（分）',
  `sell_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '计费方式（1CPM,2CPC',
  `max_per_ip` bigint(20) unsigned NOT NULL DEFAULT '10' COMMENT '每IP最大显示数量',
  `max_pre_uv` bigint(20) unsigned NOT NULL DEFAULT '10' COMMENT '每UV最大显示数量',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后更新时间',
  `check_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '审核时间',
  `creator` varchar(30) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '创建者',
  `changer` varchar(30) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '最后修改',
  `check_admin` varchar(30) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '审核人',
  `check_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '审核状态(0待审核,1通过,2已拒绝',
  PRIMARY KEY (`loc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='广告位';

-- ----------------------------
-- Records of ad_loc
-- ----------------------------

-- ----------------------------
-- Table structure for `ad_loc_occupy`
-- ----------------------------
DROP TABLE IF EXISTS `ad_loc_occupy`;
CREATE TABLE `ad_loc_occupy` (
  `occupy_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `plan_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '推广计划ID',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态：1未投放，2投放中',
  PRIMARY KEY (`occupy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='广告占位记录';

-- ----------------------------
-- Records of ad_loc_occupy
-- ----------------------------

-- ----------------------------
-- Table structure for `ad_plan`
-- ----------------------------
DROP TABLE IF EXISTS `ad_plan`;
CREATE TABLE `ad_plan` (
  `ad_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ad_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '广告名',
  `budget_day` double(10,2) NOT NULL DEFAULT '0.00' COMMENT '每日预算（元）',
  `pos_ids` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '需占用的广告位ID, 多个逗号隔开, 作为ad_loc_occupy.loc_id的冗余存储',
  `src` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '素材地址',
  `link` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '广告链接',
  `extra_json` text COLLATE utf8mb4_unicode_ci COMMENT '复杂信息流广告数据json',
  `charge_type` bigint(20) NOT NULL DEFAULT '0' COMMENT '计费类型：1-CPM, 2-CPC',
  `charge` double(10,2) NOT NULL DEFAULT '0.00' COMMENT '出价(元/每单位计费类型)',
  `start_date` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '投放开始日期',
  `end_date` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '投放结束日期',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间戳',
  `check_time` int(11) NOT NULL DEFAULT '0' COMMENT '审核时间',
  `check_admin` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '审核人账号',
  `check_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '审核状态：0待审核，1已通过，2已拒绝',
  PRIMARY KEY (`ad_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='推广计划（广告）';

-- ----------------------------
-- Records of ad_plan
-- ----------------------------

-- ----------------------------
-- Table structure for `ad_platform`
-- ----------------------------
DROP TABLE IF EXISTS `ad_platform`;
CREATE TABLE `ad_platform` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '平台ID',
  `name` varchar(50) NOT NULL COMMENT '平台名称',
  `category` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '产品属性（0网站，1APP，2PC软件',
  `desc` varchar(200) DEFAULT NULL COMMENT '描述',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态（0失效，1有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='广告平台';

-- ----------------------------
-- Records of ad_platform
-- ----------------------------

-- ----------------------------
-- Table structure for `ad_pos_use`
-- ----------------------------
DROP TABLE IF EXISTS `ad_pos_use`;
CREATE TABLE `ad_pos_use` (
  `use_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pos_id` bigint(20) NOT NULL COMMENT '广告位ID',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态：0未投放, 1已投放',
  PRIMARY KEY (`use_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='广告占位记录';

-- ----------------------------
-- Records of ad_pos_use
-- ----------------------------

-- ----------------------------
-- Table structure for `ad_spec`
-- ----------------------------
DROP TABLE IF EXISTS `ad_spec`;
CREATE TABLE `ad_spec` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL COMMENT '规格名称',
  `width` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '宽度',
  `height` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '高度',
  `desc` varchar(200) DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='广告规格';

-- ----------------------------
-- Records of ad_spec
-- ----------------------------

-- ----------------------------
-- Table structure for `ad_stats`
-- ----------------------------
DROP TABLE IF EXISTS `ad_stats`;
CREATE TABLE `ad_stats` (
  `stats_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `plan_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '对应的推广计划（广告）',
  `stats_time` int(11) NOT NULL DEFAULT '0' COMMENT '统计时间戳',
  `url` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '所在页面地址',
  `domain` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '所在域名',
  PRIMARY KEY (`stats_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='广告量记录（前台只写，或用logstash）';

-- ----------------------------
-- Records of ad_stats
-- ----------------------------

-- ----------------------------
-- Table structure for `ad_stats_daysum`
-- ----------------------------
DROP TABLE IF EXISTS `ad_stats_daysum`;
CREATE TABLE `ad_stats_daysum` (
  `sum_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `plan_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '对应的推广计划（广告）',
  `cpm_num` bigint(20) NOT NULL DEFAULT '0' COMMENT '展现量',
  `cpc_num` bigint(20) NOT NULL DEFAULT '0' COMMENT '点击量',
  `stats_date` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '统计日期',
  PRIMARY KEY (`sum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='广告量统计-日汇总';

-- ----------------------------
-- Records of ad_stats_daysum
-- ----------------------------

-- ----------------------------
-- Table structure for `ad_stats_hoursum`
-- ----------------------------
DROP TABLE IF EXISTS `ad_stats_hoursum`;
CREATE TABLE `ad_stats_hoursum` (
  `sum_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `plan_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '对应的推广计划（广告）',
  `cpm_num` bigint(20) NOT NULL DEFAULT '0' COMMENT '展现量',
  `cpc_num` bigint(20) NOT NULL DEFAULT '0' COMMENT '点击量',
  `stats_hour` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '统计小时，如2017011213表示20170112的13时',
  PRIMARY KEY (`sum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='广告量统计-按小时汇总';

-- ----------------------------
-- Records of ad_stats_hoursum
-- ----------------------------

-- ----------------------------
-- Table structure for `ad_stats_monthsum`
-- ----------------------------
DROP TABLE IF EXISTS `ad_stats_monthsum`;
CREATE TABLE `ad_stats_monthsum` (
  `sum_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `plan_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '对应的推广计划（广告）',
  `cpm_num` bigint(20) NOT NULL DEFAULT '0' COMMENT '展现量',
  `cpc_num` bigint(20) NOT NULL DEFAULT '0' COMMENT '点击量',
  `stats_month` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '统计月份',
  PRIMARY KEY (`sum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='广告量统计-月汇总';

-- ----------------------------
-- Records of ad_stats_monthsum
-- ----------------------------

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admin_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role` tinyint(4) NOT NULL DEFAULT '0' COMMENT '角色：数值待定，0为默认管理员',
  `udb` varchar(32) NOT NULL DEFAULT '' COMMENT 'UDB账号',
  `yyuid` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建人',
  `creator` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人',
  `changer` varchar(32) NOT NULL DEFAULT '' COMMENT '修改人',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='管理员';

-- ----------------------------
-- Records of admin
-- ----------------------------

-- ----------------------------
-- Table structure for `deduct_order`
-- ----------------------------
DROP TABLE IF EXISTS `deduct_order`;
CREATE TABLE `deduct_order` (
  `order_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) NOT NULL,
  `day_cpc_num` int(11) NOT NULL DEFAULT '0' COMMENT '当日CPC量',
  `day_cpm_num` int(11) NOT NULL DEFAULT '0' COMMENT '当日CPM量',
  `deduct_date` varchar(8) NOT NULL DEFAULT '' COMMENT '扣款日期YYYYMMDD',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `note` varchar(64) NOT NULL DEFAULT '' COMMENT '备注',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态：0待完成，1已完成，2中止',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统结算扣款订单';

-- ----------------------------
-- Records of deduct_order
-- ----------------------------

-- ----------------------------
-- Table structure for `invoice_record`
-- ----------------------------
DROP TABLE IF EXISTS `invoice_record`;
CREATE TABLE `invoice_record` (
  `record_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `apply_time` int(11) NOT NULL DEFAULT '0' COMMENT '申请时间',
  `money` int(11) NOT NULL DEFAULT '0' COMMENT '申请金额（正数）',
  `invoice_header` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '发票抬头',
  `invoice_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '发票项目（即类型），0默认类型',
  `charge_month` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '充值月份',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态：0申请中，1已通过，2被拒绝，3已快递',
  `express_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '快递公司',
  `express_code` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '快递单号',
  `address` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '收货地址',
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '收货电话',
  `email` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '收货通知邮件',
  `contact` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '收货联系人',
  `note` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='发票开具记录';

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
  `note` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  `stats_date` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '汇总日期',
  PRIMARY KEY (`sum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='资金变动汇总（日）';

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
  `note` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  `stats_month` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '汇总月份',
  PRIMARY KEY (`sum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='资金变动汇总（月）';

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
  `money_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '消费类型（0为未定义类型，正数为增加金额类型，负数为减少金额类型。1自助充值，2后台手动充值，-1系统结算扣除，-2后台手动扣除。）',
  `recharge_order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '自助充值订单ID',
  `deduct_order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '系统结算扣款订单ID',
  `balance_before` double(10,2) NOT NULL DEFAULT '0.00' COMMENT '原余额',
  `balance_after` double(10,2) NOT NULL DEFAULT '0.00' COMMENT '变动后余额',
  `note` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  `stats_date` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '统计日期（冗余存储）',
  `stats_month` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '统计月份（冗余存储）',
  `stats_time` int(11) NOT NULL DEFAULT '0' COMMENT '统计时间戳',
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='资金变动记录（精确到次）';

-- ----------------------------
-- Records of money_record
-- ----------------------------

-- ----------------------------
-- Table structure for `recharge_order`
-- ----------------------------
DROP TABLE IF EXISTS `recharge_order`;
CREATE TABLE `recharge_order` (
  `order_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) NOT NULL,
  `money` double(10,2) NOT NULL DEFAULT '0.00' COMMENT '充值金额',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `note` varchar(64) NOT NULL DEFAULT '' COMMENT '备注',
  `response` text COMMENT '充值接口响应内容',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态：0待完成，1已完成，2中止',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='自助充值订单';

-- ----------------------------
-- Records of recharge_order
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` bigint(20) NOT NULL,
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '登录账号',
  `password` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码不可逆值',
  `license_img` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '营业执照图',
  `balance` double(10,2) NOT NULL DEFAULT '0.00' COMMENT '余额',
  `reg_time` int(11) NOT NULL DEFAULT '0' COMMENT '注册时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `company` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '公司名',
  `address` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '地址',
  `contact` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '联系人（名）',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '手机或电话',
  `email` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'QQ',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='广告商用户';

-- ----------------------------
-- Records of user
-- ----------------------------
