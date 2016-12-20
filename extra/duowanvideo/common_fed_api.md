<pre>

<h1><center>多玩视频 - 通用前端API</center></h1>

<font color="blue">1、获取播客列表 jsapi/Podcasts </font>
	————————————————————————————————————————————————————
	URL:		http://video.duowan.com/jsapi/podcasts
	————————————————————————————————————————————————————
	参数(get|post):
		sort		排序依据（playsum|videosum），播放数或视频数（默认playsum，可选）
		p			页码（默认1，可选）
		limit		获取个数（默认10，可选）
		channel		专区ID（可选）
	————————————————————————————————————————————————————
	返回(json含array)：
		{
			//列表
			list: [{
				"user_id": "50075229",
				"user_avatar": "http://s1.dwstatic.com/vhuya/avatar/50/07/200_200/2a1c68f6caa9088a88fccd3a8df35469.jpg?t=1437745951",
				"user_nickname": "虎牙LOL",
				"user_homepage": "http://video.duowan.com/u/50075229",
				"user_channel": "lol",
				"user_channel_name": "英雄联盟",
				"user_video_sum": "8,704",
				"user_play_sum": "43.0千万",
				"user_desc": "虎牙LOL视频。"
			}, ..., {}],
			//分页信息
			pages: {
				"total_count": "3649",//总个数
				"page_size": 18,//每页个数
				"total_page": 203,//总页数
				"first_page": 1,
				"prev_page": 1,
				"next_page": 2,
				"last_page": 203,//最后页码
				"current_page": 1,
				"all_pages": [
					1,
					2,
					3,
					4,
					5,
					6,
					7,
					8,
					9,
					10
				],
				"offset": 0,
				"limit": 18
			}
		}
	————————————————————————————————————————————————————
	备注: 
		无
	————————————————————————————————————————————————————
	示例：
		http://video.duowan.com/jsapi/podcasts
		http://video.duowan.com/jsapi/podcasts?p=2
		http://video.duowan.com/jsapi/podcasts?p=2&channel=lol
		http://video.duowan.com/jsapi/podcasts?p=2&channel=lol&limit=12
	————————————————————————————————————————————————————









<font color="blue">2、获取用户的视频 jsapi/getUserVideos </font>
	————————————————————————————————————————————————————
	URL:		http://video.duowan.com/jsapi/getUserVideos
	————————————————————————————————————————————————————
	参数(get|post):
		uid			用户的YYUID，/u/xxxxxx的xxxxx部分
		limit		个数（默认10，可选）
	————————————————————————————————————————————————————
	返回(json)：
		{
			list: [{
				"user_id": "50014545",
				"user_avatar": "http://s1.dwstatic.com/vhuya/avatar/50/01/200_200/98d2a3f69b3baffa354413ea9951e7c5.jpg?t=1466045578",
				"user_nickname": "王尼玛",
				"user_homepage": "http://video.duowan.com/u/50014545",
				"vid": 3502275,
				"video_title": "亚索光速技能三部曲",
				"video_subtitle": "亚索光速技能三部曲",
				"video_cover": "http://vimg.dwstatic.com/1647/3502275/4-220x124.jpg",
				"video_play_num": "165",
				"video_raw_play_num": 165,
				"video_comment_num": "0",
				"video_raw_comment_num": 0,
				"video_duration": "07:25",
				"video_raw_duration": 445,
				"video_url": "http://video.duowan.com/play/3502275.html",
				"video_upload_time": "2016-11-24 13:07",
				"video_raw_upload_time": "1479964074",
				"video_channel": "lol",
				"video_intro": "",
				"video_tags": ""
			}, ..., {}]
			pageInfo: {
				"total_count": "35",
				"page_size": "12",
				"total_page": 3,
				"first_page": 1,
				"prev_page": 1,
				"next_page": 2,
				"last_page": 3,
				"current_page": 1,
				"all_pages": [
					1,
					2,
					3
				],
				"offset": 0,
				"limit": "12"
			}
		}
	————————————————————————————————————————————————————
	备注: 
		无
	————————————————————————————————————————————————————
	示例：
		http://video.duowan.com/jsapi/getUserVideos?uid=50014545&limit=12
	————————————————————————————————————————————————————





<font color="blue">3、获取订阅的专区 jsapi/getGameSubscribe </font>
	————————————————————————————————————————————————————
	URL:		http://video.duowan.com/jsapi/getGameSubscribe
	————————————————————————————————————————————————————
	参数(get|post):
		<span style="display:none">limit		个数（默认10，可选）</span>
		<span style="display:none">page		页码（默认1，可选）</span>
	————————————————————————————————————————————————————
	返回(json)：
		{
			//游戏列表
			list: [{
				"game_id": "638",
				"game_channel": "mc",
				"game_name": "我的世界",
				"game_cover": "http://s1.dwstatic.com/vhuya/C6/29/c6291be2f8ddb5f31fab7fe60071d43c6532.jpg",
				"game_url": "http://video.duowan.com/mc/",
				"game_intro": "Minecraft是一款自由度很高的沙盒游戏，《我的世界》、《当个创世神》、《麦块》、《我的手艺》等仅为非官方中文译名。\r\n\t\t\t\t\t",
				"channel_alias": "mc"
			}, ..., {}]
			pages: null //分页信息，貌似有点问题。一般不会给游戏分页，先忽略这个吧
		}
	————————————————————————————————————————————————————
	备注: 
		需要dwUDBProxy.isLogin()登录态
	————————————————————————————————————————————————————
	示例：
		http://video.duowan.com/jsapi/GetGameSubscribe
	————————————————————————————————————————————————————





<font color="blue">4、获取订阅的用户 jsapi/getUserSubscribe </font>
	————————————————————————————————————————————————————
	URL:		http://video.duowan.com/jsapi/getUserSubscribe
	————————————————————————————————————————————————————
	参数(get|post):
		<span style="display:none">limit		个数（默认10，可选）</span>
		<span style="display:none">page		页码（默认1，可选）</span>
	————————————————————————————————————————————————————
	返回(json)：
		{
			//游戏列表
			list: [{
				"game_id": "638",
				"game_channel": "mc",
				"game_name": "我的世界",
				"game_cover": "http://s1.dwstatic.com/vhuya/C6/29/c6291be2f8ddb5f31fab7fe60071d43c6532.jpg",
				"game_url": "http://video.duowan.com/mc/",
				"game_intro": "Minecraft是一款自由度很高的沙盒游戏，《我的世界》、《当个创世神》、《麦块》、《我的手艺》等仅为非官方中文译名。\r\n\t\t\t\t\t",
				"channel_alias": "mc"
			}, ..., {}]
			pages: null //分页信息，貌似有点问题。一般不会给游戏分页，先忽略这个吧
		}
	————————————————————————————————————————————————————
	备注: 
		需要dwUDBProxy.isLogin()登录态
	————————————————————————————————————————————————————
	示例：
		http://video.duowan.com/jsapi/GetUserSubscribe
	————————————————————————————————————————————————————






</pre>