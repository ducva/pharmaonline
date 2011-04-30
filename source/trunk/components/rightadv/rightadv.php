<?php	$oRightadv=new XTemplate('html/components/rightadv/rightadv.tpl');
	
	//get right adv
	$oRightAdv=new clsAdvertising();
	
	$sRightAdv=$oRightAdv->getRight();
	
	$oRightadv->assign('LISTRIGHTADV',$sRightAdv);
	$oRightadv->parse('MAIN.LISTRIGHTADV');
	//end get right adv
	
	$oRightadv->parse('MAIN');
	$HTMLRightadv=$oRightadv->text('MAIN');
?>