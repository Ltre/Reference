<pre>

<h1><center>多玩视频 - 提供给发布器的API</center></h1>

<font color="blue">1、通过专区、文章id获取视频基本信息（<font color="red">发布器模板用</font>） cmsapi/getInfoByArticleId </font>
	————————————————————————————————————————————————————
	URL:		http://video.duowan.com/?r=cmsapi/getInfoByArticleId
	————————————————————————————————————————————————————
	参数(get|post):
		channel		专区ID
		articleId	文章ID
	————————————————————————————————————————————————————
	返回(array)：
		[{
			"user_id": 0,
			"user_avatar": "http://video.duowan.com/style/img/editor-avatar.png",
			"user_nickname": "多玩小编",
			"user_homepage": "http://video.duowan.com/",
			"vid": 0,
			"video_title": "",
			"video_subtitle": "",
            "video_rawtitle": "",
			"video_cover": "http://video.duowan.com/style/img/no-cover.jpg",
			"video_play_num": 0,
			"video_raw_play_num": 0,
			"video_comment_num": 0,
			"video_raw_comment_num": 0,
			"video_duration": "00:00",
			"video_raw_duration": "00:00",
			"video_url": "http://video.duowan.com/",
			"video_upload_time": "2015-07-08",
			"video_raw_upload_time": 0,
			"video_channel": "lol",
            "video_channel_name": "英雄联盟",
			"video_intro": "",
			"video_tags": ""
		}, ..., {}]
	————————————————————————————————————————————————————
	备注: 
		无
	————————————————————————————————————————————————————







<font color="blue">2、通过标签获取视频排行榜（<font color="red">发布器模板用</font>） cmsapi/getRankByTag </font>
	————————————————————————————————————————————————————
	URL:		http://video.duowan.com/?r=cmsapi/getRankByTag
	————————————————————————————————————————————————————
	参数(get|post):
		channel		专区（可选）
		tag			标签（可选，仅接受单个标签）
		sortBy		排序依据（day|week|month，可选，默认day）
		limit		获取个数（可选，默认10）
	————————————————————————————————————————————————————
	返回(array)：
		[{
			"user_id": 0,
			"user_avatar": "http://video.duowan.com/style/img/editor-avatar.png",
			"user_nickname": "多玩小编",
			"user_homepage": "http://video.duowan.com/",
			"vid": 0,
			"video_title": "",
			"video_subtitle": "",
            "video_rawtitle": "",
			"video_cover": "http://video.duowan.com/style/img/no-cover.jpg",
			"video_play_num": 0,
			"video_raw_play_num": 0,
			"video_comment_num": 0,
			"video_raw_comment_num": 0,
			"video_duration": "00:00",
			"video_raw_duration": "00:00",
			"video_url": "http://video.duowan.com/",
			"video_upload_time": "2015-07-08",
			"video_raw_upload_time": 0,
			"video_channel": "lol",
            "video_channel_name": "英雄联盟",
			"video_intro": "",
			"video_tags": ""
		}, ..., {}]
	————————————————————————————————————————————————————
	备注: 
		无
	————————————————————————————————————————————————————
	示例：
		http://video.duowan.com/?r=cmsapi/getRankByTag&channel=5253wzry&tag=%E8%99%8E%E7%89%99%E8%A7%86%E9%A2%91&sortBy=month&limit=10
	————————————————————————————————————————————————————




<font color="blue">3、按专区获取手动推荐的播客（解说OR用户），多玩首页推荐的channel参数传duowanvideo。（<font color="red">发布器模板用</font>）</font>
	————————————————————————————————————————————————————
	URL:		http://video.duowan.com/?r=cmsapi/getUsersByHot
	————————————————————————————————————————————————————
	参数(get|post):
        channel     专区（可选）
		limit		获取个数（可选，默认8）
	————————————————————————————————————————————————————
	返回(array)：
		[{
            "user_id": "1062484609",
            "user_avatar": "http://s1.dwstatic.com/vhuya/avatar/10/62/200_200/4173a0e5ae914ae31b0aadf310b1b0ae.jpg?t=1481842948",
            "user_nickname": "CarryLeeS",
            "user_homepage": "http://video.duowan.com/u/1062484609",
            "user_channel": "lol",
            "user_channel_name": "英雄联盟",
            "user_video_sum": "117",
            "user_play_sum": "190万",
            "user_desc": ""
		}, ..., {}]
	————————————————————————————————————————————————————
	备注: 
		无
	————————————————————————————————————————————————————
	示例：
		http://video.duowan.com/?r=cmsapi/getRankByTag&channel=5253wzry&tag=%E8%99%8E%E7%89%99%E8%A7%86%E9%A2%91&sortBy=month&limit=10
	————————————————————————————————————————————————————




<font color="blue">4、通过UID获取用户的最新视频  cmsapi/getVideosByUser。（<font color="red">发布器模板用</font>）</font>
	————————————————————————————————————————————————————
	URL:		http://video.duowan.com/?r=cmsapi/getVideosByUser。
	————————————————————————————————————————————————————
	参数(get|post):
        uid         用户YYUID
		limit		获取个数（可选，默认8）
	————————————————————————————————————————————————————
	返回(array)：
		[{
            "user_id": "50014545",
            "user_avatar": "http://s1.dwstatic.com/vhuya/avatar/50/01/200_200/98d2a3f69b3baffa354413ea9951e7c5.jpg?t=1466045578",
            "user_nickname": "王尼玛",
            "user_homepage": "http://video.duowan.com/u/50014545",
            "vid": 3082499,
            "video_title": "祈Inory威风堂堂恶搞",
            "video_subtitle": "祈Inory威风堂堂恶搞",
            "video_cover": "http://vimg.dwstatic.com/1634/3082499/4-220x124.jpg",
            "video_play_num": "1,050",
            "video_raw_play_num": 1050,
            "video_comment_num": "0",
            "video_raw_comment_num": 0,
            "video_duration": "01:09",
            "video_raw_duration": 69,
            "video_url": "http://video.duowan.com/play/3082499.html",
            "video_upload_time": "2016-08-25 10:29",
            "video_raw_upload_time": "1472092193",
            "video_channel": "kan",
            "video_channel_name": "娱乐",
            "video_intro": "",
            "video_tags": ""
		}, ..., {}]
	————————————————————————————————————————————————————
	备注: 
		无
	————————————————————————————————————————————————————
	示例：
		http://video.duowan.com/?r=cmsapi/getVideosByUser&uid=50014545
	————————————————————————————————————————————————————






</pre>