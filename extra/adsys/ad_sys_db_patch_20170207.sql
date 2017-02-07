ALTER TABLE `ad_loc_occupy`
MODIFY COLUMN `status`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '状态：0审核中，1投放中，2已过期，3广告位下架，4推广计划暂停，5推广计划被删，6欠费，7未开始' AFTER `plan_id`;

