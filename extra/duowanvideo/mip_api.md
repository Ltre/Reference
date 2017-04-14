<pre>

<h1><center>多玩视频 - 提供给百度MIP的内部API(20170413)</center></h1>

<font color="blue">1、根据专区、标签获取视频列表</font>
    ————————————————————————————————————————————————————
    URL:		http://video.duowan.com/?r=mip/getVideosByChannelTag
    ————————————————————————————————————————————————————
    参数(get|post):
        channel		专区ID，可选
        tag     	标签，可选
        p           页码，默认1
        limit       每页条数，默认20（有时会产生不足20条的情况，忽略即可）
    ————————————————————————————————————————————————————
    返回(json)：
    {
        "list": [
            {
                "user_id": "430926665",
                "user_avatar": "http://s1.dwstatic.com/vhuya/E8/45/e84507444d94e097075438a683f8e9947858.jpg",
                "user_nickname": "飞行",
                "user_homepage": "http://video.duowan.com/u/430926665",
                "vid": 3817666,
                "video_title": "2017lpl春季赛 ss vs omg 第二场",
                "video_subtitle": "2017lpl春季赛 ss vs omg 第二场",
                "video_rawtitle": "2017lpl春季赛 ss vs omg 第二场",
                "video_cover": "http://ojiastoreimage.bs2dl.huanjuyun.com/1492083041393_len21838.jpg",
                "video_play_num": "877",
                "video_raw_play_num": 877,
                "video_comment_num": "0",
                "video_raw_comment_num": 0,
                "video_support": "0",
                "video_raw_support": 0,
                "video_duration": "52:57",
                "video_raw_duration": 3177,
                "video_url": "http://video.duowan.com/play/3817666.html",
                "video_upload_time": "2017-04-13 19:19",
                "video_raw_upload_time": 1492082345,
                "video_channel": "lol",
                "video_channel_name": "英雄联盟",
                "video_intro": "",
                "video_tags": "",
                "video_square_cover": "http://ojiastoreimage.bs2dl.huanjuyun.com/1492083041393_len21838.jpg"
            },
            {
                "user_id": "2168392137",
                "user_avatar": "http://image.yy.com/ojiasnsimage/98515b35a27fb571ff7b54e1f947295a_len12200.png?imageview/0/w/150/h/150/format/jpg",
                "user_nickname": "两分钟赛事回顾",
                "user_homepage": "http://video.duowan.com/u/2168392137",
                "vid": 3815885,
                "video_title": "lpl2分钟赛事回顾：omg vs ss 1",
                "video_subtitle": "lpl2分钟赛事回顾：omg vs ss 1",
                "video_rawtitle": "lpl2分钟赛事回顾：omg vs ss 1",
                "video_cover": "http://ojiastoreimage.bs2dl.huanjuyun.com/1492082499899_len28241.jpg",
                "video_play_num": "2,792",
                "video_raw_play_num": 2792,
                "video_comment_num": "0",
                "video_raw_comment_num": 0,
                "video_support": "0",
                "video_raw_support": 0,
                "video_duration": "03:33",
                "video_raw_duration": 213,
                "video_url": "http://video.duowan.com/play/3815885.html",
                "video_upload_time": "2017-04-13 18:43",
                "video_raw_upload_time": 1492080185,
                "video_channel": "lol",
                "video_channel_name": "英雄联盟",
                "video_intro": "",
                "video_tags": "",
                "video_square_cover": "http://ojiastoreimage.bs2dl.huanjuyun.com/1492082499899_len28241.jpg"
            },
            ...
        ],
        "pages": {
            "total_count": "37733",
            "page_size": 2,
            "total_page": 18867,
            "first_page": 1,
            "prev_page": 1,
            "next_page": 2,
            "last_page": 18867,
            "current_page": 1,
            "all_pages": [1,2,3,4,5,6,7,8,9,10],
            "offset": 0,
            "limit": 2
        },
        "count": "37733"
    }
    ————————————————————————————————————————————————————
    示例：
        http://video.duowan.com/?r=mip/GetVideosByChannelTag&channel=lol&tag=游戏视频
    ————————————————————————————————————————————————————
    备注: 
        无
    ————————————————————————————————————————————————————




