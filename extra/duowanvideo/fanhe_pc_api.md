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
                    "video_rawtitle": "152416516316",
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
	URL:		http://video.duowan.com/?r=newclientapi/getCmsEditorRealname
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
        需要登录态
		code为正数表示删除成功；
        code为负数表示异常，如
            -1      参数错误
            -2      查无记录
        错误码会有对应的msg提示，代码里不要写死code与提示信息。弹框提示时，建议以msg为准。
	————————————————————————————————————————————————————
	示例：
		http://video.duowan.com/?r=newclientapi/getCmsEditorRealname&udb=dw_xxx
	————————————————————————————————————————————————————






<font color="blue">4、获取已发布的饭盒视频</font>
	————————————————————————————————————————————————————
	URL:		http://video.duowan.com/?r=newclientapi/getMyPublished
	————————————————————————————————————————————————————
	参数(get|post):
		p           页码，默认1
        limit       每页数量，默认10（有时可能在非首页，出现的数据量少于limit，这个不必在意）
	————————————————————————————————————————————————————
	返回(json object)：
        {
            "code": 1,
            "msg": "获取成功",
            "data": {
                "list": [ //列表
                    {
                        "duowanVideo": {
                            "user_id": "50014545",
                            "user_avatar": "http://s1.dwstatic.com/vhuya/avatar/50/01/200_200/98d2a3f69b3baffa354413ea9951e7c5.jpg?t=1466045578",
                            "user_nickname": "王尼玛",
                            "user_homepage": "http://video.duowan.com/u/50014545",
                            "vid": "3560324",
                            "video_title": "部落冲突 皇室战争-瓦基丽武神 迷你皮卡 哥布林小屋",
                            "video_subtitle": "部落冲突 皇室战争-瓦基丽武神 迷你皮卡 哥布林小屋",
                            "video_rawtitle": "464416541631631",
                            "video_cover": "http://ojiastoreimage.bs2dl.yy.com/1487899301440_len94848.png",
                            "video_play_num": "768",
                            "video_raw_play_num": 768,
                            "video_comment_num": "0",
                            "video_raw_comment_num": 0,
                            "video_support": "0",
                            "video_raw_support": 0,
                            "video_duration": "10:10",
                            "video_raw_duration": 610,
                            "video_url": "http://video.duowan.com/play/3560324.html",
                            "video_upload_time": "2017-02-24 09:21",
                            "video_raw_upload_time": 1487899288,
                            "video_channel": "oujtest",
                            "video_channel_name": "多玩视频",
                            "video_intro": "",
                            "video_tags": "",
                            "video_square_cover": "http://ojiastoreimage.bs2dl.yy.com/1487899300854_len91129.png",
                            "src": "http://dw-w7.dwstatic.com/59/9/1708/3560324-98-1487899300.mp4",
                            "album_id": "0",
                            "album_name": ""
                        },
                        "fanheVideo": {
                            "id": "1186",
                            "vid": "3560324",
                            "channel": "",
                            "title": "部落冲突 皇室战争-瓦基丽武神 迷你皮卡 哥布林小屋",
                            "uid": "50014545",
                            "cover": "http://ojiastoreimage.bs2dl.yy.com/1487899301440_len94848.png",
                            "square_cover": "http://ojiastoreimage.bs2dl.yy.com/1487899300854_len91129.png",
                            "gif_cover": "http://ojiastorevideos.bs2dl.yy.com/1487899302373_len578368.gif",
                            "cms_tags": "",
                            "fanhe_main_tags": "二次元",
                            "fanhe_tags": ",呵呵,",
                            "album_id": "0",
                            "serie_id": "0",
                            "collection_name": "",
                            "digest": "",
                            "upload_uid": "50014545",
                            "upload_udb_name": "dw_fangkunbiao",
                            "article_id": "0",
                            "article_url": "",
                            "status": "3",
                            "is_del": "0"
                        }
                    },
                    {
                        "duowanVideo": {
                            "user_id": "50014545",
                            "user_avatar": "http://s1.dwstatic.com/vhuya/avatar/50/01/200_200/98d2a3f69b3baffa354413ea9951e7c5.jpg?t=1466045578",
                            "user_nickname": "王尼玛",
                            "user_homepage": "http://video.duowan.com/u/50014545",
                            "vid": "3557527",
                            "video_title": "部落冲突 皇室战争-瓦基丽武神 迷你皮卡 哥布林小屋",
                            "video_subtitle": "部落冲突 皇室战争-瓦基丽武神 迷你皮卡 哥布林小屋",
                            "video_rawtitle": "466546461",
                            "video_cover": "http://ojiastoreimage.bs2dl.yy.com/1487664007878_len101245.png",
                            "video_play_num": "1,028",
                            "video_raw_play_num": 1028,
                            "video_comment_num": "0",
                            "video_raw_comment_num": 0,
                            "video_support": "0",
                            "video_raw_support": 0,
                            "video_duration": "10:10",
                            "video_raw_duration": 610,
                            "video_url": "http://video.duowan.com/play/3557527.html",
                            "video_upload_time": "2017-02-21 15:58",
                            "video_raw_upload_time": 1487663929,
                            "video_channel": "ceshi",
                            "video_channel_name": "多玩视频",
                            "video_intro": "",
                            "video_tags": "",
                            "video_square_cover": "http://ojiastoreimage.bs2dl.yy.com/1487664007540_len97228.png",
                            "src": "http://dw-w5.dwstatic.com/55/3/1708/3557527-98-1487664005.mp4",
                            "album_id": "1326",
                            "album_name": "尼玛死"
                        },
                        "fanheVideo": {
                            "id": "613",
                            "vid": "3557527",
                            "channel": "ceshi",
                            "title": "部落冲突 皇室战争-瓦基丽武神 迷你皮卡 哥布林小屋[非重复值1f456d4as961sd65a4fs6]",
                            "uid": "50014545",
                            "cover": "http://ojiastoreimage.bs2dl.yy.com/1487664007878_len101245.png",
                            "square_cover": "http://ojiastoreimage.bs2dl.yy.com/1487664007540_len97228.png",
                            "gif_cover": "http://ojiastorevideos.bs2dl.yy.com/1487664010603_len578368.gif",
                            "cms_tags": ",呵呵,",
                            "fanhe_main_tags": "二次元",
                            "fanhe_tags": ",呵呵,",
                            "album_id": "1326",
                            "serie_id": "0",
                            "collection_name": "",
                            "digest": "发大水发生大幅",
                            "upload_uid": "50014545",
                            "upload_udb_name": "dw_fangkunbiao",
                            "article_id": "351620444040",
                            "article_url": "",
                            "status": "3",
                            "is_del": "0"
                        }
                    }
                ],
                "pages": {
                    "total_count": "4",//总数据量
                    "page_size": 2,//每页数量
                    "total_page": 2,//总页数
                    "first_page": 1,//首页
                    "prev_page": 1,//上一页
                    "next_page": 2,//下一页
                    "last_page": 2,//尾页
                    "current_page": 1,//当前页
                    "all_pages": [1, 2],//当前可见页码
                    "offset": 0,//记录起始偏移量
                    "limit": 2
                }
            }
        }
	————————————————————————————————————————————————————
	备注: 
        需要登录态
	————————————————————————————————————————————————————
	示例：
		http://video.duowan.com/?r=newclientapi/GetMyPublished&p=1&limit=2
	————————————————————————————————————————————————————










