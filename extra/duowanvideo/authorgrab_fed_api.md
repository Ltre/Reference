<pre>

<h1><center>订阅号追踪-前端API (20170616)</center></h1>


<font color="blue">1、添加作者抓取任务</font>
	————————————————————————————————————————————————————
	URL:	http://grab-v.duowan.com/jsapi/authorGrab
            http://grab-author.webdev2.duowan.com/jsapi/authorGrab
	————————————————————————————————————————————————————
	参数(get|post):
		authorName      自定义作者名称
        homeUrl         作者主页
        tplYyuid        推荐模板yyuid，即要分配至的订阅号
        cmsTags         发布器标签，逗号隔开，逗号不限制全角或半角
        fanheTags       饭盒标签，逗号隔开，逗号不限制全角或半角
        fanheMainTags   饭盒主标签，逗号隔开，逗号不限制全角或半角
        pushVideosite   是否发布到视频站（即发布器文章对外展现URL是否形如http://video.duowan.com/play/xxxxxx.html）
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
        http://grab-author.webdev2.duowan.com/jsapi/authorGrab?homeUrl=http://video.duowan.com/u/50014545&authorName=%E7%8E%8B%E5%B0%BC%E7%8E%9B2&tplYyuid=50014545&cmsTags=%E6%B8%B8%E6%88%8F%E8%A7%86%E9%A2%91&fanheTags=BS&fanheMainTags=%E6%B8%B8%E6%88%8F
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


<font color="blue">4、获取饭盒标签</font>
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
    备注：无
    ————————————————————————————————————————————————————


