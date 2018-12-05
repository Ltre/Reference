<h1><center>用户自动下注策略接口(20181031)</center></h1>


<a href="#a0">0、简要</a>
<a href="#a1">1、用户提交新的策略信息</a>
<a href="#a2">2、获取用户最新的策略</a>
<a href="#a3">3、停止或重新开始下注</a>



<font id="a0" color="blue">0、简要</font>
    a、用户每提交一次策略，将新增一条历史记录，并将旧的记录变更为停止状态。
    b、获取策略信息时，将自动从用户名下获取最新的历史记录。
    c、启用或停止策略，仅作用于最后一条历史。


<font id="a1" color="blue">1、用户提交新的策略信息</font>
    ————————————————————————————————————————————————————
    URL:        
        正式：
            http://dice.eosget.io/autobet/setup
        测试：
            http://test-dice.eosget.io/autobet/setup
    ————————————————————————————————————————————————————
    参数(get|post):
        gameCount   最大下注期数
        stopLine    余额止损线(1单位=0.0001EOS)，例如 10000 = 1EOS
        offerList   下注明细，用法跟sicbo/balanceBet的参数offer_list一致，例如 10000|100|10000|200
        //身份校验参数
        account     EOS账户名
        token       登录校验统一算法所得token
    ————————————————————————————————————————————————————
    返回(object)：
    {
        "result": 1,                                        //请参照phpbase2的标准返回来判断
        "code": 0,                                          //请参照phpbase2的标准返回来判断
        "msg": "ok",
        "data": {
            "auto_id": "11",                                //策略ID
            "game_count": "5",                              //最大下注期数
            "player": "aben",                               //EOS账户名
            "offer_list": "10000|100|10000|200|10000|100",  //下注明细
            "stop_line": "2000000",                         //余额止损线
            "total_pay": "0",                               //此策略产生的赌注总和
            "total_income": "0",                            //此策略下的所有赌博所得
            "played_count": "0",                            //已进行下注的期数
            "is_stop": "0",                                 //是否停止
            "create_time": "2018-10-31 14:50:29",
            "update_time": "2018-10-31 14:50:29",
            "offer_types": [                                //下注码枚举
                100,
                200
            ],
            "amount_sboe": 0,                               //大小单双下注的EOS筹码数
            "amount_ts": 10000,                             //豹子、猜数字一、二、三、四、五、六的EOS筹码数
            "remain_count": 0,                              //剩余的下注期数
            "real_pay": 0,                                  //实际花费. real_pay = total_pay - total_income; 小于0则取0.
            "gt_total": 0                                   //此策略下获得GT币数量（待开发）
        }
    }
    ————————————————————————————————————————————————————
    备注: 
        real_pay字段用于前端的“共花费筹码EOS”的填充
    ————————————————————————————————————————————————————
    示例：
        http://test-dice.eosget.io/autobet/setup?gameCount=5&stopLine=2000000&offerList=10000|100|10000|200|10000|100&account=abcde&token=0454dab6983f392b
    ————————————————————————————————————————————————————









<font id="a2" color="blue">2、获取用户最新的策略</font>
    ————————————————————————————————————————————————————
    URL:        
        正式：
            http://dice.eosget.io/autobet/getsetup
        测试：
            http://test-dice.eosget.io/autobet/getsetup
    ————————————————————————————————————————————————————
    参数(get|post):
        //身份校验参数
        account     EOS账户名
        token       登录校验统一算法所得token
    ————————————————————————————————————————————————————
    返回(object)：
    {
        "result": 1,                                        //请参照phpbase2的标准返回来判断
        "code": 0,                                          //请参照phpbase2的标准返回来判断
        "msg": "ok",
        "data": {
            "auto_id": "11",                                //策略ID
            "game_count": "5",                              //最大下注期数
            "player": "aben",                               //EOS账户名
            "offer_list": "10000|100|10000|200|10000|100",  //下注明细
            "stop_line": "2000000",                         //余额止损线
            "total_pay": "0",                               //此策略产生的赌注总和
            "total_income": "0",                            //此策略下的所有赌博所得
            "played_count": "0",                            //已进行下注的期数
            "is_stop": "0",                                 //是否停止
            "create_time": "2018-10-31 14:50:29",
            "update_time": "2018-10-31 14:50:29",
            "offer_types": [                                //下注码枚举
                100,
                200
            ],
            "amount_sboe": "",                              //大小单双下注的EOS筹码数
            "amount_ts": 10000,                             //豹子、猜数字一、二、三、四、五、六的EOS筹码数
            "remain_count": 0,                              //剩余的下注期数
            "real_pay": 0,                                  //实际花费. real_pay = total_pay - total_income; 小于0则取0.
            "gt_total": 0                                   //此策略下获得GT币数量（待开发）
        }
    }
    ————————————————————————————————————————————————————
    备注: 
        * 此接口执行成功后，会返回与autobet/getSetup同样的数据
        * real_pay字段用于前端的“共花费筹码EOS”的填充
    ————————————————————————————————————————————————————
    示例：
        http://test-dice.eosget.io/autobet/getsetup?account=abcde&token=0454dab6983f392b
    ————————————————————————————————————————————————————




<font id="a3" color="blue">3、停止或重新开始下注</font>
    ————————————————————————————————————————————————————
    URL:        
        正式：
            http://dice.eosget.io/autobet/ctrl
        测试：
            http://test-dice.eosget.io/autobet/ctrl
    ————————————————————————————————————————————————————
    参数(get|post):
        stop        标记停止. 可选;当不传或传0则为重新开始;当传1时则停止
        //身份校验参数
        account     EOS账户名
        token       登录校验统一算法所得token
    ————————————————————————————————————————————————————
    返回(object)：
    {
        "result": 1,
        "code": 0,
        "msg": "ok",
        "data": null
    }
    ————————————————————————————————————————————————————
    备注: 
        无
    ————————————————————————————————————————————————————
    示例：
        http://test-dice.eosget.io/autobet/ctrl?account=abcde&token=0454dab6983f392b&stop=1
    ————————————————————————————————————————————————————







<font id="a4" color="blue">18、XXXXX（<font color="red">XXXXX</font>） XXXX/XXXX </font>
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


