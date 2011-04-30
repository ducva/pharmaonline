<?php	$oRules=new XTemplate('html/components/rule/rule.tpl');
	
	$rules=new clsTable('rules');
	$aRules=$rules->select('','','','','Position asc');
	$iLine=count($aRules);
	for($i=0 ; $i < $iLine ; $i++)
	{
		$aArray=array(
					'ID'=>$aRules[$i]['Id'],	
					'NAME'=>$aRules[$i]['Name']
					);
		$oRules->assign('LISTRULES',$aArray);
		$oRules->parse('MAIN.LISTRULES');
	}
	
	$oRules->parse('MAIN');
	$HTMLRule=$oRules->text('MAIN');
?>