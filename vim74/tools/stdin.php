<?php
if (!isset($argv[1]))
{
    return;
}
$load_file = dirname($argv[0]).'/phptools/'.$argv[1].'.php';
if (!file_exists($load_file))
{
    return;
}
$all_line = ""; 
while (false !== ($line = fgets(STDIN))) {
    $all_line = $all_line . $line;
}
require_once($load_file);
try {
    $controller_ReflectionClass = new ReflectionClass($argv[1]);
    $o = $controller_ReflectionClass->newInstance();
    $reflection = new ReflectionObject($o);
    $m = $reflection->getMethod("main");
    echo $m->invokeArgs($o, array($all_line));
} catch (Exception $e) {
    return;
}
