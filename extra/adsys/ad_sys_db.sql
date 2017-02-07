/*
Navicat MySQL Data Transfer

Source Server         : 61.160.36.225
Source Server Version : 50546
Source Host           : 61.160.36.225:3306
Source Database       : adsystem

Target Server Type    : MYSQL
Target Server Version : 50546
File Encoding         : 65001

Date: 2017-02-07 09:34:20
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
  `update_time` timestamp NULL DEFAULT NULL COMMENT '最后更新时间',
  `changer` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '修改者',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='模板JS代码';

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
  `page_url` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '所在页面url',
  `remark` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '备注',
  `sell_price` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '底价（分）',
  `sell_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '计费方式（1CPM,2CPC',
  `max_per_ip` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '每IP最大显示数量',
  `max_per_uv` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '每UV最大显示数量',
  `max_per_click` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '最大点击数',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '最后更新时间',
  `check_time` timestamp NULL DEFAULT NULL COMMENT '审核时间',
  `creator` varchar(30) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '创建者',
  `changer` varchar(30) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '最后修改',
  `check_admin` varchar(30) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '审核人',
  `check_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '审核状态(0待审核,1通过,2已拒绝',
  PRIMARY KEY (`loc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='广告位';

-- ----------------------------
-- Table structure for `ad_loc_occupy`
-- ----------------------------
DROP TABLE IF EXISTS `ad_loc_occupy`;
CREATE TABLE `ad_loc_occupy` (
  `occupy_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `loc_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '广告位ID',
  `plan_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '推广计划ID',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态：0审核中，1投放中，2已过期，3广告位下架，4推广计划暂停，5推广计划被删，6欠费',
  PRIMARY KEY (`occupy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='广告占位记录';

-- ----------------------------
-- Table structure for `ad_plan`
-- ----------------------------
DROP TABLE IF EXISTS `ad_plan`;
CREATE TABLE `ad_plan` (
  `plan_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `plan_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '广告名',
  `uid` bigint(20) NOT NULL,
  `budget_day` bigint(20) NOT NULL DEFAULT '0' COMMENT '每日预算（分）',
  `loc_ids` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '需占用的广告位ID, 多个逗号隔开, 作为ad_loc_occupy.loc_id的冗余存储',
  `src` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '素材地址',
  `link` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '广告链接',
  `extra_json` text COLLATE utf8mb4_unicode_ci COMMENT '复杂信息流广告数据json',
  `sell_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '计费类型：1-CPM, 2-CPC',
  `sell_price` bigint(20) NOT NULL DEFAULT '0' COMMENT '出价(分/每单位计费类型)',
  `start_date` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '投放开始日期',
  `end_date` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '投放结束日期',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间戳',
  `check_time` int(11) NOT NULL DEFAULT '0' COMMENT '审核时间',
  `check_admin` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '审核人账号',
  `check_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '审核状态：0待审核，1已通过，2已拒绝',
  `is_pause` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否暂停：0正常 1已暂停',
  `is_del` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否被删：1已删 0未删',
  PRIMARY KEY (`plan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='推广计划（广告）';

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
-- Table structure for `ad_stats`
-- ----------------------------
DROP TABLE IF EXISTS `ad_stats`;
CREATE TABLE `ad_stats` (
  `stats_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `plan_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '对应的推广计划（广告）',
  `loc_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '广告ID',
  `sell_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '计费类型：1-CPM，2-CPC',
  `stats_time` int(11) NOT NULL DEFAULT '0' COMMENT '统计时间戳',
  `url` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '所在页面地址',
  `domain` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '所在域名',
  PRIMARY KEY (`stats_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='广告量流水（前台只写，或用logstash）';

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
  `loc_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '广告ID',
  `cpm_num` bigint(20) NOT NULL DEFAULT '0' COMMENT '展现量',
  `cpc_num` bigint(20) NOT NULL DEFAULT '0' COMMENT '点击量',
  `cpm_ip_invalid_num` bigint(20) NOT NULL DEFAULT '0' COMMENT 'CPM无效IP量，用于防刷',
  `cpc_ip_invalid_num` bigint(20) NOT NULL DEFAULT '0' COMMENT 'CPC无效IP量，用于防刷',
  `cpm_uv_invalid_num` bigint(20) NOT NULL DEFAULT '0' COMMENT 'CPM无效UV量，用于防刷',
  `cpc_uv_invalid_num` bigint(20) NOT NULL DEFAULT '0' COMMENT 'CPC无效UV量，用于防刷',
  `cpm_other_invalid_num` bigint(20) NOT NULL DEFAULT '0' COMMENT 'CPM其它无效量，用于防刷',
  `cpc_other_invalid_num` bigint(20) NOT NULL DEFAULT '0' COMMENT 'CPC其它无效量，用于防刷',
  `stats_date` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '统计日期',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='广告量统计-日汇总';

-- ----------------------------
-- Table structure for `ad_stats_hoursum`
-- ----------------------------
DROP TABLE IF EXISTS `ad_stats_hoursum`;
CREATE TABLE `ad_stats_hoursum` (
  `sum_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `plan_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '对应的推广计划（广告）',
  `loc_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '广告位ID',
  `cpm_num` bigint(20) NOT NULL DEFAULT '0' COMMENT '展现量',
  `cpc_num` bigint(20) NOT NULL DEFAULT '0' COMMENT '点击量',
  `cpm_ip_invalid_num` bigint(20) NOT NULL DEFAULT '0' COMMENT 'CPM无效IP量，用于防刷',
  `cpc_ip_invalid_num` bigint(20) NOT NULL DEFAULT '0' COMMENT 'CPC无效IP量，用于防刷',
  `cpm_uv_invalid_num` bigint(20) NOT NULL DEFAULT '0' COMMENT 'CPM无效UV量，用于防刷',
  `cpc_uv_invalid_num` bigint(20) NOT NULL DEFAULT '0' COMMENT 'CPC无效UV量，用于防刷',
  `cpm_other_invalid_num` bigint(20) NOT NULL DEFAULT '0' COMMENT 'CPM其它无效量，用于防刷',
  `cpc_other_invalid_num` bigint(20) NOT NULL DEFAULT '0' COMMENT 'CPC其它无效量，用于防刷',
  `stats_hour` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '统计小时，如2017011213表示20170112的13时',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='广告量统计-按小时汇总';

-- ----------------------------
-- Table structure for `ad_stats_monthsum`
-- ----------------------------
DROP TABLE IF EXISTS `ad_stats_monthsum`;
CREATE TABLE `ad_stats_monthsum` (
  `sum_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `plan_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '对应的推广计划（广告）',
  `loc_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '广告位ID',
  `cpm_num` bigint(20) NOT NULL DEFAULT '0' COMMENT '展现量',
  `cpc_num` bigint(20) NOT NULL DEFAULT '0' COMMENT '点击量',
  `cpm_ip_invalid_num` bigint(20) NOT NULL DEFAULT '0' COMMENT 'CPM无效IP量，用于防刷',
  `cpc_ip_invalid_num` bigint(20) NOT NULL DEFAULT '0' COMMENT 'CPC无效IP量，用于防刷',
  `cpm_uv_invalid_num` bigint(20) NOT NULL DEFAULT '0' COMMENT 'CPM无效UV量，用于防刷',
  `cpc_uv_invalid_num` bigint(20) NOT NULL DEFAULT '0' COMMENT 'CPC无效UV量，用于防刷',
  `cpm_other_invalid_num` bigint(20) NOT NULL DEFAULT '0' COMMENT 'CPM其它无效量，用于防刷',
  `cpc_other_invalid_num` bigint(20) NOT NULL DEFAULT '0' COMMENT 'CPC其它无效量，用于防刷',
  `stats_month` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '统计月份',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='广告量统计-月汇总';

-- ----------------------------
-- Records of ad_stats_monthsum
-- ----------------------------

-- ----------------------------
-- Table structure for `deduct_order`
-- ----------------------------
DROP TABLE IF EXISTS `deduct_order`;
CREATE TABLE `deduct_order` (
  `order_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) NOT NULL,
  `plan_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '对应的推广计划',
  `loc_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '对应的广告位',
  `money` bigint(20) NOT NULL DEFAULT '0' COMMENT '实际扣款（分）',
  `day_cpc_num` int(11) NOT NULL DEFAULT '0' COMMENT '当日CPC量',
  `day_cpm_num` int(11) NOT NULL DEFAULT '0' COMMENT '当日CPM量',
  `deduct_date` varchar(8) NOT NULL DEFAULT '' COMMENT '扣款日期YYYYMMDD',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `note` varchar(64) NOT NULL DEFAULT '' COMMENT '备注',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态：0待完成，1已完成，2中止',
  `pre_money` bigint(20) NOT NULL DEFAULT '0' COMMENT '应扣取的费用（分）',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统结算扣款订单';

-- ----------------------------
-- Table structure for `invoice_record`
-- ----------------------------
DROP TABLE IF EXISTS `invoice_record`;
CREATE TABLE `invoice_record` (
  `record_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `apply_time` int(11) NOT NULL DEFAULT '0' COMMENT '申请时间',
  `check_time` int(11) NOT NULL DEFAULT '0' COMMENT '审核时间',
  `express_time` int(11) NOT NULL DEFAULT '0' COMMENT '快递发出时间',
  `money` bigint(11) NOT NULL DEFAULT '0' COMMENT '申请金额（分）',
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
-- Table structure for `mixed`
-- ----------------------------
DROP TABLE IF EXISTS `mixed`;
CREATE TABLE `mixed` (
  `mid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '代号,用于标识配置项',
  `content` longtext NOT NULL COMMENT '配置值(多个值存储时需序列化)',
  `note` varchar(64) NOT NULL DEFAULT '' COMMENT '注释',
  `create_ip` varchar(15) NOT NULL DEFAULT '',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_ip` varchar(15) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `create_user` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建人的user_id',
  `update_user` bigint(20) NOT NULL DEFAULT '0' COMMENT '修改人的user_id',
  `valid` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否有效',
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='杂项配置';

-- ----------------------------
-- Table structure for `money_daysum`
-- ----------------------------
DROP TABLE IF EXISTS `money_daysum`;
CREATE TABLE `money_daysum` (
  `sum_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) NOT NULL,
  `expend` bigint(20) NOT NULL DEFAULT '0' COMMENT '支出金额（分）',
  `income` bigint(20) NOT NULL DEFAULT '0' COMMENT '存入金额（分）',
  `note` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  `stats_date` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '汇总日期',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='资金变动汇总（日）';

-- ----------------------------
-- Table structure for `money_monthsum`
-- ----------------------------
DROP TABLE IF EXISTS `money_monthsum`;
CREATE TABLE `money_monthsum` (
  `sum_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) NOT NULL,
  `expend` bigint(20) NOT NULL DEFAULT '0' COMMENT '支出金额（分）',
  `income` bigint(20) NOT NULL DEFAULT '0' COMMENT '存入金额（分）',
  `note` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  `stats_month` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '汇总月份',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='资金变动汇总（月）';

-- ----------------------------
-- Table structure for `money_record`
-- ----------------------------
DROP TABLE IF EXISTS `money_record`;
CREATE TABLE `money_record` (
  `record_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) NOT NULL,
  `money` bigint(20) NOT NULL DEFAULT '0' COMMENT '资金变动正负值 (分)',
  `money_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '消费类型（0为未定义类型，正数为增加金额类型，负数为减少金额类型。1自助充值，2后台手动充值，-1系统结算扣除，-2后台手动扣除。）',
  `recharge_order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '自助充值订单ID',
  `deduct_order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '系统结算扣款订单ID',
  `balance_before` bigint(20) NOT NULL DEFAULT '0' COMMENT '原余额（分）',
  `balance_after` bigint(20) NOT NULL DEFAULT '0' COMMENT '变动后余额（分）',
  `note` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  `stats_date` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '统计日期（冗余存储）',
  `stats_month` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '统计月份（冗余存储）',
  `stats_time` int(11) NOT NULL DEFAULT '0' COMMENT '统计时间戳',
  `img_url` varchar(200) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '单据截图url',
  `admin` varchar(20) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '后台操作管理员',
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='资金变动记录（精确到次）';

-- ----------------------------
-- Table structure for `recharge_order`
-- ----------------------------
DROP TABLE IF EXISTS `recharge_order`;
CREATE TABLE `recharge_order` (
  `order_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '我方系统产生的订单ID，与支付系统的订单ID不同',
  `shop_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '支付接口预提供的shop_id，约定为7',
  `goods_name` varchar(32) NOT NULL DEFAULT '' COMMENT '商品名',
  `total_fee` bigint(20) NOT NULL DEFAULT '0' COMMENT '充值金额（分）',
  `remark` varchar(64) NOT NULL DEFAULT '' COMMENT '备注',
  `user_id` bigint(20) NOT NULL,
  `return_url` varchar(128) NOT NULL DEFAULT '' COMMENT '充值结果返回URL',
  `notify_url` varchar(128) NOT NULL DEFAULT '' COMMENT '异步通知URL',
  `create_ip` varchar(20) NOT NULL DEFAULT '',
  `update_ip` varchar(20) NOT NULL DEFAULT '',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_refer` varchar(128) NOT NULL DEFAULT '' COMMENT '用户的HTTP_REFERER',
  `update_refer` varchar(128) NOT NULL DEFAULT '' COMMENT '用户的HTTP_REFERER',
  `create_ua` text COMMENT '用户UA',
  `update_ua` text COMMENT '用户UA',
  `jump_url` text COMMENT '接口返回的跳转支付URL',
  `remote_order_id` varchar(50) NOT NULL DEFAULT '' COMMENT '提交订单后，接口返回的订单ID',
  `remote_order_sn` varchar(50) NOT NULL DEFAULT '' COMMENT '提交订单后，接口返回的订单SN码',
  `remote_msg` varchar(50) NOT NULL DEFAULT '' COMMENT '接口返回的msg字段',
  `remote_code` varchar(10) NOT NULL DEFAULT '' COMMENT '接口返回的错误码，0正常，其他异常',
  `remote_result` varchar(10) NOT NULL DEFAULT '' COMMENT '接口返回的处理结果：1：成功，0：失败',
  `response` text COMMENT '订单提交接口响应的整串内容',
  `sign` varchar(50) NOT NULL DEFAULT '' COMMENT '接口调用签名',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态：0待完成，1已完成，2进行中（跳到支付页），3网络调用失败， 4过期,  5订单提交接口处理失败',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='自助充值订单';

-- ----------------------------
-- Table structure for `recharge_order_callback`
-- ----------------------------
DROP TABLE IF EXISTS `recharge_order_callback`;
CREATE TABLE `recharge_order_callback` (
  `callback_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `callback_uri` text COMMENT '回调时的URI，如/finance/notifyRecharge?xxx=yyy&yyy=xxx',
  `ch_id` varchar(50) NOT NULL DEFAULT '' COMMENT '支付渠道，如WX',
  `out_trade_no` varchar(50) NOT NULL DEFAULT '' COMMENT '财务订单号',
  `remote_order_id` varchar(50) NOT NULL DEFAULT '' COMMENT '支付中心订单号',
  `total_fee` varchar(50) NOT NULL DEFAULT '' COMMENT '总支付金额（分）',
  `pay_status` varchar(50) NOT NULL DEFAULT '' COMMENT '支付状态：成功success, 失败fail',
  `user_id` bigint(20) NOT NULL DEFAULT '0',
  `sign` varchar(50) NOT NULL DEFAULT '' COMMENT '回调签名',
  `return_msg` text COMMENT '回调完成后，提供给回调者的msg字段，附带调试错误信息',
  `return_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '返回给回调者的错误码：0正常，其他异常',
  `return_result` tinyint(4) NOT NULL DEFAULT '0' COMMENT '返回给回调者的处理结果：1成功，0失败',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_ip` varchar(20) NOT NULL DEFAULT '',
  `update_ip` varchar(20) NOT NULL DEFAULT '',
  `create_refer` varchar(128) NOT NULL DEFAULT '' COMMENT 'HTTP_REFERER',
  `update_refer` varchar(128) NOT NULL,
  `create_ua` text COMMENT 'UA',
  `update_ua` text COMMENT 'UA',
  PRIMARY KEY (`callback_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='充值订单回调记录';

-- ----------------------------
-- Table structure for `tmp_log`
-- ----------------------------
DROP TABLE IF EXISTS `tmp_log`;
CREATE TABLE `tmp_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL COMMENT '日志句柄',
  `note` text NOT NULL COMMENT '注释',
  `content` longtext NOT NULL,
  `log_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `log_ip` varchar(15) NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='临时日志表';

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '登录账号',
  `password` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码不可逆值',
  `license_img` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '营业执照图',
  `balance` bigint(20) NOT NULL DEFAULT '0' COMMENT '余额（分）',
  `reg_time` int(11) NOT NULL DEFAULT '0' COMMENT '注册时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `company` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '公司名',
  `address` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '地址',
  `contact` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '联系人（名）',
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '手机或电话',
  `email` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'QQ',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='广告商用户';
