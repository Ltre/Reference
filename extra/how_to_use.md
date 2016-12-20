
一、环绕注入的用法

    对于TestDo::test()，其环绕注入为TestInject::onTest()。
    一般可以在TestInject::onTest()中生成多个Closure，结尾合并为一个数组返回。
    这个返回的数组会自动被系统作为TestDo::test()的最后一个传入参数。
    因此，在环绕注入中编写逻辑并有返回值时，则可在TestDo::test()中执行以下代码：
        $args = func_get_args();
        $on_ret = array_pop($args);//取得环绕注入代码
    注：$on_ret的数据结构以TestInject::onTest()返回值为准。
    
二、临时类创建及实例化

    关于create_class的使用问题：如果要传参给构造，即create_class(...)->newInstance(array(传参)),
    则创建class时必须继承  {已经显示声明空参构造器的类，不一定是DIBase}
    
三、重写__autoload()之后的影响
    
    class_exists($classname)执行时，
        会试图执行__autoload，
        会寻找特定格式名称的类，如XxxDo,XxxModel,XxxFilter等等，
        还会扫描entity目录，
        如果类名在之前定义过了（是执行过程中定义不是写代码时定义），则会报出class redeclare的错误。
    建议指定第二个参数以得到正确结果，如class($classname, false)，
    但代价是以后都不会重新自动加载类。

四、如果定义的Do类不仅是开头大写，而且还是驼峰式的，如何确保控制器能被执行？

    例如在core/do/RootCommon.do.php中定义了class RootCommonDo extends DIDo {}
    根据本框架提供的__autoload()方法，会找到该文件。
    不过如果在LINUX/UNIX下，其文件系统就要区分大小写，这样就不一定能够找到该文件。
    
    假定URL为：?rootcommon/test 在LINUX/UNIX则会找Rootcommon.do.php，结果找不到。
    假定URL为：?rootCommon/test或RootCommon/test，在UNIX/LINUX才能找到RootCommon.do.php
    
    但是，如果定义了这样的类：class RootCommonDo extends DIDo { function tEsT(){}} }
    那么以上的URL即使“/”前面的部分是正确对应的，也不一定能执行到tEsT()方法。
    
    为了高度兼容windows和LINUX/UNIX文件系统，以及避免URL大小写写错导致无法执行的问题，
    建议在urlshell.php中声明这个DO类的确切名称和需要访问的方法名，这些名称的大小写跟类中的大小写全部一致。
    如：class RootCommonDo extends DIDo { function tEsT(){}} }的声明格式如下：
    
    class DIUrlShell {
        static function doshell(){
            return array(
                'RootCommon' => array(
                    'tEsT' => 0, //这里的0就不解释了，详见urlshell.php注释
                ),
            );
        }
    }
    
五、如遇到类加载与本框架的__autoload()冲突，可临时解除强制加载，再重写autoload()。

    例如某库的所有文件都放置在core/exe/somelib目录中，则可新建core/exe/somelib/autoload.php
    <?php
    spl_autoload_unregister('__autoload');//暂时解除自带的强制注册(看情况来决定是否解除，如果新的类名与现有类名不冲突，就不需要解除)
    function somelib_autoload($class_name) {
        $files = glob(DI_EXT_PATH . "somelib/*${class_name}*");
        foreach ($files as &$f) {
            $f = preg_replace(
                array(
                    '/'.str_replace(array('/', '.', '_', '-'), array('\\/', '\\.', '\\_', '\\-'), DI_EXT_PATH).'/',
                    '/\.php/'
                ), 
                '', $f
            );
            import($f);
        }
        //dump($files);//test
        //dump(DIRuntime::getRuntime());//test
    }
    spl_autoload_register('somelib_autoload');
    ?>
    
    在需要使用“somelib”库之前，执行import('somelib/autoload')导入即可。
    
六、备用的路由GET参数

    在HTML表单提交时，如果使用的是形如"http://danmu.me/?audio/parse5sing/1"的URL，可能需要作一些手动的参数处理才能正确提交。
    本框架提供了一个备用的路由参数，用于指定所使用的命令(shell)。
    该参数名默认为"x"，其配置位于 DI_ROUTE_GET_PARAM_NAME @ core/base/__env.php。
    如需自定义，请在core/config/define.php中重新定义：
        define('DI_ROUTE_GET_PARAM_NAME', 'your_param_name');
    这样就可以用"http://danmu.me/?your_param_name=audio/parse5sing/1"代替原URL了
    注意：对于URL“http://danmu.me/test.upload”，其转化为常规URL时为“http://danmu.me/x=test_upload”

七、受保护的XxxDo::func()，如果其某些参数设定了默认值，则没有环绕注入时，不会把环绕functions的空数组注入到XxxDo::func()的参数表中。
	即：
	使用受保护XxxDo::func()时，如果参数表有默认值，则应将有默认值的参数置于尾部，并且不要使用环绕注入。
	
八、使用Do模块级注入(过滤)
	例如TestDo需要对其所有方法过滤，则需在TestInject中编写doInject()方法即可，不用指定doInject的参数。
	
九、使用tpl()输出随意模板
	该特性可以帮助开发人员使用自定义模板，用法详见anyTpl() @ Test.do.php。