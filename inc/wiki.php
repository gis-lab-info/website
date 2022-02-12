<?php
define("API", 'https://wiki.gis-lab.info/api.php');

$page = $_GET['page'];

$url_parse = API . '?action=parse&format=xml&page=' . urlencode($page);
$url_info = API . '?action=query&format=xml&prop=info&inprop=url&titles=' . urlencode($page);

$xml_parse = new SimpleXMLElement(file_get_contents($url_parse));
$title = $xml_parse->parse['displaytitle'];
$html = $xml_parse->parse->text;


$xml_info = new SimpleXMLElement(file_get_contents($url_info));
$touched = strtotime($xml_info->query->pages->page['touched']);
$editurl = $xml_info->query->pages->page['editurl'];

// относительные ссылки на абсолютные
$html = preg_replace('/(src|href)="\//', '\1="https://wiki.gis-lab.info/', $html);

print "<h1>$title</h1>";

if (array_key_exists('thread', $_GET)) {
    $disc = file_get_contents('https://gis-lab.info/scripts/forum-comments-num.php?i=' . $_GET['thread']);
    print '<p class="discuss discuss_top"><span>' . $disc . "</span><span><a href=\"$editurl\">Редактировать в вики</a></span></p>";
};


print "<div class=\"gl-mw-include\">$html</div>";

if (array_key_exists('thread', $_GET)) {
    print "<p class=\"discuss\"><span>$disc</span><span><a href=\"$editurl\">Редактировать в вики</a></span></p>";
};

print "<p class=\"status\">Последнее обновление: " . strftime('%Y-%m-%d %H:%M', $touched) . "</p>";


?>
