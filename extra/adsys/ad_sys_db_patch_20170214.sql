ALTER TABLE `ad_stats_hoursum`
MODIFY COLUMN `cost`  decimal(12,3) NOT NULL DEFAULT 0 COMMENT '当前时段花费总额(分)' AFTER `cpc_num`;

ALTER TABLE `ad_stats_daysum`
MODIFY COLUMN `cost`  decimal(12,3) NOT NULL DEFAULT 0 COMMENT '当前时段花费总额(分)' AFTER `cpc_num`;

ALTER TABLE `ad_stats_monthsum`
MODIFY COLUMN `cost`  decimal(12,3) NOT NULL DEFAULT 0 COMMENT '当前时段花费总额(分)' AFTER `cpc_num`;


ALTER TABLE `invoice_record`
ADD COLUMN `uid`  bigint NOT NULL COMMENT '用户ID' AFTER `record_id`,
MODIFY COLUMN `invoice_type`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '发票类型：0增值税普票，1增值税专票' AFTER `invoice_header`,
ADD COLUMN `invoice_item`  tinyint NOT NULL DEFAULT 0 COMMENT '发票项目：0广告费, 1广告发布费' AFTER `invoice_type`,
ADD COLUMN `tax_license_img`  varchar(128) NOT NULL DEFAULT '' COMMENT '纳税人资质文件截图（用于纳税扩展信息）' AFTER `contact`,
ADD COLUMN `tax_company`  varchar(128) NOT NULL DEFAULT '' COMMENT '纳税公司名称（用于纳税扩展信息）' AFTER `tax_license_img`,
ADD COLUMN `tax_bankname`  varchar(50) NOT NULL DEFAULT '' COMMENT '开户行（用于纳税扩展信息）' AFTER `tax_company`,
ADD COLUMN `tax_man_id`  varchar(32) NOT NULL DEFAULT '' COMMENT '纳税人识别号（用于纳税扩展信息）' AFTER `tax_bankname`,
ADD COLUMN `tax_bankcard`  varchar(32) NOT NULL DEFAULT '' COMMENT '银行卡号（用于纳税扩展信息）' AFTER `tax_man_id`,
ADD COLUMN `tax_address`  varchar(256) NOT NULL DEFAULT '' COMMENT '地址（用于纳税扩展信息）' AFTER `tax_bankcard`,
ADD COLUMN `tax_phone`  varchar(20) NOT NULL DEFAULT '' COMMENT '电话（用于纳税扩展信息）' AFTER `tax_address`;

