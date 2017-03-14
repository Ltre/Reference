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









<font color="blue">2、通过UID获取用户的最新视频 jsapi/getUserVideos </font>
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
                "video_channel_name": "英雄联盟",
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
                "user_id": "1062484609",
                "user_avatar": "http://s1.dwstatic.com/vhuya/avatar/10/62/200_200/4173a0e5ae914ae31b0aadf310b1b0ae.jpg?t=1481842948",
                "user_nickname": "CarryLeeS",
                "user_homepage": "http://video.duowan.com/u/1062484609",
                "user_channel": "lol",
                "user_channel_name": "英雄联盟",
                "user_video_sum": "180",
                "user_play_sum": "190万",
                "user_desc": "",
                "week_update_num": "202"
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




<font color="blue">5、多玩懂你视频列表 jsapi/videosKnowYou </font>
	————————————————————————————————————————————————————
	URL:		http://video.duowan.com/jsapi/videosKnowYou
	————————————————————————————————————————————————————
	参数(get|post):
		limit		个数（默认10，可选）
	————————————————————————————————————————————————————
	返回(array)：
		[{
			"user_id": "803575426",
			"user_avatar": "http://s1.dwstatic.com/vhuya/avatar/80/35/200_200/caca8b842222ab5aa446613cb053026f.jpg?t=1480663433",
			"user_nickname": "Numen",
			"user_homepage": "http://video.duowan.com/u/803575426",
			"vid": 3512943,
			"video_title": "Numen精彩集锦：剑姬丝血躲伤1V2",
			"video_subtitle": "Numen精彩集锦：剑姬丝血躲伤1V2",
			"video_cover": "http://vimg.dwstatic.com/1650/3512943/9-220x124.jpg",
			"video_play_num": "8",
			"video_raw_play_num": 8,
			"video_comment_num": "5",
			"video_raw_comment_num": 5,
			"video_duration": "05:49",
			"video_raw_duration": 349,
			"video_url": "http://video.duowan.com/play/3512943.html",
			"video_upload_time": "2016-12-16 11:23",
			"video_raw_upload_time": 1481858616,
			"video_channel": "lol",
			"video_intro": "Numen精彩集锦：剑姬丝血躲伤1V2。",
			"video_tags": ",游戏视频,娱乐集锦视频,盒子推荐,重点,"
		}, ..., {}]
	————————————————————————————————————————————————————
	备注: 
		无
	————————————————————————————————————————————————————
	示例：
		http://video.duowan.com/jsapi/videosKnowYou
	————————————————————————————————————————————————————




<font color="blue">6、通过标签获取视频排行榜（前端JS用） jsapi/getRankByTag </font>
	————————————————————————————————————————————————————
	URL:		http://video.duowan.com/jsapi/getRankByTag
	————————————————————————————————————————————————————
	参数(get|post):
		channel		专区（可选）
		tag			标签（可选，仅接受单个标签）
		sortBy		排序依据（day|week|month，可选，默认day）
		limit		获取个数（可选，默认10）
        page        页码（默认1，可选）
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
		可以给通用视频列表模块的“换一换”功能使用，页码最大支持至50
	————————————————————————————————————————————————————
	示例：
		http://video.duowan.com/jsapi/getRankByTag&channel=5253wzry&tag=%E8%99%8E%E7%89%99%E8%A7%86%E9%A2%91&sortBy=month&limit=10
	————————————————————————————————————————————————————





