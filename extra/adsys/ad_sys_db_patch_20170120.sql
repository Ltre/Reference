ALTER TABLE `recharge_order_callback`
MODIFY COLUMN `callback_uri`  text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '回调时的URI，如/finance/notifyRecharge?xxx=yyy&yyy=xxx' AFTER `callback_id`;

ALTER TABLE `recharge_order_callback`
MODIFY COLUMN `return_msg`  text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '回调完成后，提供给回调者的msg字段，附带调试错误信息' AFTER `sign`;