<font color="blue">2、获取某视频的关联视频列表</font>
    ————————————————————————————————————————————————————
    URL:		http://video.duowan.com/?r=mip/GetVideoRelate
    ————————————————————————————————————————————————————
    参数(get|post):
        relate_vid		多玩视频ID
    ————————————————————————————————————————————————————
    返回(array)：
    [
        {
            "user_id": "430926665",
            "user_avatar": "http://s1.dwstatic.com/vhuya/E8/45/e84507444d94e097075438a683f8e9947858.jpg",
            "user_nickname": "飞行",
            "user_homepage": "http://video.duowan.com/u/430926665",
            "vid": 3817666,
            "video_title": "2017lpl春季赛 ss vs omg 第二场",
            "video_subtitle": "2017lpl春季赛 ss vs omg 第二场",
            "video_rawtitle": "2017lpl春季赛 ss vs omg 第二场",
            "video_cover": "http://ojiastoreimage.bs2dl.huanjuyun.com/1492083041393_len21838.jpg",
            "video_play_num": "877",
            "video_raw_play_num": 877,
            "video_comment_num": "0",
            "video_raw_comment_num": 0,
            "video_support": "0",
            "video_raw_support": 0,
            "video_duration": "52:57",
            "video_raw_duration": 3177,
            "video_url": "http://video.duowan.com/play/3817666.html",
            "video_upload_time": "2017-04-13 19:19",
            "video_raw_upload_time": 1492082345,
            "video_channel": "lol",
            "video_channel_name": "英雄联盟",
            "video_intro": "",
            "video_tags": "",
            "video_square_cover": "http://ojiastoreimage.bs2dl.huanjuyun.com/1492083041393_len21838.jpg"
        },
        {
            "user_id": "2168392137",
            "user_avatar": "http://image.yy.com/ojiasnsimage/98515b35a27fb571ff7b54e1f947295a_len12200.png?imageview/0/w/150/h/150/format/jpg",
            "user_nickname": "两分钟赛事回顾",
            "user_homepage": "http://video.duowan.com/u/2168392137",
            "vid": 3815885,
            "video_title": "lpl2分钟赛事回顾：omg vs ss 1",
            "video_subtitle": "lpl2分钟赛事回顾：omg vs ss 1",
            "video_rawtitle": "lpl2分钟赛事回顾：omg vs ss 1",
            "video_cover": "http://ojiastoreimage.bs2dl.huanjuyun.com/1492082499899_len28241.jpg",
            "video_play_num": "2,792",
            "video_raw_play_num": 2792,
            "video_comment_num": "0",
            "video_raw_comment_num": 0,
            "video_support": "0",
            "video_raw_support": 0,
            "video_duration": "03:33",
            "video_raw_duration": 213,
            "video_url": "http://video.duowan.com/play/3815885.html",
            "video_upload_time": "2017-04-13 18:43",
            "video_raw_upload_time": 1492080185,
            "video_channel": "lol",
            "video_channel_name": "英雄联盟",
            "video_intro": "",
            "video_tags": "",
            "video_square_cover": "http://ojiastoreimage.bs2dl.huanjuyun.com/1492082499899_len28241.jpg"
        },
        ...
    ]
    ————————————————————————————————————————————————————
    示例：
        http://video.duowan.com/?r=mip/GetVideoRelate&relate_vid=111111
    ————————————————————————————————————————————————————
    备注: 
        无
    ————————————————————————————————————————————————————








