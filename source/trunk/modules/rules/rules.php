<?php	$oRules=new XTemplate('html/modules/rules/rules.tpl');
	$rules=new clsTable('rules');
	if(isset($_GET['id']) && $_GET['id'] != "")
	{
		$aRules=$rules->select('','','','Id='.$_GET['id']);
		$oRules->assign('NAME',$aRules[0]['Name']);
		$oRules->assign('DETAIL',$aRules[0]['Detail']);
	}
	$oRules->parse('MAIN');
	$HTMLContent=$oRules->text('MAIN');
?>