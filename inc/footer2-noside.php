            </div>
            <div class="col2">
            
                <!--<div class="block">
                  <h3>Открытые проекты</h3>
                  <p class="project">
                    <a href="http://uikgeo.ru"><img src="/images/project_uikgeo.jpg" alt="Данные по Москве width="183" height="87"><br>
                        УИК ГЕО</a>
                    <a href="/forum/viewtopic.php?t=14285"><img src="/images/forumq.gif" alt="обсудить в форуме" border="0" /></a>
                  </p>
                  <p class="project">
                    <a href="/qa/data-mos.html"><img src="/images/project_datamosru.png" alt="Данные по Москве width="167" height="55"><br>
                        Нормализованные данные с портала ОД г. Москвы</a>
                    <a href="/forum/viewtopic.php?t=12882"><img src="/images/forumq.gif" alt="обсудить в форуме" border="0" /></a> 
                  </p>
                </div>-->

                
               	<!-- <script type="text/javascript">
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
                <script type="text/javascript">cleanLogin();</script> -->
                <div class="block">
          <a href="http://gis-lab.info/qa/donate.html"><img src="/images/gis-lab-donate-sq.png" width="190" height="189" border="0" alt="Donate"></a>
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
				
                <div class="block last">
                    <h3>Новое на форуме<a href="http://gis-lab.info/forum/app.php/feed"><img src="/images/rss.png" alt="RSS"></a></h3>
                    <div id="forum_recent_posts"></div>
                    <script type="text/javascript" src="http://gis-lab.info/forum/recent.php"></script>
					<ul><li><a href="/forum">Все темы форума</a></li></ul>
                </div>
            </div>
            <div class="stopfloat"></div>
        </div>
    </div>
    <div class="foot">
        <iframe src="https://money.yandex.ru/quickpay/shop-widget?writer=seller&targets=GIS-Lab%20%D0%BD%D1%83%D0%B6%D0%BD%D1%8B%20%D0%B4%D0%B5%D0%BD%D1%8C%D0%B3%D0%B8%20%D0%BD%D0%B0%20%D1%85%D0%BE%D1%81%D1%82%D0%B8%D0%BD%D0%B3%2C%20%D0%B0%D0%B4%D0%BC%D0%B8%D0%BD%D0%B8%D1%81%D1%82%D1%80%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%2C%20%D1%80%D0%B0%D0%B7%D0%B2%D0%B8%D1%82%D0%B8%D0%B5&targets-hint=&default-sum=300&button-text=11&comment=on&hint=%D0%97%D0%B4%D0%B5%D1%81%D1%8C%20%D0%BC%D0%BE%D0%B6%D0%BD%D0%BE%20%D0%BE%D1%81%D1%82%D0%B0%D0%B2%D0%B8%D1%82%D1%8C%20%D0%BA%D0%BE%D0%BC%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%D1%80%D0%B8%D0%B9&successURL=&quickpay=shop&account=410011586105267" width="510" height="341" frameborder="0" allowtransparency="true" scrolling="no"></iframe>
    </div>
    <div class="foot"><div class="l"><div class="r">

        <p align="right" style="float:right;padding:15px 15px 0 0;">
			<script src="/scripts/geokrug.js" language="JavaScript1.2"></script>
        	<script>showgeokrug()</script><br>
			(<a href="/buttons.html">Геокруг</a>)
		</p>

        <ul>
            <li class="first"><a href="/index-eng.html">English</a></li>
			<li><a href="/about.html">О GIS-Lab</a></li>
            <li><a href="/qa.html">Статьи</a></li>
            <li><a href="/docs.html">Документация</a></li>
            <li><a href="/contacts.html">Контакты</a></li>
            <li><a href="/help.html">Участие</a></li>
 	        <li><a href="/forum">Форум</a></li>
            <li><a href="http://wiki.gis-lab.info">Вики</a></li>
            <li><a href="/blog">Блог</a></li>
			<li><a href="/irc.html">IRC</a></li>
            <li><strong><a href="/adv.html">Реклама на сайте</a></strong></li>
        </ul>

        <p>Если Вы обнаружили на сайте ошибку, выберите фрагмент текста и нажмите Ctrl+Enter</p>

    </div></div></div></div></div></div></div></div>

    <div class="copyright">
        <div class="l">
            <div class="r">
                <p>&copy; GIS-Lab и авторы, 2002-2018. При использовании материалов сайта, ссылка на GIS-Lab и авторов обязательна. Содержание материалов - ответственность авторов. (<a href="/disclaimer.html">подробнее</a>).</p>
            </div>
        </div>
    </div>

    </div>

</div>
<script src="/scripts/send_error.js" type="text/javascript"></script>
<!-- Google Analytics counter -->
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-45388587-1', 'gis-lab.info');
  ga('send', 'pageview');

</script>
<!-- Google Analytics counter -->
<!-- Yandex.Metrika counter -->
<script src="/scripts/yandex-metrica.js" type="text/javascript"></script>
<noscript><div><img src="//mc.yandex.ru/watch/22083943" style="position:absolute; left:-9999px;" alt="" /></div></noscript>
<!-- /Yandex.Metrika counter -->
</body>
</html>
