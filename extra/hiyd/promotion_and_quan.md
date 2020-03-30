<h1><center>Hiyd商城促销与购物券相关接口(20200326)</center></h1>


<a href="#a0">0、简要</a>
<a href="#a1">1、显示新人满减券列表</a>
<a href="#a2">2、领取新人满减券</a>
<a href="#a3">3、已领取的购物券</a>
<a href="#a4">4、显示购物券分享任务列表</a>
<a href="#a5">5、分配-购物券分享任务（俗称领任务）</a>
<a href="#a6">6、查看分享任务的进度</a>
<a href="#a7">7、提交助力动作</a>
<a href="#a8">8、领取任务奖励</a>
<a href="#a9">9、待领取券的减免金额总额</a>
<a href="#a10"></a>
<a href="#a11"></a>
<a href="#a12"></a>
<a href="#a13"></a>



<font id="a0" color="blue">0、简要</font>
    a、。。。
    b、。。。
    c、。。。


<font id="a1" color="blue">1、显示新人满减券列表</font>
    ————————————————————————————————————————————————————
    URL:
        正式：
            
        测试：
            http://ltre-hiydshop-h5.webdev.ouj.com/quan/ShowNewuserQuan
    ————————————————————————————————————————————————————
    参数(get|post):
        platform    平台：可空，值有h5、weixin
    ————————————————————————————————————————————————————
    返回(object)：
    {
        "result": 1,
        "code": 0,
        "msg": "成功",
        "data": [
            {
                "quan_model": "NEWMJ_99_20",  //购物券型号
                "quan_name": "新人满99减20",
                "quan_desc": "",
                "quan_cover": "http://www.google.com/xijinpingshabi.jpg",
                "quan_type": "newmj", //购物券类型：如新人满减（newmj）、分享满减（sharemj）、普通满减（regularmj）、阶梯满减等
                "quan_rule": "99-20",
                "quan_money_min": "20", //达到满减的条件，单位（元）
                "quan_money_max": "20", //最高可减免金额（元）
                "use_expire": "1586207925", //使用过期时间（秒戳）
                "limit_platform": "",//可用的平台，多个用逗号隔开
                "limit_category": "",//可用的商品分类，多个用逗号隔开
                "limit_goods": "", //可用的商品ID，多个用逗号隔开
                "limit_goods_spec": "",//可用的商品规格ID，多个用逗号隔开
                "limit_goods_tag": "",//可用的商品标签，多个用逗号隔开
                "stock_num": "100",//总库存
                "stock_remain": "100",//剩余库存
                "on_lottery": "0",
                "lottery_weight": "0",
                "start_time": "1585207925",//开始领取时间
                "end_time": "1586207925",//结束领取时间
                "is_open": "1",
                "create_time": "1585207925",
                "update_time": "1585207925",
                "quan_money_condition": "99" //满减的条件金额（元）
            }
        ]
    }
    ————————————————————————————————————————————————————
    备注: 
        需要登录
    ————————————————————————————————————————————————————
    示例：
        
    ————————————————————————————————————————————————————





<font id="a2" color="blue">2、领取新人满减券 </font>
    ————————————————————————————————————————————————————
    URL:
        正式：

        测试：
            http://ltre-hiydshop-h5.webdev.ouj.com/quan/TakeNewuserQuan
    ————————————————————————————————————————————————————
    参数(get|post):
        quan_model     购物券型号，如NEWMJ_99_20
    ————————————————————————————————————————————————————
    返回(object)：
        {
            "result": 1,
            "code": 0,
            "msg": "成功",
            "data": {
                "takeId": 16, //领取的流水ID
                "quan": { //具体券信息
                    "quan_model": "NEWMJ_99_20",
                    "quan_name": "新人满99减20",
                    "quan_desc": "",
                    "quan_cover": "http://www.google.com/",
                    "quan_type": "newmj",
                    "quan_rule": "99-20",
                    "quan_money_min": "20",
                    "quan_money_max": "20",
                    "use_expire": "1586207925",
                    "limit_platform": "",
                    "limit_category": "",
                    "limit_goods": "",
                    "limit_goods_spec": "",
                    "limit_goods_tag": "",
                    "stock_num": "100",
                    "stock_remain": "98",
                    "take_limit_per_user": "0",
                    "on_lottery": "0",
                    "lottery_weight": "0",
                    "start_time": "1585207925",
                    "end_time": "1586207925",
                    "is_open": "1",
                    "create_time": "1585207925",
                    "update_time": "1585207925",
                    "quan_money_condition": "99"
                }
            }
        }
    ————————————————————————————————————————————————————
    备注: 
        需要登录
    ————————————————————————————————————————————————————
    示例：
        
    ————————————————————————————————————————————————————