<font color="blue">3、根据vid获取视频信息</font>
    ————————————————————————————————————————————————————
    URL:		http://video.duowan.com/?r=mip/GetVideoInfoByVid
    ————————————————————————————————————————————————————
    参数(get|post):
        vid		多玩视频ID
    ————————————————————————————————————————————————————
    返回(json)：
        {
            "user_id": "50014545",
            "user_avatar": "http://screenshot.dwstatic.com/ojiasnsimage/7d3d42d313df6f729d752d0ba8a03622_len89913.png?imageview/0/w/150/h/150/format/jpg",
            "user_nickname": "王尼玛123",
            "user_homepage": "http://video.duowan.com/u/50014545",//个人主页
            "vid": 111111,
            "video_title": "酷儿英雄教学：野蝎子 见识一下我的毒刺",//视频主标题（一般用这个）
            "video_subtitle": "酷儿英雄教学：野蝎子 见识一下我的毒刺",//短标题
            "video_rawtitle": "酷儿英雄教学：野蝎子 见识一下我的毒刺",//视频库的源标题
            "video_cover": "http://vimg.dwstatic.com/1515/110267/4-220x124.jpg",//封面
            "video_play_num": "3,389",
            "video_raw_play_num": 3389,
            "video_comment_num": "0",
            "video_raw_comment_num": 0,
            "video_support": "1",
            "video_raw_support": 1,
            "video_duration": "52:13",
            "video_raw_duration": 3133,
            "video_url": "http://video.duowan.com/play/111111.html",//播放页
            "video_upload_time": "2015-04-10 10:03",
            "video_raw_upload_time": 1428631437,
            "video_channel": "lolboxvideo",
            "video_channel_name": "英雄联盟",
            "video_intro": "",
            "video_tags": ",游戏视频,比赛视频,",
            "video_square_cover": "http://vimg.dwstatic.com/1515/110267/4-220x124.jpg",
            "video_tags_arr": ["游戏视频", "比赛视频"],
            "video_tag_links": [
                {
                    "tag": "游戏视频",
                    "tag_link": "http://video.duowan.com/youxishipin8210.html"
                },
                {
                    "tag": "比赛视频",
                    "tag_link": "http://video.duowan.com/lol/bisai.html"
                }
            ],
            "c": "ZW*G-Ekh~F.G.O7F_F8D~MsO!F4K.-8D*D7C(JmJ_H-U-~!G@A8G9H.G___M(H8G~K*D0WxLcCvI'E1O4Q'l1I'lnA.i0V1X3a3B5D~CaY3B-E8G9H!B@K2C-L@J*L_N*DGG3A.G!J-M)IyL8U'l@R@cxKwOvQtP@h_N9H'J75@I'J(P_N@A'P*YsG.A@G3D.L(Q~J7B*F5D'P5E.C.Q'T3C-A'M~G4C~M!K_Oyt2A)Ige8D)I*I2B)N~LNI_N_Fnl.L'J-HZU*L~CTR8D_F5E72-M)IKI'O~C-crDuS.A2a3V-VlLxE'b-SzW'D'NyC_ByCtQ(~6E!BKI.L@Ahc6E@A_*)N@Ahh~J-E7S5MvC3W7F@I!BAA7E.G-M7F(HuSrA6O~K9H*Dvu.J'Jxx_M@A~K*L)I7O8g*j~bxT9R9H2A'JQO.O-Efc!E~C2z)L'J*L3B~C.L~M5b!F7Nzx9E'J8AkH!l*E)YHF6B.G'R(P.Gbb4B'J7F_N@AoK~a0a*a)D(e.c.i!SlD3QuMmH-k1Y3B(P)IRP_N.G-M9H_F0A7H1B5E~K.O@Azz3A(H~K-M*D'gzLxP9QwO.d*f)n*j9g*L)Q'JZX2A'J2A5D(H'PqBzN)C'P@K)N@J)P6A*F!J5B9I-A~D_G_B_I!F~K5F8H1ANI2A(HDB'O-E*I3C*I(Qmh9H*DWU7C_F.OUP6E(HaY@F@A'S0v(P)I@8.L@A@YoA_n'D)q~e9Q)suBtB-SdA.A!F'X(DyCtQSN*L@A31~H-EZU-M@AZX*I)ITT~J~CvG0H7OtM@I!J-Epp8F-E4C9H(HcA1K-W!J4C!Bhg-H-ELL8F!B*L_N(H(R7H9J'S'R9H@AVT(P.G2z8B@A(P~K'J*I3DvR8CvBOM@F)I@F.I4b!D~SYW9E~C@I!J_Fyy9G_F@I_N'JxT'hrRoB.B8VsEkC1IiA)fvNsN7d0X~K_N)I423B*D_N(P~C-O_P7E5E(P~K.G889G!B~K_N_F_c.clDyF5XpCrJ6bxT6d'R~K'JHF.O~C9H5D'J6C7SqE'D(N4E*I!K'Q6A.I*L~I3C'F*N(R3C-A*G9D~K5F-N9IdY~K~Cki)N@A_K(Q@F_OZU9H-E@8_K_F*Gxs4C!Bxv6B~C*MFA(P-EHF@F'J!Z_bcA'DnL.i~TdD-VyG!P8f.A8C9N(DyCuRKF9H'JRP5A'Jxs)Q(HaY(M!B33!I*D7S3K(YoH@I5D@AEE~J!B4C7F(H5d6P5N~K~K!B-**G@AOO'Q'J*L5D_F9J*N_M6F.O_N(H97.O@A_~_I'J8G~K)I6B6C7C-H1Hwu@F_F'S6CdA.K@QVT5A!B'R~K@A((-L*D_N9H(H'p(fhHuH_A)f4Q4W-V@cxK3VgBeA*k~K@I)Ius_N'J@I(P(H7H7C3A*L3B(H!!3A_F-M'R'JuH5R3V_W_h2PvNfA1XgD!J2A(HVT_N@A3B!J)I)O9U1P'D(N(R6B*M9G9D)K(P)O5E-A8A~D(D-H(L)Q!L6F-NVQ3B)ITR8D*D8D'S7C2Bql8G'Jqo!G_F!D83~K@Aig_K*D)Rkf-M.GWU~H~CzN(duS.A0YyQuB0awDtB'XxU)C_J*R_B0EnKOJ6E~C316B*DdY_N)I31'O.Gnn8F*DyJ!S8PqJ-M(P*D008F-E~K9H-EeC_Y5N3B6E*D-*7A~C226D_F-M4C)I3D~H)P8G7F(HYW7F-Exu(K@A(P.O@AlK(O!G~F0GOM6B~C_k@B.N'O7Nhf'O.G)Q5D@A...N~C~K3B_F.mrFpPnA)DuH1NwO@R4WoBnFtOyU~j_N!J.Gmk6E!B2A!J(H7h(X*g9WsSwCyA-M*L@A!!8F@A3B(P-EpC-a-g)Z_htG_hgBtP~j2A9H.Gzx9H@A!J@I)I-K8TsG'D.M4E6B.P-L_J'L.O_L'S'F(P~M9I)E~F8C-M4E5E9Ilg*L.GSQ5A~C~H'S~H(QSN)Q@A.-_K*D4CLG*L~CZX(M*D~L1w2A-E).)N-EwK9VjH'DhFpH3KuU.X@S9N0X.A'N6K)E2GrOKF8G-Elj'O_FHC2A.G.-*I-EKK7E.GqB9Q_W~f*L8G-EEE9G)I'R'R(HcA0JyG.O6E_F~!(K_FRR.N~C4C5D!BpP3JkDyLrRzF3F-M_N)Icb8B~Cpp*K-E(P.O-E8XsHjJ6E8G)IaZ*G_F"
        }
    ————————————————————————————————————————————————————
    示例：
        http://video.duowan.com/?r=mip/GetVideoInfoByVid&vid=111111
    ————————————————————————————————————————————————————
    备注: 
        字段c解密过程：
            function simpleDeCrypt($str){
                $table = str_split('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789@!~*-_.()\'');
                $rawList = array();
                $offsetList = array();
                foreach (array_reverse(str_split($str)) as $k => $v) {
                    $pos = array_search($v, $table);
                    if (intval(($k + 1) % 2) == 1) {
                        $offsetList[] = $pos;
                    } else {
                        $rawPos = intval($pos - $offsetList[($k + 1) / 2 - 1]);
                        @$rawList[] = $table[$rawPos];
                    }
                }
                $raw = str_replace('@', '%', implode('', $rawList));
                return urldecode($raw);
            }

            $vid = 3560938;
            $ret = obj('dwHttp')->get('http://video.duowan.com/?r=mip/getVideoInfoByVid&vid='.$vid);
            if (false === $ret) {
                die('request error');
            }
            $ret = json_decode($ret, 1);
            if (empty($ret)) {
                die('no data');
            }
            $srcData = json_decode(simpleDeCrypt($ret['c']), 1);
            $ret['src'] = $srcData['select']['src'];//此处即可拿到源地址
            var_dump($ret);
    ————————————————————————————————————————————————————








