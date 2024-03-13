<?php

/* Всегда подключаем файл из библиотеки xAjax*/
require ('../../scripts/xajax/xajax.inc.php');

function doTimestamp()  {
  
/* Эта функция возвращает информацию о текущем времени */
/* создаем экземпляр класса xajaxResponse */
  $objResponse = new xajaxResponse();
  
  $time = time();
  $sOut = "Текущее время сервера: ".date("H", $time)." часов, ";
  $sOut .= date("i", $time)." минут и ";
  $sOut .= date("s", $time)." секунд. В формате UNIX: $time";
 
/* Устанавливаем объект xajaxResponse для обновления элемента HTML у которого ID = 'timebox' */
$objResponse->addAssign("timebox", "innerHTML", $sOut);
  
/* возвращаем результат функции */  
return $objResponse->getXML();
}

/* создаем экземпляр класса  xajax */
$objAjax = new xajax();
$objAjax->setCharEncoding("windows-1251");

/* регистрируем функцию 'doTimestamp' для объекта xajax */
$objAjax->registerFunction('doTimestamp');

/* обрабатываем запрос */
$objAjax->processRequests();

?>
<?
require_once("../../scripts/js-xajax.php");
?>
<h1>Пример 1: Получение времени сервера</h1>
<p>Нажав на кнопку ниже, время будет запрошено с сервера и показано внутри прямоугольной области без перезагрузки страницы.</p>
<div id="timebox">&nbsp;</div>
<input type="button" class="button" value="Посмотреть время" onclick="xajax_doTimestamp();" />
</html>