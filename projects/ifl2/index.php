<?

require_once('engine/common.inc.php');

function escapejs($value) { return str_replace('&amp;', '&', addcslashes(str2text($value), "\0..\37'`\"")); }

switch($action)
{
    default:
        $html->start();
        
        ?><style>#page { margin:0; }</style><?
        
        echo '<div id="map" style="width:100%;height:540px;"></div>';
        echo '<script type="text/javascript">var map = assign_map(\'map\', 25, 5, 2, true);</script>';
        
?>
<script>
var p = map.getCenter();
var currentLat = p.lat();
var currentLon = p.lng();
var currentZoom = map.getZoom();

function updateAddCommentURL()
{
    document.getElementById('add_comment').href = 'comment.php?action=insert' +
        '&lat=' + currentLat +
        '&lon=' + currentLon +
        '&zoom=' + currentZoom;
}

GEvent.addListener(map, "moveend", function() {
    var p = map.getCenter();
    currentLat = p.lat();
    currentLon = p.lng();
    updateAddCommentURL();
});
        
GEvent.addListener(map, "zoomend", function() {
    currentZoom = map.getZoom();
    updateAddCommentURL();
});

function addCommentMarker(id, lat, lon, title, author)
{
    var marker = new GMarker(new GLatLng(lat, lon), { icon:treeIcon, title:title });    
    GEvent.addListener(marker, "click", function() {
        var html = "<div class=\"popup\"><h1>" + title + "</h1><p class=\"author\">by " + author + "</p><p class=\"more\"><a href=\"comment.php?action=show&id=" + id + "\">Show details</p></div>";
        map.openInfoWindowHtml(new GLatLng(lat, lon), html);
    });
    map.addOverlay(marker);
}
<?        
        foreach($sql->get('*', DB.'comment order by datetime_stamp desc') as $row)
        {
            if($row['user_id'] == 0)
                $user_name = text($row['signature']);
            else
                $user_name = text($users->get_user_name($row['user_id']));
            
            echo 'addCommentMarker('.$row['id'].', '.$row['lat'].', '.$row['lon'].', \''.escapejs(text($row['title'])).'\', \''.escapejs(text($user_name)).'\');'."\r\n"; 
        }
?>
</script>
<?        
        $html->stop();
        break;
?>

<script type="text/javascript">
//<![CDATA[

//]]>
</script>

<div style="margin:15px 25px;">

<div id="panel_changes" style="display:none;float:left;width:270px;height:500px;margin-right:20px;">
<?
$html->form_start('index.php', 'insert_post'); ?>

<div style="border:1px solid #CCC;width:100%;height:430px;overflow-y:scroll;">
    <div id="changes" style="padding:5px 0;"></div> 
    
</div>

<?                     
$html->form_actions();
echo '<input type="button" value="Close" onclick="toggle_changes_panel()"/>';
echo '<input type="button" value="Refresh" onclick="loadChanges()"/>';
$html->form_stop();
 ?>        
</div>

<div id="panel_comment" style="display:none;float:left;width:270px;height:500px;margin-right:20px;">

<?

//echo '<p style="font:bold 14px Arial;padding-bottom:5px;margin-bottom:8px;border-bottom:solid 1px #CCC;">New comment</a></p>';

//<div><label for="markers"><span class="mark">*</span>Markers <span style="margin-left:127px;"><a href="javascript:addMarker()">Add marker</a> | <a href="javascript:clearMarkers()">Clear</a></span></label>
//    <select style="width:270px" size="3" d="markers" name="markers"></select></div>

?>
<form class="form" enctype="multipart/form-data" name="dialog_form" action="index.php" method="post" onsubmit="prepareCommentSubmit();return check(dialog_form);">

<script language="JavaScript" type="text/javascript" src="engine/check.js"></script>
<script language="JavaScript" type="text/javascript" src="engine/popup.js"></script>
<input type="hidden" name="action" value="insert_comment_post"/>

<table class="border"><tr><td class="block">

<script>function check(form){return true;}</script>

<div><label for="title"><span class="mark">*</span>Title</label><input type="text" style="width:270px" id="title" name="title"/></div>
<div><label for="description">Comment</label><textarea style="width:270px" rows="15" id="description" name="description"></textarea></div>
<div><label for="markers"><span class="mark">*</span>Markers <span style="margin-left:127px;"><a href="javascript:addMarker()">Add marker</a> | <a href="javascript:clearMarkers()">Clear</a></span></label>
    <select style="width:270px" size="3" id="markers" name="markers"></select></div>
<div><label for="signature"><span class="mark">*</span>Name/nickname</label><input type="text" style="width:270px" id="signature" name="signature"/></div>
<div><label for="email">E-mail (not shown, enter if you want to be replied)</label><input type="text" style="width:270px" id="email" name="email"/></div>

<input type="hidden" id="markers_text" name="markers_text"/>
<input type="hidden" id="position_text" name="position_text"/>

</td></tr></table>

<table><tr><td class="actions">

<input type="submit" value="Add comment"/>
<input type="button" value="Close" onclick="toggle_comment_panel()"/>

</td></tr></table>

</form>

</div>

<div id="panel_map" style="width:900px;height:500px;float:left;"></div>
<script>initialize()</script>

<div style="clear:both"></div>

</div>

<?

        if(@$_GET['show_changes'] == 1) echo '<script>toggle_changes_panel();</script>';

        $html->stop();
        break;
    
    case 'insert_comment_post':

        $vars = $_POST;
        $files = $_FILES;
        
        $user_id = $users->info['id'];
        
        $temp = explode("\t", str_replace(',', '.', $vars['position_text']));
        $lat = floatval($temp[0]);
        $lon = floatval($temp[1]);
        $zoom = floatval($temp[2]);
        
        $sql->insert(array(
            'title'=>$sql->ts($vars['title']),
            'description'=>$sql->ts($vars['description']),
            'datetime_stamp'=>$sql->i(time()),
            'user_id'=>$sql->i($user_id),
            'signature'=>$sql->s($vars['signature']),
            'email'=>$sql->s($vars['email']),
            'lat'=>$sql->f($lat),
            'lon'=>$sql->f($lon),
            'zoom'=>$sql->f($zoom),
        ), DB.'comment');
        
        $comment_id = $sql->get_last_id();
        
        foreach(explode("\r\n", trim($vars['markers_text'])) as $row)
        {
            $temp = explode("\t", str_replace(',', '.', $row));
            $marker_id = intval($temp[0]);
            $lat = floatval($temp[1]);
            $lon = floatval($temp[2]);
            
            $sql->insert(array(
                'comment_id'=>$sql->i($comment_id),
                'marker_id'=>$sql->i($marker_id),
                'lat'=>$sql->f($lat),
                'lon'=>$sql->f($lon),
            ), DB.'comment_point');
        }
        
        location('index.php?show_changes=1');
        break;
        
    case 'changes':
    
        echo 'var e_changes = document.getElementById("changes"); var changes_html = \'\';';
        
        foreach($sql->get('*', DB.'comment order by datetime_stamp desc') as $row)
        {
?>            
function showComment<?= $row['id'] ?>()
{
    map.setCenter(new GLatLng(<?= $row['lat'] ?>, <?= $row['lon'] ?>), <?= $row['zoom'] ?>);
    map.clearOverlays();
<? foreach($sql->get('*',  DB.'comment_point', 'comment_id='.$sql->i($row['id'])) as $point) { ?>
     map.addOverlay(createMarker(new GLatLng(<?= $point['lat'] ?>, <?= $point['lon'] ?>), <?= $point['marker_id'] ?>));
<? } ?>
}
<?            
            echo 'changes_html += \'<div style="font:normal 11px Arial;padding:8px 10px;"><a href="javascript:showComment'.$row['id'].'()"><b style="font:bold 12px Arial;">'.str_replace('&amp;', '&', addcslashes(str2text($row['title']), "\0..\37'`\"")).'<\/b><\/a><br\/>'.str_replace('&amp;', '&', addcslashes(str2text($row['description']), "\0..\37'`\"")).'</div>\';';
        }
        
        echo 'e_changes.innerHTML = changes_html;';
        break;

    case 'get_changes':
        $items = array();
        foreach($sql->get('*', DB.'comment order by datetime_stamp desc') as $row)
        {            
            $points = array();
            foreach($sql->get('*', DB.'comment_point', 'comment_id='.$sql->i($row['id']).' order by marker_id') as $point)
                $points []= '['.escapejs($point['lat']).','.escapejs($point['lon']).']';   
            $items []= '['.$row['id'].',"'.escapejs($row['title']).'","'.escapejs($row['description']).'","'.escapejs(date('j.m.Y', $row['datetime_stamp'])).'","'.escapejs($row['signature']).'",'.escapejs($row['lat']).','.escapejs($row['lon']).','.escapejs($row['zoom']).',['.escapejs(join(',', $points)).']]';
        }
        
        echo 'info = ['.join(",\r\n", $items).'];';
        echo 'setupMarkers(info);setupRecentList(info);';
        break;
}

?>