<font id="a3" color="blue">3、已领取的购物券</font>
    ————————————————————————————————————————————————————
    URL:
        正式：

        测试：
            http://ltre-hiydshop-h5.webdev.ouj.com/quan/GetMyQuanList
    ————————————————————————————————————————————————————
    参数(get|post):
        platform     [可选]平台，如h5, weixin
        p            [可选]页码，默认1
        limit        [可选]每页限制数，默认10
    ————————————————————————————————————————————————————
    返回(object)：
        {
            "result": 1,
            "code": 0,
            "msg": "成功",
            "data": {
                "list": [
                    {
                        "quan_model": "NEWMJ_99_20",
                        "quan_name": "新人满99减20",
                        "quan_desc": "",
                        "quan_cover": "http://www.google.com/",
                        "quan_type": "newmj",
                        "quan_rule": "99-20",
                        "quan_money_min": "20",
                        "quan_money_max": "20",
                        "use_expire": "1586207925",
                        "limit_platform": "",
                        "limit_category": "",
                        "limit_goods": "",
                        "limit_goods_spec": "",
                        "limit_goods_tag": "",
                        "stock_num": "100",
                        "stock_remain": "98",
                        "take_limit_per_user": "0",
                        "on_lottery": "0",
                        "lottery_weight": "0",
                        "start_time": "1585207925",
                        "end_time": "1586207925",
                        "is_open": "1",
                        "create_time": "1585207925",
                        "update_time": "1585207925",
                        "take_id": "18",
                        "user_id": "120010",
                        "take_time": "1585469051",
                        "use_time": "0",
                        "is_valid": "1",
                        "quan_money_condition": "99"
                    },
                    ...,
                    {...}
                ],
                "pages": {
                    "total_count": "2",//总数
                    "page_size": 1,//每页数
                    "total_page": 2,//总页数
                    "first_page": 1,
                    "prev_page": 1,
                    "next_page": 2,
                    "last_page": 2,
                    "current_page": 1,
                    "all_pages": [
                        1
                    ],
                    "offset": 0,
                    "limit": 1
                },
                "count": 0
            }
        }
    ————————————————————————————————————————————————————
    备注: 
        需要登录
    ————————————————————————————————————————————————————
    示例：
        
    ————————————————————————————————————————————————————







<font id="a4" color="blue">4、显示购物券分享任务列表</font>
    ————————————————————————————————————————————————————
    URL:
        正式：

        测试：
            http://ltre-hiydshop-h5.webdev.ouj.com/quan/ShowTasks
    ————————————————————————————————————————————————————
    参数(get|post):
        platform        [可选]平台，例如 h5,weixin
    ————————————————————————————————————————————————————
    返回(object)：
        {
            "result": 1,
            "code": 0,
            "msg": "成功",
            "data": [
                {
                    "task_id": "1", //任务ID
                    "task_name": "分享满减购物券任务200-40", //任务名，可以直接展示在红包样式上
                    "task_desc": "分享给三个人，即可获得满200减40购物券",
                    "allot_cycle": "8886400", //执行任务的可持续时间（秒），超过时间则过期
                    "is_open": "1",
                    "create_time": "1585209650",
                    "update_time": "1585209650",
                    "manual_sort": "0",
                    "full_times": "3",
                    "reward_quan_main": "SHAREMJ_200_40", //任务完成后，奖励给发起者的购物券型号(quan_model)
                    "reward_quan_less": "SHAREMJ_100_5", //任务完成后，奖励给助力者的购物券型号(quan_model)
                    "quan_main": {结构同接口1的购物券明细},
                    "quan_less": {结构同接口1的购物券明细},
                    "money_main": "40",//任务完成后，奖励给发起者的购物券减免额度
                    "money_less": "5"//任务完成后，奖励给助力者的购物券减免额度
                }
            ]
        }
    ————————————————————————————————————————————————————
    备注: 
        不需登录
    ————————————————————————————————————————————————————
    示例：
        
    ————————————————————————————————————————————————————





