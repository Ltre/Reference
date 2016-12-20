SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- 文章访问记录
-- ----------------------------
DROP TABLE IF EXISTS `dwv_article_access`;
CREATE TABLE `dwv_article_access` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author` varchar(30) DEFAULT NULL COMMENT '作者',
  `channelid` varchar(20) DEFAULT NULL COMMENT '专区id',
  `tags` varchar(50) DEFAULT NULL COMMENT '标签',
  `articleid` bigint(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章id当做视频id',
  `yyuid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击人yyuid',
  `accesstime` int(11) NOT NULL DEFAULT '0' COMMENT '点击时间',
  PRIMARY KEY (`id`),
  KEY `accesstime` (`accesstime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Cron载入的文章缓存
-- ----------------------------
DROP TABLE IF EXISTS `dwv_article_cache`;
CREATE TABLE `dwv_article_cache` (
  `cache_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `articleid` varchar(20) DEFAULT NULL COMMENT '文章id对应list接口返回id',
  `title` varchar(50) DEFAULT NULL,
  `subtitle` varchar(50) DEFAULT NULL,
  `videoid` varchar(20) DEFAULT NULL COMMENT '文章页抓取videoId',
  `digest` varchar(256) DEFAULT NULL COMMENT '简介',
  `emptylink` varchar(256) DEFAULT NULL COMMENT '接口字段emptyLink',
  `pictureurl` varchar(256) DEFAULT NULL COMMENT '接口字段pictureUrl',
  `source` varchar(50) DEFAULT NULL COMMENT '来源',
  `author` varchar(30) DEFAULT NULL COMMENT '作者',
  `userid` varchar(30) DEFAULT NULL COMMENT '发布者，对应接口返回的userId',
  `channelid` varchar(20) DEFAULT NULL COMMENT '对应接口字段channelId',
  `url` varchar(256) DEFAULT NULL COMMENT '文章URL',
  `publishtime` int(11) DEFAULT NULL COMMENT '对应publishTime',
  PRIMARY KEY (`cache_id`),
  KEY `publishtime` (`publishtime`) USING BTREE,
  KEY `author` (`author`) USING BTREE,
  KEY `articleid` (`articleid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- 订阅表
-- ----------------------------
DROP TABLE IF EXISTS `dwv_subscribe`;
CREATE TABLE `dwv_subscribe` (
  `sub_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author` varchar(30) DEFAULT NULL COMMENT '视频作者',
  `channelid` varchar(20) DEFAULT NULL COMMENT '专区id',
  `tags` varchar(50) DEFAULT NULL,
  `sub_time` int(11) NOT NULL DEFAULT '0' COMMENT '订阅时间',
  `sub_yyuid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订约人yyuid',
  `is_cancel` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否取消订阅',
  PRIMARY KEY (`sub_id`),
  UNIQUE KEY `author_subyyuid` (`author`,`sub_yyuid`) USING BTREE,
  KEY `author` (`author`) USING BTREE,
  KEY `sub_yyuid` (`sub_yyuid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- 用户信息(目前仅保留登录态用)
-- ----------------------------
DROP TABLE IF EXISTS `dwv_user`;
CREATE TABLE `dwv_user` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `yyuid` int(11) NOT NULL DEFAULT '0',
  `username` varchar(50) DEFAULT NULL,
  `first_ip` varchar(16) DEFAULT NULL,
  `first_time` int(11) DEFAULT NULL,
  `last_ip` varchar(16) DEFAULT NULL,
  `last_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;