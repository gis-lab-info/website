<?php
//  PHP 4.1.0       $HTTP_POST_FILES 
//  $_FILES.

$error = 0;

$curdate = date("Ymd_Gis");
$resdir = '/usr/local/www/gis-lab/data/projects/osmrus/data/custom/';

if (isset($HTTP_SERVER_VARS['QUERY_STRING_UNESCAPED'])) {
   list($uri,$ssi_vars) = explode("?",$HTTP_SERVER_VARS['REQUEST_URI']);
    $ssi_vars = explode("&",$ssi_vars);
    list($name, $lat1) = explode("=",$ssi_vars[0]);
	list($name, $long1) = explode("=",$ssi_vars[1]);
	list($name, $lat2) = explode("=",$ssi_vars[2]);
	list($name, $long2) = explode("=",$ssi_vars[3]);
}

echo $lat1.'<br>'.$long1.'<br>'.$lat2.'<br>'.$long2.'<br>';

if ($error == 0) {
	//1. Create new tables in OSMCUSTOM database using entered coordinates using OSM database as a source
	//2. Export shapefiles using script
	//3. Wipe up created tables
}
?>
