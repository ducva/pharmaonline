<?php	$oLeftnewsmenu=new XTemplate('html/components/leftnewsmenu/leftnewsmenu.tpl');
	
	$newscategory=new clsTable('newscategory');
	$aNewsCategory=$newscategory->select('','','','RootId=0 and Status=1','Position asc');
	$iLine=count($aNewsCategory);
	for($i=0 ; $i < $iLine ;$i++)
	{
		$aChildNewCategory=$newscategory->select('','','','Status=1 and RootId='.$aNewsCategory[$i]['Id'],'Position asc');
		$iChildLine=count($aChildNewCategory);
		$sSubNewsMenu='';
		for($j=0 ; $j < $iChildLine ; $j++)
		{
			if($j==$iChildLine-1)
				$sSubNewsMenu.='new menuItem("'.$aChildNewCategory[$j]['Name'].'","javascript:goCategory(\'index.php?page=news&catid='.$aChildNewCategory[$j]['Id'].'\',0);", msi_corp_website_prop, 0)';
			else
				$sSubNewsMenu.='new menuItem("'.$aChildNewCategory[$j]['Name'].'","javascript:goCategory(\'index.php?page=news&catid='.$aChildNewCategory[$j]['Id'].'\',0);", msi_corp_website_prop, 0),';
		}
		$aArray=array(
					'ID'=>$aNewsCategory[$i]['Id'],
					'NAME'=>$aNewsCategory[$i]['Name'],
					'SUBNEWSMENU'=>$sSubNewsMenu
					);
		$oLeftnewsmenu->assign('LEFTNEWSMENU',$aArray);
		$oLeftnewsmenu->parse('MAIN.LEFTNEWSMENU');
	}
	
	$oLeftnewsmenu->parse('MAIN');
	$HTMLLeftnewsmenu=$oLeftnewsmenu->text('MAIN');
?>