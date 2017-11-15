<pre>

<h1><center>订阅号追踪-前端API (20170616)</center></h1>


<font color="blue">1、添加作者抓取任务</font>
	————————————————————————————————————————————————————
	URL:	http://grab-v.duowan.com/jsapi/authorGrab
            http://grab-author.webdev2.duowan.com/jsapi/authorGrab
	————————————————————————————————————————————————————
	参数(get|post):
		authorName      【必填】自定义作者名称
        homeUrl         【必填】作者主页
        tplYyuid        【必填】推荐模板yyuid，即要分配至的订阅号
        channel         【可选】专区
        cmsTags         【可选】发布器标签，逗号隔开，逗号不限制全角或半角
        fanheTags       【必填】饭盒标签，逗号隔开，逗号不限制全角或半角
        fanheMainTags   【可选】饭盒主标签，逗号隔开，逗号不限制全角或半角
        pushVideosite   【必填】是否发布到视频站（即发布器文章对外展现URL是否形如http://video.duowan.com/play/xxxxxx.html）
	————————————————————————————————————————————————————
	返回: 
		rs              操作结果：true|false
        msg             提示
        data            返回rs为true时则有data
                            值为：{authorId:123, recomId:456, authorTaskId:789}
                            authorId为任务对应的作者id
                            recomId为任务对应的推荐模板id
                            authorTaskId为当前新建的任务id
	————————————————————————————————————————————————————
	示例：
        http://grab-author.webdev2.duowan.com/jsapi/authorGrab?homeUrl=http://video.duowan.com/u/50014545&authorName=%E7%8E%8B%E5%B0%BC%E7%8E%9B2&tplYyuid=50014545&cmsTags=%E6%B8%B8%E6%88%8F%E8%A7%86%E9%A2%91&fanheTags=BS&fanheMainTags=%E6%B8%B8%E6%88%8F&channel=ceshi
    返回：
        {
            "rs": true,
            "msg": "success",
            "data": {
                "authorId": "4",
                "recomId": "55",
                "authorTaskId": "49"
            }
        }
	————————————————————————————————————————————————————
    备注：<font color="red">需要登录态</font>
    ————————————————————————————————————————————————————



<font color="blue">2、作者任务列表</font>
	————————————————————————————————————————————————————
	URL:	http://grab-v.duowan.com/jsapi/authorTasks
            http://grab-author.webdev2.duowan.com/jsapi/authorTasks
	————————————————————————————————————————————————————
	参数(get|post):
		p               页码，可选，默认1
        limit           每页条数，可选，默认10
        keyword         关键字，可选，默认不搜索
	————————————————————————————————————————————————————
	返回: 
        {
            "list": [
                {
                    "task_id": "49",
                    "author_url": "http://video.duowan.com/u/50014545",
                    "recom_id": "55",
                    "status": "0",
                    "create_time": "1497595377",
                    "author_id": "4",
                    "author_name": "王尼玛2",
                    "op_udb": "dw_fangkunbiao"
                },
                {
                    "task_id": "40",
                    "author_url": "http://video.duowan.com/u/50014545",
                    "recom_id": "46",
                    "status": "0",
                    "create_time": "1497595273",
                    "author_id": "4",
                    "author_name": "王尼玛2",
                    "op_udb": "dw_fangkunbiao"
                }, 
                ...,
                {...}
            ],
            "pages": {
                "total_count": "15",
                "page_size": 10,
                "total_page": 2,
                "first_page": 1,
                "prev_page": 1,
                "next_page": 2,
                "last_page": 2,
                "current_page": 1,
                "all_pages": [1, 2],
                "offset": 0,
                "limit": 10
            },
            "count": "15"
        }
	————————————————————————————————————————————————————
	示例：无
	————————————————————————————————————————————————————
    备注：<font color="red">需要登录态</font>
    ————————————————————————————————————————————————————



<font color="blue">3、获取自己UDB账号名下的订阅号列表</font>
	————————————————————————————————————————————————————
	URL:	http://grab-v.duowan.com/jsapi/myUsers
            http://grab-author.webdev2.duowan.com/jsapi/myUsers
	————————————————————————————————————————————————————
	参数(get|post):
        无
	————————————————————————————————————————————————————
	返回: 
        [
            {
                "uid": "159357",
                "name": "播客159357",
                "avatar": "http://s1.dwstatic.com/duowanvideo/20170523/10/5355326.png",
                "desc": "",
                "bg": ""
            },
            {
                "uid": "50014545",
                "name": "辣鸡王尼玛",
                "avatar": "http://s1.dwstatic.com/duowanvideo/avatar/50/01/200_200/b4b20319f59de9956070e805dd5f6834.jpg?t=1496732787",
                "desc": "呵呵",
                "bg": "http://s1.dwstatic.com/duowanvideo/20170525/16/13572.gif"
            },
            ... ,
            {...}
        ]
	————————————————————————————————————————————————————
	示例：无
	————————————————————————————————————————————————————
    备注：<font color="red">需要登录态</font>
    ————————————————————————————————————————————————————





