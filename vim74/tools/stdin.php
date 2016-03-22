<?php
if (!isset($argv[1]))
{
    exit(1);
}
$load_file = dirname($argv[0]).'/phptools/'.$argv[1].'.php';
if (!file_exists($load_file))
{
    exit(1);
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
    exit(1);
}
exit(0);