<font color="blue">7、获取视频信息及视频源、评论uniqid、相关标签等（视频站播放页专用） jsapi/playPageVideoInfo </font>
	————————————————————————————————————————————————————
	URL:		http://video.duowan.com/jsapi/playPageVideoInfo
	————————————————————————————————————————————————————
	参数(get|post):
		vids            视频，多个用半角逗号隔开
	————————————————————————————————————————————————————
	返回(json)：
        {
            "123456": {
                "user_id": "1002099688",
                "user_avatar": "http://s1.dwstatic.com/boke_avatar/FB/9E/fb9e256e85a1e00ee2fb12b2beaf6bae5475.jpg",
                "user_nickname": "咖啡",
                "user_homepage": "http://video.duowan.com/u/1002099688",
                "vid": 123456,
                "video_title": "【战舰世界】【舰队】Des Moines.mp4_WebBilibili",
                "video_subtitle": "【战舰世界】【舰队】Des Moines.mp4_WebBilibili",
                "video_cover": "http://vimg.dwstatic.com/1523/123456/4-220x124.jpg",
                "video_big_cover": "http://vimg.dwstatic.com/1523/123456/4-640x360.jpg",
                "video_play_num": "853",
                "video_raw_play_num": 853,
                "video_comment_num": "0",
                "video_raw_comment_num": 0,
                "video_duration": "04:10",
                "video_raw_duration": 250,
                "video_url": "http://video.duowan.com/play/123456.html",
                "video_upload_time": "2015-06-03 19:57",
                "video_raw_upload_time": 1433332660,
                "video_channel": "wows",
                "video_channel_name": "多玩视频",  //专区显示名
                "video_intro": "视频简介",
                "video_tags": ["游戏视频", "比赛视频"],
                "video_tag_links": [
                    {
                        "tag": "游戏视频",
                        "tag_link": "http://video.duowan.com/youxishipin8210.html"
                    },
                    {
                        "tag": "比赛视频",
                        "tag_link": "http://video.duowan.com/lol/bisai.html"
                    }
                ],
                "video_square_cover": "http://s1.dwstatic.com/duowanvideo/20170221/11/5238501.jpg",
                "comment3_uniqid": "bb7d509c92c98b48c2a94b8254aa50d2",  //通用评论uniqid
                "comment3_domain": "psv.duowan.com", //通用评论domain参数
                "comment3_url": "/1411/281119815775.html", //通用评论url参数
                "c": "加密字符串",
                "result": 1   // 1 正常(以此为准)  0无效数据
            },
            "654321" : {
                ...,
                ... 结构同"123456"...,
                ...
            }, 
            ...
        }
	————————————————————————————————————————————————————
	备注: 
		字段c解密：
            方法：
                ;function decr(r){var e="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789@!~*-_.()'".split("");var n=[];var a=[];r.split("").reverse().forEach(function(r,t){var o=e.indexOf(r);if(parseInt((t+1)%2)==1){a.push(o)}else{var p=parseInt(o-a[(t+1)/2-1]);n.push(e[p])}});var t=n.join("").replace(/@/g,"%");return decodeURIComponent(t)};
                var srcMap = {};
                if (JSON.parse) {
                    srcMap = JSON.parse(decr(c)); 
                } else {
                    srcMap = eval('('+decr(c)+')');
                }
            结果示例：
                有数据时，
                    得到：{
                        "all": {
                            "350": {
                                "src": "http://dw-w6.dwstatic.com/1/12/1523/123456-98-1433333060.mp4",
                                "definition": "350",
                                "definition_name": "流畅"
                            },
                            "1000": {
                                "src": "http://dw-w6.dwstatic.com/1/9/1523/123456-99-1433333060.mp4",
                                "definition": "1000",
                                "definition_name": "高清"
                            },
                            "1300": {
                                "src": "http://dw-w6.dwstatic.com/1/11/1523/123456-100-1433333060.mp4",
                                "definition": "1300",
                                "definition_name": "超清"
                            },
                            "yuanhua": {
                                "src": "http://dw-w6.dwstatic.com/1/12/1523/123456-101-1433333060.mp4",
                                "definition": "yuanhua",
                                "definition_name": "原画"
                            }
                        },
                        "select": {
                            "src": "",
                            "definition": "1300",
                            "definition_name": "超清"
                        }
                    }
                没数据时，
                    得到：[]
            示例源码：<a href="http://cms.acggeek.com/%E5%A4%9A%E7%8E%A9%E8%A7%86%E9%A2%91GCVS%E8%A7%86%E9%A2%91%E6%BA%90%E6%8E%A5%E5%8F%A3%E8%A7%A3%E5%AF%86%E7%A4%BA%E4%BE%8B">详见</a>
	————————————————————————————————————————————————————
	示例：
		http://video.duowan.com/jsapi/getRankByTag&channel=5253wzry&tag=%E8%99%8E%E7%89%99%E8%A7%86%E9%A2%91&sortBy=month&limit=10
	————————————————————————————————————————————————————








<font color="blue">8、操作接口 - 收藏视频动作 jsapi/collectByVid </font>
	————————————————————————————————————————————————————
	URL:		http://video.duowan.com/jsapi/collectByVid
	————————————————————————————————————————————————————
	参数(get|post):
		vids	    视频ID，多个用半角逗号隔开
	————————————————————————————————————————————————————
	返回(json)：
        {
            "rs": true,//true即成功
            "msg": "操作成功"
        }
	————————————————————————————————————————————————————
	备注: 
		需要登录态
	————————————————————————————————————————————————————
	示例：
        http://video.duowan.com/jsapi/collectByVid?vids=111111,123456
	————————————————————————————————————————————————————