<font color="blue">4、获取账号名下，具有发布器权限的专区列表</font>
	————————————————————————————————————————————————————
	URL:	http://grab-v.duowan.com/jsapi/myCmsChannels
            http://grab-author.webdev2.duowan.com/jsapi/myCmsChannels
	————————————————————————————————————————————————————
	参数(get|post):
        无
	————————————————————————————————————————————————————
    返回：
        [
            {
                "channelId": "5253video",
                "channelName": "5253视频"
            },
            {
                "channelId": "d3",
                "channelName": "暗黑3"
            },
            {
                "channelId": "bb",
                "channelName": "BOOM BEACH"
            },
            ... ,
            {...}
        ]
	————————————————————————————————————————————————————
    备注：需要登录态
    ————————————————————————————————————————————————————




<font color="blue">5、获取发布器专区的标签节点树</font>
	————————————————————————————————————————————————————
	URL:	http://grab-v.duowan.com/jsapi/cmsTags
            http://grab-author.webdev2.duowan.com/jsapi/cmsTags
	————————————————————————————————————————————————————
	参数(get|post):
        channel         专区
        fromHeadTag     可选，以所指定标签为头标签来取数据，例如“游戏视频”
	————————————————————————————————————————————————————
    返回：
        [
            {
                "tagName": "撸圈八卦",
                "tagId": "1",
                "tagParentId": "0",
                "tagParentName": "无"
            },
            {
                "tagName": "撸时代",
                "tagId": "2",
                "tagParentId": "163",
                "tagParentName": "动画短片"
            },
            {
                "tagName": "囧视频",
                "tagId": "3",
                "tagParentId": "1110",
                "tagParentName": "游戏视频"
            },
            ... ,
            {...}
        ]
	————————————————————————————————————————————————————
    备注：无
    ————————————————————————————————————————————————————




<font color="blue">6、获取饭盒标签</font>
	————————————————————————————————————————————————————
	URL:	http://admin-svideo.duowan.com/tag/all.do
	————————————————————————————————————————————————————
	参数(get|post):
        无
	————————————————————————————————————————————————————
	文档详见: 
        http://doc.oujia.com/svideo/html/admin/tag_all.html
        HOSTS: 61.160.36.225  doc.oujia.com
	————————————————————————————————————————————————————
    返回：
    "code": int 状态码，0成功；其他为失败
    "data": {
    {
        "list": array 标签列表
        [
            {
                "children": array 标签子标签(可无)
                [
                    {
                        "children": array 标签子标签(可无)
                        [
                            {
                                "icon": string 标签图标, 
                                "id": long 标签id, 
                                "name": string 标签名
                            }
                        ], 
                        "icon": string 标签图标, 
                        "id": long 标签id, 
                        "name": string 标签名
                    }
                ], 
                "icon": string 标签图标, 
                "id": long 标签id, 
                "name": string 标签名
            }
        ]
    }
    },
    "result": int 请求状态码; 1成功，0失败
	————————————————————————————————————————————————————
    备注：该接口由饭盒后端提供。用于饭盒的视频大分类，和饭盒标签
    ————————————————————————————————————————————————————




