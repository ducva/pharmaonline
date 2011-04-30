<?php	$oIntro=new XTemplate('html/modules/intro/intro.tpl');
	$intro=new clsTable('intro');
	$aIntro=$intro->select('','','','PageName="intro"');
	$oIntro->assign('DETAIL',$aIntro[0]['Detail']);
	$oIntro->parse('MAIN');
	$HTMLContent=$oIntro->text('MAIN');
?>