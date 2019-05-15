<h1><center>2019页游接口第一期（首页运营内容 + 游戏登录） - 20190508</center></h1>


<a href="#a0">0、注意事项</a>
<a href="#a1">1、游戏类型(标签)列表</a>
<a href="#a2">2、热门游戏列表（实际就是人工推荐的东西）</a>
<a href="#a3">3、我的游戏</a>
<a href="#a4">4、游戏排行榜 - 最新榜</a>
<a href="#a5">5、游戏排行榜 - 最热榜（后台先手动改数据）</a>
<a href="#a6">6、今日热游（支持换一换）</a>
<a href="#a7">7、热门游戏（实际就是人工推荐的东西）</a>
<a href="#a8">8、根据标签获取游戏列表</a>
<a href="#a9">9、加载某游戏的所有区服列表（不分页）</a>
<a href="#a10">10、游戏请求登录接口（实则获取游戏加载页动态链接）</a>
<a href="#a11">11、开服公告</a>
<a href="#a12">12、我的角色列表</a>
<a href="#a13">13、个人信息</a>
<a href="#a14">14、最近登录</a>
<a href="#a15">15、批量获取区服信息</a>
<a href="#a16">16、横向轮播精品游戏（人工推荐的东西）</a>



<font id="a0" color="blue">0、业务入门简要</font>
    a、为方便且均匀地分表，此项目中的uid，不是YYUID，而是数据表的自增ID
    b、除了一些涉及用户自身记录的接口，大部分不需要登录态
    c、消息和充值方面的接口尚未提供 --20190508
    d、所有接口一定要先判断 rs=true ，才可作后续正常操作
    e、游戏 -> 一对多 -> 区服 -> 一对多 -> 角色
    f、接口使用图示，<a href="#infview">详见</a>


