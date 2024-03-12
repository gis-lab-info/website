<?php
require_once("class-ipgeo.php" );

$ip = $_SERVER['REMOTE_ADDR'];
$ipl = new IPGeo($ip);

$city = $ipl->ip($ip);
if ($city != 'not found') {
  $city = iconv('windows-1251', 'utf-8', $city);
  ?>
    var selectobj=document.getElementById("city-select");
    for (var i=0; i<selectobj.length; i++){
      if (selectobj.options[i].text  == "<?=$city?>") {
        selectobj.value = selectobj.options[i].value;
        document.getElementById("go-link").href = "http://www.openstreetmap.org/?"
          + selectobj.value + "&zoom=12";
      };
    }

  <?php
};
?>