<font color="blue">7、获取单个作者任务中的视频列表</font>
	————————————————————————————————————————————————————
	URL:	http://grab-v.duowan.com/jsapi/videosInAuthorTask
            http://grab-author.webdev2.duowan.com/jsapi/videosInAuthorTask
	————————————————————————————————————————————————————
	参数(get|post):
        authorTaskId    作者任务ID
        p               页码，默认1
        limit           每页条数，默认10
        status          【可选】抓取及发布的综合状态，值如下：
                            PUBLISH_SUCCESS     - VideoInfo发布状态：发布成功
                            PUBLISH_FAIL        - VideoInfo发布状态：发布失败
                            PUBLISH_DEL         - VideoInfo发布状态：被删除
                            PUBLISH_NOTFOUND    - VideoInfo发布状态：查无记录
                            PUBLISH_OTHER       - VideoInfo发布状态：其它状态
                            GRAB_WAIT           - 抓取状态：待抓取
                            GRAB_ING            - 抓取状态：抓取中
                            GRAB_RETRY          - 抓取状态：正在重试
                            GRAB_FAIL           - 抓取状态：抓取失败
	————————————————————————————————————————————————————
    返回：
        {
            "list": [
                {
                    "id": "3",
                    "author_task_id": "1",
                    "url_task_id": "74",
                    "recom_id": "0",
                    "author_id": "3",
                    "vid": "0",
                    "status": 1,
                    "status_desc": "发布成功",
                    "create_time": "0",
                    "videourl": "www.bilibili.com/video/av5726734",
                    "title": "【血与酒】黑桐谷歌视频攻略 07 攻下一城",
                    "cover": "//i1.hdslb.com/bfs/archive/adbba6349cd8041f38e8e9449b33aa4f3117d767.jpg",
                    "has_article": true, //有文章
                    "articles": [
                        363193754808: {
                            article_id: "363193754808",
                            author: "辣鸡王尼玛",
                            channel: "ceshi",
                            channel_name: "测试",
                            comment3_uniqid: "e475564203856a2bc7ff846b29961cae",
                            comment_num: "0",
                            content: "&lt;div class="embed-video"&gt;&lt;script type="text/javascript"&gt;var player_conf = {"letvVideoUnique":"","userUnique":"","videoId":"0","vid":"8421141","channelId":"ceshi","continous_play":"0","autoPlay": "1","height":"498","width":"610"};&lt;/script&gt;&lt;script type="text/javascript" src="http://assets.dwstatic.com/video/vp.js"&gt;&lt;/script&gt;&lt;/div&gt;",
                            digest: "",
                            diy1: "",
                            diy2: "",
                            diy3: "",
                            diy4: "",
                            diy5: "",
                            id: "232149",
                            picture_url: "http://s1.dwstatic.com/author-grab/20170705/14/5057455.jpeg",
                            publish_time: "2017-07-05 15:09:14",
                            source: "多玩饭盒视频机器人",
                            stat_update_time: "1499244663",
                            subtitle: "",
                            tags: ",图片,",
                            title: "【暴走大事件第四季】61 反诈骗新章！铁柱已跌入爱情悬崖",
                            title_color: "",
                            update_time: "2017-07-05 16:51:03",
                            url: "http://ceshi.duowan.com/1707/363193754808.html",
                            user_id: "编辑的姓名",
                            video_day_sum: "0",
                            video_month_sum: "0",
                            video_play_sum : "0",
                            video_week_sum: "0",
                            vids: ",8421141,"
                        },
                        363193754809: {
                            ....
                        },
                        ...
                    ]
                },
                {
                    "id": "3",
                    "author_task_id": "1",
                    "url_task_id": "74",
                    "recom_id": "0",
                    "author_id": "3",
                    "vid": "0",
                    "status": 1,
                    "status_desc": "发布成功",
                    "create_time": "0",
                    "videourl": "www.bilibili.com/video/av5726734",
                    "title": "【血与酒】黑桐谷歌视频攻略 07 攻下一城",
                    "cover": "//i1.hdslb.com/bfs/archive/adbba6349cd8041f38e8e9449b33aa4f3117d767.jpg",
                    "has_article": true, //没文章
                    "articles": []
                },
                ... ,
                {...}
            ],
            "pages": null,
            "count": "1",
            "author": {
                "author_name": "sb"
            },
            "authorTask": {
                "task_id": "1",
                "author_id": "3",
                "author_url": "https://space.bilibili.com/43536#!/",
                "recom_id": "0",
                "task_status": "9"
            }
        }
	————————————————————————————————————————————————————
    备注：无
    ————————————————————————————————————————————————————





<font color="blue">8、删除单个视频子任务及对应的视频、文章、饭盒视频</font>
	————————————————————————————————————————————————————
	URL:	http://grab-v.duowan.com/jsapi/delVideo
            http://grab-author.webdev2.duowan.com/jsapi/delVideo
	————————————————————————————————————————————————————
	参数(get|post):
        id          某个视频的抓取流水ID（不是视频平台的vid）
	————————————————————————————————————————————————————
    返回：
        {
            "rs": true,
            "msg": "删除成功"
        }
	————————————————————————————————————————————————————
    备注：无
    ————————————————————————————————————————————————————



<font color="blue">9、重传抓取的视频</font>
	————————————————————————————————————————————————————
	URL：无
	————————————————————————————————————————————————————
	参数(get|post):
        无
	————————————————————————————————————————————————————
    返回：
        无
	————————————————————————————————————————————————————
    备注：荒唐需求，不需要做
    ————————————————————————————————————————————————————




