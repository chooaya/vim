<?php
class PostFormFormat
{
    public function main($input = null)
    {
        $json = json_decode($input,true);
		$code = json_last_error();
		if ($code === JSON_ERROR_NONE) {
            return http_build_query($json, '', '&');
        } else {
			throw new Exception('check error!!');
        }
    }


}

