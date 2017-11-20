<?php
class DIRouteRewrite {
    
    /**
     * 自定义路由重写规则
     * 书写原则，特殊在前，通用在后
     * 详见：
     *      DIRoute::rewrite() @ __route.php
     */
    static $rulesMap = array(
        '://doc.yooo.moe' => 'doc/start',
        '://doc.yooo.moe/<X>' => 'doc/start/<X>',
        '://danmucopy.me/' => 'test/test', //含有域名的配置最好放在最前面(经验之谈)
        '://danmu.me/' => 'danmu/start',
        '://iio.ooo/' => 'fm/start',
        
        's' => 'shell.shell',
        's.html' => 'shell.shell',
        
        'doc' => 'doc/start',
        'doc/<var>' => 'doc/start/<var>', //输出说明文档
        
        '<D>' => '<D>/start',
        '<D>.htm' => '<D>/start',
        '<D>.html' => '<D>/start',
        
        '<nums>' => 'test/start/<nums>',
    	
        '<D>/<F>' => '<D>/<F>',
        '<D>-<F>' => '<D>/<F>',
        '<L>.let' => '<L>',
        '<L>.<E>' => '<L>.<E>',
        '<L>.<E>.<T>' => '<L>.<E>.<T>',
    );
    
    /**
     * 不需要重写的
     * 左侧为相对于脚本目录的URI
     * 右侧表示重写失败时是否终止程序
     * 这些规则不受常量DI_KILL_ON_FAIL_REWRITE影响
     */
    static $withoutMap = array(
        'index.php' => false,
        'index.html' => false,
        'index.htm' => false,
        'favicon.ico' => true,
    	'robots.txt' => true,
    );
    
}