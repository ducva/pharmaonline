<?php
	$toolbar=new XTemplate('html/components/toolbar.tpl');
	$toolbar->parse('MAIN');
	$HTMLToolbar=$toolbar->text('MAIN');
?>