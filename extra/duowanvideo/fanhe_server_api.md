<pre>

<h1><center>多玩视频 - 提供给饭盒后端的API (20170313)</center></h1>


<font color="blue">1、【api/syncFanheUidToUserHome】同步饭盒订阅号信息到个人主页</font>
	————————————————————————————————————————————————————
	URL:		http://video.duowan.com/?r=api/syncFanheUidToUserHome
	————————————————————————————————————————————————————
	参数(get|post):
		uid         YYUID。必需，类型为字符串
        nickname    订阅号昵称（多玩视频用户昵称）。可选，不需要时，需传空字符串
        avatar      头像。可选，不需要时，需传空字符串
        userIntro   个人简介。可选，不需要时，需传空字符串
        homeNotice  多玩视频个人主页公告。可选，不需要时，需传空字符串
        homeCover   多玩视频个人背景图。可选，不需要时，需传空字符串
        time        时间戳，一定要转字符串，否则两方系统数据类型不一致
        sign        签名
	————————————————————————————————————————————————————
    签名过程：
        $argArr = [...]; //除了sign之外，所有的参数键名都需要，无顺序放置要求
        ksort($argArr, SORT_REGULAR);
        $sign = hash_hmac('sha1', json_encode($argArr), $token);
    ————————————————————————————————————————————————————
	返回(json object)：
        {
            "code": 0,
            "msg": "操作成功",
            "rs": true|false 布尔值，true用于标识成功
        }

	————————————————————————————————————————————————————
	备注: 
		code=0表示操作成功；
        code为负数时表示异常，如 -1 参数错误， -2 签名出错
	————————————————————————————————————————————————————
	示例：
        function actionSyncFanheUidToUserHome(){
            //测试环境配置
            list($url, $domain, $token) = array('http://172.16.12.111/?r=api/syncFanheUidToUserHome', 'video.duowan.com', '9b1b3cdfcf5ec35a631c29ac210c25ef4fc9bd8d');
            //正式环境配置(不需要hosts)
            //list($url, $domain, $token) = array('http://video.duowan.com/?r=api/syncFanheUidToUserHome', '', '9b1b3cdfcf5ec35a631c29ac210c25ef4fc9bd8d');

            $data = array(
                'uid' => '50014545', //必需，类型为字符串
                'nickname' => '这是昵称', //可选，不需要时，需传空字符串
                'userIntro' => '个人简介', //可选，不需要时，需传空字符串
                'homeNotice' => '个人主页公告', //可选，不需要时，需传空字符串
                'homeCover' => 'http://s1.dwstatic.com/duowanvideo/20170313/20/1225823.gif', //可选，不需要时，需传空字符串
                'avatar' => 'http://s1.dwstatic.com/duowanvideo/20170313/20/1225823.gif', //可选，不需要时，需传空字符串
                'time' => (string) time(), //时间戳，一定要字符串，否则两方系统数据类型不一致
            );
            $data['sign'] = $this->_genSignBySyncFanheUidToUserHome($data, $token);
            if (empty($domain)) {
                $ret = obj('dwHttp')->post($url, $data, 30);
            } else {
                $ret = obj('dwHttp')->post($url, $data, 30, "Host: {$domain}");
            }
            if (false === $ret) {
                //请求出错
            }
            $ret = json_decode($ret, 1);
            if ($ret['rs']) {
                //删除成功
            } else {
                //否则。。
            }
        }

        private function _genSignBySyncFanheUidToUserHome($argArr, $token){
            ksort($argArr, SORT_REGULAR);
            $sign = hash_hmac('sha1', json_encode($argArr), $token);
            return $sign;
        }
	————————————————————————————————————————————————————








<font color="blue">2、【api/getArticleVideosOrderByTime】根据发布器专区、标签，获取视频列表</font>
	————————————————————————————————————————————————————
	URL:		http://video.duowan.com/?r=api/getArticleVideosOrderByTime
	————————————————————————————————————————————————————
	参数(get|post):
		channel     发布器专区ID，可选，不传则不限专区获取全部列表。
        tags        发布器标签，可选，支持逗号隔开或字符串数组。如："标签1"；"标签1,标签2,标签3"；["标签1", "标签2", "标签3"]。
        p           页码，默认1，可选，最大支持25页。
        limit       每页条数，默认10，可选，最大支持20条。
    ————————————————————————————————————————————————————
	返回(json object)：
        {
            "list": [ //列表
                {
                    "user_id": "2168956928",
                    "user_avatar": "http://screenshot.dwstatic.com/ojiasnsimage/243f0f8782d930a4e60ecc0d4b29c11e_len3357.jpg?imageview/0/w/150/h/150/format/jpg",
                    "user_nickname": "西门四泉",
                    "user_homepage": "http://video.duowan.com/u/2168956928",
                    "vid": 8523335,
                    "video_title": "诱人坐姿 性感长腿 韩国车展美女模特展示",
                    "video_subtitle": "诱人坐姿 性感长腿 韩国车展美女模特展示",
                    "video_rawtitle": "诱人坐姿 性感长腿 韩国车展美女模特展示",
                    "video_cover": "http://vimg.dwstatic.com/1735/8523335/9-220x124.jpg",
                    "video_play_num": "1.0万",
                    "video_raw_play_num": 10425,
                    "video_comment_num": "1",
                    "video_raw_comment_num": 1,
                    "video_support": "0",
                    "video_raw_support": 0,
                    "video_duration": "03:48",
                    "video_raw_duration": 228,
                    "video_url": "http://video.duowan.com/play/8523335.html",
                    "video_upload_time": "2017-08-31 12:02",
                    "video_raw_upload_time": 1504152166,
                    "video_channel": "kan",
                    "video_channel_name": "娱乐",
                    "video_channel_url": "http://video.duowan.com/yule/",
                    "video_intro": "",
                    "video_tags": ",全部,舞蹈,首页舞蹈推荐,福利,性感美女,图片,",
                    "video_square_cover": "http://ojiastoreimage.bs2dl.huanjuyun.com/320x180/1504149738602_len16813.jpg",
                    "video_publish_status": 1,
                    "video_publish_status_desc": "发布成功",
                    "article_id": "368107365960"
                },
                { ... },
                ...
            ],
            "pages": { //分页信息
                "total_count": "14700",
                "page_size": 10,
                "total_page": 1470,
                "first_page": 1,
                "prev_page": 1,
                "next_page": 2,
                "last_page": 1470,
                "current_page": 1,
                "all_pages": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
                "offset": 0,
                "limit": 10
            }
        }
	————————————————————————————————————————————————————
	备注: 
        无
	————————————————————————————————————————————————————
	示例：
        http://video.duowan.com/?r=api/getArticleVideosOrderByTime&channel=lol&tags=%E6%B8%B8%E6%88%8F%E8%A7%86%E9%A2%91
	————————————————————————————————————————————————————





