<?php 
chdir(getenv('DEVPATH'));include_once(getenv('VIM').'/vim74/tools/taste.php');
$all_c_mok = array();
foreach(App::objects('Controller') as $controller) 
{
	App::uses($controller,'Controller');
};
echo 'Controller:';
$all_c = print_r(array_map(function(&$v){return implode(' ',$v);},array_chunk(App::objects('Controller'),6)),true);
echo $all_c;
echo 'Model:';
$all_m = print_r(array_map(function(&$v){return implode(' ',$v);},array_chunk(App::objects('Model'),6)),true);
echo $all_m;
$h_m = "Default_Test_Model:\n  var_dump(ClassRegistry::init('TestModel')->testMethod('test')); \n";
echo $h_m;

function Test_Controller_Function($controller_name,$method_name,$method_args = array())
{
	$controller_ReflectionClass = new ReflectionClass($controller_name);
	$o = $controller_ReflectionClass->newInstance();
	$reflection = new ReflectionObject($o);
	$m = $reflection->getMethod($method_name);
	$m->setAccessible(true);
	return $m->invokeArgs($o, $method_args);
}

function Test_Model_Function($model_name,$method_name,$method_args = array())
{
	$o = ClassRegistry::init($model_name);
	$reflection = new ReflectionObject($o);
	$m = $reflection->getMethod($method_name);
	$m->setAccessible(true);
	return $m->invokeArgs($o, $method_args);
}

$h_m_n = "Test_Model:\n  var_dump(Test_Model_Function('TestModel','testMethod',array('test'))); \n";
echo $h_m_n;

$h_c = "Test_Controller:\n  var_dump(Test_Controller_Function('TestController','testMethod',array('test'))); \n";
echo $h_c;
