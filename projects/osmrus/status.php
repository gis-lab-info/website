<?php

$file=fopen("/usr/local/www/gis-lab/data/projects/osmrus/status", "r");
$list = fgets($file, 4096);
$templist = explode(",", $list);
$status = $templist[0];
$datetmp = explode(":",$templist[1]); 
$datestr = $datetmp[1];
$timetmp = explode(":",$templist[2]); 
$timestr = $timetmp[1];
fclose ($file);

if ($datestr != "") {
	list($year,$month,$day) = explode("-",$datestr);
	list($hour,$minute,$second) = explode("-",$timestr);
	
	$anewtime = mktime( $hour, $minute, $second, $month, $day, $year );
	
	$starttime = date("Y-m-d H-i-s", $anewtime);
	$showtime = (strtotime("now") - $anewtime)/60;
	
	echo $status;
	echo "идёт: " . number_format($showtime,0)." мин.";
} else {
    $diff = explode(".", $list);
	echo "Завершено без ошибок (Обновление: <a href=http://planet.openstreetmap.org/daily/" . $list . ">" . $diff[0] . "</a>).";
}
?> 