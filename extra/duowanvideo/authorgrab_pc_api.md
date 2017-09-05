<pre>

<h1><center>订阅号追踪 - 提供给PC视频上传助手的单个视频抓取API (20170905)</center></h1>

正式环境：grab-v.duowan.com
测试环境：grab-author.webdev2.duowan.com

<font color="blue">1、抓取某个外站视频</font>
    ————————————————————————————————————————————————————
    URL:    http://grab-v.duowan.com/uploadclientapi/grabOneVideo
            http://grab-author.webdev2.duowan.com/uploadclientapi/grabOneVideo
    ————————————————————————————————————————————————————
    参数(get|post):
        url             外站播放页URL
        channel         [可选]指定上传至的发布器专区ID
    ————————————————————————————————————————————————————
    返回: 
        rs              操作结果：true|false
        msg             提示
        data            rs为true时，值为{"urlTaskId": "数字"}，表示新增的任务ID，用于后续接口参数使用
    ————————————————————————————————————————————————————
    示例：
        http://grab-v.duowan.com/uploadclientapi/grabOneVideo?url=https://www.bilibili.com/video/av9362543/
        返回成功例如：
        {
            "rs": true,
            "msg": "添加任务成功",
            "data": {"urlTaskId": "53531"}
        }
        返回失败例如：
        {
            "rs": false,
            "msg": "重复信息有：\r\n[上传者UDB=dw_fangkunbiao, YYUID=50014545, url_task_id=53524\r\n如有疑问，将此提示信息截图给技术即可",
            "data": null
        }
    ————————————————————————————————————————————————————
    备注：<font color="red">需要登录态!</font>
    ————————————————————————————————————————————————————



<font color="blue">2、获取个人抓取记录</font>
    ————————————————————————————————————————————————————
    URL:    http://grab-v.duowan.com/uploadclientapi/getMyGrabList
            http://grab-author.webdev2.duowan.com/uploadclientapi/getMyGrabList
    ————————————————————————————————————————————————————
    参数(get|post):
        p           [可选]页码，默认1
        limit       [可选]每页条数，默认10，最大20
    ————————————————————————————————————————————————————
    返回: 
        {
        "list": [ //列表
            {
                "task_id": "786",
                "author_task_id": "78",
                "author_id": "25",
                "url": "https://www.bilibili.com/video/av14089733/",
                "vid": "0",
                "channel": "duowanvideo",
                "udb": "dw_fangkunbiao",
                "yyuid": "50014545",
                "title": "",
                "cover": "",
                "status": "0",
                "retry_count": "0",
                "create_time": "2017-09-05 13:13:21",
                "modify_time": "",
                "update_time": "2017-09-05 13:13:21",
                "is_del": false,
                "upload_token": ""
            },
            { ... },
            ,...
        ],
        "pages": { //分页信息：当不足一页时，该值为null
            "total_count": "10", //总数
            "page_size": 5, //每页最大条数
            "total_page": 2, //总页数
            "first_page": 1, //第一页
            "prev_page": 1, //上一页
            "next_page": 2, //下一页
            "last_page": 2, //最后一页
            "current_page": 1, //当前页码
            "all_pages": [1, 2], //用于显示的一定范围页码
            "offset": 0, //当前页起始排列数，最低为0
            "limit": 5 //跟page_size一样
        },
            "count": "10" //跟total_count一样
        }
    ————————————————————————————————————————————————————
    示例：
        http://grab-v.duowan.com/uploadclientapi/getMyGrabList?limit=5&p=2
    ————————————————————————————————————————————————————
    备注：<font color="red">需要登录态!</font>
    ————————————————————————————————————————————————————




<font color="blue">3、获取抓取的综合状态</font>
    ————————————————————————————————————————————————————
    URL:    http://grab-v.duowan.com/uploadclientapi/getComprehensiveStatus
            http://grab-author.webdev2.duowan.com/uploadclientapi/getComprehensiveStatus
    ————————————————————————————————————————————————————
    参数(get|post):
        url             外站播放页URL
        channel         [可选]指定上传至的发布器专区ID
    ————————————————————————————————————————————————————
    返回: 
        rs          执行结果：成功true|失败false
        msg         提示，发生错误时，可弹出来显示
        data        返回的数据
                    rs = true时返回
                        {"status": 抓取状态码(int), "statusDesc": "抓取状态描述"}
                    rs = false时返回
                        null
    ————————————————————————————————————————————————————
    示例：
        http://grab-v.duowan.com/uploadclientapi/getComprehensiveStatus?urlTaskId=53531
        返回成功例如：
        {
            "rs": false,
            "msg": "success",
            "data": {"status": 990, "statusDesc": "待抓取"}
        }
        返回失败例如：
        {
            "rs": false,
            "msg": "找不到该抓取任务!",
            "data": null
        }
    ————————————————————————————————————————————————————
    备注：<font color="red">需要登录态!</font>
    ————————————————————————————————————————————————————



