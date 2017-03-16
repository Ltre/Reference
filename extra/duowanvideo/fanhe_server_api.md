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





