            </div>
            <div class="col2">

               	<script type="text/javascript">
               	function clean(A){var B=A.previousSibling;if(B){A.onblur=function(){if(!A.value){B.style.top=""}};B.style.top="-9999px";}}
               	function cleanLogin(){
               		var A=document.getElementById("username");
               		var C=document.getElementById("password");
               		var B=function(){if(A.value){clean(A)}if(C.value){clean(C)}};
               		setInterval(B,100)
               		};
               	</script>

                <div class="block">
                    <h3>Открытые проекты</h3>
                  <p class="project"><a href="/qa/osgeo-live-docs-coord.html"><img src="/images/project_osgeolive.png" alt="Открытый проект!" width="180" height="50"><br>
                  Перевод материалов OSGeo Live</a> <a href="/forum/viewtopic.php?t=11526"><img src="/images/forumq.gif" alt="обсудить в форуме" border="0" /></a></p>
				  <p class="project"><a href="/projects/osm_shp.html"><img src="/images/project_osm2shp.png" alt="Открытый проект!" width="180" height="43"><br>
                  Данные OSM в  формате Shape </a> <a href="/forum/viewtopic.php?t=4135"><img src="/images/forumq.gif" alt="обсудить в форуме" border="0" /></a></p>
		      </div>

				<div class="block">
                    <h3>Вход</h3>
                    <form id="login" name="login" action="/forum/ucp.php?mode=login" method="post">
                        <div style="position:relative;height:25px;">
                        	<label style="width:150px;" onclick="this.nextSibling.focus()" for="username">логин</label><input type="text" style="position:absolute;width:150px;" class="text" id="username" name="username" onfocus="clean(this);" value="">
                        </div>
                        <div style="position:relative;height:25px;">
                        	<label style="width:150px;" onclick="this.nextSibling.focus()" for="password">пароль</label><input type="password" style="position:absolute;width:150px;" class="text" id="password" name="password" onfocus="clean(this);" value="">
                        </div>
                        <div><input name="login" class="blogin" type="submit" value=""></div>
                    </form>
                    <ul>
                        <li><a href="/forum/ucp.php?mode=register">Регистрация</a></li>
                        <li><a href="/forum/ucp.php?mode=sendpassword">Забыли пароль?</a></li>
                    </ul>
                </div>
                <script type="text/javascript">cleanLogin();</script>
				
				<div class="block">
                    <h3>Подписка на  новости</h3>
                    <form id="gislabnews" name="gislabnews" method="post" action="/scripts/send-news.php">
                        <div><input onblur="if(value==''){value='email'}" onfocus="if(value=='email'){value=''}" class="text" value="email"> <input class="bok" type="submit" value=""></div>
                   </form>
				   <ul>
                      <li><a href="/subscribe-news.html">О подписке на новости</a></li>
                    </ul>
                </div>
				
                <div class="block last">
                    <h3>Новое на форуме<a href="http://gis-lab.info/forum/rss.php"><img src="/images/rss.png" alt="RSS"></a></h3>
                    <div id="forum_recent_posts"></div>
					<ul><li><a href="/forum">Все темы форума</a></li></ul>
                </div>
            </div>
            <div class="stopfloat"></div>
        </div>
    </div>

    <div class="foot"><div class="l"><div class="r">

        <p align="right" style="float:right;padding:15px 15px 0 0;">
			<script src="/scripts/geokrug.js" language="JavaScript1.2"></script>
        	<script>showgeokrug()</script><br>
			(<a href="/buttons.html">Геокруг</a>)
		</p>

        <ul>
            <li class="first"><a href="/index-eng.html">English</a></li>
			<li><a href="/about.html">О нас</a></li>
            <li><a href="/qa.html">Статьи</a></li>
            <li><a href="/programs.html">Программы</a></li>
            <li><a href="/docs.html">Документация</a></li>
            <li><a href="/contacts.html">Контакты</a></li>
            <li><a href="/help.html">Участие</a></li>
 	        <li><a href="/forum">Форум</a> <a style="padding-left:0" href="/scripts/forum-all-topics.php">(все)</a></li>
            <li><a href="/blog">Блог</a></li>
			<li><a href="/irc.html">IRC</a></li>
        </ul>

        <p>Если Вы обнаружили на сайте ошибку, выберите фрагмент текста и нажмите Ctrl+Enter</p>

    </div></div></div></div></div></div></div></div>

    <div class="copyright"><div class="l"><div class="r">
        <p>&copy; GIS-Lab и авторы, 2002-2012. При использовании материалов сайта, ссылка на GIS-Lab и авторов обязательна (<a href="/disclaimer.html">подробнее</a>).</p>
    </div></div></div>

    </div>

</div>
<script src="/scripts/send_error.js" type="text/javascript"></script>
<script language='JavaScript' type='text/javascript' src='/forum/recent.php'></script>

<!--SAPE start-->
<div class="advert">
<p><font size=-2>
<?php
	define('_SAPE_USER', '914f7b3557d9df7c666583f9e565a271'); 
	require_once($_SERVER['DOCUMENT_ROOT'].'/'._SAPE_USER.'/sape.php'); 
	$o['charset'] = 'windows-1251';
	$sape = new SAPE_client($o);
	unset($o);
	$sapeLinks = mb_convert_encoding($sape->return_links(), "UTF-8", "CP1251");
	echo $sapeLinks;
?></font></p></div>
<!--SAPE end-->

</body>
</html>