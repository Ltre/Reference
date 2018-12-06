<h1><center>EOS竞拍活动接口(20181205)</center></h1>


<a href="#a0">0、简要</a>
<a href="#a1">1、获取奖池信息、最后出价、上次成交、是否中奖</a>
<a href="#a2">2、领取竞拍奖励</a>
<a href="#a3">3、竞拍上报接口</a>



<font id="a0" color="blue">0、简要</font>
    a、。。。
    b、。。。
    c、。。。






<font id="a1" color="blue">1、获取奖池信息、最后出价、上次成交、是否中奖</font>
    ————————————————————————————————————————————————————
    URL:
        http://test-dice.eosget.io/auction/prizePool
    ————————————————————————————————————————————————————
    参数(get|post):
        player      EOS账户名
    ————————————————————————————————————————————————————
    返回(object)：
        理想情况：有在进行中的拍卖(lastBid!=null)，且有上一次成交的记录(lastTrx!=null)
        {
            "result": 1,
            "code": 0,
            "msg": "成功",
            "data": {
                "actId": "2", //本期期号
                "prize": "500",  //奖池EOS，单位0.0001EOS
                "ttl": 10739, //【本期】剩余倒计时(秒)
                "rewardList": [ //自己获取的奖励历史（为方便扩展，此值为数组，前端只需要取第一个值即可）
                    {
                        "actId": 2, //奖励所在期的期号
                        "player": "abcde",
                        "return_gt": 0,  //回馈的总GT（1单位=0.0001GT）
                        "return_eos": 60000, //回馈的EOS（1单位=0.0001EOS）
                        "gt_amount": 666133829 //在期数{actId}投入的GT数（1单位=0.0001GT）
                    }
                ],
                "lastBid": {  //当前拍卖期号的最后出价记录(特指未成交)
                    "id": "3",                              //流水ID
                    "act_id": "2",                          //期号
                    "player": "abcde",                      //出价者
                    "gt_amount": "1010000",                 //投入GT
                    "return_gt": "0",                       //回馈GT，成交后
                    "return_eos": "0",                      //回馈EOS，成交后
                    "state": "0",                           //竞拍状态：0-竞拍中，1-开奖中，2-已结束(已开奖)
                    "ttl": "86399",                         //所在期设置的总倒计时
                    "is_received": "0",                     //拍卖结束后，是否已领取回馈
                    "transaction_id": "",                   //链上交易ID
                    "block_num": "0",                       //链上交易块
                    "create_time": "2018-12-04 16:12:36",   //出价时间
                    "update_time_int": "1543911184"         //数据更新时间
                },
                "lastTrx": { //最新成交记录(特指往期)
                    "id": "1",
                    "act_id": "1",
                    "player": "abcde",
                    "gt_amount": "1000000",
                    "return_gt": "0",
                    "return_eos": "1100000", 
                    "state": "2",
                    "ttl": "86399",
                    "is_received": "0", 
                    "transaction_id": "",
                    "block_num": "0",
                    "create_time": "2018-12-04 14:52:36",
                    "update_time_int": "1543906680"
                }
            }
        }
    ————————————————————————————————————————————————————
    备注: 
        应该关注字段：
            data.actId - 本期期号
            data.prize
            data.ttl - 本期剩余倒计时
            data.rewardList[0].{ //自己待领取的奖励，取一条即可
                actId - 奖励所在期的期号
                return_gt - 回馈的总GT（1单位=0.0001GT）
                return_eos - 回馈的EOS（1单位=0.0001EOS）
                gt_amount - 在期数{actId}投入的GT数（1单位=0.0001GT）
            }
            data.lastBid.{ //本期最后出价记录
                id
                act_id
                player
                gt_amount - 本期最后出价GT
                create_time - 本期最后出价时间
            }
            data.lastTrx.{ //最新成交记录(往期)
                id
                act_id
                player
                gt_amount - 最新成交记录所获GT
                return_eos - 最新成交记录所获EOS
                create_time - 对应出价时间
            }
    ————————————————————————————————————————————————————
    示例：
        无
    ————————————————————————————————————————————————————





<font id="a2" color="blue">2、领取竞拍奖励</font>
    ————————————————————————————————————————————————————
    URL:
        http://test-dice.eosget.io/auction/takeReward
    ————————————————————————————————————————————————————
    参数(get|post):
        actId       竞拍期号
        //身份校验参数(必传)
        account     EOS账户名
        token       登录校验统一算法所得token
    ————————————————————————————————————————————————————
    返回(object)：
        {
            "result": 1,
            "code": 0,
            "msg": "成功",
            "data": {
                "eosFeed": ...,
                "gtFeed": ...
            }
        }
    ————————————————————————————————————————————————————
    备注: 
        1、必须登录
        2、注意领取奖励的类型（根据接口/auction/prizePool返回的data.rewardList[0].return_eos > 0判断）
        2、出错的提示：
            No reward data! - 可能原因：流水不存在；这条流水不属于当前用户所竞拍；已领取奖励，不必重复；还没到开奖时间
            Operation is too frequent! - 并发操作拦截
    ————————————————————————————————————————————————————
    示例：
        http://test-dice.eosget.io/auction/takeReward?id=1
    ————————————————————————————————————————————————————






<font id="a3" color="blue">3、竞拍上报接口</font>
    ————————————————————————————————————————————————————
    URL:
        http://test-dice.eosget.io/auction/auctionTrx
    ————————————————————————————————————————————————————
    参数(get|post):
        transaction_id     链上交易ID
        block_num          交易块
    ————————————————————————————————————————————————————
    返回(object)：
        {
            "result": 1,
            "code": 0,
            "msg": "成功",
            "data": null
        }
    ————————————————————————————————————————————————————
    备注: 
        不需要登录
    ————————————————————————————————————————————————————
    示例：
        http://eosget-pc.webdev2.duowan.com/auction/auctionTrx?transaction_id=c29fc5c2c8f77296211358f2b1f450aff03fbd4b5a48edf10d07a4c1017f7d27&block_num=2230355&account=kunbiao&token=fdsfsr3r43
    ————————————————————————————————————————————————————

















<font id="a99" color="blue">18、XXXXX（<font color="red">XXXXX</font>） XXXX/XXXX </font>
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








INSERT INTO `auction` VALUES ('1', '1', 'abc',  '1000000', '0',     '1100000',  '2', '86399', 0, '', 0, '2018-12-04 14:52:36', '1543906680');
INSERT INTO `auction` VALUES ('2', '1', 'def',      '2000000', '50000', '0',        '2', '86399', 0, '', 0, '2018-12-04 15:51:36', '1543910024');
INSERT INTO `auction` VALUES ('3', '2', 'abc',  '1010000', '0',     '0',        '0', '86399', 0, '', 0, '2018-12-04 16:12:36', '1543911184');

