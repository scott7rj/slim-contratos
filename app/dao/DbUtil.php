<?php
namespace app\dao;

final class DbUtil {

	public static function prepareNullValue($var) {
		$ret = "'".$var."'";
        if ( is_null($var) or strlen(trim($var)) === 0 )
            $ret = "NULL";
        return $ret;
	}
}