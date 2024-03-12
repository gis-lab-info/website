<?php
$table = "osm_stat";
$mode = "count";

$region = pg_escape_string($_GET['region']);
$layer = pg_escape_string($_GET['layer']);

$link = pg_connect('host=localhost dbname=osm user=labinfo password=incognito');

if ($region != "") {
	$regionquery = " WHERE DATE>'2009-11-3' AND region = '$region'";
} 
if ($layer !="") {
	$regionquery = $regionquery . " AND layer = '$layer'";
}
if ($region != "" & $layer == "") {
	$query = "SELECT Date,SUM(Count) FROM $table " . $regionquery . " AND (NOT (layer LIKE ('%area, ha%'))) AND (NOT (layer LIKE ('%length, km%'))) GROUP BY Date ORDER BY Date ASC";
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

echo "date,number<br>";			
WHILE ($myrow = pg_fetch_assoc($result))
{
	if ($mode == "sum") {
		$val = $myrow['sum'];
	}
	if ($mode == "count") {
		$val = $myrow['count'];
	}
	$date = $myrow['date'];
	echo $date.",".$val."<br>";;
}
echo "</table>";
?>