<?php

goto SUBSC;


// ----------------------------------------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------------------------------------

SUBSC://测试订阅

$_SERVER['REQUEST_URI'] = '?r=subscribe/subsc';
$_SERVER['REQUEST_URI'] .= '&' . http_build_query(array(
	'author' => '这是作者',
    'channelid' => 'lol',
    'tags' => '撸啊撸',
));
$_COOKIE['yyuid'] = '50014545';
$_SERVER['REQUEST_URI'] .= '&username=fangkunbiao&osinfo=450206885278da8f75e63419b642b2ecf1822886&web_ver=0&oauthCookie=A34DAF02F51F672DAD35AE25DD0652F25F2B9B4F4A3A28F3F2B2518C10DD5D22C05DBD843FC313730067BEECA385233B44DE857D6BA23D1C1E615CF82A50DB38DF3485E7B995B6F5A33EFF76A8A0EA98B05AAB02AC163C618A51CC0B078D6B6FD9252BD819809726C1A65D3CAA232CEA5475B9182DED48424B43B90317FE454591B4408D3D37360932D22A521473053BB46C5DEF8D567825B4F8A7B8BAE601F4D8662045B4E4452CA4FC0BE7017E335A6434C5D82B43D0F428CDDA56EC4C4029CF4280AF1B9473A21385B7AA27E3F6F45F077DB8B8779279C77D5410D0CA0DEB&g_cid=lol&yyuid=975265212&password=38fc1d354ae67dee60b36334d52041455a48428b&g_appid=1&app_ver=17&d_uuid=359250050539707';
parse_str($_SERVER['REQUEST_URI'], $_GET);
$_GET['r'] = "open/paygift";
$_SERVER['HTTP_USER_AGENT'] = 'test';
$_SERVER['HTTP_HOST'] = 'vsub.webdev.duowan.com';

return;

// ----------------------------------------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------------------------------------
