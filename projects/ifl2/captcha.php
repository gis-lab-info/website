<?

require('engine/common.inc.php');
include('engine/lib/captcha.lib.php');

$font = array(
	'image'=>'skin/i/captcha_times.png',
	'height'=>20,
	'width'=>array('0'=>12, '1'=>8, '2'=>12, '3'=>11, '4'=>13, '5'=>11, '6'=>12, '7'=>12, '8'=>11, '9'=>12),
	'offset'=>array('0'=>0, '1'=>12, '2'=>20, '3'=>33, '4'=>44, '5'=>57, '6'=>68, '7'=>80, '8'=>92, '9'=>103),
);

$captcha_session_id = captcha_get_session($sql);
captcha_image(captcha_refesh_code($sql, $captcha_session_id), $font, 60, 30);

?>