<?php

/**
 * 核心出错异常类
 * 可以根据DEBUG模式的启用情况，给出常规处理方式。
 * 处理方式：覆盖__construct方法。
 */
class DIException extends Exception {
	
    /**
     * @param string $message 错误信息
     * @param string $errPage 错误页，用来include。当处于处于DI_DEBUG_MODE时，可能会调用。
     * @param array|callable $callback 回调体。如果在回调体中终止程序，则$errPage参数会失效。
     */
	function __construct($message, $errPage=DI_PAGE_503, $callback=NULL, $code=0, $previous=NULL){

        //记录错误日志到文件或数据库
        if (DI_IO_RWFUNC_ENABLE) {
            $time = date('Y-m-d H:i:s');
            $file = DI_LOG_PATH . 'log_' . date('Y-m-d') . '.txt';
            $link = fopen($file, 'a+');
            @$msg = $time . "    {$_SERVER['SERVER_PROTOCOL']}    {$_SERVER['SERVER_NAME']}" . (80==$_SERVER['SERVER_PORT']?'':':'.$_SERVER['SERVER_PORT']) . "{$_SERVER['REQUEST_URI']}    REFERER[{$_SERVER['HTTP_REFERER']}]    REMOTE_ADDR[{$_SERVER['REMOTE_ADDR']}]    REQUEST_METHOD[{$_SERVER['REQUEST_METHOD']}]    $message\r\n";
            fwrite($link, $msg);
        } else {
            //需要提前配置好数据库
        }

        //执行回调
        if (is_callable($callback)) {
            $callback();
        } elseif (is_array($callback) && 2==count($callback) && is_callable($callback[0]) && is_array($callback[1])) {
            call_user_func_array($callback[0], $callback[1]);
        }

		if(DI_DEBUG_MODE){
            parent::__construct($message, $code, $previous);
		}
		else{
    		//这里不继承调用父类构造器，阻止显式抛出异常，这样就不用在每个catch块中进行手动判断DEBUG模式了
            if (is_file($errPage)) {
                include $errPage;
            }
		}
		
	}
	
}

class DIError {
    
}

class DIErrorCode {
    const EXAMPLE = 0x00000001;
}
