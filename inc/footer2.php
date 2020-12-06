<div align="right">
<p class="up"><a href="#top">Наверх</a></p></div>
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
					<div id="google_translate_element"></div>
					<script>
						function googleTranslateElementInit() {
						  new google.translate.TranslateElement({
							pageLanguage: 'ru',
							includedLanguages: 'en,be,nl,ka,es,it,zh-TW,zh-CN,lv,lt,de,pl,ro,sr,sk,sl,tr,uk,fr,hr,cs,sv,et,ja'
						  }, 'google_translate_element');
						}
						</script>
				</div>
                <div class="block">
                    <h3>Новое на сайте<a href="http://gis-lab.info/news.xml"><img src="/images/rss.png" width="20" height="13" border="0" alt="RSS"></a></h3>
                    <p><a href="/qa/qtiles.html">Создание тайлов из проекта QGIS при помощи QTiles</a> <a href="/forum/viewtopic.php?t=12521"><img src="/images/forumq.gif" alt="обсудить в форуме" /></a></p>
                    <p><a href="/qa/mapnik-datasources.html">Рендеринг векторных данных в Mapnik без предоставления прямого доступа к хранилищу</a> <a href="/forum/viewtopic.php?t=12530"><img src="/images/forumq.gif" alt="обсудить в форуме" /></a></p>
                    <p><a href="/qa/sextante-qgis.html">Геопроцессинг с SEXTANTE для QGIS</a> <a href="/forum/viewtopic.php?t=12535"><img src="/images/forumq.gif" alt="обсудить в форуме" /></a></p>
                    <p><a href="/qa/corona.html">Данные Corona - описание и получение</a> <a href="/forum/viewtopic.php?t=12561"><img src="/images/forumq.gif" alt="обсудить в форуме" /></a></p>
                    <p><a href="/qa/declass-catalog.html">Каталог данных Declass (Corona)</a> <a href="/forum/viewtopic.php?t=12571"><img src="/images/forumq.gif" alt="обсудить в форуме" /></a></p>
                    <p><a href="/qa/georef-saga.html">Привязка топографических карт в SAGA</a> <a href="/forum/viewtopic.php?t=12557"><img src="/images/forumq.gif" alt="обсудить в форуме" /></a></p>
                    <ul>
                      <li><a href="/">Все новости</a></li>
                    </ul>
              </div>

                <div class="block">
                    <h3>Подписка на  новости</h3>
                    <form id="gislabnews" name="gislabnews" method="post" action="/scripts/send-news.php">
                        <div><input onblur="if(value==''){value='email'}" onfocus="if(value=='email'){value=''}" class="text" value="email"> <input class="bok" type="submit" value=""></div>
                   </form>
				   <ul>
                      <li><a href="/subscribe-news.html">О подписке на новости</a></li>
                    </ul>
                </div>

                <div class="block">
                    <h3>Новое на форуме<a href="http://gis-lab.info/forum/rss.php"><img src="/images/rss.png" alt="RSS"></a></h3>
                    <div id="forum_recent_posts"></div>
                    <ul><li><a href="/forum">Все темы форума</a></li></ul>
                </div>
                <div class="block last">
                    <h3>Обратная связь</h3>
                    <form id="gislabcomment" name="gislabcomment" method="post" action="/scripts/send-comment.php">
                        <div><input onblur="if(value==''){value='email'}" onfocus="if(value=='email'){value=''}" class="text" value="email" style="width:177px" name="address"></div>
                        <div><input onblur="if(value==''){value='три цифры'}" onfocus="if(value=='три цифры'){value=''}" class="text" value="три цифры" style="width:100px" name="secretcode"> <img style="vertical-align:bottom;" src="/scripts/image-code.php" alt="captcha"></div>
                        <div><textarea onblur="if(value==''){value='используйте эту форму для отправки комментария, вопроса или сообщения об ошибке для этой страницы'}" onfocus="if(value=='используйте эту форму для отправки комментария, вопроса или сообщения об ошибке для этой страницы'){value=''}" class="text" style="width:177px;height:100px;" rows="7" cols="7" name="message">используйте эту форму для отправки комментария, вопроса или сообщения об ошибке для этой страницы</textarea></div>
                        <input type="hidden" value="Комментарий к сайту GIS-LAB" name="fTitle">
                        <div><input class="bsend" type="submit" value=""></div>
                    </form>
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
        <p>&copy; GIS-Lab и авторы, 2002-2013. При использовании материалов сайта, ссылка на GIS-Lab и авторов обязательна. Содержание материалов - ответственность авторов. (<a href="/disclaimer.html">подробнее</a>).</p>
    </div></div></div>

    </div>

</div>
<script src="/scripts/send_error.js" type="text/javascript"></script>
<script language='JavaScript' type='text/javascript' src='/forum/recent.php'></script>
<script src="http://translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
</body>
</html>