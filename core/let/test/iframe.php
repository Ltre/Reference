<script>

/* var split = location.search.split('&backdata=');
var callback = decodeURIComponent(split[0]).replace('?callback=', '');
var json = decodeURIComponent(split[1]);
var callArr = callback.split('.');
var callCode = 'parent';
for (var i in callArr) {
    callCode += '["' + callArr[i] + '"]';
}
//alert(callCode + '(' + json + ')');
eval(callCode + '(' + json + ')'); */
</script>






<script>
/* var split = location.search.split('&backdata=');
var callback = decodeURIComponent(split[0]).replace('?callback=', '');
var json = decodeURIComponent(split[1]);
var callArr = callback.split('.');
var callbackFn = parent ;
for (var i in callArr) {
    callbackFn = callbackFn[callArr[i]]||{};
}
callbackFn.call(parent, json); */



(function(){
    var split = location.search.split('&backdata=');
    var callback = decodeURIComponent(split[0]).replace('?callback=', '');
    var json = decodeURIComponent(split[1]);
    var callArr = callback.split('.');
    var callbackFn = parent ;
    for (var i in callArr) {
        callbackFn = callbackFn[callArr[i]]||{};
    }
    callbackFn.call(parent, json);    
})();
</script>