<pre>

<h1><center>多玩视频 - 提供给发布器的API</center></h1>

1、更多视频播放量统计 popular/videoList
	————————————————————————————————————————————————————
	URL:		http://v.huya.com/?r=popular/videoList
	————————————————————————————————————————————————————
	参数(get|post):
		keyword		[可选]搜索关键字
		sort		[可选]默认降序(desc)。升序用asc
		p			[可选]页码，默认为1，表示第一页
	————————————————————————————————————————————————————
	返回(json)：
		count: "5"
		next_page: ""
		page: 1
		videos: [{
			definition: "yuanhua"
			duration: "309.986400"
			edit_title: ""
			game_id: "1904"
			uptime: "1427365166"
			vid: "103270"
			video_comment_sum: "0"
			video_cover: "http://vimg.dwstatic.com/1513/103270/7-220x124.jpg"
			video_intro: null
			video_play_sum: 0
			video_title: "【物语动画MAD】AMV _ Videos _ Into The Labyrinth"
			yesterday_play: 0
		}, ... ,{...}]
	————————————————————————————————————————————————————
	备注: 
		需要登录态
	————————————————————————————————————————————————————


</pre>