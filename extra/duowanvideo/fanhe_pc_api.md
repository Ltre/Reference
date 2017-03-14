<pre>

<h1><center>多玩视频 - 提供给饭盒视频助手的API (20170306)</center></h1>


<font color="blue">1、【newclientapi/GetVideoData】拉取vid指定的视频，作为其新的饭盒视频插入来源或已有数据编辑来源 </font>
	————————————————————————————————————————————————————
	URL:		http://video.duowan.com/?r=newclientapi/GetVideoData
	————————————————————————————————————————————————————
	参数(get|post):
		vid		多玩视频的VID
	————————————————————————————————————————————————————
	返回(json object)：
        {
            "code": 1,
            "msg": "获取成功",
            "data": {
                "duowanVideo": {
                    "user_id": "50014545",
                    "user_avatar": "http://s1.dwstatic.com/vhuya/avatar/50/01/200_200/98d2a3f69b3baffa354413ea9951e7c5.jpg?t=1466045578",
                    "user_nickname": "王尼玛",
                    "user_homepage": "http://video.duowan.com/u/50014545",
                    "vid": 3570868,
                    "video_title": "辣鸡测试001_4561746534faf4as65f47as6df",
                    "video_subtitle": "辣鸡测试001_4561746534faf4as65f47as6df",
                    "video_cover": "http://vimg.dwstatic.com/1710/3570868/9-220x124.jpg",
                    "video_play_num": "959",
                    "video_raw_play_num": 959,
                    "video_comment_num": "0",
                    "video_raw_comment_num": 0,
                    "video_duration": "10:10",
                    "video_raw_duration": 610,
                    "video_url": "http://video.duowan.com/play/3570868.html",
                    "video_upload_time": "2017-03-06 15:25",
                    "video_raw_upload_time": 1488785138,
                    "video_channel": "ceshi",
                    "video_channel_name": "多玩视频",
                    "video_intro": "",
                    "video_tags": ",视频测试,图片,",
                    "video_square_cover": "http://ojiastoreimage.bs2dl.yy.com/1488784065250_len97228.png",
                    "src": "http://dw-w6.dwstatic.com/2/11/1523/123455-101-1433332813.mp4",
                    "album_id": 321,
                    "album_name": "呵呵"
                },
                "fanheVideo": {
                    "id": "3339",
                    "vid": "3570868",
                    "channel": "ceshi",
                    "title": "辣鸡测试001_4561746534faf4as65f47as6df",
                    "uid": "50014545",
                    "cover": "http://ojiastoreimage.bs2dl.yy.com/1488784065406_len101245.png",
                    "square_cover": "http://ojiastoreimage.bs2dl.yy.com/1488784065250_len97228.png",
                    "gif_cover": "http://ojiastorevideos.bs2dl.yy.com/1488784065787_len578368.gif",
                    "cms_tags": ",视频测试,",
                    "fanhe_main_tags": "二次元",
                    "fanhe_tags": ",辣鸡,",
                    "album_id": "1326",
                    "serie_id": "0",
                    "collection_name": "辣鸡",
                    "digest": "",
                    "upload_uid": "50014545",
                    "upload_udb_name": "dw_fangkunbiao",
                    "article_id": "352740337994",
                    "article_url": "",
                    "status": "2",
                    "is_del": "1"
                }
            }
        }

	————————————————————————————————————————————————————
	备注: 
		code=1表示获取成功；
        code为负数时表示异常，如 -1 未指定VID， -2 多玩视频中，找不到该视频
	————————————————————————————————————————————————————
	示例：
		http://video.duowan.com/?r=newclientapi/GetVideoData&vid=3570868
	————————————————————————————————————————————————————






<font color="blue">2、饭盒视频客户端删除操作</font>
	————————————————————————————————————————————————————
	URL:		http://video.duowan.com/?r=newclientapi/del
	————————————————————————————————————————————————————
	参数(get|post):
		vid		多玩视频的VID
	————————————————————————————————————————————————————
	返回(json object)：
        {
            "code": 1,
            "msg": "删除成功"
        }
	————————————————————————————————————————————————————
	备注: 
		code为正数表示删除成功；
        code为负数表示异常，如
            -999    未登录（通常是登录态出问题）
            -99     未指定VID
            -1      找不到饭盒视频提交记录
            -2      该饭盒视频记录，并非你提交
            -3      获取发布器编辑人员姓名失败, UDB = dw_xxxx
            -4      饭盒接口删除出错
            -5      在视频平台找不到上传记录
            -6      非本人上传的视频，不能删除
            -7      在多玩视频个人主页中，找不到该视频
            -8      远程删除接口提示：XXXXX（一般是删除失败）
            -9      在多玩视频个人主页中，删除视频失败
        错误码会有对应的msg提示，代码里不要写死code与提示信息。弹框提示时，建议以msg为准。
	————————————————————————————————————————————————————
	示例：
		http://video.duowan.com/?r=newclientapi/del&vid=3570868
	————————————————————————————————————————————————————



<font color="blue">3、获取发布器编辑姓名，也可判断是否为发布器编辑</font>
	————————————————————————————————————————————————————
	URL:		http://video.duowan.com/?r=newclientapi/del
	————————————————————————————————————————————————————
	参数(get|post):
		udb		YY通行证
	————————————————————————————————————————————————————
	返回(json object)：
        {
            "code": 1,
            "msg": "获取成功"
            "realname": "王尼玛"
        }
	————————————————————————————————————————————————————
	备注: 
		code为正数表示删除成功；
        code为负数表示异常，如
            -1      参数错误
            -2      查无记录
        错误码会有对应的msg提示，代码里不要写死code与提示信息。弹框提示时，建议以msg为准。
	————————————————————————————————————————————————————
	示例：
		http://video.duowan.com/?r=newclientapi/getCmsEditorRealname&udb=dw_xxx
	————————————————————————————————————————————————————

