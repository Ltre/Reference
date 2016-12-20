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
				"user_id": 0,
				"user_avatar": "http://video.duowan.com/style/img/editor-avatar.png",
				"user_nickname": "多玩小编",
				"user_homepage": "http://video.duowan.com/",
				"vid": 0,
				"video_title": "",
				"video_subtitle": "",
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
				"video_channel": "unknown",
				"video_intro": "",
				"video_tags": ""
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



</pre>