<font color="blue">5、保存视频</font>
	————————————————————————————————————————————————————
	URL:		http://video.duowan.com/?r=newclientapi/save
	————————————————————————————————————————————————————
	参数(get|post):
		articleJson		字段集
	————————————————————————————————————————————————————
	返回(json object)：
        {
            "code": 1,
            "msg": "操作成功",
        }
	————————————————————————————————————————————————————
	备注: 
        编辑已有视频时，不能修改订阅号
	————————————————————————————————————————————————————
	示例：
        var data = {
            videoId:1773,
            channel:'ceshi',
            title:'测试视频002',
            uid:'50001131',
            cover:'http://res.miku.us/res/img/default/2016/07/24/010233-353-hex238.jpg',
            cms_cover:'http://res.miku.us/res/img/default/2016/11/24/091644-204-hex95.jpg',
            gifCover:'http://ojiastorevideos.bs2dl.yy.com/1487227598555_len220641.gif',
            cmsTags:['视频测试','美女','娱乐','游戏'],
            mainTag:'游戏',
            tags:['英雄联盟','英雄联盟-LCK联赛'],
            album:113,
            serie:0,
            collection:'',  
            describe:'这是一个测试视频，请无视',
            udb_name:'dw_zhaotao'
        };
        $.get('http://video.duowan.com/?r=newclientapi/save', {articleJson: JSON.stringify(data)}, function(j){
            console.log(j);
        }, 'jsonp');
	————————————————————————————————————————————————————





