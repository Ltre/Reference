ALTER TABLE `ad_stats_hoursum`
MODIFY COLUMN `cost`  decimal(12,3) NOT NULL DEFAULT 0 COMMENT '当前时段花费总额(分)' AFTER `cpc_num`;

ALTER TABLE `ad_stats_daysum`
MODIFY COLUMN `cost`  decimal(12,3) NOT NULL DEFAULT 0 COMMENT '当前时段花费总额(分)' AFTER `cpc_num`;

ALTER TABLE `ad_stats_monthsum`
MODIFY COLUMN `cost`  decimal(12,3) NOT NULL DEFAULT 0 COMMENT '当前时段花费总额(分)' AFTER `cpc_num`;
