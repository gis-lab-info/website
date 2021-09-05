            </div>
            <div class="col2">
            
                <!--<div class="block">
                    <h3>Open projects </h3>
                    <p class="project"><a href="http://uikgeo.ru"><img src="/images/project_uikgeo.jpg" alt="Voting stations" width="183" height="87"><br>Map your voting stations</a> <a href="/forum/viewtopic.php?t=14285"><img src="/images/forumq.gif" alt="discuss" border="0" /></a></p>
                    <p class="project"><a href="/qa/data-mos.html"><img src="/images/project_datamosru.png" alt="Данные по Москве width="167" height="55"><br>
                    Normalized Moscow open city data </a> <a href="/forum/viewtopic.php?t=12882"><img src="/images/forumq.gif" alt="discuss" border="0" /></a></p> 
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
                    <h3>Enter</h3>
                    <form id="login" name="login" action="/forum/ucp.php?mode=login" method="post">
                        <div style="position:relative;height:25px;">
                        	<label style="width:150px;" onclick="this.nextSibling.focus()" for="username">username</label>
                        	<input type="text" style="position:absolute;width:150px;" class="text" id="username" name="username" onfocus="clean(this);" value="">
                        </div>
                        <div style="position:relative;height:25px;">
                        	<label style="width:150px;" onclick="this.nextSibling.focus()" for="password">password</label>
                        	<input type="password" style="position:absolute;width:150px;" class="text" id="password" name="password" onfocus="clean(this);" value="">
                        </div>
                        <div><input name="login" class="blogin" type="submit" value=""></div>
                    </form>
                    <ul>
                        <li><a href="/forum/ucp.php?mode=register">Sign up </a></li>
                        <li><a href="/forum/ucp.php?mode=sendpassword">Forgot password?</a></li>
                    </ul>
                </div>
                <script type="text/javascript">cleanLogin();</script> -->
				<div class="block">
          <a href="http://gis-lab.info/qa/donate.html"><img src="/images/gis-lab-donate-sq-en.png" width="190" height="189" border="0" alt="Donate"></a>
        </div>
				<div class="block">
                    <h3>Subscribe to news</h3>
                    <form id="gislabnews" name="gislabnews" method="post" action="/scripts/send-news.php">
                        <div><input onblur="if(value==''){value='email'}" onfocus="if(value=='email'){value=''}" class="text" value="email"> <input class="bok" type="submit" value=""></div>
                   </form>
				   <ul>
                      <li><a href="/subscribe-news.html">About site news</a></li>
                    </ul>
                </div>
				
                <div class="block">
                    <h3>Forum updates<a href="http://gis-lab.info/forum/app.php/feed"><img src="/images/rss.png" alt="RSS"></a></h3>
                    <div id="forum_recent_posts"></div>
					<ul><li><a href="/forum">All forum topics</a></li></ul>
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
            <li class="first"><a href="/index.html">Русский</a></li>
			<li><a href="/about.html">About</a></li>
            <li><a href="/qa.html">Articles</a></li>
            <li><a href="/docs.html">Docs</a></li>
            <li><a href="/contacts.html">Contacts</a></li>
            <li><a href="/help.html">Participate</a></li>
			<li><a href="/forum">Forum</a></li>
            <li><a href="http://wiki.gis-lab.info">Wiki</a></li>
            <li><a href="/blog">Блог</a></li>
			<li><a href="/irc.html">IRC</a></li>
        </ul>

        <p>If you've found a typo or bug, select a related piece of text and hit Ctrl+Enter</p>

    </div></div></div></div></div></div></div></div>

    <div class="copyright"><div class="l"><div class="r">
        <p>&copy; GIS-Lab and authors, 2002-2015. Attribution to GIS-Lab and authors is required (<a href="/disclaimer.html">more</a>). </p>
    </div></div></div>

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
