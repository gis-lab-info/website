<?php
$table = "osm_stat";
$link = pg_connect('host=localhost dbname=osm user=labinfo password=incognito');

if (isset($HTTP_SERVER_VARS['QUERY_STRING_UNESCAPED'])) {
   list($uri,$ssi_vars) = explode("?",$HTTP_SERVER_VARS['REQUEST_URI']);
    $ssi_vars = explode("&",$ssi_vars);
    list($name, $region) = explode("=",$ssi_vars[0]);
	list($name, $layer) = explode("=",$ssi_vars[1]);
}

$region = str_replace("+" , " ", $region);
$layer = str_replace("+" , " ", $layer);

//Вывод выбора подгрупп
$regions = array(
'russia'=>'Россия',
'azerbaijan'=>'Азербайджан',
'armenia'=>'Армения',
'belarus'=>'Беларусь',
'georgia'=>'Грузия',
'kazakhstan'=>'Казахстан',
'kyrgyzstan'=>'Киргизия',
'tajikistan'=>'Таджикистан',
'turkmenistan'=>'Туркменистан',
'uzbekistan'=>'Узбекистан',
'ukraine'=>'Украина',
                'adygeya'=>'Адыгея',
				'altay'=>'Алтай',
				'altayskiy'=>'Алтайский',
				'amur'=>'Амурская',
				'arkhan'=>'Архангельская',
				'astrakhan'=>'Астраханская',
				'bashkir'=>'Башкортостан',
				'belgorod'=>'Белгородская',
				'bryansk'=>'Брянская',
				'buryat'=>'Бурятия',
				'vladimir'=>'Владимирская',
				'volgograd'=>'Волгоградская',
				'vologda'=>'Вологодская',
				'voronezh'=>'Воронежская',
				'dagestan'=>'Дагестан',
				'evrey'=>'Еврейская',
				'zabaikal'=>'Забайкальский',
				'ivanov'=>'Ивановская',
				'ingush'=>'Ингушетия',
				'irkutsk'=>'Иркутская',
				'kabardin'=>'Кабардино-Балкарская',
				'kalinin'=>'Калининградская',
				'kalmyk'=>'Калмыкия',
				'kaluzh'=>'Калужская',
				'kamch'=>'Камчатский',
				'karach'=>'Карачаево-Черкесская',
				'karel'=>'Карелия',
				'kemerovo'=>'Кемеровская',
				'kirov'=>'Кировская',
				'komi'=>'Коми',
				'kostrom'=>'Костромская',
				'krasnodar'=>'Краснодарский',
				'krasnoyarsk'=>'Красноярский',
				'kurgan'=>'Курганская',
				'kursk'=>'Курская',
				'stpeter'=>'Санкт-Петербург',
				'leningrad'=>'Ленинградская',
				'lipetsk'=>'Липецкая',
				'magadan'=>'Магаданская',
				'mariyel'=>'Марий-Эл',
				'moscow'=>'Москва',
				'mosobl'=>'Московская',
				'mordov'=>'Мордовия',
				'murmansk'=>'Мурманская',
				'nenec'=>'Ненецкий',
				'nizhegorod'=>'Нижегородская',
				'novgorod'=>'Новгородская',
				'novosib'=>'Новосибирская',
				'omsk'=>'Омская',
				'orenburg'=>'Оренбуржская',
				'orlovsk'=>'Орловская',
				'penz'=>'Пензенская',
				'perm'=>'Пермский',
				'prim'=>'Приморский',
				'pskov'=>'Псковская',
				'rostov'=>'Ростовская',
				'ryazan'=>'Рязанская',
				'samar'=>'Самарская',
				'saratov'=>'Саратовская',
				'yakut'=>'Саха (Якутия)',
				'sakhalin'=>'Сахалинская',
				'sverdl'=>'Свердловская',
				'osetiya'=>'Северная Осетия - Алания',
				'smol'=>'Смоленская',
				'stavrop'=>'Ставропольский',
				'tambov'=>'Тамбовская',
				'tver'=>'Тверская',
				'tatar'=>'Татарстан',
				'tomsk'=>'Томская',
				'tul'=>'Тульская',
				'tyva'=>'Тыва (Тува)',
				'tumen'=>'Тюменская',
				'udmurt'=>'Удмуртская',
				'ulyan'=>'Ульяновская',
				'khabar'=>'Хабаровский',
				'khakas'=>'Хакасия',
				'khanty'=>'Ханты-Мансийский',
				'chel'=>'Челябинская',
				'chechen'=>'Чеченская',
				'chuvash'=>'Чувашская',
				'chukot'=>'Чукотский',
				'yamal'=>'Ямало-Ненецкий',
				'yarosl'=>'Ярославская');
