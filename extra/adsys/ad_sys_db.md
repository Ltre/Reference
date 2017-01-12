<pre>


<h1><center>多玩广告系统数据库设计草稿(20170112)</center></h1>


<h2>
    <center><a href="/doc/adsysDbDesignSql" target="_blank">多玩广告系统数据库设计SQL(20170112)</a></center>
</h2>


<font color="blue">ad【推广计划（广告）】</font>
	ad_id
	ad_name
	budget_day	每日预算
	pos_id  (ad_pos.id)
	src		素材地址
	link		广告链接
	charge_type	计费类型(CPM/CPC/CPA)
	charge		出价（元/一单位计费类型）
	start_date	投放开始日期
	end_date	投放结束日期，0不限截止
	其它字段：create_time创建时间, check_time审核时间, check_admin审核人, check_status审核状态(待审核0，已通过1，已拒绝2)




<font color="blue">ad_pos【广告位】</font>
	pos_id
	pos_name	如“新闻阅读页C1”
	dimension	格式【宽,高】，例如1000,90
	domain		匹配的域名（正则）
	uri		匹配的URI，如【/\/abcde/12345.html/】
	available	是否可用（用于管理员进行上下架）
	used		是否被占用
	

		
<font color="blue">money_record【资金变动记录】</font>
	record_id
	uid
	money		正负记录
	money_type	消费类型（预定义，0为默认类型，正数为增加金额类型，负数为减少金额类型）
	note		备注
	stats_date	统计日期（冗余存储）
	stats_month	统计月份（冗余存储）
	stats_time	统计时间戳
	


<font color="blue">money_daysum【资金变动汇总（日）】</font>
	sum_id
	uid
	存入
	支出
	note		备注（好像没什么用）
	stats_date	统计日期


<font color="blue">money_monthsum【资金变动汇总（月）】</font>
	sum_id
	uid
	存入
	支出
	note		备注（好像没什么用）
	stats_month	统计月份

	
<font color="blue">ad_stats【广告量记录（前台只写，或使用logstash）】</font>
	stats_id
	ad_id		对应的推广计划（广告）
	stats_time	统计时间戳


<font color="blue">ad_stats_sum【广告量统计-汇总】</font>
	sum_id
	ad_id		对应的推广计划（广告）
	cpm_num		展现量
	cpc_num		点击量
	stats_hour	统计小时
	stats_date	统计日期
	stats_month	统计月份
	


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