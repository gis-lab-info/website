<?
require('../../scripts/chart/chart.php');
$table = "osm_stat";
$mode = "count";

$region = pg_escape_string($_GET['region']);
$layer = pg_escape_string($_GET['layer']);

$region = rawurldecode($region);
$region = str_replace("+" , " ", $region);
$layer = rawurldecode($layer);
$layer = str_replace("+" , " ", $layer);

$link = pg_connect('host=localhost dbname=osm user=labinfo password=incognito');

if ($region != "") {
	$regionquery = " WHERE DATE>'2009-11-3' AND region = '$region'";
} 
if ($layer !="") {
	$regionquery = $regionquery . " AND layer = '$layer'";
}
if ($region != "" & $layer == "") {
	$query = "SELECT Date,SUM(Count) FROM $table " . $regionquery . " GROUP BY Date ORDER BY Date ASC";
	$mode = "sum";
}
if ($region != "" & $layer != "") {
	$query = "SELECT * FROM $table" . $regionquery . " ORDER BY Date ASC";
}

$result = pg_query($query);
if (!$result) {
	echo "Problem with query " . $query . "<br/>";
	echo pg_last_error();
	exit();
}
			
$i = array();
$dates = array();
WHILE ($myrow = pg_fetch_assoc($result))
{
	$layer = $myrow['layer'];
	if ($mode == "sum") {
		$val = $myrow['sum'];
	}
	if ($mode == "count") {
		$val = $myrow['count'];
	}
	$date = $myrow['date'];
	$i[] = $val;
	$dates[] = $date;
}

//chart

$chart = new chart(730, 300);
$chart->plot($i);
$chart->set_labels($x = "Date", $y = "Number");
$chart->set_x_ticks($dates, $format = "text");
$chart->set_margins($left = 60,$right = 5, $top = 5,$bottom = 35);
$chart->stroke();

?>

