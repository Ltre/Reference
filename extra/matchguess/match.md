<pre>

<h1><center>赛事竞猜接口 - 20180330</center></h1>

<font color="blue">1、获取比赛列表，列表元素包含比赛信息和竞猜数据</span>
	————————————————————————————————————————————————————
	URL:		
        正式：
            ???
        测试：
            http://match-guess.webdev2.duowan.com/matches/list
	————————————————————————————————————————————————————
	参数(get|post):
		ac_id       活动ID，本次活动为战马红蓝大竞猜(测试环境的ac_id=1)
	————————————————————————————————————————————————————
	返回(object)：
		{
            "1": [ // 1 表示第一周 ；每周加载N个比赛数据块，每个数据块包含比赛信息和竞猜数据
                {
                    "match_id": "8", //比赛ID
                    "ac_id": "1", //活动ID
                    "match_type": "BO1",   //比赛类型：前端暂时不用
                    "start_time": "1522402200", //比赛开始时间，这跟竞猜开始时间不同概念
                    "end_time": "1522488600", //比赛结束时间，这跟竞猜结束时间不同概念
                    "status": "2", //比赛进行状态：0未开始 1进行中 2已结束 3已暂停 4已取消
                    "left_team": "5", //主队ID
                    "right_team": "4", //客队ID
                    "left_win": "0", //主队胜场
                    "right_win": "1", //客队胜场
                    "result": "2", //比赛结果：0未知 1主队胜 2客队胜
                    "online_users": 68112, //在线人数(一般是后台设置的随机值)
                    "start_time_mdhi": "03-30 17:30", 
                    "end_time_mdhi": "03-31 17:30",
                    "start_time_md": "03-30",
                    "end_time_md": "03-31",
                    "start_time_hi": "17:30",
                    "end_time_hi": "17:30",
                    "result_desc": "客队胜", //比赛结果：0未知 1主队胜 2客队胜
                    "status_desc": "已结束",
                    "left_team_name": "NMBD", //主队名
                    "right_team_name": "BB", //客队名
                    "left_team_logo": "http://ya2.dwstatic.com/201803/8c/8c04cab6a8cf2c21f1ba0794267c8437.jpg",
                    "right_team_logo": "http://ya3.dwstatic.com/201803/d3/d38c92440f32b0e938d1d836839a9bc2.gif",
                    //<span color="orange">胜负问题的数据块</span>
                    "win_question": {
                        "guess_id": "9", //胜负问题的问题ID
                        "question": "", //问题描述，对于胜负问题，为空串；对于实况问题，有描述
                        "bonus_score": 100, //答对奖励分数
                        "deduct_score": 0, //答错扣除分数
                        "start_time": "1522315800", //答题开始时间，<span color="red">根据需要，使用该时间控制是否可答题，后端也做了控制</span>
                        "end_time": "1522487400", //答题结束时间，<span color="red">根据需要，使用该时间控制是否可答题，后端也做了控制</span>
                        "start_time_mdhi": "03-29 17:30",
                        "end_time_mdhi": "03-31 17:10",
                        "start_time_md": "03-29",
                        "end_time_md": "03-31",
                        "start_time_hi": "17:30",
                        "end_time_hi": "17:10",
                        "guess_options": [ //竞猜候选项列表
                            {
                                "option_id": "13", //候选项ID
                                "guess_id": "9", //对应问题ID
                                "option_name": "teamId=5", //候选项的描述(对于胜负竞猜，这里的值有点奇怪，但是前段用不到，就忽略吧)
                                "correctness": "2" // 正确性: 0未知 1答对 2答错
                            },
                            {
                                "option_id": "14",
                                "guess_id": "9",
                                "option_name": "teamId=4",
                                "correctness": "1"
                            }
                        ],
                        //系统指定的正确答案，一般在竞猜结束后会展示；没有答案时，是个空数组。
                        //数组里的元素结构，同guess_options里的元素完全一致
                        //对于胜负类型的竞猜，该数组最多只有一个元素，只要取answers[0]即可
                        //当系统开放正确答案时，将显示出来
                        "answers": [],
                        //个人提交竞猜的记录，一个问题一定只有一条记录，结构是object，不是array；没有登录或没有提交记录时，为null
                        "guess_record": {
                            "record_id": "1", //记录ID
                            "answer": "13", //提交的候选项ID
                            "result": "0" //是否猜对：0-未知，1-答对，2-答错
                        }
                    },
                    //<span color="orange">实况小问题数据列表, 这个是array，注意数组闭合处的省略号</span>
                    "live_questions": [{
                        {
                            "guess_id": "10",
                            "question": "发打扫机家佛将大赛i 分挤掉附近",
                            "bonus_score": 100,
                            "deduct_score": 0,
                            "start_time": "1522315800", //答题开始时间，<span color="red">根据需要，使用该时间控制是否可答题，后端也做了控制</span>
                            "end_time": "1522487400", //答题结束时间，<span color="red">根据需要，使用该时间控制是否可答题，后端也做了控制</span>
                            "start_time_mdhi": "03-29 17:30",
                            "end_time_mdhi": "03-31 17:10",
                            "start_time_md": "03-29",
                            "end_time_md": "03-31",
                            "start_time_hi": "17:30",
                            "end_time_hi": "17:10",
                            "guess_options": [ //竞猜候选项列表
                                {
                                    "option_id": "15", //候选项ID
                                    "guess_id": "10", //对应问题ID
                                    "option_name": "发达囧覅搭建覅偶", //候选项的描述
                                    "correctness": "1" // 正确性：0未知 1答对 2答错
                                },
                                {
                                    "option_id": "16",
                                    "guess_id": "10",
                                    "option_name": "范德萨",
                                    "correctness": "2"
                                }
                            ],
                            //系统指定的正确答案，一般在竞猜结束后会展示；没有答案时，是个空数组。
                            //数组里的元素结构，同guess_options里的元素完全一致
                            //对于胜负类型的竞猜，该数组最多只有一个元素，只要取answers[0]即可
                            //当系统开放正确答案时，将显示出来
                            "answers": [
                                {
                                    "option_id": "15",
                                    "guess_id": "10",
                                    "option_name": "发达囧覅搭建覅偶",
                                    "correctness": "1"
                                }
                            ],
                            //个人提交竞猜的记录，一个问题一定只有一条记录，结构是object，不是array；没有登录或没有提交记录时，为null
                            "guess_record": {
                                "record_id": "1", //记录ID
                                "answer": "13", //提交的候选项ID
                                "result": "0" //是否猜对：0-未知，1-答对，2-答错
                            }
                        },
                    }, <span color="red">...</span>]
                },
                {
                    <span color="red">...</span>
                },
                <span color="red">...<span>
            ],
            "2": [ //第二周
                {...},
                {...},
                {...},
                {...},
                ...
            ],
            "4": [ //第四周
                {...},
                {...},
                {...},
                {...},
                ...
            ],
            ...
        }
	————————————————————————————————————————————————————
	备注: 
		登录和未登录，返回的数据有微小差异

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