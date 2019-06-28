<pre>

1、视频上传接口 - 全量上传（仅限服务器调用）：
    http://动态域名/?r=upload/entity
    参数：
        source_client - 客户端标识，特秀的固定传52
        channelId - 对应发布器专区，特秀目前没有专区，后面可能会开设专区，暂时传 texiu
        title - 视频标题
        udb - 多玩通行证
        yyuid - YYUID
        entity - 文件域
    返回：
        code - 当状态码等于2时，msg就是VID（以前别人写的代码）
        msg - 提示信息或者数据
    
2、动态域名获取
    http://upload.v.duowan.com/?r=upload/GetDomain
    返回：
        取result字段即可
    
3、视频源信息（视频可播状态，也可以通过此接口确认）
    http://playapi.v.duowan.com/?r=play/video&vid=111111&partner=dw
    判断code=1时，表明视频可播放
    视频源的MAP从 result.items[N].transcode.urls[N] 获取， 
        N表示数组下标，item[N]表示其中一种码率的data体，
        urls[N]表示在某种码率下的某个MP4播放链接


</pre>