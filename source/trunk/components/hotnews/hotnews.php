<?php	$oHotnews=new XTemplate('html/components/hotnews/hotnews.tpl');
	$news=new clsTable('news');
	$aHotNews=$news->select('','','','HotNews=1 and Status=1','WriteDate desc','0,10');
	$iLine=count($aHotNews);
	
	for($i=0 ; $i < $iLine ; $i++)
	{
		$aArray=array(
					'ID'=>$aHotNews[$i]['Id'],
					'TITLE'=>$aHotNews[$i]['Title']
					);
		$oHotnews->assign('HOTNEWS',$aArray);
		$oHotnews->parse('MAIN.HOTNEWS');
	}
	
	$oHotnews->parse('MAIN');
	$HTMLHotnews=$oHotnews->text('MAIN');
?>