<?

class html
{
	function start($title=false, $path=false)
	{
        global $is_login;
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="content-type" content="text/html; charset=windows-1251"/>
    <title>OpenIFL</title>
	<link href="skin/style.css" type="text/css" rel="stylesheet"/>
	<!--[if IE]><link href="skin/style_ie.css" type="text/css" rel="stylesheet"></link><![endif]-->
	<link rel="shortcut icon" href="favicon.png" type="image/png">
	<link rel="icon" href="favicon.png" type="image/png">
</head>
<body id="body">

<div id="auth">
<?

if(!$is_login)
    echo '<a href="login.php">Login</a> <a href="register.php">Register</a>';
else
{
    echo '<span>Welcome &#151; '.$users->get_user_name($users->info['id']).'!</span>';
    echo '<a href="logout.php">Logout</a>';
}

?>    
</div>

<div id="head">
    <h1>OpenIFL</h1>
    <p>Open Intact Forest Landscapes</p>
</div>

<div style="padding:0 25px; font:normal 11px Arial; color:#999;">To add comment zoom and center the map on the spot you would like to comment on, click on "add your comment" and "add marker", keep adding markers until you are done.</div>

<div id="menu">
    <a id="menu_1" href="javascript:toggle_comment_panel()">Add your comment</a> 
    <a id="menu_2" href="javascript:toggle_changes_panel()">Recent changes</a>      
</div>

<?

        if($title !== false) echo '<h1>'.$title.'</h1>'; 

        if($path !== false)
        {
            echo '<p id="path">';
            foreach($path as $value)
            {
                list($name, $url) = explode('|', $value);
                echo '<span><a href="'.$url.'">'.$name.'</a>&#160;/ </span>';
            }
            echo '&#160;</p>';
        }
	}

	function stop()
	{
?>

<div id="bottom">
    <a href="#">About project</a> |
    <a href="#">Terms of use</a>
</div>
<div id="gislab">
	<p align="right">Created in <a href="http://gis-lab.info/index-eng.html"><img src="/images/gis-lab-button.gif" alt="GIS-Lab" width="88" height="31" align="right" /></a></p>
</div>

  </body>
</html>

<?
	}

	function form_start($url, $action, $id='', $is_form_check=true)
	{
		if($is_form_check)
			echo '<form class="form" enctype="multipart/form-data" name="dialog_form" action="'.$url.'" method="post" onsubmit="return check(dialog_form);">';
		else
			echo '<form class="form" enctype="multipart/form-data" name="dialog_form" action="'.$url.'" method="post">';
		echo '<script language="JavaScript" type="text/javascript" src="engine/check.js"></script>';
		echo '<script language="JavaScript" type="text/javascript" src="engine/popup.js"></script>';
		echo '<input type="hidden" name="action" value="'.$action.'"/>';
		if($id!='') echo '<input type="hidden" name="id" value="'.$id.'"/>';
		echo '<table class="border"><tr><td class="block">';
	}

	function form_actions()
	{
		echo '</td></tr></table><table><tr><td class="actions">';
	}

	function form_add_action($label, $icon='')
	{
		if($icon=='')
			echo '<input type="submit" value="'.$label.'"/> ';
		else
			echo '<input type="image" src="i2/b/'.$icon.'" value="'.$label.'"/> ';
	}

	function form_stop()
	{
		echo '</td></tr></table></form>';
	}

	function form_add_string($var, $label, $value, $size=0, $is_not_empty=false)
	{
		if($size!=0) $str = ' size="'.$size.'"'; else $str = ' class="w"';
		echo '<div><label for="'.$var.'">'.(($is_not_empty)?'<span>*</span> ':'').''.$label.'</label><input class="text" type="text" id="'.$var.'" name="'.$var.'" value="'.@str2input($value).'" '.$str.'/></div>';
	}

	function form_add_password($var, $label, $value, $size=0, $is_not_empty=false)
	{
		if($size!=0) $str = ' size="'.$size.'"'; else $str = ' class="w"';
		echo '<div><label for="'.$var.'">'.(($is_not_empty)?'<span>*</span> ':'').''.$label.'</label><input type="password" name="'.$var.'" value="'.@str2input($value).'" '.$str.'/></div>';
	}

