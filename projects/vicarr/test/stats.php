<?php

$link = pg_connect('host=localhost dbname=osm user=labinfo password=incognito');

$regions = array(
    'russia_full'=>'РФ',
    'aginsk'=>'Агинский',
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
    'leningrad'=>'Ленинградская',
    'lipetsk'=>'Липецкая',
    'magadan'=>'Магаданская',
    'mariyel'=>'Марий-Эл',
    'mosobl'=>'Московская',
    'mordov'=>'Мордовия',
    'murmansk'=>'Мурманская',
    'nenec'=>'Ненецкий',
    'nizhegorod'=>'Нижегородская',
    'novgorod'=>'Новгородская',
    'novosib'=>'Новосибирская',
    'omsk'=>'Омская',
    'orenburg'=>'Оренбургская',
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
    'ustordyn'=>'Усть-Ордынский',
    'khabar'=>'Хабаровский',
    'khakas'=>'Хакасия',
    'khanty'=>'Ханты-Мансийский',
    'chel'=>'Челябинская',
    'chechen'=>'Чеченская',
    'chita'=>'Читинская',
    'chuvash'=>'Чувашская',
    'chukot'=>'Чукотский',
    'yamal'=>'Ямало-Ненецкий',
    'yarosl'=>'Ярославская',
);

$layers = array(
    'Buildings'=>'Дома',
    'Roads'=>'Дороги',
    'Rivers linear'=>'Гидросеть (линия)',
    'Water polygonal'=>'Гидросеть (полигон)',
    'Cities'=>'Города',
    'Forest'=>'Леса',
    'Points of interests'=>'Точки интереса',
);

switch(@$_GET['action'])
{
    default:
        echo file_get_contents('http://gis-lab.info/inc/header02.txt');
        echo '<title>GIS-Lab: Статистика роста OSM по объектам по регионам</title>';
        echo file_get_contents('http://gis-lab.info/inc/header2.txt');
        echo '
<div class="cont">
<div class="col1">

<ul class="path">
   <li class="first"><a href="/">Главная</a></li>
   <li><a href="/projects.html">Проекты</a></li>
</ul>

<!--Contents start-->
<h1>Статистика роста OSM по объектам по регионам</h1>
<p class="ann">База данных по спектрам природных объектов</p>
        <p class="text">
';

        $region = trim(@$_GET['region']);
        if(@!isset($regions[$region])) $region='';

        $layer = trim(@$_GET['layer']);
        if(@!isset($layers[$layer])) $layer='';
        
        echo '<p><form method="get" action="stats.php">';
        
        echo '<select name="region"><option value=""></option>';
        foreach($regions as $id => $name) echo '<option '.(($region == $id)?'selected ':'').'value="'.$id.'">'.$name.'</option>';
        echo '</select>';
        
        echo '<select name="layer"><option value=""></option>';
        foreach($layers as $id => $name) echo '<option '.(($layer == $id)?' selected ':'').'value="'.$id.'">'.$name.'</option>';
        echo '</select>';

        echo '<input type="submit" value="Показать"/></form></p>';
        
        if($region != '')
        {
            echo '<p><img src="?action=showimage&region='.htmlspecialchars($region).'&layer='.htmlspecialchars($layer).'"/></p>';
            echo '<p><a href="?action=showtable&region='.htmlspecialchars($region).'&layer='.htmlspecialchars($layer).'"/>Таблица значений</a></p>';
        }

echo '  </p>
        <p class="text">'.file_get_contents('http://gis-lab.info/scripts/forum-comments-num.php?i=54').'</p>
        <div class="links">
            <h2>Ссылки по теме</h2>
                <ul>
                    <li></li>
                </ul>
        </div>
        <!--Contents end-->';

        file_get_contents('http://gis-lab.info/scripts/date.php');
        file_get_contents('http://gis-lab.info/inc/footer2.php');
        break;
        
    case 'showimage':
        $region = trim(@$_GET['region']);
        if(@!isset($regions[$region])) $region='';

        $layer = trim(@$_GET['layer']);
        if(@!isset($layers[$layer])) $layer='';
        
        if($region == '') die();

        $query = 'select date, sum(count) from osm_stat %s group by date order by date asc';
        
        $param = '';
        
        if($layer == '')
            $param = "where date>'2009-11-1' and region='".pg_escape_string($region)."'";
        else
            $param = "where date>'2009-11-1' and region='".pg_escape_string($region)."' and layer='".pg_escape_string($layer)."'";
            
        $result = pg_query(sprintf($query, $param));
        
        if (!$result) {
            echo "Problem with query ".sprintf($query, $param)."<br/>";
            echo pg_last_error();
            exit();
        }

        $i = array();
        $dates = array();
        WHILE ($myrow = pg_fetch_assoc($result))
        {
            $layer = $myrow['layer'];
            $val = $myrow['sum'];
            $date = $myrow['date'];
            $i[] = $val;
            $dates[] = $date;
        }
        
        //chart

        require('../../../scripts/chart/chart.php');
        $chart = new chart(730, 300);
        $chart->plot($i);
        $chart->set_labels($x = "Date", $y = "Number");
        $chart->set_x_ticks($dates, $format = "text");
        $chart->set_margins($left = 60,$right = 5, $top = 5,$bottom = 35);
        $chart->stroke();
        break;
        
    case 'showtable':
        $region = trim(@$_GET['region']);
        if(@!isset($regions[$region])) $region='';

        $layer = trim(@$_GET['layer']);
        if(@!isset($layers[$layer])) $layer='';
        
        if($region == '') die();

        require('../../../scripts/chart/chart.php');

        $query = 'select date, sum(count) from osm_stat %s group by date order by date asc';
        
        $param = '';
        
        if($layer == '')
            $param = "where date>'2009-11-1' and region='".pg_escape_string($region)."'";
        else
            $param = "where date>'2009-11-1' and region='".pg_escape_string($region)."' and layer='".pg_escape_string($layer)."'";
            
        $result = pg_query(sprintf($query, $param));
        
        if (!$result) {
            echo "Problem with query ".sprintf($query, $param)."<br/>";
            echo pg_last_error();
            exit();
        }

        // table

        echo "date,number<br>";            
        WHILE ($myrow = pg_fetch_assoc($result))
        {
            $val = $myrow['sum'];
            $date = $myrow['date'];
            echo $date.",".$val."<br>";;
        }
        echo "</table>";
        break;
}
