1、视频订阅
	————————————————————————————————————————————————————
	URL:		http://vsub.webdev.duowan.com/subscribe/subsc
	正式地址：	<font color=blue> http://huodong.duowan.com/videoSubscribe?r=subscribe/subsc </font>
	————————————————————————————————————————————————————
	参数(get|post):
		author		作者
		tags		标签，多个用逗号隔开
		channelid	专区id
	————————————————————————————————————————————————————
	返回(jsonp)：
		code
			 0	订阅成功
			-1	已订阅过
			-2	订阅失败(一般不会出现)
			-3	参数有误或缺失
		msg		消息(仅参考)
	————————————————————————————————————————————————————
	备注: 没有登录态时会直接返回订阅成功，在登录后会自动保存之前的订阅。
	————————————————————————————————————————————————————
	






2、取消订阅
	————————————————————————————————————————————————————
	URL:		http://vsub.webdev.duowan.com/subscribe/unsubsc
	正式地址：	<font color=blue> http://huodong.duowan.com/videoSubscribe?r=subscribe/unsubsc </font>
	————————————————————————————————————————————————————
	参数(get|post):
		author		作者
	————————————————————————————————————————————————————
	返回(jsonp):
		code
			 0	操作成功
			-1	操作失败
		msg		消息(仅参考)
	————————————————————————————————————————————————————







3、检测所订阅的更新，获取到视频列表(使用的实际是发布器的文章资源)
	————————————————————————————————————————————————————
	URL:		http://vsub.webdev.duowan.com/subscribe/checksubsnew
	正式地址：	<font color=blue> http://huodong.duowan.com/videoSubscribe?r=subscribe/checksubsnew </font>
	————————————————————————————————————————————————————
	参数(get|post):
		[time_ago]	可选参数, 单位秒，检测多久之前的数据,设置为0默认为一天
		[refresh]	可选参数, 值为1时强制刷新缓存
	————————————————————————————————————————————————————
	返回(jsonp):
		code
			 0	获取成功
		data : {
			dataType : 1 (推荐的视频) | 2 (订阅的视频),
			list : [
				{
						
					'articleid'	: '文章id',
					'title'		: '标题',
					'subtitle'	: '子标题',
					'pictureurl': '头图地址',
					'author'	: '作者',
					'channelid'	: '专区id',
					'url'		: '文章地址'
				},
				...
			]
		}
		msg		消息(仅参考)
	————————————————————————————————————————————————————
	备注：没有登录态的会获取到推荐的视频，状态码code返回0
	————————————————————————————————————————————————————









4、获取用户的订阅记录<font color=red>【该接口与ReportAccess合并到Raags】</font>
	————————————————————————————————————————————————————
	URL:		http://vsub.webdev.duowan.com/subscribe/usersubs
	正式地址：	<font color=blue> http://huodong.duowan.com/videoSubscribe?r=subscribe/usersubs </font>
	————————————————————————————————————————————————————
	参数(get|post): 		无
	————————————————————————————————————————————————————
	返回(jsonp):
		code
			 0	获取成功(这个是处于登录态的)
			-1	没订阅过
			-2	没有登录(也会返回缓存中的订阅数组)
		data(数组)
			[
				{
					'author'	: '作者',
					'channelid'	: '专区id',
					'tags'		: '标签'
				},
				...
			]
	————————————————————————————————————————————————————









5、上报点击视频<font color=red>【该接口与UserSubs合并到raags】</font>
	————————————————————————————————————————————————————
	URL:		http://vsub.webdev.duowan.com/subscribe/reportaccess
	正式地址：	<font color=blue> http://huodong.duowan.com/videoSubscribe?r=subscribe/reportaccess </font>
	————————————————————————————————————————————————————
	参数(get|post):
		articleid	文章id
		author		作者
		channelid	专区id
		tags		标签
	————————————————————————————————————————————————————
	返回(jsonp):
		code
			 0	上报成功
			-1	上报失败
			-2	没有登录(**不作任何处理**)
			-3	参数有误或缺失
	————————————————————————————————————————————————————






6、上报视频点击记录, 并获取用户的订阅记录<font color=red>【该接口由UserSubs和ReportAccess合并】</font>
	————————————————————————————————————————————————————
	URL:		http://vsub.webdev.duowan.com/subscribe/raags
	正式地址：	<font color=blue> http://huodong.duowan.com/videoSubscribe?r=subscribe/raags </font>
	————————————————————————————————————————————————————
	参数(get|post):
		articleid	文章id
		author		作者
		channelid	专区id
		tags		标签
	————————————————————————————————————————————————————
	返回(jsonp):
		code
			 0	获取记录成功
			-1	没订阅过视频
			-3	参数有误或缺失
		data(数组)
			[
				{
					'author'	: '作者',
					'channelid'	: '专区id',
					'tags'		: '标签'
				},
				...
			]
		msg		消息(仅参考)
	————————————————————————————————————————————————————

