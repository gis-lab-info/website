<?php
$file="/home/sim/gl/projects/osmrus/errors-wms/log.txt";

$display = file($file);
$count = count($display);
$lastline = $display[$count-1];
$templist = explode("|", $lastline);
$dates = explode(" ",$templist[0]);
$date = $dates[1];
echo "Сейчас ошибок: ".$templist[1]."<br>";
echo "Обновление: ". $date."<br>";
echo "<a href=\"osmrus/errors-wms/log.txt\">История ошибок</a>";
?> 