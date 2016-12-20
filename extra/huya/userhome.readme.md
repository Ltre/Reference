未上线的页面链接：
个人主页：
	http://v.huya.com/index.php?r=user/index2
个人视频列表页：
	http://v.huya.com/index.php?r=user/video2
个人栏目列表页：
	http://v.huya.com/index.php?r=user/album2
个人栏目详情页：
	http://v.huya.com/index.php?r=user/detailalbum2&aid=21
个人栏目编辑页：
	http://v.huya.com/index.php?r=albummanage/editalbum2
个人中心————栏目列表页
	http://v.huya.com/index.php?r=albummanage/album2




<font color=red>1、通用图片上传接口</font>
	————————————————————————————————————————————————————
	URL:		http://v.huya.com/jsapi/imgUpload
	————————————————————————————————————————————————————
	参数(file post):
		img		        文件域[必选]
		imgType		预置图片类型, 可选, 若不指定则上传原图
						类型值与配置的对应关系(暂时只有一个配置项，以后会新增其它)：
						userhome-cover => 最小宽1920 最小高350 宽高比不限制
						album-cover 最小宽220 最小高124 宽高比不限制
	————————————————————————————————————————————————————
	返回(json)：
		code: 0 (0表示正常，其它情况异常)
		fileExt: "gif"
		fileName: "jinguanyu.gif"
		fileSize: 41735
		height: 100
		width: 100
		mimeType: "image/gif"
		msg: "upload success"
		url: "http://s1.dwstatic.com/vhuya/20150916/11/2851708.gif"
	————————————————————————————————————————————————————
	备注: 
		1、上传的图片低于宽高最小值时，会失败
		2、上传的图片过于偏离规定比例，会失败
		3、之前的width, height参数已废除，不允许自定义宽高
	————————————————————————————————————————————————————
	


<font color=red>2、设置个人热门视频</font>
	————————————————————————————————————————————————————
	URL:		http://v.huya.com/jsapi/setUserHotVideo
	————————————————————————————————————————————————————
	提交(post|get)
        参数名称      类型       
	vids           array      
	top 	       int            
		
	————————————————————————————————————————————————————
	返回(json)：
		result                true|false 是否成功
		
	————————————————————————————————————————————————————
	备注: 
		需要登录态
	————————————————————————————————————————————————————



<font color=red>3、设置个人主页头图(封面)</font>
	————————————————————————————————————————————————————
	URL:		http://v.huya.com/jsapi/updateUserHomeCover
	————————————————————————————————————————————————————
	提交(post|get)
        参数名称      类型       
	homecover   string     
	————————————————————————————————————————————————————
	返回(json)：
		result                true|false 是否成功
		
	————————————————————————————————————————————————————
	备注: 
		需要登录态
	————————————————————————————————————————————————————



<font color=red>4、设置个人主页公告</font>
	————————————————————————————————————————————————————
	URL:		http://v.huya.com/jsapi/updateUserHomeNotice
	————————————————————————————————————————————————————
	提交(post|get)
        参数名称      类型       
	homenotice   string    
	————————————————————————————————————————————————————
	返回(json)：
		result                true|false 是否成功
		
	————————————————————————————————————————————————————
	备注: 
		需要登录态



<font color=red>5、获取栏目相关的候选视频（用于栏目内添加视频）</font>
	————————————————————————————————————————————————————
	URL:		http://v.huya.com/jsapi/GetVideosForAlbum
	————————————————————————————————————————————————————
	参数(post|get)
		aid		[必选] 栏目ID，取自HTML的data-aid属性
		p		[必选] 加载数据页码，从1开始
		limit	[可选] 每次下拉加载数目，默认12个
	    
	————————————————————————————————————————————————————
	返回(json)：
		[
			{
				"user_id": "50014545",
				"user_avatar": "http://s1.dwstatic.com/vhuya/avatar/50/01/200_200/50014545.jpg?t=1426753657",
				"user_nickname": "hehe",
				"user_homepage": "http://v.huya.com/u/50014545",
				"vid": 1780,
				"video_title": "史诗般的胜利 刺刀技术哪家强—155 51",
				"video_subtitle": "史诗般的胜利 刺刀技术哪家强—155 51",
				"video_cover": "http://vimg.dwstatic.com/1504/1780/9-220x124.jpg",
				"video_play_num": "2.1万",
				"video_comment_num": "22",
				"video_duration": "07:46",
				"video_url": "http://v.huya.com/play/1780.html",
				"video_upload_time": "2015-01-24 06:07",
				"video_channel": "wot"
			},
			{ ... },
			...
		]
	————————————————————————————————————————————————————
	备注: 
		需要登录态
		


