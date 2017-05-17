<?php
class JsonFormat
{
    public function main($input = null)
    {
		$input = preg_replace("/,[\s\t\n]*\]/", ']',preg_replace("/,[\s\t\n]*}/", '}',$input));
        $json = json_decode($input);
		$code = json_last_error();
		if ($code === JSON_ERROR_NONE) {
            if (is_string($json))
            {
                $json = json_decode($json);
                $code = json_last_error();
                if ($code !== JSON_ERROR_NONE)
                {
                    throw new Exception('check error!!');
                }
            }
            $encoded_json = str_replace('\\/', '/', json_encode($json));
            $formatted_json = preg_replace_callback( '/\\\\u([0-9a-zA-Z]{4})/', 
                function ($matches) 
                {
                    return mb_convert_encoding(pack('H*',$matches[1]),'UTF-8','UTF-16');
                }
            , $encoded_json);
            return $this->prettyPrint($formatted_json);
        } else {
			throw new Exception('check error!!');
        }
    }


    public function prettyPrint( $json )
    {
        $result = '';
        $level = 0;
        $in_quotes = false;
        $in_escape = false;
        $ends_line_level = NULL;
        $json_length = strlen( $json );

        for( $i = 0; $i < $json_length; $i++ ) {
            $char = $json[$i];
            $new_line_level = NULL;
            $post = "";
            if( $ends_line_level !== NULL ) {
                $new_line_level = $ends_line_level;
                $ends_line_level = NULL;
            }
            if ( $in_escape ) {
                $in_escape = false;
            } else if( $char === '"' ) {
                $in_quotes = !$in_quotes;
            } else if( ! $in_quotes ) {
                switch( $char ) {
                case '}': case ']':
                    $level--;
                    $ends_line_level = NULL;
                    $new_line_level = $level;
                    break;

                case '{': case '[':
                    $level++;
                case ',':
                    $ends_line_level = $level;
                    break;

                case ':':
                    $post = " ";
                    break;

                case " ": case "\t": case "\n": case "\r":
                    $char = "";
                    $ends_line_level = $new_line_level;
                    $new_line_level = NULL;
                    break;
                }
            } else if ( $char === '\\' ) {
                $in_escape = true;
            }
            if( $new_line_level !== NULL ) {
                $result .= "\n".str_repeat( "\t", $new_line_level );
            }
            $result .= $char.$post;
        }

        return $result;
    }
}

