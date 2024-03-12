<?

require_once('engine/common.inc.php'); 

switch($action)
{
    default:
        $html->start('Comments', array('Main|index.php'));

        echo '<div class="actions">';
        $html->action('?action=insert', 'insertl', 'Add new comment');
        echo '</div>';
        
        foreach($sql->get('*', DB.'comment order by datetime_stamp desc') as $row)
        {
            echo '<div class="row"><p><a href="?action=show&id='.$row['id'].'">'.str2text($row['title']).'</a>';
            
            if($row['user_id'] == 0)
                echo ' by '.text($row['signature']);
            else
                echo ' by '.text($users->get_user_name($row['user_id']));
            
            $is_my = $is_login && ($users->info['id'] == $row['user_id']);
            if($is_moderator || $is_my)
            {
                $html->action('?action=update&id='.$row['id'], 'update', 'Update');
                $html->action('?action=delete&id='.$row['id'], 'delete', 'Delete', 'Really delete?');
            }
            echo '</p></div>';
        }

        $html->stop();
        break;

    case 'show':
        $id = @intval($_GET['id']);
        $item = $sql->row('*', DB.'comment', 'id='.$sql->i($id));
        if($item === false) out();

        $html->start(text($item['title']), array('Main|index.php', 'Comments|comment.php'));
        
        if($item['user_id'] == 0)
            echo '<p>by '.text($item['signature']).'</p>';
        else
            echo '<p>by '.text($users->get_user_name($item['user_id'])).'</p>';

        echo '<p>'.text($item['description'], true, true).'</p>';
        
        echo '<table><tr><td>';
        echo '<div id="map" style="margin-top:20px; border:#000 1px solid;width:500px;height:400px;"></div>';
        echo '</td><td style="vertical-align:top;padding-top:20px;font:normal 11px Tahoma;padding-left:10px;">';
        
        $data = $sql->get('marker_id, lat, lon', DB.'comment_point', 'comment_id='.$sql->i($id).' order by marker_id');
        
        if(!count($data)) echo 'No markers'; else        
        foreach($data as $row)
        {
            echo '<div style="margin-bottom:2px;"><a href="javascript:map.setCenter(new GLatLng('.$row['lat'].', '.$row['lon'].'))">'.(chr(ord('A')+$row['marker_id'])).': '.$row['lat'].', '.$row['lon'].'</a></div>';
        }
        echo '</td></tr></table>';
        echo '<script type="text/javascript">var map = assign_map(\'map\', '.@floatval($item['lat']).', '.@floatval($item['lon']).', '.@floatval($item['zoom']).', true);</script>';
        echo '<script>';
?>
function commentAddMarker(markerId, lat, lon)
{
    var letter = String.fromCharCode("A".charCodeAt(0) + markerId);
    var letteredIcon = new GIcon(baseIcon);
    letteredIcon.image = "http://www.google.com/mapfiles/marker" + letter + ".png";
    var marker = new GMarker(new GLatLng(lat, lon), { icon:letteredIcon });
    map.addOverlay(marker);
}

<?        
        foreach($sql->get('marker_id, lat, lon', DB.'comment_point', 'comment_id='.$sql->i($id).' order by marker_id') as $row)
        {
            echo 'commentAddMarker('.$row['marker_id'].', '.$row['lat'].', '.$row['lon'].');';
        }
        echo '</script>';
        
        $html->stop();
        break;

    case 'insert': case 'update':
        if($action == 'insert')
        {
            if(isset($_GET['lat']) && isset($_GET['lon']) && isset($_GET['zoom']))
            {
                $item['lat'] = floatval($_GET['lat']);
                $item['lon'] = floatval($_GET['lon']);
                $item['zoom'] = floatval($_GET['zoom']);
            }
            else
            {
                $item['lat'] = 30;
                $item['lon'] = 0;
                $item['zoom'] = 1;
            }
                        
            $html->start('Add new comment', array('Main|index.php', 'Comments|comment.php'));
            $html->form_start('comment.php', 'insert_post');
        }
        else
        {            
            if(!$is_login) out();

            $id = @intval($_GET['id']);
            $item = $sql->row('*', DB.'comment', 'id='.$sql->i($id));
            if($item === false) out();
            
            $is_my = $is_login && ($users->info['id'] == $item['user_id']);
            if(!$is_moderator && !$is_my) out();

            $item['markers'] = $sql->get('*', DB.'comment_point', 'comment_id='.$sql->i($id).' order by marker_id');

            $html->start('Update comment', array('Main|index.php', 'Comments|comment.php'));
            $html->form_start('comment.php', 'update_post', $id);
        }
    
        $html->form_add_string('title', 'Title', @$item['title'], 40, true);
        $html->form_add_text('description', 'Comment', @$item['description'], '500px', '100px', true, true);
        $html->form_geo_markers('markers', 'lat', 'lon', 'zoom', 'Markers', @$item['markers'], @$item['lat'], @$item['lon'], @$item['zoom'], '500px', '300px');

        if(!$is_login || (($action == 'update') && $is_moderator && (@$item['user_id'] == 0)))
        {
            $html->form_add_string('signature', 'Name/nickname', @$item['signature'], 40, true);
            $html->form_add_string('email', 'E-mail (not shown, enter if you want to be replied)', @$item['email'], 40);
        }
        
        if(!$is_login)
        {
            include 'engine/lib/captcha.lib.php';
            $captcha_session_id = captcha_get_session($sql);
            $html->form_add_captcha('Enter number on picture', $captcha_session_id);
            $html->form_add_variable('captcha', $captcha_session_id);
        }
        
        $html->form_actions();
        if($action=='insert') $html->form_add_action('Add');
            else $html->form_add_action('Update');
        $html->form_stop();

        $html->stop();
        break;

    case 'insert_post':
    
        if(!$is_login)
        {
            include 'engine/lib/captcha.lib.php';
            $captcha_session_id = captcha_get_session($sql);
            if(captcha_compare_code($sql, $captcha_session_id, $_POST['captcha_code']))
            {
                captcha_refesh_code($sql, $captcha_session_id);
        
                $sql->insert(array(
                    'title'=>$sql->s($_POST['title'], 255),
                    'description'=>$sql->s($_POST['description'], 4000),
                    'datetime_stamp'=>$sql->i(time()),
                    'user_id'=>$sql->i(0),
                    'signature'=>$sql->s($_POST['signature'], 255),
                    'email'=>$sql->s($_POST['email'], 255),
                    'lat'=>$sql->f($_POST['lat']),
                    'lon'=>$sql->f($_POST['lon']),
                    'zoom'=>$sql->f($_POST['zoom'])
                ), DB.'comment');
                
                $id = $sql->get_last_id();

                foreach(explode("\r\n", trim($_POST['markers'])) as $row)
                {
                    list($marker_id, $lat, $lon) = explode("\t", $row);
                    
                    $sql->insert(array(
                        'comment_id'=>$sql->i($id),
                        'marker_id'=>$sql->i($marker_id),
                        'lat'=>$sql->f($lat),
                        'lon'=>$sql->f($lon),
                    ), DB.'comment_point');
                }
            }
            else
                location('comment.php?action=bad_captcha');
        }
        else
        {
            $sql->insert(array(
                'title'=>$sql->s($_POST['title'], 255),
                'description'=>$sql->s($_POST['description'], 4000),
                'datetime_stamp'=>$sql->i(time()),
                'user_id'=>$sql->i($users->info['id']),
                'signature'=>$sql->s(''),
                'email'=>$sql->s(''),
                'lat'=>$sql->f($_POST['lat']),
                'lon'=>$sql->f($_POST['lon']),
                'zoom'=>$sql->f($_POST['zoom'])
            ), DB.'comment');
            
            $id = $sql->get_last_id();

            if(trim($_POST['markers']) != '')
            foreach(explode("\r\n", trim($_POST['markers'])) as $row)
            {
                list($marker_id, $lat, $lon) = explode("\t", $row);
                
                $sql->insert(array(
                    'comment_id'=>$sql->i($id),
                    'marker_id'=>$sql->i($marker_id),
                    'lat'=>$sql->f($lat),
                    'lon'=>$sql->f($lon),
                ), DB.'comment_point');
            }
        }

        location('comment.php?action=show&id='.$id);
        break;

    case 'update_post':
    
        if(!$is_login) out();
        
        $id = @intval($_POST['id']);
        $item = $sql->row('*', DB.'comment', 'id='.$sql->i($id));
        if($item === false) out();
        
        $is_my = $is_login && ($users->info['id'] == $item['user_id']);
        if(!$is_moderator && !$is_my) out();
        
        if(($item['user_id'] == 0) && $is_moderator)
        {
            $signature = $_POST['signature'];
            $email = $_POST['email'];
        }
        else 
        {
            $signature = '';
            $email = '';
        }
            
        $sql->update(array(
            'title'=>$sql->s($_POST['title'], 255),
            'description'=>$sql->s($_POST['description'], 4000),
            'signature'=>$sql->s($signature),
            'email'=>$sql->s($email),
            'lat'=>$sql->f($_POST['lat']),
            'lon'=>$sql->f($_POST['lon']),
            'zoom'=>$sql->f($_POST['zoom'])
        ), DB.'comment', 'id='.$sql->i($id));
        
        $sql->delete(DB.'comment_point', 'comment_id='.$sql->i($id));
        
        if(trim($_POST['markers']) != '')
        foreach(explode("\r\n", trim($_POST['markers'])) as $row)
        {
            list($marker_id, $lat, $lon) = explode("\t", $row);
            
            $sql->insert(array(
                'comment_id'=>$sql->i($id),
                'marker_id'=>$sql->i($marker_id),
                'lat'=>$sql->f($lat),
                'lon'=>$sql->f($lon),
            ), DB.'comment_point');
        }

        location('comment.php?action=show&id='.$id);
        break;

    case 'delete':
    
        if(!$is_moderator) out();
    
        $id = intval($_GET['id']);
        $sql->delete(DB.'comment', 'id='.$sql->i($id));
        $sql->delete(DB.'comment_point', 'comment_id='.$sql->i($id));

        location('comment.php');
        break;
}

?>