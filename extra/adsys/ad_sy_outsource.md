<pre>

<h1><center>手游联运-广告位外包接口文档(20180416)</center></h1>


<h2>广告位ID对应表</h2>

    loc  位置名称
    188	【外包】多玩饭盒APP-资讯内容页-热门榜100*100
    187	【外包】多玩饭盒APP-资讯内容页-新游榜100*100
    186	【外包】多玩饭盒APP-资讯内容页-精品手游100*100
    185	【外包】多玩论坛APP-头条-资讯列表240*136
    184	【外包】多玩论坛APP-资讯内容页-热门榜100*100
    183	【外包】多玩论坛APP-资讯内容页-新游榜100*100
    182	【外包】多玩论坛APP-资讯内容页-精品手游100*100
    181	【外包】多玩饭盒APP-资讯列表-新闻列表226*170
    180	【外包】多玩饭盒APP-首页-精品手游100*100
    179	【外包】多玩WAP-视频排行榜-推荐位220*124
    178	【外包】多玩WAP-找游戏-最新手游114*160
    177	【外包】多玩WAP-论坛-帖子详情50*50
    176	【外包】多玩WAP-论坛-帖子列表(不限宽高)
    175	【外包】多玩WAP-论坛-每日推荐200*110
    174	【外包】多玩WAP-视频播放页-推荐位220*124
    173	【外包】多玩WAP-视频-今日推荐220*124
    172	【外包】多玩WAP-视频-视频列表220*124
    171	【外包】多玩WAP-资讯内容页&视频播放页-热门榜100*100
    170	【外包】多玩WAP-资讯内容页&视频播放页-新游榜100*100
    169	【外包】多玩WAP-资讯内容页&视频播放页-精品手游100*100
    168	【外包】多玩WAP-首页新闻中心-新闻列表-220*124
    167	【外包】多玩WAP-图库-图库推荐-200*230
    166	【外包】多玩WAP-图库-图库内容-宽640
    165	【外包】多玩WAP-图库-图库列表-宽200
    164	【外包】多玩论坛APP-贴子详情-614*346
    163	【外包】多玩论坛APP-贴子列表-700*400


<h2>前端</h2>
    广告信息加载接口统一为：http://da.duowan.com/loc/{$loc}
    广告上报接入http://dastats.duowan.com
    


<h2>论坛APP</h2>
    广告信息加载接口为：http://da.duowan.com/api/outsourcebbs?loc={$locName}&platform={$platform}
        参数说明：
            locName 参照以下 loc -> locName 转换表：
                163 -> postlist
                164 -> postdetail
                182 -> jpsylist
                183 -> newgamelist
                184 -> hotlist
                185 -> topnewslist
            platform
                目前支持"ios", "android"
    上报：已附带自动上报技能


    
<h2>饭盒APP</h2>
    广告信息加载接口为：http://da.duowan.com/api/fanhe?loc={$locName}&platform={$platform}
        参数说明：
            locName 参照以下 loc -> locName 转换表：
                180 -> outsource_jpsylist
                181 -> outsource_newslist
                186 -> outsource_news_jpsylist
                187 -> outsource_news_newgames
                188 -> outsource_news_hotlist
            platform
                目前支持"ios", "android"
    上报：已附带自动上报技能


