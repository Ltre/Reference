<pre>


<h1><center>多玩广告系统数据库设计草稿(20170112)</center></h1>
<h2>
    <center><a href="/doc/adsysDbDesignSql" target="_blank">多玩广告系统数据库设计SQL(20170112)</a></center>
</h2>


<font color="blue">ad_plan【推广计划】</font>
    plan_id
    plan_name   计划名
    uid 
    day_budget	每日预算
    loc_ids     (ad_loc.id)，多个逗号隔开（冗余存储）
    src         素材地址
    link		广告链接
    extra_json  复杂信息流广告数据
    charge_type	计费类型(CPM/CPC/CPA)
    charge		出价（元/每单位计费类型）
    start_date	投放开始日期
    end_date	投放结束日期
    create_time 创建时间
    check_time  审核时间
    check_admin 审核人
    check_status审核状态(待审核0，审核通过(可投放)1，已拒绝2)



<font color="blue">ad_loc_occupy【广告占位记录】</font>
    occupy_id
    plan_id     推广计划ID
    loc_id      广告位ID
    status      状态：0未投放 1投放中



<font color="blue">recharge_order【自助充值订单】</font>
    order_id
    uid
    money           充值金额
    create_time     创建时间
    update_time     更新时间
    note            备注
    response        充值接口响应内容
    status          状态：0待完成 1已完成 2中止


<font color="blue">deduct_order【系统结算扣款订单】</font>
    order_id
    uid
    day_cpc_num     当日CPC量
    day_cpm_num     当日CPM量
    deduct_date     扣款日期
    create_time     创建时间
    update_time     更新时间
    note            备注
    status          状态：0待完成 1已完成 2中止

<font color="blue">money_record【资金变动流水】</font>
	record_id
	uid
	money		        正负记录
	money_type	        消费类型（0为未定义类型，正数为增加金额类型，负数为减少金额类型。1自助充值，2后台手动充值，-1系统结算扣除，-2后台手动扣除。）
    recharge_order_id   自助充值订单ID
    deduct_order_id     系统结算扣款订单ID
    balance_before      原余额
    balance_after       变动后余额
	note		        备注
	stats_date	        统计日期（冗余存储）
	stats_month	        统计月份（冗余存储）
	stats_time	        统计时间戳
	


<font color="blue">money_daysum【资金变动汇总（日）】</font>
	sum_id
	uid
	income      存入
	expend      支出
	note		备注（好像没什么用）
	stats_date	统计日期


<font color="blue">money_monthsum【资金变动汇总（月）】</font>
	sum_id
	uid
	income      存入
	expend      支出
	note		备注（好像没什么用）
	stats_month	统计月份

	
<font color="blue">ad_stats【广告量记录（前台只写，或使用logstash）】</font>
	stats_id
	plan_id		对应的推广计划（广告）
	stats_time	统计时间戳
    url         所在地址
    domain      所在域名



<font color="blue">ad_stats_daysum【广告量统计-汇总】</font>
	sum_id
	plan_id		对应的推广计划（广告）
    loc_id
	cpm_num		展现量
	cpc_num		点击量
	stats_date	统计日期
	



<font color="blue">ad_stats_monthsum【广告量统计-汇总】</font>
	sum_id
	plan_id		对应的推广计划（广告）
    loc_id
	cpm_num		展现量
	cpc_num		点击量
	stats_month	统计月份
	



<font color="blue">ad_stats_hoursum【广告量统计-汇总】</font>
	sum_id
	plan_id		对应的推广计划（广告）
    loc_id
	cpm_num		展现量
	cpc_num		点击量
	stats_hour	统计小时
	



<font color="blue">ad_user【广告商】</font>
	uid
	username	登录账号
	password	密码
	license_img	营业执照
	balance		余额
	reg_time	注册时间
	update_time	更新时间
	company		公司名称
	address		地址
	contact		联系人（名）
	phone		手机号
	email		
	qq
	priority	优先级（可用于优先占用广告位，年后的需求，可先不设置）



	
	
<font color="blue">invoice_record【发票开具记录】</font>
	record_id
	apply_time	    申请时间
	money		    申请金额（正数）
	invoice_header	发票抬头
	invoice_type	发票项目（即类型，可预定义数字常量）
	charge_month	充值月份
	status		    状态：0申请中，1已通过，2被拒绝，3已快递
    express_name    快递公司
    express_code    快递单号
	address		    收货地址（默认从ad_user.address取，可提供修改）
	phone		    收货手机
	email		    收货通知邮件
	contact		    收货联系人
	note		    备注
















CPM 千人次观看广告成本
CPC 千次点击广告成本
CPA 每行动广告成本



</pre>