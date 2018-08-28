<h1><center>赛事竞猜接口 - 20180330</center></h1>


<a href="#a0">0、业务入门摘要</a>
<a href="#a1">1、获取比赛列表，列表元素包含比赛信息和竞猜数据</a>
<a href="#a2">2、胜负竞猜-提交接口</a>
<a href="#a3">3、实况问题竞猜-提交接口</a>
<a href="#a4">4、我的竞猜记录</a>
<a href="#a5">5、个人信息</a>
<a href="#a6">6、用户排行榜</a>
<a href="#a7">7、中奖登记</a>
<a href="#a8">8、签到</a>
<a href="#a9">9、获奖名单</a>
<a href="#a10">10、获取今日分配给自己的分享任务</a>
<a href="#a11">11、访问分享页时，加载任务执行信息、助力记录、获奖记录</a>
<a href="#a12">12、被邀请者提交助力记录</a>
<a href="#a13">13、领取助力分享的奖励</a>


<font id="a0" color="blue">0、业务入门简要</font>
    a、先对数据类型(包含前端可能用不到的)有个印象，知道一些标识符对应什么类型的数据
        赛事活动(主键ac_id): 表activity。解释：本次的战马厂商委托，可以算是个活动，以后如果有别的厂商来委托、或者我们自己搞了个别的赛事，那就是另一个活动
        比赛(主键match_id) 表matches
        用户(主键yyuid) 表user
        用户统计汇总(主键sum_id) 表user_summary
        积分流水(主键detail_id) 表score_detail
        竞猜问题(主键guess_id) 表guess
        竞猜候选项(主键option_id) 表guess_option
        竞猜提交记录(主键record_id) 表guess_record
        战队(主键team_id) 表team
        中奖登记记录(主键regist_id) 表bonus_regist
    b、数据类型之间的关系
        b1、活动activity -> 一对多 -> 比赛match，即一个活动包含多个比赛
        b2、比赛match -> 一对多 -> 竞猜问题guess
            特别地，一场比赛只有一个胜负问题，但可以有多个实况小问题
        b3、竞猜问题guess -> 一对多 -> 竞猜候选项guess_option
        b4、比赛信息包含战队，一个战队可以参与多场比赛。即：比赛match <-> 多对多 <-> 战队team