<font color="blue">9、操作接口 - 取消收藏视频动作 jsapi/collectByVid </font>
	————————————————————————————————————————————————————
	URL:		http://video.duowan.com/jsapi/removeCollectByVid
	————————————————————————————————————————————————————
	参数(get|post):
		vids	    视频ID，多个用半角逗号隔开
	————————————————————————————————————————————————————
	返回(json)：
        {
            "rs": true,//true即成功
            "msg": "操作成功"
        }
	————————————————————————————————————————————————————
	备注: 
		需要登录态
	————————————————————————————————————————————————————
	示例：
		http://video.duowan.com/jsapi/removeCollectByVid?vids=11111,123456
	————————————————————————————————————————————————————




<font color="blue">10、判断接口 - 是否已收藏视频 jsapi/isVideoCollected </font>
	————————————————————————————————————————————————————
	URL:		http://video.duowan.com/jsapi/isVideoCollected
	————————————————————————————————————————————————————
	参数(get|post):
		vids	    视频ID，多个用半角逗号隔开
	————————————————————————————————————————————————————
	返回(json)：
        {
            "rs": true,//true即成功
            "msg": "操作成功",
            "map": {
                "111111": true, //已收藏
                "123456": false //未收藏
            }
        }
	————————————————————————————————————————————————————
	备注: 
		需要登录态
	————————————————————————————————————————————————————
	示例：
		http://video.duowan.com/jsapi/isVideoCollected?vids=111111,123456
	————————————————————————————————————————————————————




<font color="blue">11、数据接口 - 获取已收藏的视频列表 jsapi/getVideoCollected </font>
	————————————————————————————————————————————————————
	URL:		http://video.duowan.com/jsapi/getVideoCollected
	————————————————————————————————————————————————————
	参数(get|post):
		p   	    页码，默认1，可选
        limit       每页条目数，默认16，可选
	————————————————————————————————————————————————————
	返回(json)：
        {
            "rs": true,//true即成功
            "msg": "获取成功",
            "list": [ <font color=red>//这里的视频信息，是最基本的VideoInfo结构，跟jsapi/playPageVideoInfo返回的还是有区别的，注意不用使用不存在的字段</font>
                {
                    "user_id": "5452110",
                    "user_avatar": "http://s1.dwstatic.com/vhuya/avatar/54/52/200_200/c05f22834f003f77e912ea1896713396.jpg?t=1473320930",
                    "user_nickname": "小学生院长",
                    "user_homepage": "http://video.duowan.com/u/5452110",
                    "vid": 1638206,
                    "video_title": "北美第一锐雯BoxBox 用手柄也能打爆你",
                    "video_subtitle": "北美第一锐雯BoxBox 手柄打爆你",
                    "video_cover": "http://vimg.dwstatic.com/1614/1638206/9-220x124.jpg",
                    "video_play_num": "4.2万",
                    "video_raw_play_num": 42253,
                    "video_comment_num": "22",
                    "video_raw_comment_num": 22,
                    "video_duration": "49:42",
                    "video_raw_duration": 2982,
                    "video_url": "http://video.duowan.com/play/1638206.html",
                    "video_upload_time": "2016-04-07 12:07",
                    "video_raw_upload_time": 1460002058,
                    "video_channel": "lol",
                    "video_channel_name": "英雄联盟",
                    "video_intro": "　　北美第一锐雯BoxBox用手柄玩上单锐雯，这操作与手速比普通人用键盘还溜。",
                    "video_tags": ",游戏视频,高手视频,主播视频,英雄视频,上单视频,放逐之刃锐雯视频,盒子推荐,",
                    "video_square_cover": "http://s1.dwstatic.com/duowanvideo/20170221/11/5238501.jpg",
                    "game_url": "http://video.duowan.com/lol/",
                    "game_name": "英雄联盟"
                },
                ...,
                {...}
            ],
            "pages": { //分页信息，结构由PHPBASE框架生成。<font color=red>当没有生成分页数据时，值为null</font>
                "total_count": "10", //总数据量
                "page_size": 2, //每页条数
                "total_page": 5, //总页数
                "first_page": 1, //首页
                "prev_page": 1, //上一页
                "next_page": 2, //下一页
                "last_page": 5, //最后一页
                "current_page": 1, //当前页
                "all_pages": [1, 2, 3, 4, 5], //当前可见页码表
                "offset": 0, //起始数据位置
                "limit": 2
            }
        }
	————————————————————————————————————————————————————
	备注: 
		需要登录态
	————————————————————————————————————————————————————
	示例：
		http://video.duowan.com/jsapi/getVideoCollected?p=1&limit=2
	————————————————————————————————————————————————————



</pre>