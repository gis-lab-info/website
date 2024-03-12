<?php
	$acommand1 = "cd data/custom/20081212_232357/";
	//$acommand2 = "/usr/local/bin/zip data/custom/new.zip *";
	$acommand2 = "ls -la > data/custom/test";
	passthru($acommand1);
	passthru($acommand2);
?>
