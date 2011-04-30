<?php	$oContact=new XTemplate('html/modules/contact/contact.tpl');
	$oContact->parse('MAIN');
	$HTMLContent=$oContact->text('MAIN');
?>