$layers = array('Buildings'=>'Дома, шт',
'Buildings (area, ha)'=>'Дома, площадь',
'Roads'=>'Дороги, шт',
'Roads (length, km)'=>'Дороги, длина',
'Rail and tram'=>'Железные дороги, шт',
'Rail and tram (length, km)'=>'Железные дороги, длина',
'Rivers linear'=>'Гидросеть, шт (линия)',
'Rivers linear (length, km)'=>'Гидросеть, длина (линия)',
'Water polygonal'=>'Гидросеть, шт (полигон)',
'Water polygonal (area, ha)'=>'Гидросеть, площадь (полигон)',
'Coastline'=>'Береговая линия, шт',
'Coastline line (length, km)'=>'Береговая линия (линия), длина',
'Forest'=>'Леса, шт',
'Forest (area, ha)'=>'Леса, площадь',
'Cities points'=>'Населенные пункты, шт (точка)',
'Cities poly'=>'Населенные пункты, шт (полигон)',
'Cities poly (area, ha)'=>'Населенные пункты, площадь (полигон)',
'Landuse'=>'Землепользование, шт (полигон)',
'Landuse (area, ha)'=>'Землепользование, площадь (полигон)',
'Burned areas poly'=>'Выгоревшие территории, шт',
'Burned areas poly (area, ha)'=>'Выгоревшие территории, площадь',
'Points of interests'=>'Точки интереса (POI), шт');
				
echo "<form id='frmregions1' name='frmregions1' method='get' action='../projects/osm-stats.html'>";
echo "<select name='region'>";
foreach ($regions as $key => $value){
    if ($key == $region) echo "<option selected type='text' value=".$key.">".$value;
	else echo "<option type='text' value=".$key.">".$value;
}
echo "</select>";
echo "<select name='layer'>";
echo "<option value=''></option>";
foreach ($layers as $key => $value){
    if ($key == $layer) echo "<option selected type='text' value='".$key."'>".$value;
	else echo "<option type='text' value='".$key."'>".$value;
}
echo "</select>";
echo "<input type='submit' value='Выбрать' />";
echo "</form>";

$error = 0;
if ($region != "") {
	$regionquery = " WHERE DATE>'2009-11-3' AND region = '$region'";
} 
if ($layer !="") {
	$regionquery = $regionquery . " AND layer = '$layer'";
}
if ($region != "" & $layer == "") {
	//SELECT Date,SUM(Count) FROM osm_stat WHERE region = 'mosobl' GROUP BY Date ORDER BY Date ASC
	$query = "SELECT Date,SUM(Count) FROM $table " . $regionquery . " AND (NOT (layer LIKE ('%area, ha%'))) AND (NOT (layer LIKE ('%length, km%'))) GROUP BY Date ORDER BY Date ASC";
}

if ($region != "" & $layer != "") {
	$query = "SELECT * FROM $table" . $regionquery . " ORDER BY Date ASC";
}
if ($region == "") {
	$error = 1;
}
if ($region == "" & $layer == "") {
	$error = 1;
}


if ($error == 0) {
echo "<p><img border=\"0\" src=\"../projects/osmrus/showpchart.php?region=$region&layer=$layer\"/></p>";
echo "<p style=\"font-size: 10px; color: #CCCCCC;\">$query</p>";
echo "<p><a href=\"../projects/osmrus/showtable.php?region=$region&layer=$layer\"/>Таблица значений</a></p>";
$result = pg_query($query);
if (!$result) {
	echo "Problem with query " . $query . "<br/>";
	echo pg_last_error();
	exit();
}
}
?>