<font color="blue">10、剪辑、修改视频</font>
	————————————————————————————————————————————————————
	URL：无
	————————————————————————————————————————————————————
	参数(get|post):
        vid         多玩视频的id
	————————————————————————————————————————————————————
    返回：
        无
	————————————————————————————————————————————————————
    备注：直接调起客户端的工具即可，详见<a href="http://grab-author.webdev2.duowan.com/test/clientInf" target="_blank">此处</a>.
    ————————————————————————————————————————————————————




<font color="blue">11、重抓单个视频</font>
	————————————————————————————————————————————————————
    URL: http://grab-v.duowan.com/jsapi/reGrabVideo
         http://grab-author.webdev2.duowan.com/jsapi/reGrabVideo
	————————————————————————————————————————————————————
    参数(get|post):
        id          某个视频的抓取流水ID（不是视频平台的vid）
	————————————————————————————————————————————————————
    返回：
        {
            "rs": true,
            "msg": "操作成功，请等待异步处理"
        }
	————————————————————————————————————————————————————
    备注：<font color=red>需要登录态</font>
	————————————————————————————————————————————————————
	示例：
        http://grab-author.webdev2.duowan.com/jsapi/reGrabVideo?id=1
    ————————————————————————————————————————————————————




<font color="blue">12、删除作者抓取的任务</font>
	————————————————————————————————————————————————————
    URL: http://grab-v.duowan.com/jsapi/delAuthorTask
         http://grab-author.webdev2.duowan.com/jsapi/delAuthorTask
	————————————————————————————————————————————————————
    参数(get|post):
        authorTaskId    作者任务ID
	————————————————————————————————————————————————————
    返回：
        {
            "rs": true,
            "msg": "操作成功"
        }
	————————————————————————————————————————————————————
    备注：<font color=red>需要登录态</font>
	————————————————————————————————————————————————————
	示例：
        http://grab-author.webdev2.duowan.com/jsapi/delAuthorTask?authorTaskId=1
    ————————————————————————————————————————————————————



<font color="blue">13、提交勾选需要抓取的视频</font>
	————————————————————————————————————————————————————
    URL: http://grab-v.duowan.com/jsapi/toggleNeedRunUrlTasks
         http://grab-author.webdev2.duowan.com/jsapi/toggleNeedRunUrlTasks
	————————————————————————————————————————————————————
    参数(get|post):
        urlTaskIdList    视频任务ID集合，用逗号隔开
	————————————————————————————————————————————————————
    返回：
        {
            "rs": true,
            "msg": "操作成功"
        }
	————————————————————————————————————————————————————
    备注：<font color=red>需要登录态</font>
	————————————————————————————————————————————————————
	示例：
        http://grab-author.webdev2.duowan.com/jsapi/toggleNeedRunUrlTasks?authorTaskId=1
    ————————————————————————————————————————————————————



<font color="blue">14、获取待勾选抓取的视频任务</font>
	————————————————————————————————————————————————————
    URL: http://grab-v.duowan.com/jsapi/GetWaitRunUrlTasks
         http://grab-author.webdev2.duowan.com/jsapi/GetWaitRunUrlTasks
	————————————————————————————————————————————————————
    参数(get|post):
        authorTaskId    作者任务ID
	————————————————————————————————————————————————————
    返回：
        {
            "rs": true,
            "msg": "操作成功"
        }
	————————————————————————————————————————————————————
    备注：<font color=red>需要登录态</font>
	————————————————————————————————————————————————————
	示例：
        http://grab-author.webdev2.duowan.com/jsapi/GetWaitRunUrlTasks?authorTaskId=1
    ————————————————————————————————————————————————————



<font color="blue">15、提交作者任务后，获取该作者页下可抓的视频任务列表（这步比较慢，要等待）</font>
	————————————————————————————————————————————————————
    URL: http://grabauthornode-v.duowan.com/api/getUrlByAuthor.do
	————————————————————————————————————————————————————
    参数(get|post):
        taskId     作者任务ID（这个值由jsapi/authorGrab接口返回的JSON.data.authorTaskId提供）
	————————————————————————————————————————————————————
    返回：
        {
            "rs": true,
            "msg": "操作成功"
        }
	————————————————————————————————————————————————————
    备注：<font color=red>需要登录态</font>
	————————————————————————————————————————————————————
	示例：
        http://grabauthornode-v.duowan.com/api/getUrlByAuthor.do?taskId=130
    ————————————————————————————————————————————————————


