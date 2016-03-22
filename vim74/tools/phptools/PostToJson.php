<?php
class PostToJson
{
    public function main($input = null)
    {
        parse_str($input, $output);
        if (is_null($output))
        {
			throw new Exception('check error!!');
        }
        $load_file = __DIR__.'/'.'JsonFormat'.'.php';
        if (!file_exists($load_file))
        {
			throw new Exception('check error!!');
        }
        require_once($load_file);
        $json_format = new JsonFormat();
        return $json_format->main(json_encode($output));
    }
}