<font id="a1" color="blue">1、获取比赛列表，列表元素包含比赛信息和竞猜数据</font>
    ————————————————————————————————————————————————————
    URL:        
        正式：
            http://match-guess.duowan.com/matches/list
        测试：
            http://match-guess.webdev2.duowan.com/matches/list
    ————————————————————————————————————————————————————
    参数(get|post):
        ac_id       活动ID，本次活动为战马红蓝大竞猜(测试环境的ac_id=1)
        groupMode   分组模式，值有week按周|mode按天，默认为week，可空
    ————————————————————————————————————————————————————
    返回(object)：
        {
            rs: true|false
            msg: xxx
            data: 按周|天分组的比赛数据，每组是一个列表，
        }

        具体的data结构如下：

        {
            "1": [ // 1 表示第一周|天 ；每周加载N个比赛数据块，每个数据块包含比赛信息和竞猜数据
                {
                    "match_id": "8", //比赛ID
                    "ac_id": "1", //活动ID
                    "match_name": "LPL春季小组赛 ABC vs HUAJI",   //比赛名称
                    "match_type": "BO1",   //比赛类型：前端暂时不用
                    "start_time": 1522402200, //比赛开始时间戳，这跟竞猜开始时间不同概念
                    "end_time": 1522488600, //比赛结束时间戳，这跟竞猜结束时间不同概念
                    "status": "2", //比赛进行状态：0未开始 1进行中 2已结束 3已暂停 4已取消
                    "left_team": "5", //主队ID
                    "right_team": "4", //客队ID
                    "left_win": "0", //主队胜场
                    "right_win": "1", //客队胜场
                    "result": "2", //比赛结果：0未知 1主队胜 2客队胜
                    "online_users": 68112, //在线人数(一般是后台设置的随机值)
                    "record_url": 'http://录播地址',
                    "report_url": 'http://战报地址',
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
                    "left_guess_num": 200,//主队支持数
                    "right_guess_num": 100,//客队支持数
                    "left_guess_perc": "66.67%",//主队支持率
                    "right_guess_perc": "33.33%",//客队支持率
                    //<font color="orange">胜负问题的数据块</font>
                    "win_question": {
                        "guess_id": "9", //胜负问题的问题ID
                        "question": "", //问题描述，对于胜负问题，为空串；对于实况问题，有描述
                        "bonus_score": 100, //答对奖励分数
                        "deduct_score": 0, //答错扣除分数
                        "start_time": 1522315800, //答题开始时间戳，<font color="red">根据需要，使用该时间控制是否可答题，后端也做了控制</font>
                        "end_time": 1522487400, //答题结束时间戳，<font color="red">根据需要，使用该时间控制是否可答题，后端也做了控制</font>
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
                                "option_name": "teamId=5", //候选项的描述(对于胜负竞猜，这里的值有点奇怪，但是前端用不到，就忽略吧)
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
                    //<font color="orange">实况小问题数据列表, 这个是array，注意数组闭合处的省略号</font>
                    "live_questions": [{
                        {
                            "guess_id": "10",
                            "question": "发打扫机家佛将大赛i 分挤掉附近",
                            "bonus_score": 100,
                            "deduct_score": 0,
                            "start_time": 1522315800, //答题开始时间戳，<font color="red">根据需要，使用该时间控制是否可答题，后端也做了控制</font>
                            "end_time": 1522487400, //答题结束时间戳，<font color="red">根据需要，使用该时间控制是否可答题，后端也做了控制</font>
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
                    }, <font color="red">...</font>]
                },
                {
                    <font color="red">...</font>
                },
                <font color="red">...</font>
            ],
            "2": [ //第二周|天
                {...},
                {...},
                {...},
                {...},
                ...
            ],
            "4": [ //第四周|天
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
        未登录时，不会加载个人竞猜提交记录
        没有开放答案时，接口不会显示答案
    ————————————————————————————————————————————————————
    示例：
        http://match-guess.webdev2.duowan.com/matches/list?ac_id=1
    ————————————————————————————————————————————————————








<font id="a2" color="blue">2、胜负竞猜-提交接口</font>
    ————————————————————————————————————————————————————
    URL:    
        正式：http://match-guess.duowan.com/guess/SubmitWin
        测试：http://match-guess.webdev2.duowan.com/guess/SubmitWin
    ————————————————————————————————————————————————————
    参数(get|post):
        guess_id        竞猜问题ID
        option_id       候选项ID
        match_id        比赛ID
    ————————————————————————————————————————————————————
    返回(objet)：
        {
            "rs": false,
            "msg": "投票已经结束了"
        }
    ————————————————————————————————————————————————————
    备注: 
        需要登录态
    ————————————————————————————————————————————————————
    示例：
        http://match-guess.webdev2.duowan.com/guess/SubmitWin?callback=jQuery1113024605852558475227_1522419242933&guess_id=8&option_id=11&match_id=7&_=1522419242934

        `script`
            var url = 'http://match-guess.webdev2.duowan.com/guess/SubmitWin';
            var param = {
                guess_id: 8,
                option_id: 11,
                match_id: 7
            };
            $.get(url, param, function(j){
                console.log(j);
            }, 'jsonp');
        `script`
    ————————————————————————————————————————————————————








<font id="a3" color="blue">3、实况问题竞猜-提交接口</font>
    ————————————————————————————————————————————————————
    URL:    
        正式：http://match-guess.duowan.com/guess/SubmitLives
        测试：http://match-guess.webdev2.duowan.com/guess/SubmitLives
    ————————————————————————————————————————————————————
    参数(get|post):
        args        object数组，结构如下
                    [
                        {
                            guess_id: 8, //竞猜问题ID
                            option_id: 11, //候选项ID
                            match_id: 7 //比赛ID
                        },{
                            guess_id: 7,
                            option_id: 9,
                            match_id: 2
                        }
                    ]
    ————————————————————————————————————————————————————
    返回(object)：
        {
            "rs": true,
            "msg": "提交成功",
            "feeds": [ //每个问题的反馈。先不管这里吧，直接用外层的rs判断是否成功即可
                {
                    "rs": false,
                    "msg": "竞猜已经结束了"
                },
                {
                    "rs": false,
                    "msg": "竞猜已经结束了"
                }
            ]
        }
    ————————————————————————————————————————————————————
    备注: 
        需要登录态
    ————————————————————————————————————————————————————
    示例：
        http://match-guess.webdev2.duowan.com/guess/SubmitLives?callback=jQuery111309869211024474152_1522418060858&args%5B0%5D%5Bguess_id%5D=8&args%5B0%5D%5Boption_id%5D=11&args%5B0%5D%5Bmatch_id%5D=7&args%5B1%5D%5Bguess_id%5D=7&args%5B1%5D%5Boption_id%5D=9&args%5B1%5D%5Bmatch_id%5D=2&_=1522418060859

        `script`
            var url = 'http://match-guess.webdev2.duowan.com/guess/SubmitLives';
            var args = [{
                guess_id: 8,
                option_id: 11,
                match_id: 7
            },{
                guess_id: 7,
                option_id: 9,
                match_id: 2
            }];
            $.get(url, {args:args}, function(j){
                console.log(j);
            }, 'jsonp');
        `script`
    ————————————————————————————————————————————————————






<font id="a4" color="blue">4、我的竞猜记录</font>
    ————————————————————————————————————————————————————
    URL:
        正式：http://match-guess.duowan.com/guess/myVictoryRecord
        测试：http://match-guess.webdev2.duowan.com/guess/myVictoryRecord
    ————————————————————————————————————————————————————
    参数(get|post):
        ac_id        活动ID
    ————————————————————————————————————————————————————
    返回(array)：
        [
            {
                "record_id": "2",
                "my_answer": "ABC", //竞猜的战队
                "my_result": "0", //是否猜对：0未知 1是 2否
                "submit_time": 1522392633, //竞猜提交时间
                "submit_time_mdhi": "03-30 14:50", //竞猜提交时间
                "guess_id": "8",
                "bonus_score": 100, //猜对奖励
                "deduct_score": 0, //猜错扣除
                "match_id": "7",
                "match_type": "BO1",
                "match_start_time": 1522402140, //比赛开始时间
                "match_end_time": 1522402140, //比赛结束时间
                "left_team": "6", //主队ID
                "right_team": "7", //客队ID
                "left_win": "0", //主队胜场次数
                "right_win": "0", //客队胜场次数
                "match_status": "0", //比赛进行状态：0未开始 1进行中 2已结束 3已暂停 4已取消
                "match_result": "0", //比赛结果：0未知 1主队胜 2客队胜
                "left_team_name": "ABC",
                "right_team_name": "HUAJI",
                "left_team_logo": "http://ya3.dwstatic.com/201803/0f/0ffae3c336a4e1fbd19ea7c87d8481ad.jpg",
                "right_team_logo": "http://ya2.dwstatic.com/201803/cc/cc15b849f790fc45b14b172a6500e631.png",
                "win_team": 0, //系统公布的胜方队ID
                "win_team_name": "未知", //系统公布的胜方队名
                "win_team_logo": "",
                "question": "ABC VS HUAJI全场比赛结果为？"
            },
            {
                ...
            },
            {
                ...
            },
            {
                ...
            },
            ...
        ]
    ————————————————————————————————————————————————————
    备注: 
        需要登录态

        接口返回的字段有很多用不到，但留着备用
    ————————————————————————————————————————————————————
    示例：
        http://match-guess.webdev2.duowan.com/guess/myVictoryRecord?ac_id=1
    ————————————————————————————————————————————————————








<font id="a5" color="blue">5、个人信息</font>
    ————————————————————————————————————————————————————
    URL:        
        正式：http://match-guess.duowan.com/user/info
        测试：http://match-guess.webdev2.duowan.com/user/info
    ————————————————————————————————————————————————————
    参数(get|post):
        ac_id        活动ID
    ————————————————————————————————————————————————————
    返回(object)：
        {
            "rs": true,
            "msg": "",
            "info": {
                "yyuid": "50014545",
                "nickname": "LTRE",
                "udb": "dw_abc",
                "avatar": "http://q.qlogo.cn/qqapp/101413783/F9C8F4EF012599DAB39EA7B0FDA8942B/100",
                "score": 0,
                "guess_times": "2",//竞猜总次数
                "guess_correct_times": "0",//竞猜正确次数
                "guess_wrong_times": "1",//竞猜错误次数
                "guess_victory_times": "2",//猜胜负次数
                "guess_victory_correct_times": "0",//猜胜负正确次数
                "guess_victory_wrong_times": "1",//猜胜负错误次数
                "guess_live_times": "0",//猜实况问题次数
                "guess_live_correct_times": "0",//猜实况问题正确次数
                "guess_live_wrong_times": "0"//猜实况问题错误次数
                "rankNo": 1, //排名，如返回0，则表示没上榜，相关的名次和中奖登记就不予显示
            }
        }
    ————————————————————————————————————————————————————
    备注: 
        需要登录态
    ————————————————————————————————————————————————————
    示例：
        http://match-guess.webdev2.duowan.com/user/info?ac_id=1
    ————————————————————————————————————————————————————




<font id="a6" color="blue">6、用户排行榜</font>
    ————————————————————————————————————————————————————
    URL:
        正式：http://match-guess.duowan.com/user/sumRank        
        测试：http://match-guess.webdev2.duowan.com/user/sumRank        
    ————————————————————————————————————————————————————
    参数(get|post):
        ac_id        活动ID
        limit        显示条目数量，默认20
    ————————————————————————————————————————————————————
    返回(object)：
        {
            "rs": true,
            "msg": "",
            "list": [
                {
                    "yyuid": "50014545",
                    "nickname": "LTRE",
                    "avatar": "http://q.qlogo.cn/qqapp/101413783/F9C8F4EF012599DAB39EA7B0FDA8942B/100",
                    "score": 0,
                    "guess_times": "2",
                    "guess_correct_times": "0",
                    "guess_wrong_times": "1",
                    "guess_victory_times": "2",
                    "guess_victory_correct_times": "0",
                    "guess_victory_wrong_times": "1",
                    "guess_live_times": "0",
                    "guess_live_correct_times": "0",
                    "guess_live_wrong_times": "0"
                },
                {
                    ...
                },
                ...
            ]
        }
    ————————————————————————————————————————————————————
    备注: 
        无
    ————————————————————————————————————————————————————
    示例：
        http://match-guess.webdev2.duowan.com/user/sumRank?ac_id=1&limit=10
    ————————————————————————————————————————————————————









<font id="a7" color="blue">7、中奖登记</font>
    ————————————————————————————————————————————————————
    URL:
        正式：http://match-guess.duowan.com/user/registBonus
        测试：http://match-guess.webdev2.duowan.com/user/registBonus
    ————————————————————————————————————————————————————
    参数(get|post):
        ac_id       活动ID
        realname    真实姓名
        phone       手机
        addr        地址
    ————————————————————————————————————————————————————
    返回(object)：
        {
            "rs": true,
            "msg": "登记成功"
        }
    ————————————————————————————————————————————————————
    备注: 
        需要登录态
    ————————————————————————————————————————————————————
    示例：
        http://match-guess.webdev2.duowan.com/user/registBonus?callback=jQuery1113028888580276149556_1522661714266&ac_id=1&realname=%E5%8F%91%E8%8C%83%E5%BE%B7%E8%90%A8%E5%8F%8A%E5%A4%A9%E4%BD%BF%E9%83%BD%E5%8F%8A&phone=15911111111&addr=%E5%B0%BC%E7%8E%9B%E5%9C%B0%E5%9D%80%E5%9C%B0%E6%96%B9%E5%9C%B0%E6%96%B9&_=1522661714267
    ————————————————————————————————————————————————————







<font id="a8" color="blue">8、签到</font>
    ————————————————————————————————————————————————————
    URL:        
        正式: http://match-guess.duowan.com/sign/do
        测试: http://match-guess.webdev2.duowan.com/sign/do
    ————————————————————————————————————————————————————
    参数(get|post):
        ac_id        活动ID
    ————————————————————————————————————————————————————
    返回(object)：
        {
            "rs": true,
            "msg": "签到成功"
        }
    ————————————————————————————————————————————————————
    备注: 
        需要登录态
        当rs=true时，再次调用user/info接口，重新渲染用户的积分数
    ————————————————————————————————————————————————————
    示例：
        http://match-guess.webdev2.duowan.com/sign/do?ac_id=1
    ————————————————————————————————————————————————————







<font id="a9" color="blue">9、获奖名单</font>
    ————————————————————————————————————————————————————
    URL:
        正式：https://match-guess.duowan.com/user/bonusList
        测试：http://match-guess.webdev2.duowan.com/user/bonusList
    ————————————————————————————————————————————————————
    参数(get|post):
        ac_id     活动ID
    ————————————————————————————————————————————————————
    返回(object)：
        {
            "rs": true,
            "msg": "",
            "list": [
                {
                    "yyuid": "1625819783",
                    "rank_no": 1, //排名，如果是0则没有上榜，通常是安慰奖
                    "nickname": "q274430777", //昵称
                    "udb": "q274430777", //通行证
                    "avatar": "",//头像
                    "score": 1210,//积分
                    "guess_times": 18,//竞猜总次数
                    "guess_correct_times": 10,//竞猜总正确次数
                    "guess_wrong_times": 2//竞猜总错误次数
                },
                {...},
                ...
            ]
        }
    ————————————————————————————————————————————————————
    备注: 
        无
    ————————————————————————————————————————————————————
    示例：
        https://match-guess.duowan.com/user/bonusList?ac_id=1
    ————————————————————————————————————————————————————







<font id="a10" color="blue">10、获取今日分配给自己的分享任务</font>
    ————————————————————————————————————————————————————
    URL:
        正式：http://match-guess.duowan.com/encour/getTodayAllot
        测试：http://match-guess.webdev2.duowan.com/encour/getTodayAllot
    ————————————————————————————————————————————————————
    参数(get|post):
        ac_id       活动ID, 必填
        task_id     非必填，除非运营强制指定某个任务为当前开放
    ————————————————————————————————————————————————————
    返回(object)：
        {
            rs: true|false,
            msg: 'ok',
            progress: {
                "progress_id": "2", //执行ID
                "progress_code": "9147ed9e56a583b7703332da81b68fdae6dde08c", //执行码，用于拼接前端分享URL
                "yyuid": "50014545", //分享发起者
                "task_id": "9", //分享任务ID，跟后台运营配置有关
                "ac_id": "5", //活动ID
                "accept_time": "1535352317", //接受任务时间(秒)
                "complete_time": "0", //完成任务时间
                "encour_times": "0", //已点亮次数
                "is_completed": "0", //是否完成
                "is_valid": "1", //是否有效
                "reward_receive_id": "0", //获得奖励的ID
                "reward_receive_time": "0", //获奖时间
                "update_time": "2018-08-27 14:45:17" //此记录的最后更新时间
            }
        }
    ————————————————————————————————————————————————————
    备注: 
        需要登录态
        前端一般只关注progress.progress_code即可
    ————————————————————————————————————————————————————
    示例：
        http://match-guess.webdev2.duowan.com/encour/getTodayAllot?ac_id=5
        在测试环境加force=1参数可强制预览progress数据
    ————————————————————————————————————————————————————





<font id="a11" color="blue">11、访问分享页时，加载任务执行信息、助力记录、获奖记录</font>
    ————————————————————————————————————————————————————
    URL:
        正式：http://match-guess.duowan.com/encour/progress/{progress_code}
        测试：http://match-guess.webdev2.duowan.com/encour/progress/{progress_code}
    ————————————————————————————————————————————————————
    参数(get|post):
        将地址的{progress_code}替换为具体的值
    ————————————————————————————————————————————————————
    返回(object)：
        {
            "rs": true,
            "msg": "ok",
            "data": {
                "progress": {
                    "progress_id": "2",
                    "progress_code": "9147ed9e56a583b7703332da81b68fdae6dde08c",
                    "yyuid": "50014545",
                    "task_id": "9",
                    "ac_id": "5",
                    "accept_time": "1535352317",
                    "complete_time": "0",
                    "encour_times": "0",
                    "is_completed": "0",
                    "is_valid": "1",
                    "reward_receive_id": "0",
                    "reward_receive_time": "0",
                    "update_time": "2018-08-27 14:45:17"
                },
                "task": {
                    "task_id": "9",
                    "task_name": "滚",
                    "task_desc": "放大法",
                    "start_time": "1535115540",
                    "end_time": "1536411600",
                    "start_date": "20180824",
                    "end_date": "20180908",
                    "full_times": "3",
                    "ac_id": "5",
                    "manual_sort": "0",
                    "is_open": "1",
                    "create_time": "1535334178",
                    "update_time": "2018-08-27 09:42:58"
                },
                "initiator": { //分享发起者
                    "yyuid": "50014545",
                    "nickname": "扌斤木奉",
                    "avatar": "http://tva1.sinaimg.cn/crop.21.2.203.203.50/77010c85gw1eevysgz0icj207m070mxm.jpg"
                },
                "encourRecords": [ //助力记录列表
                    {
                        "record_id": "1",
                        "initiator": "50014545",
                        "encouror": { //助力提交者(协助者)
                            "yyuid": 123456,
                            "nickname": "膜蛤谈笑风生",
                            "avatar": "http://tva1.sinaimg.cn/crop.21.2.203.203.50/77010c85gw1eevysgz0icj207m070mxm.jpg"
                        },
                        "progress_id": "2",
                        "task_id": "9",
                        "ac_id": "5",
                        "create_time": "1535362630",
                        "ip": "172.16.12.111",
                        "ua": "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36",
                        "referer": "http://abc.duowan.com/fdsafsda.html?fsfd"
                    },
                    {...},
                    ...
                ],
                "reward": {//奖励数据
                    "reward_id": "15", //奖励ID
                    "goods_id": "2", //物品ID
                    "yyuid": "50014545", //分享发起者
                    "progress_id": "2", //助力记录ID
                    "task_id": "9", //任务ID
                    "take_size": "1", //领取量
                    "reward_time": "1535442860",//获奖时间
                    "reward_time_ymdhis": "2018-08-28 15:54:20",
                    "ac_id": "5",
                    "goods": {
                        "goods_id": "2",
                        "goods_code": "JF10",
                        "goods_name": "30积分",
                        "goods_desc": "辣鸡积分",
                        "goods_cover": "",
                        "stock_unit": "份"
                    }
                }
                "completeTimes": "0", //已完成点亮次数
                "totalTimes": "3", //全部需点亮次数
                "isMe": true //是否为分享者本人视角
            }
        }
    ————————————————————————————————————————————————————
    备注: 
        需要登录态
        前端一般关注以下字段：
            data.progress.progress_code
            data.initiator - 分享发起者
            data.encourRecords - 助力记录列表
            data.reward - 奖励数据[@todo 待开发，名称、封面、数量等]
            data.reward.reward_time - 获奖时间
            data.reward.goods.goods_code - 跟前端资源映射的奖品编码
            data.reward.goods.goods_name
            data.completeTimes - 已点亮次数
            data.totalTimes - 全部需要点亮次数
            data.isMe - 是否为分享发起者视角
    ————————————————————————————————————————————————————
    示例：
        http://match-guess.webdev2.duowan.com/encour/progress/9147ed9e56a583b7703332da81b68fdae6dde08c
    ————————————————————————————————————————————————————






<font id="a12" color="blue">12、被邀请者提交助力记录</font>
    ————————————————————————————————————————————————————
    URL:
        正式：http://match-guess.duowan.com/encour/support/{progress_code}
        测试：http://match-guess.webdev2.duowan.com/encour/support/{progress_code}
    ————————————————————————————————————————————————————
    参数(get|post):
        将地址的{progress_code}替换为具体的值
    ————————————————————————————————————————————————————
    返回(object)：
        {
            "rs": true,
            "msg": "ok",
            "encour_record_id": "1", //支持记录ID
            "encouror": {
                "yyuid": 123456,
                "nickname": "膜蛤谈笑风生",
                "avatar": "http://tva1.sinaimg.cn/crop.21.2.203.203.50/77010c85gw1eevysgz0icj207m070mxm.jpg"
            }
        }
    ————————————————————————————————————————————————————
    备注: 
        需要登录态
    ————————————————————————————————————————————————————
    示例：
        http://match-guess.webdev2.duowan.com/encour/support/9147ed9e56a583b7703332da81b68fdae6dde08c
    ————————————————————————————————————————————————————






<font color="blue">13、领取助力分享的奖励</font>
    ————————————————————————————————————————————————————
    URL:
        正式：http://match-guess.duowan.com/encour/TakeReward/{progress_code}
        测试：http://match-guess.webdev2.duowan.com/encour/TakeReward/{progress_code}
    ————————————————————————————————————————————————————
    参数(get|post):
        将地址的{progress_code}替换为具体的值
    ————————————————————————————————————————————————————
    返回(object)：
        {
            "rs": true,
            "msg": "领取成功"
        }
    ————————————————————————————————————————————————————
    备注: 
        需要登录态
    ————————————————————————————————————————————————————
    示例：
        http://match-guess.webdev2.duowan.com/encour/TakeReward/9147ed9e56a583b7703332da81b68fdae6dde08c
    ————————————————————————————————————————————————————










<font color="blue">14、XXXXX（<font color="red">XXXXX</font>） XXXX/XXXX </font>
    ————————————————————————————————————————————————————
    URL:        
    ————————————————————————————————————————————————————
    参数(get|post):
        channel     FDASFSAF
    ————————————————————————————————————————————————————
    返回(object)：
    ————————————————————————————————————————————————————
    备注: 
    ————————————————————————————————————————————————————
    示例：
        
    ————————————————————————————————————————————————————


