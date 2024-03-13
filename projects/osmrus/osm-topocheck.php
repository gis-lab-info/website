<?php
//  PHP 4.1.0       $HTTP_POST_FILES 
//  $_FILES.

$error = 0;

$curdate = date("Ymd_Gis");
$uploaddir = '/usr/local/www/gis-lab/data/projects/osmrus/data/topocheck/';
$logfile = '/usr/local/www/gis-lab/data/projects/osmrus/data/topocheck/log.txt';
$basename = basename($_FILES['userfile']['name']);
$input = $curdate . "-" . $basename;
$uploadfile = $uploaddir . $input;
$fileext = strrchr($uploadfile, '.');
$fldr = $curdate;
$output = date("Ymd_Gis").".zip";

if ($fileext != ".osm" && $fileext != ".xml") {
	$error = 1;
	echo "This is not and OSM file";
}

print "<pre>";
if (move_uploaded_file($_FILES['userfile']['tmp_name'], $uploadfile)) {
    print "Файл загружен, проверка топологии закончена.";
} else {
    print "Possible file upload attack!  Here's some debugging info:\n";
    print_r($_FILES);
	$error == 1;
}
print "</pre>";


if ($error == 0) {
	passthru("/home/sim/gl/projects/osmrus/bin/osm2pgsql/osm2pgsql -U pgsql -d topocheck -p d$curdate -l -s -S /home/sim/gl/projects/osmrus/bin/osm2pgsql/default.style -C 1024 data/topocheck/$input", $errorcode);
	$polytable = "d" . $curdate ."_polygon";
	$types = array("polygon","line","point","nodes","rels","roads","ways");
	
	passthru("psql -U pgsql -d topocheck -c \"SELECT ST_IsValidReason(way) from " . $polytable . " WHERE ST_Isvalid(way)<>'t' \"");
	echo "<br>";
	echo "<a href=\"javascript:history.back()\">Вернуться на предыдущую страницу</a>";
	
	foreach ($types as &$type) {
		$table = "d" . $curdate ."_".$type;
		passthru("psql -U pgsql -d topocheck -c \"DROP TABLE " . $table . "\"". "> " .$logfile);
	}
}
?>
