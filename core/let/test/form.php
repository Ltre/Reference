<html>
<head>
<title>upload</title>
<script>
//保存在父页的存根方法
window.MyFuncs = {
    test : function(json){
        console.log(json);
    }
};
</script>
</head>
<body>
<!-- <form enctype="multipart/form-data" method="post" action="http://sidebartest.webdev.duowan.com/?r=api/UploadCmntImg" target="TTT"> -->
<!-- <form enctype="multipart/form-data" method="post" action="http://sidebar.v.huya.com/?r=api/TestUploadCmntImg" target="TTT"> -->
<form enctype="multipart/form-data" method="post" action="http://sidebar.v.huya.com/?r=api/UploadCmntImg" target="TTT">
<input type="file" id="img" name="img"><br>
<input type="hidden" name="redirect" value="http://reference.webdev.duowan.com/core/let/test/iframe.php">
<input type="hidden" name="callback" value="MyFuncs.test">
<input type="submit">
</form>
<iframe name="TTT" src="about:blank">

</iframe>
</body>



















<!-- 以下代码作废 -->
<script src="http://www.duowan.com/assets/js/jquery.js"></script>
<script src="http://hvadmin.webdev.duowan.com/static/js/jquery.form.js"></script>
<script type="text/javascript">

$('form').submit(function(){
    /* var options = {
        //url : 'http://sidebartest.webdev.duowan.com/?r=api/UploadCmntImg',
        url : 'http://sidebar.v.huya.com/?r=api/UploadCmntImg',
        async : false,
        iframe: true,
        type : 'POST',
        dataType: 'script',
        success : function(json) {
            console.log(json);
        },
        error : function(err, err1, err2, err3) {
            console.log([err, err1, err2, err3]);
            alert('图片上传失败!');
        }
    };
    $(this).ajaxSubmit(options); */


    /* var formData = new FormData();
    var yourFileObj = $('#img').get(0);
    formData.append("img", yourFileObj.files[0]);
    console.log([formData, yourFileObj]);

    $.ajax({
        url: 'http://sidebartest.webdev.duowan.com/?r=api/UploadCmntImg',
        type: 'POST',
        data: formData,
        cache: false,
        success: function(response) {
            //do something with response
        },
        error: function(){
            alert('出错');
        }
    });
    */
    
    //return false; 
});
</script>

</html>