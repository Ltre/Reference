<?php
$shell = 'test/test';
$shellargs = array(
	//1, 'a', 'b', false, ...
);

$request = array(
	$shell . (empty($shellargs)?'':'/') . join('/', $shellargs) => '',
);

$_REQUEST = array_merge($_REQUEST, $request);