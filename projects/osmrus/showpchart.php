<?php
include ("../../scripts/jpgraph/src/jpgraph.php");
include ("../../scripts/jpgraph/src/jpgraph_line.php");
include ("../../scripts/jpgraph/src/jpgraph_date.php");

$table = "osm_stat";
$mode  = "count";
$region = pg_escape_string($_REQUEST['region']);
$layer  = pg_escape_string($_REQUEST['layer']);
$region = rawurldecode($region);
$region = str_replace("+" , " ", $region);
$layer  = rawurldecode($layer);
$layer  = str_replace("+" , " ", $layer);

$link = pg_connect('host=localhost dbname=osm user=labinfo password=incognito');

if (!empty($region)) {$regionquery = " WHERE DATE>'2009-11-3' AND region = '$region'";}
if (!empty($layer))  {$regionquery.= " AND layer = '$layer'";}
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
WHILE ($myrow = pg_fetch_assoc($result))
{
	if ($mode == "sum") {
		$data[] = $myrow['sum'];
	}
	if ($mode == "count") {
		$data[] = $myrow['count'];
	}
    $date[] = $myrow['date'];
}

$graph = new Graph(700, 268,"auto");
$graph->img->SetMargin(50,20,0,80);
$graph->SetBackgroundGradient('white','white',GRAD_HOR,BGRAD_FRAME);
$graph->SetShadow();
$graph->title->Set($region.' : '.$layer);
$graph->SetScale( "datlin");
$lineplot =new LinePlot($data);
$lineplot->SetFillColor('orange@0.85');
$graph->Add( $lineplot);
$graph->xaxis->scale->SetTimeAlign( DAYADJ_1 );
$graph->xaxis->SetLabelAngle(90);
$lineplot->SetColor("orange");
$graph->SetBackgroundImageMix(100);
//$lineplot->SetLegend('Feature count');
$graph->legend->SetFillColor('white');
$graph->legend->Pos(0.75,0.16,"right","center");
$graph->xaxis->SetTickLabels($date);
$graph->Stroke();
?>