




<h1><center>Hiyd商城促销与购物券相关接口(20200326)</center></h1>


<a href="#a0">0、简要</a>
<a href="#a1">1、显示新人满减券列表</a>
<a href="#a2">2、领取新人满减券</a>
<a href="#a3">3、已领取的购物券</a>
<a href="#a4">4、显示购物券分享任务</a>
<a href="#a5"></a>
<a href="#a6"></a>
<a href="#a7"></a>



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
                "update_time": "1585207925"
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




已领取的购物券




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







<font id="a4" color="blue">4、显示购物券分享任务列表（<font color="red">XXXXX</font>） XXXX/XXXX </font>
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


