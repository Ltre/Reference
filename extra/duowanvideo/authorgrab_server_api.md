<pre>

<h1><center>订阅号追踪-前端API (20170616)</center></h1>


<font color="blue">1、单个视频抓取完成后的通知接收点</font>
	————————————————————————————————————————————————————
	URL:	http://grab-v.duowan.com/api/notifyOneVideo
            http://grab-author.webdev2.duowan.com/api/notifyOneVideo
	————————————————————————————————————————————————————
	参数(get|post):
		urlTaskId       grab_url_task表主键
	————————————————————————————————————————————————————
	返回: 
		rs              操作结果：true|false
        data            返回rs为true时则有data
                            结构如下：
                                - grabVideoId : grab_video新增记录的主键
	————————————————————————————————————————————————————
	示例：
        http://grab-author.webdev2.duowan.com/api/notifyOneVideo?urlTaskId=1
    返回：
        {
            "rs": true,
            "data": {
                "grabVideoId": "1"
            }
        }
	————————————————————————————————————————————————————
    备注：无
    ————————————————————————————————————————————————————

