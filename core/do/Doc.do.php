<?php
class DocDo extends DIDo {
    
    //需要启用重写规则：'doc/<var>' => 'doc/start/<var>',
    function start($key = null){
        $map = $GLOBALS['docMap'];
        if (null === $key) {
            $this->map = $map;
            $this->stpl();
        }
        
        foreach ($map as $k => $doc) {
            if (! strcasecmp($key, $k)) {
                $f = @$GLOBALS['docMap'][$k][0];
                file_exists($f) || die('param err');
                $s = '<pre>' . file_get_contents($f) . '</pre>';
                header('Content-type:text/html; charset=utf-8');
                print $s;
                break;
            }
        }
    }
    
}