	function form_add_datetime($var, $label, $value, $size=25)
	{
		echo '<div><label for="'.$var.'">'.$label.'</label><input type="text" name="'.$var.'" value="'.@date('j.m.Y H:i', $value).'" size="'.$size.'"/></div>';
	}

	function form_add_date($var, $label, $value, $size=25)
	{
		echo '<div><label for="'.$var.'">'.$label.'</label><input type="text" name="'.$var.'" value="'.@date('j.m.Y', $value).'" size="'.$size.'"/></div>';
	}

	function form_add_file($var, $label, $value, $size=20, $is_not_empty=false)
	{
		echo '<div><label>'.(($is_not_empty)?'<span>*</span> ':'').''.$label.'</label><table><tr><td><input '.(@($value!='')?'checked ':'').'type="checkbox" name="is_'.$var.'"/></td><td><input type="file" name="'.$var.'" onchange="if('.$var.'.value!=\'\') is_'.$var.'.checked=true;" size="'.$size.'"/></td></tr></table></div>';
	}

	function form_add_text($var, $label, $value, $size=0, $wrap=false, $is_not_empty=false)
	{
		if($size!=0) $str = ' rows="'.$size.'" class="w"'; else { $str=' rows="5" class="w"'; $size=5; }
		echo '<div><label><a id="'.$var.'_l" href="javascript:;" onclick="var e=document.getElementById(\''.$var.'\');var l=document.getElementById(\''.$var.'_l\');if(e.rows=='.$size.') { e.rows=20;l.innerHTML=\'<img align=absmiddle src=skin/i/close.gif>\'; } else { e.rows='.$size.';l.innerHTML=\'<img align=absmiddle src=skin/i/open.gif>\'; }"><img align=absbottom src=skin/i/open.gif></a> '.$label.(($is_not_empty)?'<span>*</span> ':'').'</label><textarea '.($wrap?'wrap="off" ':'').'name="'.$var.'" id="'.$var.'" cols="80"'.$str.'>'.$value.'</textarea></div>';
	}

	function form_add_ill($var_image, $var_text, $label, $value_image, $value_text)
	{
		echo '<div>';
		if($label!='') echo '<label>'.$label.'</label>';
		echo '<table><tr><td><input type="checkbox" name="is_'.$var_image.'" '.@(($value_image!='')?'checked':'').'/></td><td>';
		echo '<input type="file" name="'.$var_image.'" onchange="if('.$var_image.'.value!=\'\') is_'.$var_image.'.checked=true;" size="10"/></td><td>&#160;';
		echo '<input type="text" name="'.$var_text.'" value="'.@str2input($value_text).'" size="30"/></td></tr></table></div>';
	}

	function form_add_ill_h($var_image, $var_text, $label, $value_image, $value_text)
	{
		echo '<div><table><tr>';
		if($label!='') echo '<td><label>'.$label.'&#160;&#160;</label></td>';
		echo '<td><input type="checkbox" name="is_'.$var_image.'" '.@(($value_image!='')?'checked':'').'/></td><td>';
		echo '<input type="file" name="'.$var_image.'" onchange="if('.$var_image.'.value!=\'\') is_'.$var_image.'.checked=true;" size="10"/></td><td>&#160;';
		echo '<input type="text" name="'.$var_text.'" value="'.@str2input($value_text).'" size="30"/></td></tr></table></div>';
	}

	function form_add_variable($var, $value)
	{
		echo '<input type="hidden" name="'.$var.'" value="'.$value.'"/>';
	}

	function form_add_select($var, $label, $value, $data)
	{
		echo '<div><label>'.$label.'</label><select name='.$var.'>';

		foreach($data as $row)
			echo '<option '.(($row['id']==$value)?'selected ':'').'value='.$row['id'].'>'.$row['title'].'</option>';

		echo '</select></div>';
	}

	function form_add_bool($var, $label, $value)
	{
		echo '<div><table><tr><td><input type="checkbox" id="'.$var.'" name="'.$var.'" '.@(intval($value)?'checked':'').'/></td><td><label for="'.$var.'">'.$label.'</label></td></tr></table></div>';
	}