<font id="a5" color="blue">5、分配-购物券分享任务（俗称领任务）</font>
    ————————————————————————————————————————————————————
    URL:
        正式：

        测试：
            http://ltre-hiydshop-h5.webdev.ouj.com/quan/AllotByTask
    ————————————————————————————————————————————————————
    参数(get|post):
        task_id     [必需]任务ID
        platform    [必需]平台, 如 h5,weixin
    ————————————————————————————————————————————————————
    返回(object)：
        {
            "result": 1,
            "code": 0,
            "msg": "任务[1]已在此周期内分配过,请继续执行任务",
            "data": {
                "progress": {
                    "progress_id": "1", //任务执行进度ID
                    "progress_code": "43fd607b78a53ba05a5450018b98fe672150b44b", //任务执行进度编码（分享者和助力者都要跟进此编码）
                    "user_id": "120010",
                    "task_id": "1",
                    "accept_time": "1585473504", //接受任务时间
                    "complete_time": "0", //完成任务时间
                    "encour_times": "0", //被助力的次数
                    "is_completed": "0", //是否完成
                    "platform": "h5", //在什么平台发起的分享？
                    "create_time": "1585473504",
                    "update_time": "1585473504"
                }
            }
        }
    ————————————————————————————————————————————————————
    备注: 
        需要登录
    ————————————————————————————————————————————————————
    示例：
        http://ltre-hiydshop-h5.webdev.ouj.com/quan/AllotByTask?task_id=1&platform=h5
    ————————————————————————————————————————————————————





<font id="a6" color="blue">6、查看分享任务的进度</font>
    ————————————————————————————————————————————————————
    URL:
        正式：

        测试：
            http://ltre-hiydshop-h5.webdev.ouj.com/quan/Progress
    ————————————————————————————————————————————————————
    参数(get|post):
        progress_code     任务执行进度代码
    ————————————————————————————————————————————————————
    返回(object)：
        {
            "result": 1,
            "code": 0,
            "msg": "ok",
            "data": {
                //任务进度数据
                "progress": {
                    "progress_id": "1",
                    "progress_code": "43fd607b78a53ba05a5450018b98fe672150b44b",
                    "user_id": "120010",
                    "task_id": "1",
                    "accept_time": "1585473504",
                    "complete_time": "1585482602",
                    "encour_times": "3",
                    "is_completed": "1",
                    "platform": "h5",
                    "create_time": "1585473504",
                    "update_time": "1585473504"
                },
                //任务定义数据
                "task": {
                    "task_id": "1",
                    "task_name": "分享满减购物券任务200-40",
                    "task_desc": "分享给三个人，即可获得满200减40购物券",
                    "allot_cycle": "8886400",
                    "is_open": "1",
                    "limit_platform": "",
                    "create_time": "1585209650",
                    "update_time": "1585209650",
                    "manual_sort": "0",
                    "full_times": "3",
                    "reward_quan_main": "SHAREMJ_200_40",
                    "reward_quan_less": "SHAREMJ_100_5"
                },
                //任务发起人（分享人）
                "initiator": {
                    "user_id": "120010"
                },
                //助力记录（列表）
                "encourList": [
                    {
                        "encour_id": "4", //助力流水ID
                        "initiator": "120010",  //任务的发起人
                        "encouror": "120011", //助力人user_id
                        "progress_id": "1", //任务执行进程ID
                        "task_id": "1", //任务定义的ID
                        "create_time": "1585478005", //助力提交的时间
                        "ip": "172.16.14.222",
                        "refer": "", //HTTP REFERER头
                        "platform": "" //发起助力的平台，如weixin, h5
                    },
                    ...,
                    {..}
                ],
                //奖励的MAP结构，分为share(发起人)和encour(助力人)两个视角. 注意, share只有一个，encour有多个
                "rewardMap": {
                    "share": {
                        "reward_id": "11", //奖励流水ID
                        "quan_model": "SHAREMJ_200_40", //购物券型号
                        "user_id": "120010", //被奖励人user_id
                        "progress_id": "1", //对应的任务执行进度ID
                        "reward_object": "share", 
                        "task_id": "1", //对应的任务定义ID
                        "take_size": "1", //获取购物券张数，通常是1
                        "take_time": "1585482603", //领奖时间
                        "quan_take_record": "29", //对应的购物券领取流水表ID
                        "quan": {  //这里就是购物券的信息结构，前面提过，不赘述
                            "quan_model": "SHAREMJ_200_40",
                            "quan_name": "分享满减券200-40",
                            "quan_desc": "",
                            "quan_cover": "http://www.google.com/",
                            "quan_type": "sharemj",
                            "quan_rule": "200-40",
                            "quan_money_min": "40",
                            "quan_money_max": "40",
                            "use_expire": "1586207925",
                            "limit_platform": "",
                            "limit_category": "",
                            "limit_goods": "",
                            "limit_goods_spec": "",
                            "limit_goods_tag": "",
                            "stock_num": "500",
                            "stock_remain": "499",
                            "take_limit_per_user": "0",
                            "on_lottery": "0",
                            "lottery_weight": "0",
                            "start_time": "1585207925",
                            "end_time": "1586207925",
                            "is_open": "1",
                            "create_time": "1585207925",
                            "update_time": "1585207925",
                            "quan_money_condition": "200"
                        }
                    },
                    "encour": [
                        {... 跟上面的share结构一样 ...},
                        {... 跟上面的share结构一样 ...},
                        ...
                    ]
                },
                "completeTimes": "3", //已助力次数
                "totalTimes": "3", //完成任务需要助力的总次数
                "isCompleted": true, //是否完成任务
                "isMe": false //视角：是否为任务发起人自己
            }
        }
    ————————————————————————————————————————————————————
    备注: 
        不需登录
        当没有登录时，则以游客状态观看进度，在需要点击助力时，务必先弹出登录过程
    ————————————————————————————————————————————————————
    示例：
        http://ltre-hiydshop-h5.webdev.ouj.com/quan/Progress?progress_code=43fd607b78a53ba05a5450018b98fe672150b44b
    ————————————————————————————————————————————————————








