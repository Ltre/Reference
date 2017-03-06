ALTER TABLE `ad_plan`
ADD COLUMN `spec_id`  bigint NOT NULL DEFAULT 0 COMMENT '选择的尺寸规格ID' AFTER `budget_day`;


CREATE TABLE `ad_plan_edit_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `plan_id` bigint(20) NOT NULL,
  `uid` bigint(20) NOT NULL COMMENT '计划所属UID',
  `old_plan` text COMMENT '原推广计划数据JSON',
  `new_plan` text COMMENT '修改后的推广计划数据JSON',
  `data_diff` text COMMENT '数据差异',
  `changer` varchar(32) NOT NULL DEFAULT '' COMMENT '后台修改者（如有）',
  `log_time` int(11) NOT NULL DEFAULT '0',
  `log_ip` varchar(20) NOT NULL DEFAULT '',
  `note` varchar(128) NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='推广计划修改日志';


ALTER TABLE `ad_plan`
ADD COLUMN `update_time`  int NOT NULL DEFAULT 0 COMMENT '更新时间' AFTER `create_time`;

