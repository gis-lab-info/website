<div align="right" class="addthis_toolbox addthis_default_style">
    <a class="addthis_button_facebook"></a>
	<a class="addthis_button_livejournal"></a>
    <a class="addthis_button_twitter"></a>
	<a class="addthis_button_vk"></a> 
    <a class="addthis_button_email"></a>
    <a class="addthis_button_facebook_like"></a>
	<span class="addthis_separator"> </span>
	<a href="http://addthis.com/bookmark.php?v=250" class="addthis_button_compact">Share</a>
</div>
<div align="right"><p class="up"><a href="#top">Up</a></p></div>

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
                    <h3>What's new  <a href="http://gis-lab.info/news.xml"><img src="/images/rss.png" width="20" height="13" border="0" alt="RSS"></a></h3>
                    <p><a href="/qa/qtiles.html">Creating multi-level tiles from QGIS project with QTiles</a> <a href="/forum/viewtopic.php?t=12521"><img src="/images/forumq.gif" alt="обсудить в форуме" /></a></p>
                    <p><a href="/qa/mapnik-datasources.html">Rendering vector data with Mapnik without direct access to the storage</a> <a href="/forum/viewtopic.php?t=12530"><img src="/images/forumq.gif" alt="обсудить в форуме" /></a></p>
                    <p><a href="/qa/sextante-qgis.html">Geoprocessing with SEXTANTE for QGIS</a> <a href="/forum/viewtopic.php?t=12535"><img src="/images/forumq.gif" alt="обсудить в форуме" /></a></p>
                    <p><a href="/qa/corona.html">Remote sensing Corona data - description and access</a> <a href="/forum/viewtopic.php?t=12561"><img src="/images/forumq.gif" alt="обсудить в форуме" /></a></p>
                    <p><a href="/qa/declass-catalog.html">Catalog of Declass (Corona) data</a> <a href="/forum/viewtopic.php?t=12571"><img src="/images/forumq.gif" alt="обсудить в форуме" /></a></p>
                    <p><a href="/qa/georef-saga.html">Georeferencing topographic maps in SAGA</a> <a href="/forum/viewtopic.php?t=12557"><img src="/images/forumq.gif" alt="обсудить в форуме" /></a></p>
                    <ul><li><a href="/index-eng.html">All news</a></li></ul>
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
                    <h3>New on forum<a href="http://gis-lab.info/forum/rss.php"><img src="/images/rss.png" alt="RSS"></a></h3>
                    <div id="forum_recent_posts"></div>
                    <ul>
                      <li><a href="/forum">All forum topics</a></li>
                    </ul>
                </div>

                <div class="block last">
                    <h3>Feedback</h3>
                    <form id="gislabcomment" name="gislabcomment" method="post" action="/scripts/send-comment.php">
                        <div><input onblur="if(value==''){value='email'}" onfocus="if(value=='email'){value=''}" class="text" value="email" style="width:177px" name="address"></div>
                        <div><input onblur="if(value==''){value='three digits'}" onfocus="if(value=='three digits'){value=''}" class="text" value="three digits" style="width:100px" name="secretcode"> <img style="vertical-align:bottom;" src="/scripts/image-code.php" alt="captcha"></div>
                        <div><textarea onblur="if(value==''){value='use this form to send comment, question or bug report for this page'}" onfocus="if(value=='use this form to send comment, question or bug report for this page'){value=''}" class="text" style="width:177px;height:100px;" rows="7" cols="7" name="message">use this form to send comment, question or bug report for this page</textarea></div>
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
            <li class="first"><a href="/index.html">Русский</a></li>
			<li><a href="/about.html">About</a></li>
            <li><a href="/qa.html">Articles</a></li>
            <li><a href="/programs.html">Programs</a></li>
            <li><a href="/docs.html">Docs</a></li>
            <li><a href="/contacts.html">Contacts</a></li>
            <li><a href="/help.html">Participate</a></li>
			<li><a href="/forum">Forum</a> <a style="padding-left:0" href="/scripts/forum-all-topics.php">(all)</a></li>
            <li><a href="/blog">Blog</a></li>
			<li><a href="/irc.html">IRC</a></li>
        </ul>

        <p>If you've found a typo or bug, select a related piece of text and hit Ctrl+Enter</p>

    </div></div></div></div></div></div></div></div>

    <div class="copyright"><div class="l"><div class="r">
        <p>&copy; GIS-Lab and authors, 2002-2013. Attribution to GIS-Lab and authors is required. The responsibility for the content of this article rests with the author (<a href="/disclaimer.html">more</a>). </p>
    </div></div></div>

    </div>

</div>
<script language='JavaScript' type='text/javascript' src='/forum/recent.php'></script>
<script src="/scripts/send_error.js" type="text/javascript"></script>
<script src="http://translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
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