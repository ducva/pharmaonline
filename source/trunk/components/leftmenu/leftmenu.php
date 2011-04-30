<?php
	$oLeftmenu=new XTemplate('html/components/leftmenu/leftmenu.tpl');
	
	$category=new clsTable('category');
	$aCategory=$category->select('','','','RootId=0 and Status=1','Position asc');
	$iLine=count($aCategory);
	for($i=0 ; $i < $iLine ;$i++)
	{
		$aChildCategory=$category->select('','','','Status=1 and RootId='.$aCategory[$i]['Id'],'Position asc');
		$iChildLine=count($aChildCategory);
		$sSubMenu='';
		for($j=0 ; $j < $iChildLine ; $j++)
		{
			if($j==$iChildLine-1)
				$sSubMenu.='new menuItem("'.$aChildCategory[$j]['Name'].'","javascript:goCategory(\'index.php?page=product&catid='.$aChildCategory[$j]['Id'].'\',0);", msi_corp_website_prop, 0)';
			else
				$sSubMenu.='new menuItem("'.$aChildCategory[$j]['Name'].'","javascript:goCategory(\'index.php?page=product&catid='.$aChildCategory[$j]['Id'].'\',0);", msi_corp_website_prop, 0),';
		}
		$aArray=array(
					'ID'=>$aCategory[$i]['Id'],
					'NAME'=>$aCategory[$i]['Name'],
					'SUBMENU'=>$sSubMenu
					);
		$oLeftmenu->assign('LEFTMENU',$aArray);
		$oLeftmenu->parse('MAIN.LEFTMENU');
	}
	
	$oLeftmenu->parse('MAIN');
	$HTMLLeftmenu=$oLeftmenu->text('MAIN');
?>