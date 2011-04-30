<?php
	$home=new XTemplate("html/components/home.tpl");
	$home->parse('MAIN');
	$HTMLHome=$home->text('MAIN');
	
?>
