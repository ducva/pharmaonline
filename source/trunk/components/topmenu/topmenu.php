<?php
	$oTopmenu=new XTemplate('html/components/topmenu/topmenu.tpl');
	//get middle adv
	$oMiddleAdv=new clsAdvertising();
	$sMiddleAdv=$oMiddleAdv->getMiddle();
	$oTopmenu->assign('MIDDLEADV',$sMiddleAdv);
	$oTopmenu->parse('MAIN.MIDDLEADV');
	//end get middle adv
	
	
	$category=new clsTable('category');
	$aCategory=$category->select('','','','RootId=0 and Status=1','Position asc');
	$iLine=count($aCategory);
	for($i=0 ; $i < $iLine ; $i++)
	{
		$aArray=array(
					'ID'=>$aCategory[$i]['Id'],
					'NAME'=>$aCategory[$i]['Name']
					);
		$oTopmenu->assign('CBOCATEGORY',$aArray);
		$oTopmenu->parse('MAIN.CBOCATEGORY');
	}
	
	$oTopmenu->parse('MAIN');
	$HTMLTopmenu=$oTopmenu->text('MAIN');
?>