<font id="a1" color="blue">1、游戏类型列表</font>
    ————————————————————————————————————————————————————
    URL:
        测试：
        http://test-pgame.duowan.com/game/types
        正式：
        。。。
    ————————————————————————————————————————————————————
    参数(get|post):
        无
    ————————————————————————————————————————————————————
    返回(object)：
        {
            "rs": true,
            "msg": "ok",
            "types": [
                {
                    "tid": "5",
                    "tag": "模拟经营",
                    "purpose": "game",
                    "created": "0", //创建时间戳（秒）
                    "updated": "0"//更新时间戳（秒）
                    "is_del": "0"
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
        无
    ————————————————————————————————————————————————————





<font id="a2" color="blue">2、热门游戏列表（实际就是人工推荐的东西）</font>
    ————————————————————————————————————————————————————
    URL:
        测试：
        http://test-pgame.duowan.com/game/RecomList
        正式：
        。。。
    ————————————————————————————————————————————————————
    参数(get|post):
        无
    ————————————————————————————————————————————————————
    返回(object)：
        {
            "rs": true,
            "msg": "ok",
            "list": [
                {
                    "gid": "1", //游戏ID
                    "game_code": "FAKEYOU", //厂商用的游戏ID，或者叫游戏代码
                    "slogan": "我们的口号是什么？", //一句话标语
                    "intro": "fdsfdsjfidsoj", //游戏说明
                    "game_name": "口号大王", //游戏名称
                    "cover_thumb": "https://s1.dwstatic.com/duowanvideo/20190508/16/2600699.jpg", //小图标
                    "cover_mid": "https://s1.dwstatic.com/duowanvideo/20190508/16/2600699.jpg", //中等图
                    "cover_large": "https://s1.dwstatic.com/duowanvideo/20190508/16/2600699.jpg", //大封面
                    "pid": "1", //发行商ID
                    "score": "85", //评分，最高100
                    "is_hot": "1", //是否热门
                    "is_del": "0", 
                    "rank_num": "0", //排序值，越大越靠前
                    "player_num": "0", //参与玩家人数
                    "created": "0", //创建时间(秒)
                    "updated": "0", //最后修改时间（秒）
                    "tags": [
                        {
                            "tid": "3",
                            "tag": "休闲竞技"
                        },
                        {
                            "tid": "2",
                            "tag": "战争策略"
                        },
                        {
                            "tid": "1",
                            "tag": "角色扮演"
                        }
                    ]
                },

                { ... },

                ...
            ]
        }
    ————————————————————————————————————————————————————
    备注: 
        无
    ————————————————————————————————————————————————————
    示例：
        无
    ————————————————————————————————————————————————————





<font id="a3" color="blue">3、我的游戏</font>
    ————————————————————————————————————————————————————
    URL:
        测试：
            http://test-pgame.duowan.com/game/mygames
        正式：
            。。。
    ————————————————————————————————————————————————————
    参数(get|post):
        无
    ————————————————————————————————————————————————————
    返回(object)：
        {
            "rs": true,
            "msg": "ok",
            "games": [
                {
                    "gid": "1",
                    "game_code": "FAKEYOU",
                    "slogan": "我们的口号是什么？",
                    "intro": "fdsfdsjfidsoj",
                    "game_name": "口号大王",
                    "cover_thumb": "https://s1.dwstatic.com/duowanvideo/20190508/16/2600699.jpg",
                    "cover_mid": "https://s1.dwstatic.com/duowanvideo/20190508/16/2600699.jpg",
                    "cover_large": "https://s1.dwstatic.com/duowanvideo/20190508/16/2600699.jpg",
                    "pid": "1",
                    "score": "85",
                    "is_hot": "1",
                    "is_del": "0",
                    "rank_num": "0",
                    "player_num": "0",
                    "created": "0",
                    "updated": "0"
                }
            ]
        }
    ————————————————————————————————————————————————————
    备注: 
        需要YY登录态
    ————————————————————————————————————————————————————
    示例：
        
    ————————————————————————————————————————————————————





<font id="a4" color="blue">4、游戏排行榜 - 最新榜</font>
    ————————————————————————————————————————————————————
    URL:
        测试:
            http://test-pgame.duowan.com/game/NewList
        正式:
            ...
    ————————————————————————————————————————————————————
    参数(get|post):
        p           页码,默认1
        limit       条数,默认10
    ————————————————————————————————————————————————————
    返回(object)：
        {
            "rs": true,
            "msg": "ok",
            "list": [ //游戏列表
                {
                    "gid": "16",
                    "game_code": "fdasfsfsa",
                    "slogan": "fsdf",
                    "intro": "fdsafs",
                    "game_name": "ooooo",
                    "cover_thumb": "https://s1.dwstatic.com/duowanvideo/20190508/16/2600699.jpg",
                    "cover_mid": "https://s1.dwstatic.com/duowanvideo/20190508/16/2600699.jpg",
                    "cover_large": "https://s1.dwstatic.com/duowanvideo/20190508/16/2600699.jpg",
                    "pid": "1",
                    "score": "0",
                    "is_hot": "0",
                    "is_del": "0",
                    "rank_num": "0",
                    "player_num": "0",
                    'new_sid': "1",//新开的区服ID
                    "created": "0",
                    "updated": "0"
                },

                {...},

                ...
            ],
            "pages": { //分页或者null
                "total_count": "16",
                "page_size": "10",
                "total_page": 2,
                "first_page": 1,
                "prev_page": 1,
                "next_page": 2,
                "last_page": 2,
                "current_page": 1,
                "all_pages": [
                    1,
                    2
                ],
                "offset": 0,
                "limit": "10"
            }
        }
    ————————————————————————————————————————————————————
    备注: 
        无
    ————————————————————————————————————————————————————
    示例：
        
    ————————————————————————————————————————————————————



<font id="a5" color="blue">5、游戏排行榜 - 最热榜（后台先手动改数据）</font>
    ————————————————————————————————————————————————————
    URL:
        测试：
            http://test-pgame.duowan.com/game/hotList
        正式：
            。。。
    ————————————————————————————————————————————————————
    参数(get|post):
        p           页码,默认1
        limit       条数,默认10
    ————————————————————————————————————————————————————
    返回(object)：
        {
            "rs": true,
            "msg": "ok",
            "list": [ //游戏列表
                {
                    "gid": "16",
                    "game_code": "fdasfsfsa",
                    "slogan": "fsdf",
                    "intro": "fdsafs",
                    "game_name": "ooooo",
                    "cover_thumb": "https://s1.dwstatic.com/duowanvideo/20190508/16/2600699.jpg",
                    "cover_mid": "https://s1.dwstatic.com/duowanvideo/20190508/16/2600699.jpg",
                    "cover_large": "https://s1.dwstatic.com/duowanvideo/20190508/16/2600699.jpg",
                    "pid": "1",
                    "score": "0",
                    "is_hot": "0",
                    "is_del": "0",
                    "rank_num": "0",
                    "player_num": "0",
                    'new_sid': "1",//新开的区服ID
                    "created": "0",
                    "updated": "0"
                },

                {...},

                ...
            ],
            "pages": { //分页或者null
                "total_count": "16",
                "page_size": "10",
                "total_page": 2,
                "first_page": 1,
                "prev_page": 1,
                "next_page": 2,
                "last_page": 2,
                "current_page": 1,
                "all_pages": [
                    1,
                    2
                ],
                "offset": 0,
                "limit": "10"
            }
        }
    ————————————————————————————————————————————————————
    备注: 
        无
    ————————————————————————————————————————————————————
    示例：
        
    ————————————————————————————————————————————————————






<font id="a6" color="blue">6、今日热游（支持换一换）</font>
    ————————————————————————————————————————————————————
    URL:
        测试：
            http://test-pgame.duowan.com/game/todayGames
        正式：
            。。。
    ————————————————————————————————————————————————————
    参数(get|post):
        无
    ————————————————————————————————————————————————————
    返回(object)：
        {
            "rs": true,
            "msg": "ok",
            "list": [
                {
                    "gid": "1",
                    "game_code": "FAKEYOU",
                    "slogan": "我们的口号是什么？",
                    "intro": "fdsfdsjfidsoj",
                    "game_name": "口号大王",
                    "cover_thumb": "https://s1.dwstatic.com/duowanvideo/20190508/16/2600699.jpg",
                    "cover_mid": "https://s1.dwstatic.com/duowanvideo/20190508/16/2600699.jpg",
                    "cover_large": "https://s1.dwstatic.com/duowanvideo/20190508/16/2600699.jpg",
                    "pid": "1",
                    "score": "85",
                    "is_hot": "1",
                    "is_del": "0",
                    "rank_num": "0",
                    "player_num": 2167,
                    "created": "0",
                    "updated": "0",
                    "new_server": {
                        "sid": "1",
                        "outer_sid": "KOUHAO_A",
                        "server_name": "口号大王测试A服"
                    }
                },

                {...},

                ...
            ]
        }
    ————————————————————————————————————————————————————
    备注: 
        换一换功能，可以从返回的列表中，分段取出显示
    ————————————————————————————————————————————————————
    示例：
        
    ————————————————————————————————————————————————————






<font id="a7" color="blue">7、热门游戏（实际就是人工推荐的东西）</font>
    ————————————————————————————————————————————————————
    URL:
        测试：
            http://test-pgame.duowan.com/game/RecomList
        正式：
            。。。
    ————————————————————————————————————————————————————
    参数(get|post):
        无
    ————————————————————————————————————————————————————
    返回(object)：
        {
            "rs": true,
            "msg": "ok",
            "list": [
                {
                    "gid": "1",
                    "game_code": "FAKEYOU",
                    "slogan": "我们的口号是什么？",
                    "intro": "fdsfdsjfidsoj",
                    "game_name": "口号大王",
                    "cover_thumb": "https://s1.dwstatic.com/duowanvideo/20190508/16/2600699.jpg",
                    "cover_mid": "https://s1.dwstatic.com/duowanvideo/20190508/16/2600699.jpg",
                    "cover_large": "https://s1.dwstatic.com/duowanvideo/20190508/16/2600699.jpg",
                    "pid": "1",
                    "score": "85",
                    "is_hot": "1",
                    "is_del": "0",
                    "rank_num": "0",
                    "player_num": "0",
                    "created": "0",
                    "updated": "0",
                    "tags": [
                        {
                            "tid": "3",
                            "tag": "休闲竞技"
                        },
                        {
                            "tid": "2",
                            "tag": "战争策略"
                        },
                        {
                            "tid": "1",
                            "tag": "角色扮演"
                        }
                    ]
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
        
    ————————————————————————————————————————————————————





<font id="a8" color="blue">8、根据标签获取游戏列表</font>
    ————————————————————————————————————————————————————
    URL:
        测试：
            http://test-pgame.duowan.com/game/ListByTag
    ————————————————————————————————————————————————————
    参数(get|post):
        tag         标签名，例如“模拟经营”
    ————————————————————————————————————————————————————
    返回(object)：
    {
        "rs": true,
        "msg": "ok"
        "pages": null,
        "count": "3",
        "list": [
            {
                "gid": "6",
                "game_code": "f15asd4fds65",
                "slogan": "范德萨方式",
                "intro": "fdasfsa ",
                "game_name": "打印机",
                "cover_thumb": "https://s1.dwstatic.com/duowanvideo/20190508/16/2600699.jpg",
                "cover_mid": "https://s1.dwstatic.com/duowanvideo/20190508/16/2600699.jpg",
                "cover_large": "https://s1.dwstatic.com/duowanvideo/20190508/16/2600699.jpg",
                "pid": "1",
                "score": "0",
                "is_hot": "0",
                "is_del": "0",
                "rank_num": "0",
                "player_num": "0",
                "created": "0",
                "updated": "0"
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
        http://test-pgame.duowan.com/game/ListByTag?tag=%E6%A8%A1%E6%8B%9F%E7%BB%8F%E8%90%A5
    ————————————————————————————————————————————————————






<font id="a9" color="blue">9、加载某游戏的所有区服列表（不分页）</font>
    ————————————————————————————————————————————————————
    URL:
    ————————————————————————————————————————————————————
    参数(get|post):
        gid         游戏ID
    ————————————————————————————————————————————————————
    返回(object)：
        {
            "rs": true,
            "msg": "ok",
            "servers": [
                {
                    "sid": "1", //我方系统定义的区服ID
                    "outer_sid": "KOUHAO_A", //厂商定义的区服ID，方便他们自用
                    "gid": "1", //所属游戏ID
                    "server_name": "口号大王测试A服",
                    "is_del": "0",
                    "is_open": "1",
                    "created": "0", //创建时间戳（秒）
                    "updated": "0"//更新时间戳（秒）
                },

                {...},

                ...
            ]
        }
    ————————————————————————————————————————————————————
    备注: 
        
    ————————————————————————————————————————————————————
    示例：
        
    ————————————————————————————————————————————————————







<font id="a10" color="blue">10、游戏请求登录接口（实则获取游戏加载页动态链接）</font>
    ————————————————————————————————————————————————————
    URL:
        测试：
            http://test-pgame.duowan.com/loginGame.do
        正式：
            ...
    ————————————————————————————————————————————————————
    参数(get|post):
        sid         区服ID
    ————————————————————————————————————————————————————
    返回(object)：
        {
            "rs": true,
            "msg": "ok",
            "data": {
                //游戏动态加载链接，会在一定时间过期
                "url": "http://kouhaodawang.com/game/load?gid=1&sid=1&outer_sid=KOUHAO_A&game_code=FAKEYOU&fcm=0&lgid=20190508_1&time=1557307525&sign=d2dbe73c470b4d85571f48f41736e065",
                "gid": "1",
                "sid": "1",
                "game_code": "FAKEYOU", //厂商定义的游戏ID，或者游戏代码，目前对前端也应该没啥用
                "lgid": "20190508_1" //登录流水号，目前可能对前端没啥用
            }
        }
    ————————————————————————————————————————————————————
    备注: 
        需要YY登录态
    ————————————————————————————————————————————————————
    示例：
        http://test-pgame.duowan.com/loginGame.do?sid=1
    ————————————————————————————————————————————————————




<font id="a11" color="blue">11、开服公告</font>
    ————————————————————————————————————————————————————
    URL:
        测试：
            http://test-pgame.duowan.com/server/showplans
        正式：
            。。。
    ————————————————————————————————————————————————————
    参数(get|post):
        无
    ————————————————————————————————————————————————————
    返回(object)：
        {
            "rs": true,
            "msg": "ok",
            "data": {
                "today": [ //今日开服列表
                    {
                        "plan_id": "2",
                        "sid": "1", //区服ID
                        "start_time": "0", //开始时间戳（秒）
                        "start_date": "20190508", //开服日期
                        "end_time": "0", //闭服时间戳（秒）
                        "end_date": "", //闭服日期
                        "created": "0",
                        "gid": "1", //游戏ID
                        "game_code": "FAKEYOU",
                        "game_name": "口号大王",
                        "cover_thumb": "https://s1.dwstatic.com/duowanvideo/20190508/16/2600699.jpg",
                        "cover_mid": "https://s1.dwstatic.com/duowanvideo/20190508/16/2600699.jpg",
                        "cover_large": "https://s1.dwstatic.com/duowanvideo/20190508/16/2600699.jpg",
                        "outer_sid": "KOUHAO_A", //厂商定义的区服ID，供他们自己用
                        "server_name": "口号大王测试A服"
                    },

                    {...},

                    ...
                ],
                "tomorrow": [ //明日开服列表
                    {
                        "plan_id": "3",
                        "sid": "1",
                        "start_time": "0",
                        "start_date": "20190509",
                        "end_time": "0",
                        "end_date": "",
                        "created": "0",
                        "gid": "1",
                        "game_code": "FAKEYOU",
                        "game_name": "口号大王",
                        "cover_thumb": "https://s1.dwstatic.com/duowanvideo/20190508/16/2600699.jpg",
                        "cover_mid": "https://s1.dwstatic.com/duowanvideo/20190508/16/2600699.jpg",
                        "cover_large": "https://s1.dwstatic.com/duowanvideo/20190508/16/2600699.jpg",
                        "outer_sid": "KOUHAO_A",
                        "server_name": "口号大王测试A服"
                    },

                    {...},

                    ...
                ]
            }
        }
    ————————————————————————————————————————————————————
    备注: 
        无
    ————————————————————————————————————————————————————
    示例：
        
    ————————————————————————————————————————————————————







<a href="#a12">12、我的角色列表</a>

<font id="a12" color="blue">12、我的角色列表</font>
    ————————————————————————————————————————————————————
    URL:
        测试：
            http://test-pgame.duowan.com/game/myroles
        正式：
            。。。
    ————————————————————————————————————————————————————
    参数(get|post):
        sid         区服ID
    ————————————————————————————————————————————————————
    返回(object)：
        {
            "rs": true,
            "msg": "ok",
            "roles": [
                {
                    "role_id": "1", //角色ID
                    "outer_role_id": "KOUHAO_LJ", //厂商自定义的角色ID，方便他们自己用
                    "uid": "1", //用户自增ID
                    "gid": "1", //游戏ID
                    "sid": "1", //区服ID
                    "nickname": "HEHE", //角色昵称
                    "grade": "2", //角色等级
                    "sex": "1", //角色性别：0女1男
                    "profession": "灵车漂移", //职业
                    "extra": "{}", //扩展JSON（现在没啥用，后续可能用到）
                    "created": "0", //创建时间戳（秒）
                    "updated": "0", //更新时间戳（秒）
                    "is_del": "0" //是否删除
                }
            ]
        }
    ————————————————————————————————————————————————————
    备注: 
        需要登录态
    ————————————————————————————————————————————————————
    示例：
        http://test-pgame.duowan.com/game/myroles?sid=1
    ————————————————————————————————————————————————————






<font id="a13" color="blue">13、个人信息</font>
    ————————————————————————————————————————————————————
    URL:
        测试：
            http://test-pgame.duowan.com/user/myinfo
    ————————————————————————————————————————————————————
    参数(get|post):
        无
    ————————————————————————————————————————————————————
    返回(object)：
        {
            "rs": true,
            "msg": "ok",
            "info": {
                "uid": "1",
                "yyuid": "500123132",
                "udb": "dw_fdafdsafs",
                "avatar": "http://tva1.sinaimg.cn/crop.21.2.203.203.50/77010c85gw1eevysgz0icj207m070mxm.jpg",
                "nickname": "放假啊第三",
                "fcm": "0", //防沉迷标志：0：未填写实名信息 1：已成年 2：未成年
                "realname": "", //真实姓名
                "idcard": "", //身份证
                "nation": "", //国籍
                "phone": "", //手机
                "level": "0", //大厅等级
                "exp": "0", //大厅经验
                "created": "1554978464",
                "updated": "1554978464"
            }
        }
    ————————————————————————————————————————————————————
    备注: 
        需要登录态
    ————————————————————————————————————————————————————
    示例：
        
    ————————————————————————————————————————————————————






<font id="a14" color="blue">14、最近登录</font>
    ————————————————————————————————————————————————————
    URL:
        http://test-pgame.duowan.com/login/myhistory
    ————————————————————————————————————————————————————
    参数(get|post):
        limit       数据条数，默认10
    ————————————————————————————————————————————————————
    返回(object)：
        {
            "rs": true,
            "msg": "ok",
            "list": [
                {
                    "lgid": "20190507_5",
                    "uid": "1",
                    "gid": "1",
                    "sid": "1",
                    "role_id": "0",
                    "ip": "172.16.14.111",
                    "ua": "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36",
                    "created": "1557234260",
                    "game_code": "FAKEYOU",
                    "game_name": "口号大王",
                    "cover_thumb": "https://s1.dwstatic.com/duowanvideo/20190508/16/2600699.jpg",
                    "cover_mid": "https://s1.dwstatic.com/duowanvideo/20190508/16/2600699.jpg",
                    "cover_large": "https://s1.dwstatic.com/duowanvideo/20190508/16/2600699.jpg",
                    "outer_sid": "KOUHAO_A",
                    "server_name": "口号大王测试A服"
                },
                {
                    "lgid": "20190507_4",
                    "uid": "1",
                    "gid": "1",
                    "sid": "1",
                    "role_id": "0",
                    "ip": "172.16.14.111",
                    "ua": "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36",
                    "created": "1557234222",
                    "game_code": "FAKEYOU",
                    "game_name": "口号大王",
                    "cover_thumb": "https://s1.dwstatic.com/duowanvideo/20190508/16/2600699.jpg",
                    "cover_mid": "https://s1.dwstatic.com/duowanvideo/20190508/16/2600699.jpg",
                    "cover_large": "https://s1.dwstatic.com/duowanvideo/20190508/16/2600699.jpg",
                    "outer_sid": "KOUHAO_A",
                    "server_name": "口号大王测试A服"
                },
                {
                    "lgid": "20190508_1",
                    "uid": "1",
                    "gid": "1",
                    "sid": "1",
                    "role_id": "0",
                    "ip": "172.16.14.111",
                    "ua": "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36",
                    "created": "1557307525",
                    "game_code": "FAKEYOU",
                    "game_name": "口号大王",
                    "cover_thumb": "https://s1.dwstatic.com/duowanvideo/20190508/16/2600699.jpg",
                    "cover_mid": "https://s1.dwstatic.com/duowanvideo/20190508/16/2600699.jpg",
                    "cover_large": "https://s1.dwstatic.com/duowanvideo/20190508/16/2600699.jpg",
                    "outer_sid": "KOUHAO_A",
                    "server_name": "口号大王测试A服"
                }
            ]
        }
    ————————————————————————————————————————————————————
    备注: 
        需要登录态
    ————————————————————————————————————————————————————
    示例：
        
    ————————————————————————————————————————————————————







<font id="a15" color="blue">15、批量获取区服信息</font>
    ————————————————————————————————————————————————————
    URL:
        测试：
            http://test-pgame.duowan.com/server/getbyids
        正式：
            。。。
    ————————————————————————————————————————————————————
    参数(get|post):
        sidList         区服ID列表，半角逗号隔开
    ————————————————————————————————————————————————————
    返回(object)：
        {
            "rs": true,
            "msg": "ok",
            "servers": { //区服ID => {具体数据}
                "1": {
                    "sid": "1",
                    "outer_sid": "KOUHAO_A",
                    "gid": "1",
                    "server_name": "口号大王测试A服",
                    "is_del": "0",
                    "is_open": "1",
                    "created": "0",
                    "updated": "0"
                },
                "2": {
                    "sid": "2",
                    "outer_sid": "KOUHAO_B",
                    "gid": "1",
                    "server_name": "口号大王测试B服",
                    "is_del": "0",
                    "is_open": "1",
                    "created": "0",
                    "updated": "0"
                }
            }
        }
    ————————————————————————————————————————————————————
    备注: 
        无
    ————————————————————————————————————————————————————
    示例：
        http://test-pgame.duowan.com/server/getbyids?sidList=1,2
    ————————————————————————————————————————————————————











<font id="a16" color="blue">16、横向轮播精品游戏（人工推荐的东西）</font>
    ————————————————————————————————————————————————————
    URL:
        测试：
            http://test-pgame.duowan.com/game/JingpinList
        正式：
            。。。
    ————————————————————————————————————————————————————
    参数(get|post):
        无
    ————————————————————————————————————————————————————
    返回(object)：
        {
            "rs": true,
            "msg": "ok",
            "list": [
                {
                    "gid": "1",
                    "game_code": "FAKEYOU",
                    "slogan": "我们的口号是什么？",
                    "intro": "fdsfdsjfidsoj",
                    "game_name": "口号大王",
                    "cover_thumb": "https://s1.dwstatic.com/duowanvideo/20190508/16/2600699.jpg",
                    "cover_mid": "https://s1.dwstatic.com/duowanvideo/20190508/16/2600699.jpg",
                    "cover_large": "https://s1.dwstatic.com/duowanvideo/20190508/16/2600699.jpg",
                    "pid": "1",
                    "score": "85",
                    "is_hot": "1",
                    "is_del": "0",
                    "rank_num": "0",
                    "player_num": "0",
                    "created": "0",
                    "updated": "0",
                    "tags": [
                        {
                            "tid": "3",
                            "tag": "休闲竞技"
                        },
                        {
                            "tid": "2",
                            "tag": "战争策略"
                        },
                        {
                            "tid": "1",
                            "tag": "角色扮演"
                        }
                    ]
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
        
    ————————————————————————————————————————————————————








<font id="aXXX" color="blue">XXX、XXXXX（<font color="red">XXXXX</font>） XXXX/XXXX </font>
    ————————————————————————————————————————————————————
    URL:
    ————————————————————————————————————————————————————
    参数(get|post):
        channel     FDASFSAF
    ————————————————————————————————————————————————————
    返回(object)：
    ————————————————————————————————————————————————————
    备注: 
        备用的东西。。
    ————————————————————————————————————————————————————
    示例：
        
    ————————————————————————————————————————————————————






<img id="infview" src="https://s1.dwstatic.com/duowanvideo/20190508/18/1650770.png">
