<?php	$oNewsDetail=new XTemplate('html/modules/news/newsdetail.tpl');
	include "components/news/news/toolbar.php";
	$oNewsDetail->assign('TOOLBAR',$sToolbar);
	
	$iNewsId=$_GET['newsid'];
	$news=new clsTable('news');
	$aNews=$news->select('*,date_format(Writedate,"%d/%m/%Y") as WriteDate','','','Id='.$iNewsId);
	$oNewsDetail->assign('WRITEDATE',$aNews[0]['WriteDate']);
	$oNewsDetail->assign('TITLE',$aNews[0]['Title']);
	$oNewsDetail->assign('IMAGE',$aNews[0]['Image']);
	$oNewsDetail->assign('IMAGENOTE',$aNews[0]['ImageNote']);
	$oNewsDetail->assign('DESCRIPTION',$aNews[0]['Description']);
	$oNewsDetail->assign('DETAIL',$aNews[0]['Detail']);
	
	$aOtherNews=$news->select('*,date_format(Writedate,"%d/%m/%Y") as WriteDate','','','Id !='.$aNews[0]['Id'].' and newscategoryId='.$aNews[0]['newscategoryId'],'Writedate desc','0,5');
	$iLine=count($aOtherNews);
	$iLine=($iLine > 5 ? 5 : $iLine);
	for($i=0 ; $i < $iLine ; $i++)
	{
		$aArray=array(
					'ID'=>$aOtherNews[$i]['Id'],
					'WRITEDATE'=>$aOtherNews[$i]['WriteDate'],
					'TITLE'=>$aOtherNews[$i]['Title']
						);
		$oNewsDetail->assign('OTHERNEWS',$aArray);
		$oNewsDetail->parse('MAIN.OTHERNEWS');
	}
	
	
	$oNewsDetail->parse('MAIN');
	$HTMLContent=$oNewsDetail->text('MAIN');
?>