<font color=red>6、获取个人最新视频（可作为个人主页视频置顶候选项）</font>
	————————————————————————————————————————————————————
	URL:		http://v.huya.com/jsapi/getMyVideos
	————————————————————————————————————————————————————
	参数(post|get)
		p		[必选] 加载数据页码，从1开始
		limit	[可选] 每次下拉加载数目，默认10个
	————————————————————————————————————————————————————
	返回(json)：
		[
			{
				"user_id": "50014545",
				"user_avatar": "http://s1.dwstatic.com/vhuya/avatar/50/01/200_200/50014545.jpg?t=1426753657",
				"user_nickname": "hehe",
				"user_homepage": "http://v.huya.com/u/50014545",
				"vid": 1780,
				"video_title": "史诗般的胜利 刺刀技术哪家强—155 51",
				"video_subtitle": "史诗般的胜利 刺刀技术哪家强—155 51",
				"video_cover": "http://vimg.dwstatic.com/1504/1780/9-220x124.jpg",
				"video_play_num": "2.1万",
				"video_comment_num": "22",
				"video_duration": "07:46",
				"video_url": "http://v.huya.com/play/1780.html",
				"video_upload_time": "2015-01-24 06:07",
				"video_channel": "wot"
			},
			{ ... },
			...
		]
	————————————————————————————————————————————————————
	备注: 
		需要登录态
		


<font color=red>7、栏目删除接口（支持批量）</font>
	————————————————————————————————————————————————————
	URL:		http://v.huya.com/?r=albummanage/delAlbum
	————————————————————————————————————————————————————
	参数(post|get)
		aids	[必选] 栏目ID集合，如 [1,2,3]
	————————————————————————————————————————————————————
	返回(json)：
		true | false
	————————————————————————————————————————————————————
	备注: 
		需要登录态



<font color=red>8、添加栏目接口</font>
	————————————————————————————————————————————————————
	URL:		http://v.huya.com/?r=albummanage/addAlbum
	————————————————————————————————————————————————————
	参数(post|get)
		name	[必选] 新栏目名称
	————————————————————————————————————————————————————
	返回(json)：
		rs			true | false
		album_id	栏目ID
		album_name	栏目名
	————————————————————————————————————————————————————
	备注: 
		需要登录态


<font color=red>9、编辑栏目接口</font>
	————————————————————————————————————————————————————
	URL:		http://v.huya.com/?r=albummanage/saveAlbum
	————————————————————————————————————————————————————
	参数(post|get)
		aid					[必选] 栏目ID，取自data-aid
		name				[必选] 栏目名称
		intro				[必选] 栏目简介
		addVids				新添加的VID集合，如 [4,5,6]
		delVids				被删除的VID集合，如 [1,2,3]
	————————————————————————————————————————————————————
	返回(json)：
		rs		true | false
		msg		提示信息
	————————————————————————————————————————————————————
	备注: 
		1、需要登录态，
		2、之前的order排序参数已废除，转移到接口【11、albummanage/saveOrder】中
		


<font color=red>10、栏目封面保存接口</font>
	————————————————————————————————————————————————————
	URL:		http://v.huya.com/?r=albummanage/saveCover
	————————————————————————————————————————————————————
	参数(post|get)
		aid		[必选] 栏目ID，取自data-aid属性
		cover	[必选] 封面URL
	————————————————————————————————————————————————————
	返回(json)：
		rs			true | false
		msg			提示信息
	————————————————————————————————————————————————————
	备注: 
		需要登录态


<font color=red>11、栏目视频排序接口</font>
	————————————————————————————————————————————————————
	URL:		http://v.huya.com/?r=albummanage/saveOrder
	————————————————————————————————————————————————————
	参数(post|get)
		aid		[必选] 栏目ID，取自data-aid属性
		order   [可选] 排序方式：timeup时间升序 timedown时间降序 nameup名称升序 namedown名称降序，默认timeup
	————————————————————————————————————————————————————
	返回(json)：
		rs			true | false
		msg			提示信息
	————————————————————————————————————————————————————
	备注: 
		需要登录态

