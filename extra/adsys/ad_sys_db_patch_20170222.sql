ALTER TABLE `invoice_record`
MODIFY COLUMN `invoice_header`  varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '发票抬头' AFTER `money`;

CREATE TABLE `invoice_record_add_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `invoice_record_id` bigint(20) NOT NULL,
  `all_data` text COMMENT '在发票页面上所有填写内容(json)',
  `submit_data` text COMMENT '在发票页面上提交的内容(json)',
  `create_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='成功插入发票申请后，记录日志';
