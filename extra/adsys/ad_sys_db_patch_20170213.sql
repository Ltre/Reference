ALTER TABLE `ad_loc_occupy`
MODIFY COLUMN `status`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '状态：0推广计划审核中，1推广计划投放中，2推广计划已过期，3广告位下架，4推广计划手动暂停，5推广计划被删，6余额不足，7未开始投放，8推广计划审核失败' AFTER `plan_id`;

ALTER TABLE `ad_stats_hoursum`
ADD COLUMN `cost`  bigint NOT NULL DEFAULT 0 COMMENT '当前时段花费总额(分)' AFTER `cpc_num`;

ALTER TABLE `ad_stats_daysum`
ADD COLUMN `cost`  bigint NOT NULL DEFAULT 0 COMMENT '当前时段花费总额(分)' AFTER `cpc_num`;

ALTER TABLE `ad_stats_monthsum`
ADD COLUMN `cost`  bigint NOT NULL DEFAULT 0 COMMENT '当前时段花费总额(分)' AFTER `cpc_num`;