<font color="blue">4、根据专区ID获取标签列表</font>
    ————————————————————————————————————————————————————
    URL:		http://video.duowan.com/?r=mip/GetTagsByChannel
    ————————————————————————————————————————————————————
    参数(get|post):
        channel		专区ID
    ————————————————————————————————————————————————————
    返回(json)：
        [
            "撸圈八卦",
            "撸时代",
            "囧视频",
            "囧图",
            "撸友明星坊",
            "皎月女神黛安娜攻略",
            "皎月女神黛安娜皮肤视频",
            "皎月女神黛安娜视频",
            "皎月女神黛安娜推荐视频",
            "殇之木乃伊阿木木攻略",
            "殇之木乃伊阿木木皮肤",
            "殇之木乃伊阿木木皮肤视频",
            "殇之木乃伊阿木木视频",
            ...
        ]
    ————————————————————————————————————————————————————
    示例：
        http://video.duowan.com/?r=mip/GetTagsByChannel&channel=lol
    ————————————————————————————————————————————————————
    备注: 
        无
    ————————————————————————————————————————————————————






<font color="blue">5、获取常用专区信息列表</font>
    ————————————————————————————————————————————————————
    URL:		http://video.duowan.com/?r=mip/GetUsuallyGames
    ————————————————————————————————————————————————————
    参数(get|post):
        无
    ————————————————————————————————————————————————————
    返回(json)：
        {
            "byChannel": {
                "ycvideo": {
                "game_id": "1907",
                "game_channel": "ycvideo",
                "game_name": "多玩原创",
                "game_cover": "http://s1.dwstatic.com/vhuya/BE/31/be31d3504c2cb9d2eac65af1af191dde4470.jpg",
                "game_url": "http://video.duowan.com/ycvideo/",
                "game_intro": "由多玩原创视频团队出品，推出各类游戏视频周播栏目，涵盖资讯、推荐、娱乐、综艺等游戏内容，并延展推出动画、生活综艺等新型栏目。每周一到周日均有更新。旨在为玩家提供好玩好看的游戏视频节目。\r\n\t\t\t\t\t",
                "channel_alias": "ycvideo"
                },
                "lol": {
                "game_id": "1",
                "game_channel": "lol",
                "game_name": "英雄联盟",
                "game_cover": "http://s1.dwstatic.com/vhuya/6F/85/6f85a9e4f86b054721e8020c7dd8e99e1179.jpg",
                "game_url": "http://video.duowan.com/lol/",
                "game_intro": "《英雄联盟》（简称lol）是由美国Riot Games开发，腾讯游戏运营的英雄对战网游。\r\n\t\t\t\t\t",
                "channel_alias": "lol"
                },
                "df": {
                "game_id": "2",
                "game_channel": "df",
                "game_name": "地下城与勇士",
                "game_cover": "http://s1.dwstatic.com/vhuya/05/8B/058b97f2478e5408446bbf6b15f575e92823.jpg",
                "game_url": "http://video.duowan.com/dnf/",
                "game_intro": "《地下城与勇士》是一款韩国网络游戏公司NEOPLE开发的免费角色扮演2D游戏，由三星电子发行，并于2005年8月在韩国正式发布。由腾讯游戏代理发行。\r\n\t\t\t\t\t",
                "channel_alias": "dnf"
                },
                "kan": {
                "game_id": "1912",
                "game_channel": "kan",
                "game_name": "娱乐",
                "game_cover": "http://s1.dwstatic.com/vhuya/B4/82/b482cbe1100f6ed0f7b5cd22419c95bd1937.jpg",
                "game_url": "http://video.duowan.com/yule/",
                "game_intro": "脑洞大开，捧腹大笑，妈妈再也不用担心我没腹肌。",
                "channel_alias": "yule"
                }
            },
            "byAlias": {
                "dnf": {
                    "game_id": "1936",
                    "game_channel": "vhuyadnf",
                    "game_name": "地下城与勇士",
                    "game_cover": "http://s1.dwstatic.com/vhuya/05/8B/058b97f2478e5408446bbf6b15f575e92823.jpg",
                    "game_url": "http://video.duowan.com/dnf/",
                    "game_intro": "《地下城与勇士》是一款韩国网络游戏公司NEOPLE开发的免费角色扮演2D游戏，由三星电子发行，并于2005年8月在韩国正式发布。由腾讯游戏代理发行。",
                    "channel_alias": "dnf"
                },
                "yule": {
                    "game_id": "1945",
                    "game_channel": "vhuyayule",
                    "game_name": "娱乐",
                    "game_cover": "http://s1.dwstatic.com/vhuya/B4/82/b482cbe1100f6ed0f7b5cd22419c95bd1937.jpg",
                    "game_url": "http://video.duowan.com/yule/",
                    "game_intro": "脑洞大开，捧腹大笑，妈妈再也不用担心我没腹肌。",
                    "channel_alias": "yule"
                },
                "anime": {
                    "game_id": "1904",
                    "game_channel": "vhuyadm",
                    "game_name": "动漫",
                    "game_cover": "http://s1.dwstatic.com/vhuya/27/FE/27febf554cea977db947befd75940f562081.gif",
                    "game_url": "http://video.duowan.com/anime/",
                    "game_intro": "\t\t\t\t\t\r\n\t\t\t\t\t\r\n\t\t\t\t\t",
                    "channel_alias": "anime"
                },
                "sy": {
                    "game_id": "1961",
                    "game_channel": "5253video",
                    "game_name": "多玩手游",
                    "game_cover": "http://s1.dwstatic.com/vhuya/7A/C3/7ac359d4b8c05dec278f0bda997adaad9207.jpg",
                    "game_url": "http://video.duowan.com/sy/",
                    "game_intro": "国内外最新手游预告、试玩，最近有什么好玩的手游，一看便知。",
                    "channel_alias": "sy"
                }
            }
        }
    ————————————————————————————————————————————————————
    示例：
        http://video.duowan.com/?r=mip/GetUsuallyGames
    ————————————————————————————————————————————————————
    备注: 
        byChannel - 以专区ID为键
        byAlias - 以URL关键字为键，例如http://video.duowan.com/kan 的 “kan”
        元数据中各个字段释义
            game_channel - 专区ID
            game_game - 专区显示名
            game_cover - 专区封面
            game_url - 专区链接
            game_url - 专区简介
            channel_alias - 专区链接中的关键字，如http://video.duowan.com/kan 的 “kan”，用来表示专区首页
    ————————————————————————————————————————————————————





</pre>