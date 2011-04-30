<?php	$oLeftadv=new XTemplate('html/components/leftadv/leftadv.tpl');
	
	//get middle adv
	$oLeftAdv=new clsAdvertising();
	
	$sLeftAdv=$oLeftAdv->getLeft();
	
	$oLeftadv->assign('LISTLEFTADV',$sLeftAdv);
	$oLeftadv->parse('MAIN.LISTLEFTADV');
	//end get middle adv
	
	$oLeftadv->parse('MAIN');
	$HTMLLeftadv=$oLeftadv->text('MAIN');
?>