	function form_add_captcha($label, $captcha_id)
	{
		echo '<div><label>'.$label.'</label>';
        echo '<script>r = Math.random(); document.write("<img align=\'absmiddle\' src=\'captcha.php?captcha='.$captcha_id.'&"); document.write(r); document.write("\'/>");</script><noscript><img align=\'absmiddle\' src="captcha.php?captcha='.$captcha_id.'&'.mt_rand().'"/></noscript>';
		echo '<input type="text" name="captcha_code" size="10"/></div>';
	}

	function form_add_div($label)
	{
		echo '<div class="divider">'.$label.'</div>';
	}

	function form_check_start() { echo '<script>function check(form){'; }
	function form_check_stop() { echo 'return true;}</script>'; }

	function form_check_add_no_empty($var, $label)
	{
		echo 'if(!checkNoEmpty(form.'.$var.', "'.$label.'")) return false;';
	}

	function form_check_add_length($var, $label, $length)
	{
		echo 'if(!checkLength(form.'.$var.', "'.$label.'", '.$length.')) return false;';
	}

	function add_image_popup($path, $title, $is_scroll=false, $is_resize=false)
	{
		$temp = pathinfo($path);

		$full_path = $temp['dirname'].'/full_'.$temp['basename'];

		list($width, $height, $type, $attr) = @getimagesize($path);

		$add_url = '';
		if(is_file($full_path))
		{
			$add_url = '&full='.urlencode($full_path);
		}

		if(($width<900) && ($height<700)) $is_scroll = false;

		echo '<a href="#" onclick="window.open('."'show.php?file=".urlencode($path).$add_url."&title=".urlencode($title)."', '', 'toolbar=0,menubar=0,scrollbars=".intval($is_scroll).",resizable=".intval($is_resize).",width=".$width.",height=".($height+(($title!='')?30:0)+(($add_url!='')?30:0))."');".' return false;">';
	}

	function pager_get_current($count, $page_size)
	{
		$pages = round($count/$page_size);
		$current_page = 0;
		if(@isset($_GET['p'])) $current_page = intval($_GET['p']);
		if($current_page>$pages) $current_page=0;
		return $current_page;
	}

	function pager_html($current_page, $count, $page_size, $extra='')
	{
		$pages = ceil($count/$page_size);
		if(($pages>1) && ($count>1) && ($page_size>0))
		{
			?><div class="pager"><?
			for($i=0; $i<$count/$page_size; $i++)
			{
				if($i!=$current_page)
				{ ?>
				<a href="?p=<?= $i ?><?= ($extra!='')?'&'.$extra:'' ?>"><?= $i+1 ?></a>
				<? }
				else
				{ ?><span><?=$i+1?></span><? }
			}
			?></div><?
		}
	}

	function action($url, $icon, $name, $confirm_question='')
	{
		echo ' <a class="act"';
		if($confirm_question != '')	echo 'href="#" onclick="if(confirm(\''.$confirm_question,'\')) window.location.href=\''.$url.'\'"';
			else echo 'href="'.$url.'"';
		echo '><img src="skin/i/'.$icon.'.gif" title="'.$name.'" align="absmiddle"/></a> ';
	}

	function form_geo($var_lat, $var_lon, $label, $value_lat, $value_lon, $value_zoom)
	{
		global $config;
		$e_id = $var_lat.'_'.$var_lon;
		echo '<script type="text/javascript" src="engine/geo.js"></script>';
		echo '<div><label>'.$label.'</label>';
		echo '<input id="'.$var_lat.'" type="text" name="'.$var_lat.'" value="'.@floatval($value_lat).'" size="10"/> ';
		echo '<input id="'.$var_lon.'" type="text" name="'.$var_lon.'" value="'.@floatval($value_lon).'" size="10"/> ';
		echo '<a id="action_label_'.$e_id.'" style="font-size:0.7em" href="javascript:form_geo(\''.$e_id.'\', '.@floatval($value_lat).', '.@floatval($value_lon).', \''.$var_lat.'\', \''.$var_lon.'\', '.$value_zoom.')">Показать на карте</a><br/>';
		echo '<div id="map_block_'.$e_id.'" style="display:none;margin-top:3px;"></div></div>';
	}
}

function out() { location('index.php'); }

?>