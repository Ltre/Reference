<pre>

<h1><center>订阅号追踪-后端API (20171021)</center></h1>


<font color="blue">1、通过播放页url抓取单个零散视频</font>
    ————————————————————————————————————————————————————
    URL:    http://grab-v.duowan.com/api/grabOneVideo
    ————————————————————————————————————————————————————
    参数(get|post):
        jsonData       要传的数据，使用json格式化，具体结构如下：
                - url 被抓视频播放页URL.   必需参数
                - channel 上传视频指定的发布器专区ID.  <font color="orange">该参数可选，一般情况下默认为duowanvideo，但当遇到UDB=weijuyuanapp且channel为空时，则取值为yingshivideo</font>
                - udb 指定上传者的通行证.  说明：udb|yyuid传其中之一即可
                - yyuid 指定上传者的YYUID.   说明：udb|yyuid传其中之一即可

        sign           签名
    ————————————————————————————————————————————————————
    签名请求过程(js表示)：
        var json = {
            url: 'https://www.bilibili.com/video/av15530794/',
            channel: 'yingshivideo',  //channel可选，见上注解
            udb: 'weijuyuanapp',
        };
        var jsonstr = JSON.stringify(json);
        var key = 'duowan~!@#$%^&*';
        var sign = MD5(jsonstr + key);
        var api = 'http://grab-author.webdev2.duowan.com/api/grabOneVideo';
        $.get(api, {jsonData: jsonstr, sign: sign}, function(j){
            console.log(j);
        }, 'jsonp');
    ————————————————————————————————————————————————————
    返回: 
        rs              操作结果：true|false
        msg             提示信息
        data            <font color="orange">返回rs为true时则有data</font>，结构如下：
                            - urlTaskId 新插入的任务ID
                            - vid 多玩视频ID
    ————————————————————————————————————————————————————
    返回示例：
        {
            "data": {
                "urlTaskId": 795,
                "vid": 8581119
            },
            "msg": "添加任务成功",
            "rs": true
        }
    ————————————————————————————————————————————————————
    备注：测试用例见：http://cms.acggeek.com/%E6%B5%8B%E8%AF%95api/grabOneVideo
    ————————————————————————————————————————————————————

