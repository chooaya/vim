<?php 
chdir(getenv('DEVPATH'));include_once(getenv('VIM').'/vim74/tools/taste.php');
$all_c_mok = array();
foreach(App::objects('Controller') as $controller) 
{
	App::uses($controller,'Controller');
};
if (!isset($DISPLAY_ALL_CAKE_HELP_INFO)) echo 'Controller:';
$all_c = print_r(array_map(function(&$v){return implode(' ',$v);},array_chunk(App::objects('Controller'),6)),true);
if (!isset($DISPLAY_ALL_CAKE_HELP_INFO)) echo $all_c;
if (!isset($DISPLAY_ALL_CAKE_HELP_INFO)) echo 'Model:';
$all_m = print_r(array_map(function(&$v){return implode(' ',$v);},array_chunk(App::objects('Model'),6)),true);
if (!isset($DISPLAY_ALL_CAKE_HELP_INFO)) echo $all_m;
$h_m = "Default_Test_Model:\n  var_dump(ClassRegistry::init('TestModel')->testMethod('test')); \n";
if (!isset($DISPLAY_ALL_CAKE_HELP_INFO)) echo $h_m;

function Test_Controller_Function($controller_name,$method_name,$method_args = array(),$set_object_property = array())
{
	try {
		$controller_ReflectionClass = new ReflectionClass($controller_name);
		$o = $controller_ReflectionClass->newInstance();
		$reflection = new ReflectionObject($o);
		if (!empty($set_object_property))
		{
			foreach ($set_object_property as $property_name => $value) {
				try {
					$property = $reflection->getProperty($property_name);
					$property->setAccessible(true);
					$property->setValue($o, $value);
				} catch (Exception $e) {
					$o->$property_name = $value;
				}
			}
		}
		$m = $reflection->getMethod($method_name);
		$m->setAccessible(true);
		return $m->invokeArgs($o, $method_args);
	} catch (Exception $e) {
		App::uses($controller_name, 'Console/Command');	
		$controller_ReflectionClass = new ReflectionClass($controller_name);
		$o = $controller_ReflectionClass->newInstance();
		$reflection = new ReflectionObject($o);
		if (!empty($set_object_property))
		{
			foreach ($set_object_property as $property_name => $value) {
				try {
					$property = $reflection->getProperty($property_name);
					$property->setAccessible(true);
					$property->setValue($o, $value);
				} catch (Exception $e) {
					$o->$property_name = $value;
				}
			}
		}
		$m = $reflection->getMethod($method_name);
		$m->setAccessible(true);
		return $m->invokeArgs($o, $method_args);
	}
}

function Test_Model_Function($model_name,$method_name,$method_args = array())
{
	$o = ClassRegistry::init($model_name);
	$reflection = new ReflectionObject($o);
	$m = $reflection->getMethod($method_name);
	$m->setAccessible(true);
	return $m->invokeArgs($o, $method_args);
}
function Test_Set_Object_Property($obj,$property_name,$value)
{
	$reflectionClass = new ReflectionClass(get_class($obj));
	$property = $reflectionClass->getProperty($property_name);
	$property->setAccessible(true);
	$property->setValue($obj, $value);
	return $obj;
}
function Test_Get_Object_Property($obj,$property_name)
{
	$reflectionClass = new ReflectionClass(get_class($obj));
	$property = $reflectionClass->getProperty($property_name);
	$property->setAccessible(true);
	return $property->getValue($obj);
}
function Test_Object_Function($obj,$method_name,$method_args = array())
{
	$reflection = new ReflectionObject($obj);
	$m = $reflection->getMethod($method_name);
	$m->setAccessible(true);
	return $m->invokeArgs($obj, $method_args);
}
$h_m_n = "Test_Model:\n  var_dump(Test_Model_Function('TestModel','testMethod',array('test'))); \n";
if (!isset($DISPLAY_ALL_CAKE_HELP_INFO)) echo $h_m_n;
$h_o_n = "Test_Object_Function:\n  var_dump(Test_Object_Function(obj,'testMethod',array('test'))); \n";
if (!isset($DISPLAY_ALL_CAKE_HELP_INFO)) echo $h_o_n;
$h_o_s_p = "Test_Set_Object_Property:\n  var_dump(Test_Set_Object_Property(obj,'property_name',value)); \n";
if (!isset($DISPLAY_ALL_CAKE_HELP_INFO)) echo $h_o_s_p;
$h_o_g_p = "Test_Get_Object_Property:\n  var_dump(Test_Get_Object_Property(obj,'property_name')); \n";
if (!isset($DISPLAY_ALL_CAKE_HELP_INFO)) echo $h_o_g_p;

$h_c = "Test_Controller:\n  var_dump(Test_Controller_Function('TestController','testMethod',array('test'),set_object_property)); \n";
if (!isset($DISPLAY_ALL_CAKE_HELP_INFO)) echo $h_c;
if (!isset($DISPLAY_ALL_CAKE_HELP_INFO)) echo 'TO CLEAR HELP INFO,TRY "$DISPLAY_ALL_CAKE_HELP_INFO = false;" ';