<font id="a7" color="blue">7、提交助力动作</font>
    ————————————————————————————————————————————————————
    URL:
        正式：
        
        测试：
            http://ltre-hiydshop-h5.webdev.ouj.com/quan/encour
    ————————————————————————————————————————————————————
    参数(get|post):
        progress_code       [必需]任务执行进度代码
        platform            [必需]平台, 如 h5,weixin
    ————————————————————————————————————————————————————
    返回(object)：
        {
            "result": 1,
            "code": 0,
            "msg": "ok",
            "data": {
                //助力记录
                "encour": {
                    "encour_id": "11", //助力流水ID
                    "initiator": "120010", //任务的发起人user_id
                    "encouror": "120013", //助力者user_id
                    "progress_id": "1", //任务执行进度ID
                    "task_id": "1", //任务定义ID
                    "create_time": "1585486014", //助力提交时间
                    "ip": "172.16.14.222",
                    "refer": "", //HTTP REFERER头
                    "platform": "h5" //助力时，所在的平台
                },
                //任务执行进度
                "progress": {
                    "progress_id": "1", //进度流水ID
                    "progress_code": "43fd607b78a53ba05a5450018b98fe672150b44b", //进度代码
                    "user_id": "120010", //任务发起人
                    "task_id": "1", //任务定义ID
                    "accept_time": "1585473504", //接受任务时间
                    "complete_time": "1585486014", //完成任务时间
                    "encour_times": "3", //已被助力次数
                    "is_completed": "1", //是否完成任务
                    "platform": "h5", //发起人操作所在的平台
                    "create_time": "1585473504",
                    "update_time": "1585473504"
                },
                //奖励数据（发起人角度）
                "rewardInfo4Share": {
                    "reward_id": "13", //奖励流水ID
                    "quan_model": "SHAREMJ_200_40", //奖励的购物券型号
                    "user_id": "120010", //被奖励者user_id
                    "progress_id": "1",
                    "reward_object": "share",
                    "task_id": "1",
                    "take_size": "1",
                    "take_time": "1585486014",
                    "quan_take_record": "0",
                    "quan": { //这里是购物券详细数据，前面提过，不再赘述
                        "quan_model": "SHAREMJ_200_40",
                        "quan_name": "分享满减券200-40",
                        "quan_desc": "",
                        "quan_cover": "http://www.google.com/",
                        "quan_type": "sharemj",
                        "quan_rule": "200-40",
                        "quan_money_min": "40",
                        "quan_money_max": "40",
                        "use_expire": "1586207925",
                        "limit_platform": "",
                        "limit_category": "",
                        "limit_goods": "",
                        "limit_goods_spec": "",
                        "limit_goods_tag": "",
                        "stock_num": "500",
                        "stock_remain": "499",
                        "take_limit_per_user": "0",
                        "on_lottery": "0",
                        "lottery_weight": "0",
                        "start_time": "1585207925",
                        "end_time": "1586207925",
                        "is_open": "1",
                        "create_time": "1585207925",
                        "update_time": "1585207925",
                        "quan_money_condition": "200"
                    }
                },
                "rewardInfo4Encour": {
                    ... 如果这个人是最后一个助力者，那么就会达成任务，这里就会显示奖励数据，结构同rewardInfo4Share的完全一样 ...
                }
            }
        }
    ————————————————————————————————————————————————————
    备注: 
        需要登录
    ————————————————————————————————————————————————————
    示例：
        http://ltre-hiydshop-h5.webdev.ouj.com/quan/encour?progress_code=43fd607b78a53ba05a5450018b98fe672150b44b&platform=h5
    ————————————————————————————————————————————————————











