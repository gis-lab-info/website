<?php

$yes = "Верно";
$no = "Неверно";

class RequireAnswer extends Exception {}

$answers = array();

function q($question) {
  global $answers, $yes, $no;
  // посмотрим приходил ли нам ответ, если нет, то ошибка
  $k = 'a-' . md5($question);
  if (isset($_POST) && array_key_exists($k, $_POST)) {
    $answers[] = array($question, $_POST[$k] == $yes);
    return $_POST[$k] == $yes;
  } else {
    throw new RequireAnswer($question);
  };
}; 

include "_dt_decision.php";

function print_answers()  {
  global $answers, $yes, $no;
  foreach ($answers as $i => $a) { ?>
    <h3> <?=$i+1?>. <?=$a[0]?> - <?=$a[1] ? $yes : $no?></h3>
  <?php };
};

?>

<?php
try {
  $d = decision();
  ?>
    <?php print_answers() ?>
    <h1>Вывод: <?=$d?></h1>
  <?php
  
} catch (RequireAnswer $e) {
  ?>
  <?php print_answers() ?>
  <form method="POST" action="?#next">
    <h3>Вопрос: <?=$e->getMessage()?></h3>
    <?php foreach ($_POST as $k => $v) { if (substr($k, 0, 2) == 'a-') {?>
      <input type="hidden" name="<?=$k?>" value="<?=$v?>" />
    <?php }; }; ?>
    <input type="submit" name="a-<?=md5($e->getMessage())?>" value="<?=$yes?>" />
    <input type="submit" name="a-<?=md5($e->getMessage())?>" value="<?=$no?>"/>
  </form>
  <?php
  };
?>
