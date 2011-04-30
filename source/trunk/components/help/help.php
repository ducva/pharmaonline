<?php	$oHelp=new XTemplate('html/components/help/help.tpl');
	
	$webconfig=new clsTable('method');
	$aWebconfig=$webconfig->select();
	
	$oHelp->assign('SKYPE',$aWebconfig[0]['Skype']);
	$oHelp->assign('YAHOOMESSENGER',$aWebconfig[0]['YahooMessenger']);
	$oHelp->assign('HOTLINE',$aWebconfig[0]['HotLine']);
	$oHelp->assign('FAX',$aWebconfig[0]['Fax']);
	$oHelp->assign('TELEPHONE',$aWebconfig[0]['Telephone']);
	
	$oHelp->parse('MAIN');
	$HTMLHelp=$oHelp->text('MAIN');
?>