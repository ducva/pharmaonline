<?php	
	$oHelp=new XTemplate('html/components/help/help.tpl');
	
	$webconfig=new clsTable('supporter');
	$aWebconfig=$webconfig->select("name, skype, yahoo, title, mobile", '', '',' status=1');
	//new dBug($aWebconfig);
	
	foreach($aWebconfig as $support){
		$arrDisplay = array(
			'TITLE'=>$support['title'],
			'NAME'=>$support['name'],
			'SKYPE'=>$support['skype'],
			'YAHOOMESSENGER'=>$support['yahoo'],
			'MOBILE'=>$support['mobile'],
			
		);
		$oHelp->assign('LISTSUPPORT', $arrDisplay);
		$oHelp->parse('MAIN.LISTSUPPORT');
	}
	//new dBug($arrDisplay);
	
	$oHelp->parse('MAIN');
	//new dBug($oHelp);
	$HTMLHelp=$oHelp->text('MAIN');
	
	//new dBug($HTMLHelp);
?>