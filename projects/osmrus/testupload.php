<?php
//  PHP 4.1.0       $HTTP_POST_FILES 
//  $_FILES.

$error = 0;

$curdate = date("Ymd_Gis");
$uploaddir = '/usr/local/www/gis-lab/data/projects/osmrus/data/custom/';
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
    print "Файл загружен и сконвертирован в формат ESRI shape.";
    //print "Here's some more debugging info:\n";
    //print_r($_FILES);
} else {
    print "Possible file upload attack!  Here's some debugging info:\n";
    print_r($_FILES);
	$error == 1;
}
print "</pre>";


if ($error == 0) {
	passthru("mkdir data/custom/$fldr");
	passthru("/usr/local/bin/osmexport ruleset1.oxr data/custom/$input data/custom/$fldr");
	//echo "/usr/local/bin/osmexport ruleset1.oxr data/custom/$input data/custom/$fldr";
	passthru("/usr/local/bin/osmexport ruleset2.oxr data/custom/$input data/custom/$fldr");
	passthru("/usr/local/bin/osmexport ruleset3.oxr data/custom/$input data/custom/$fldr");
	
	$files = scandir("data/custom/$fldr");
	foreach ($files as $file) {
		if (strrchr($file, '.') == ".shp") {
			$files2[] = $file;
		}
		sort($files2);
	}
	foreach ($files2 as $file) {
		$fileroot = str_replace(".shp", "", $file);
		$extarr = array("shp","prj","shx","dbf","cpg");
		//remove all empty shapes
		if (filesize("data/custom/$fldr/$file") == 100) {
			foreach ($extarr as $extval) {
				unlink("data/custom/$fldr/$fileroot".".".$extval);
			}
		} else {
			//convert all dbfs from UTF-8 to Win-1251
			passthru("/usr/local/bin/python /usr/local/www/gis-lab/data/projects/osmrus/dbfer.py data/custom/$fldr/$fileroot.dbf data/custom/$fldr/$fileroot"."2.dbf");
			passthru("rm data/custom/$fldr/$fileroot.dbf");
			passthru("mv data/custom/$fldr/$fileroot"."2.dbf data/custom/$fldr/$fileroot.dbf");
			echo "Импортирован слой: ".$fileroot."<br>";
		}
	}
	
	
	//passthru("cd data/custom/$fldr");
	passthru("/usr/local/bin/zip -mjq9 data/custom/$output data/custom/$fldr/*");
	//passthru("tar -czvf data/custom/$output data/custom/$fldr");
	//passthru("rm data/custom/$fldr/*");
	passthru("rm -d data/custom/$fldr");
	//ob_start();
	//$res = ob_get_contents();
	//ob_end_clean();
	//echo $res;
	$resfilesize = intval(filesize("data/custom/$output")/1024);
	echo "<br><a href=\"http://gis-lab.info/projects/osmrus/data/custom/".$output.\">загрузить результат ($resfilesize Кб)</href>";
}
?>