<font id="a8" color="blue">8、领取任务奖励</font>
    ————————————————————————————————————————————————————
    URL:
        正式：

        测试：
            http://ltre-hiydshop-h5.webdev.ouj.com/quan/takereward
    ————————————————————————————————————————————————————
    参数(get|post):
        progress_code       [必需]任务执行进度代码
    ————————————————————————————————————————————————————
    返回(object)：
        {
            "result": 1,
            "code": 0,
            "msg": "领取成功",
            "data": {
                "reward_id": "15", //奖励流水ID
                "quan_model": "SHAREMJ_100_5", //奖励的购物券型号
                "user_id": "120012", //被奖励人user_id
                "progress_id": "1", //任务执行进度ID
                "reward_object": "encour", //奖励的角度: share-发起人，encour-助力人
                "task_id": "1", //任务定义ID
                "take_size": "1", //领取数，通常是1
                "take_time": "1585486283", //领奖时间
                "quan_take_record": "33", //领取购物券的流水表ID
                "quan": { //购物券详细数据，不赘述
                    "quan_model": "SHAREMJ_100_5",
                    "quan_name": "分享满减券100-5",
                    "quan_desc": "",
                    "quan_cover": "http://www.google.com/",
                    "quan_type": "sharemj",
                    "quan_rule": "100-5",
                    "quan_money_min": "5",
                    "quan_money_max": "5",
                    "use_expire": "1586207925",
                    "limit_platform": "",
                    "limit_category": "",
                    "limit_goods": "",
                    "limit_goods_spec": "",
                    "limit_goods_tag": "",
                    "stock_num": "2000",
                    "stock_remain": "1999",
                    "take_limit_per_user": "0",
                    "on_lottery": "0",
                    "lottery_weight": "0",
                    "start_time": "1585207925",
                    "end_time": "1586207925",
                    "is_open": "1",
                    "create_time": "1585207925",
                    "update_time": "1585207925",
                    "quan_money_condition": "100"
                }
            }
        }
    ————————————————————————————————————————————————————
    备注: 
        需要登录
    ————————————————————————————————————————————————————
    示例：
        http://ltre-hiydshop-h5.webdev.ouj.com/quan/takereward?progress_code=43fd607b78a53ba05a5450018b98fe672150b44b
    ————————————————————————————————————————————————————









<font id="an" color="blue">9、待领取券的减免金额总额</font>
    ————————————————————————————————————————————————————
    URL:
        正式：
        
        测试：
            http://ltre-hiydshop-h5.webdev.ouj.com/quan/GetUnclaimedListAndMoneySum
    ————————————————————————————————————————————————————
    参数(get|post):
        platform        [可选]平台
    ————————————————————————————————————————————————————
    返回(object)：
        {
            "result": 1,
            "code": 0,
            "msg": "成功",
            "data": {
                "list": [//待领券列表
                    {
                        "quan_model": "NEWMJ_1000_120",
                        "quan_name": "新人满1000减120",
                        "quan_desc": "",
                        "quan_cover": "http://www.google.com/",
                        "quan_type": "newmj",
                        "quan_rule": "1000-120",
                        "quan_money_min": "120",
                        "quan_money_max": "120",
                        "use_expire": "1586207925",
                        "limit_platform": "",
                        "limit_category": "",
                        "limit_goods": "",
                        "limit_goods_spec": "",
                        "limit_goods_tag": "",
                        "stock_num": "555",
                        "stock_remain": "554",
                        "take_limit_per_user": "0",
                        "on_lottery": "0",
                        "lottery_weight": "0",
                        "start_time": "1585207925",
                        "end_time": "1586207925",
                        "is_open": "1",
                        "create_time": "1585207925",
                        "update_time": "1585207925",
                        "quan_money_condition": "1000"
                    },
                    {...},
                    ...
                ],
                "sum": 120 //待领券的金额总额（元）
            }
        }
    ————————————————————————————————————————————————————
    备注: 
        需要登录
    ————————————————————————————————————————————————————
    示例：
        
    ————————————————————————————————————————————————————









<font id="an" color="blue">18、XXXXX（<font color="red">XXXXX</font>） XXXX/XXXX </font>
    ————————————————————————————————————————————————————
    URL:
    ————————————————————————————————————————————————————
    参数(get|post):
        channel     FDASFSAF
    ————————————————————————————————————————————————————
    返回(object)：
    ————————————————————————————————————————————————————
    备注: 
        备用占位
    ————————————————————————————————————————————————————
    示例：
        
    ————————————————————————————————————————————————————


