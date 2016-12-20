<h1><center>虎牙视频 - 播放量、订阅量统计接口文档</center></h1>

0、前提条件：
	1) 测试环境需要绑定HOSTS：  183.61.6.12 v.huya.com
	
	

<a name="1"></a>
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



另外两个接口等下更新文档，用法不变








特别说明：

//加入了测试用例的账号
private function testCase(&$uid){
    if (!strcasecmp(ACTION_NAME, 'subscribe') && in_array($uid, array('50013424', '50075091'))) {
        $this->testSubscribe();
    } elseif (!strcasecmp(ACTION_NAME, 'play') && in_array($uid, array('50013424', '50075091'))) {
        $this->testPlay();
    } elseif (!strcasecmp(ACTION_NAME, 'videolist') && in_array($uid, array('50013424', '50075091'))) {
        $this->testVideoList();
    }
}

这几个账号都接入了测试用例，拿到的数据全部都是随机的，所以不用看效果