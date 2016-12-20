! function() {
    $(function() {
        var e = $('[data-role="author"]').text();
        if (e.length) {
            var i = $('[data-role="videoSubWrap"]');
            i.html('<style>.videoSubscribe__arrow{width:10px;height:5px;background-image:url(http://assets.dwstatic.com/project/video-subscribe/img/global.png);background-position:-19px 0;background-repeat:no-repeat}.videoSubscribe__rss{width:14px;height:14px;background-image:url(http://assets.dwstatic.com/project/video-subscribe/img/global.png);background-repeat:no-repeat;background-position:0 0}.videoSubscribe{position:relative}.videoSubscribe.is-subscribed .videoSubscribe__txt{background-color:#929292}.videoSubscribe:hover .videoSubscribe__bubble{display:block}.videoSubscribe__txt{width:75px;height:28px;line-height:28px;border-radius:3px;font-size:14px;font-weight:700;text-align:center;cursor:pointer;color:#fff;background-color:#3b90d2}.videoSubscribe__rss{display:inline-block;*display:inline;*zoom:1;vertical-align:middle;margin:-2px 5px 0 0}.videoSubscribe__bubble{display:none;position:absolute;top:-38px;left:0;padding:8px;font-size:12px;background-color:#f2faff;color:#4f96cd;border:1px solid #4f96cd;box-shadow:0 1px 2px #ddd;line-height:1;white-space:nowrap;word-wrap:normal}.videoSubscribe__arrow{position:absolute;bottom:-5px;left:20px}</style> <div class="videoSubscribe" data-role="videoSub"><div class="videoSubscribe__txt"><i class="videoSubscribe__rss"></i>订阅</div><div class="videoSubscribe__bubble">喜欢TA的视频，那就订阅吧！<span class="videoSubscribe__arrow"></span></div></div>').promise().done(function() {
                var i = $('[data-role="videoSub"]'),
                o = $('[data-role="articleTags"]').find("a"),
                s = $('[data-role="articleId"]').val(),
                t = "",
                a = location.host,
                b = a.substring(0, a.indexOf("."));
                switch (b) {
                case "lol":
                    $("<style>#video #video-play .tags {padding-top: 10px;clear: both;}.videoSubWrap {float: left;padding-left: 15px;}.bdsharebuttonbox {padding-top: 5px;}</style>").appendTo("body");
                    break;
                case "dnf":
                    b = "df",
                    $("<style>.videoSubWrap {margin: 20px 0 0 9px;}.videoSubscribe__bubble{box-shadow: none;}</style>").appendTo("body");
                    break;
                case "wot":
                    $("<style>.videoSubWrap {margin-top: 15px;}</style>").appendTo("body")
                }
                o.length ? ($.each(o,
                function() {
                    t += $(this).text() + ","
                }), t = t.substring(0, t.length - 1)) : t = "",
                i.find(".videoSubscribe__txt").hover(function() {
                    $(this).next(".videoSubscribe__bubble").show()
                },
                function() {
                    $(this).next(".videoSubscribe__bubble").hide()
                });
                var r = {
                    _setSubBtn: function() {
                        i.addClass("is-subscribed").html('<div class="videoSubscribe__txt">已订阅</div>')
                    },
                    _checkSub: function() {
                        var i = this,
                        o = "http://huodong.duowan.com/videoSubscribe?r=subscribe/raags&articleid=" + s + "&author=" + e + "&channelid=" + b + "&tags=" + t,
                        a = $.ajax({
                            type: "post",
                            timeout: 5e3,
                            url: o,
                            dataType: "jsonp",
                            jsonp: "callback",
                            success: function(o) {
                                var s = o.code,
                                t = o.data;
                                switch (s) {
                                case 0:
                                    $.each(t,
                                    function(o, s) {
                                        s.author == e && i._setSubBtn()
                                    });
                                    break;
                                case - 1 : var a = $(".dw-topbar-subscribe__tips");
                                    a.length && a.removeClass("is-hidden")
                                }
                            },
                            complete: function() {
                                a = null
                            },
                            error: function() {
                                a.abort()
                            }
                        })
                    },
                    _subBtnAction: function() {
                        var o = this;
                        $(document).on("click", ".videoSubscribe__txt",
                        function(s) {
                            var a = $(s.target).parent().attr("class").indexOf("is-subscribed");
                            if (0 > a) {
                                var r = encodeURI("http://huodong.duowan.com/videoSubscribe?r=subscribe/subsc&author=" + e + "&tags=" + t + "&channelid=" + b);
                                $.ajax({
                                    type: "post",
                                    timeout: 5e3,
                                    url: r,
                                    dataType: "jsonp",
                                    jsonp: "callback",
                                    success: function(i) {
                                        var s = i.code;
                                        switch (s) {
                                        case 0:
                                            o._setSubBtn();
                                            break;
                                        case - 1 : alert("您已经订阅过" + e + "的视频啦");
                                            break;
                                        case - 2 : alert("我们与服务器通讯出了点问题，请稍候刷新页面再试！")
                                        }
                                    }
                                })
                            } else {
                                var r = encodeURI("http://huodong.duowan.com/videoSubscribe?r=subscribe/unsubsc&author=" + e);
                                $.ajax({
                                    type: "post",
                                    timeout: 5e3,
                                    url: r,
                                    dataType: "jsonp",
                                    jsonp: "callback",
                                    success: function(e) {
                                        var o = e.code;
                                        switch (o) {
                                        case 0:
                                            i.removeClass("is-subscribed").html('<div class="videoSubscribe__txt"><i class="videoSubscribe__rss"></i>订阅</div><div class="videoSubscribe__bubble">喜欢TA的视频，那就订阅吧！<span class="videoSubscribe__arrow"></span></div>');
                                            break;
                                        case - 1 : alert("我们与服务器通讯出了点问题，请稍候刷新页面再试！")
                                        }
                                    }
                                })
                            }
                        })
                    },
                    _init: function() {
                        this._checkSub(),
                        this._subBtnAction()
                    }
                };
                r._init()
            })
        }
    })
} ();